Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANXGIgyqgWn0IQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:55:56 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CEBD5E3C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 08:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41ADC10E2D8;
	Tue,  3 Feb 2026 07:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KinEANaf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A3710E2D8
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 07:55:53 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso4551965e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Feb 2026 23:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1770105352; x=1770710152;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vTWgW2Ne0NU0BHFF5J0+gTNjO8f2OCPnH0mZ+gUt7YQ=;
 b=KinEANafj0LKUfC/b3fve6WqtIrqEOCmobdXU1NgAdMEtLQt3WN9JqyDw26P1hVR0n
 L+od2eWZmxNsx1TaGVtAdj4UCBUiUB0jX11vldx+2l5PFg+/W0AFa/fnn1eS4Q6CDnYh
 h+Pq3JYNFVN/5h5U2h7PpgLRusG0VgVZHRYgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770105352; x=1770710152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vTWgW2Ne0NU0BHFF5J0+gTNjO8f2OCPnH0mZ+gUt7YQ=;
 b=sUYfZ1zX1qlm3hW9no8eFI9x43EBicpX0YvTtUVoR5k5JN+dqsj8/xL8Ft+onh2JsG
 mrkaep9Z3N5Gv03vv6MllVyZTawj1NZuIswrvLZRtefh1ARCwxpJWXn3VbpIOEsyK6T5
 4AOZrwv5CtadbTZp0p+lrj4LD7OXzA9fqhQw5w7tZwOB57j0f2ZNwx+akKW3m1MJ9Pw5
 9tc4sKAD6x9CBtJsGlHIEt2Swv77sB0/njX+OAmxTApYJ7YloUJZtgMVh247cO5xmb/G
 bdFiD8AKD5ZVSObRohjHP0Vmeh9ayk3rIEMeBt4oeZ5ciC4YMRAcHcLPYrdBJnCP1RQl
 Xs+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqN7LWZRfD4OCkU+kBWTGT6N0YQFo7OjvTZ7LW+6rp2LasfJYpUZeUhvXI3woPDGRo4zEoSellCOM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzqeQeO39qiE5TlBkNZN8JQBIft1wfmMpEYzFrX1XDlls4UmOJ
 vDWgPTZisoEZdgjTBsknKcdDC0i9CtmvPapbDuzlBgJnJ8upuKM0FHWcnUnZpBchGOY=
X-Gm-Gg: AZuq6aK4lGZq1CSk/tdqa/MB0n1rfErBFMCCh7VfblxF/JJFmkUOfio3wW4u8CcL2dV
 GwUWAhD4UFYrPe7PX8cR4L5L63s6kOiEUSaPHrvWwwuZcuGRkPaQ4IniIPL8cb2D/123nE6/M3O
 MdwOKqTdIPM3fF2qRHw0F2xFBe4ZuR288YoFnkNVj2E9/Ea0JDq3vTxPXXVaBzSO5Wpb+g5A1Ns
 ZLwQebCeztSRdk3qrbo9xvWhog3XAXnJw9m0ZsRKE957alvPkftR+2CXDGTJt3IzbFBjryZI+8j
 NEZBLtPcPifPAfuNTTAgOjaHJqBfphGeN9+xd5oAZVgP5GfnRGxZC6ipo5W6b784dRxLcKGCzGJ
 cTcEWyEh9Aa38YapYUbiLKMPoxMWQ/MYWhjG4YBw4xQxxF+zcOoLmDvSTLCtXnbHenlpZL3WQtH
 2+db1TujZuFkI3O9LsA/yWjxPzZ/PDg0TwaGHK1ql51Q2+rEabGJLeWZAqfW4Ac9ExATZ6XXSB0
 9mbtPYZQXvXjQf0+JZaAyV1CF21Ovnclk7pCshYJLE3FQzmY7p+BJkZ/0bhTzJ2StlzKqc98RIc
 EM/DaOO9sNc=
X-Received: by 2002:a05:600c:40c8:b0:47e:e38b:a83 with SMTP id
 5b1f17b1804b1-4830513617amr20490595e9.7.1770105351768; 
 Mon, 02 Feb 2026 23:55:51 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-482e267b699sm111939885e9.16.2026.02.02.23.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 23:55:51 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/4] drm/panel: ilitek-ili9806e: add Rocktech
 RK050HR345-CT106A support
Date: Tue,  3 Feb 2026 08:54:47 +0100
Message-ID: <20260203075548.14907-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,kernel.org,gmail.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amarulasolutions.com:mid,amarulasolutions.com:dkim]
X-Rspamd-Queue-Id: 20CEBD5E3C
X-Rspamd-Action: no action

This series extends the Ilitek ILI9806E panel driver to support the
Rocktech RK050HR345-CT106A model via SPI.

To achieve this, the current driver (previously restricted to DSI) is
refactored to support both DSI and SPI variants independently.

The series includes:
 - A refactoring of the existing driver and Kconfig to support
   multiple buses.
 - DT binding documentation for the Rocktech RK050HR345-CT106A.
 - The implementation of the SPI-based driver for the Rocktech panel.

Changes in v3:
- Add Reviewed-by tag of Rob Herring

Changes in v2:
- Introduce DRM_PANEL_ILITEK_ILI9806E_CORE hidden kconfig option.
- Split core and DSI logic.
- Restore vdd-supply as required for both DSI and SPI types in the
  dt-bindings.
- Dop useless settings in case of rocktech,rk050hr345-ct106a in the
  dt-bindings.

Dario Binacchi (4):
  drm/panel: ilitek-ili9806e: rename to specific DSI driver
  drm/panel: ilitek-ili9806e: split core and DSI logic
  dt-bindings: ili9806e: add Rocktech RK050HR345-CT106A display
  drm/panel: ilitek-ili9806e: add Rocktech RK050HR345-CT106A SPI panel

 .../display/panel/ilitek,ili9806e.yaml        |  38 ++-
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/panel/Kconfig                 |  24 +-
 drivers/gpu/drm/panel/Makefile                |   4 +-
 .../drm/panel/panel-ilitek-ili9806e-core.c    | 134 ++++++++
 .../drm/panel/panel-ilitek-ili9806e-core.h    |  15 +
 ...ili9806e.c => panel-ilitek-ili9806e-dsi.c} | 153 +++------
 .../gpu/drm/panel/panel-ilitek-ili9806e-spi.c | 323 ++++++++++++++++++
 8 files changed, 576 insertions(+), 118 deletions(-)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.c
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-core.h
 rename drivers/gpu/drm/panel/{panel-ilitek-ili9806e.c => panel-ilitek-ili9806e-dsi.c} (82%)
 create mode 100644 drivers/gpu/drm/panel/panel-ilitek-ili9806e-spi.c

-- 
2.43.0

base-commit: 6bd9ed02871f22beb0e50690b0c3caf457104f7c
branch: rk050hr345-ct106a
