Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BN2EYGxk2kK7wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:08:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86425148319
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 01:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6127010E18F;
	Tue, 17 Feb 2026 00:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T4dapcFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3B10E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 00:08:28 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id
 af79cd13be357-8cb48234b08so327748685a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771286908; x=1771891708; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uKM9kmgYZTGzjOUr4KBBo2QWlDyw/KtkyC0Xk4eYty4=;
 b=T4dapcFL42hpNnQEkLfvvYcC0itCc+Sw2aqMpCJuILRdTW8xR7Z2NFH6yBUbSFaYkf
 YvZtIRNMlRXV0CbzcakdUqZ0eCSbs9Cp6A9zA8rA329wxwy4roicTfvWrdxct6Vy3a9R
 vCxPhYS2367H2aRHfklFNibDtmZkx/6xO3uyxZeIIe+L+vRgPfVKIrUOK2/Vo0CvS8jK
 2oDnWctqDvrMdg5W11Q7u7VafpOr4f9zUg9CvYnqdYQq7qPIeRgtVn1Gz7o3B4Q8cb+n
 aPT85qUOm3naGPOlal0BbiqDRU/Rvx8KH/brZ3iZGefW0NgRoJWocERZD0hnp32LsFFa
 AXJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771286908; x=1771891708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uKM9kmgYZTGzjOUr4KBBo2QWlDyw/KtkyC0Xk4eYty4=;
 b=lUeDDpSHrMwqScKycU16O+BhPiVGAEeiomhLX27WkyyGnR841ZqAyqxDR3xNhjMa35
 K/vsl0d27NnmrkDrh+hP8R2+rcH3O7nF4cvQaG5p2+5M6YKaBlb7kUforQxDpiLvgbF+
 1Z2e7/kIy6wg5d/hBZJ0wBkCbOWZi6uBusRR9Ij23o3Qu54ysIsRzI3fydOIgjqn8Kji
 uVyHSbp4vyx/tv3Sbv0LBUG08QtoCpeh6uClvSAYKVlBGcb+EdWyl+nV8TjLVkJM+9f8
 oWzdLp52xvySkxg1EKVfBwrkpuop2l+Vv3GkIV21IFAClHhxYF50eTp5tzaZd38PkQZG
 jhiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPnrEOt+vAi6lId1F0k0fkSmF60LC01rrr8ctfrNtjDRcYBkfsPD5R+pWjUDGo8pvOyqbEmArxwwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyH/ngP281kPAfIm/7iQSInFiXlgXSaWR7p+z/MTM1MwA4sPgI6
 Ow2vNLEhpIsVVcB7/9OhJ6fd/lh8OBk88Y/wr3gGEUo5W+FNFFlRmEUU
X-Gm-Gg: AZuq6aItji5v9RDGMx0hGHp+RyXHGdzWxJNtD8UTqA1vJjPFLB7hdeObUxAGTjOOS8Z
 +ppLsZizQj52TM3z4ThHld0qSA6WpWU8NqBgJCZBXEa/kEpNoOc+aR6k7fl+A1Yzi+DUWElZiI3
 +2tmaO0Fz/FcCn4d6rCXsGkrsIHy7o0Y1q+936opXdnMd95NOg8ecArqEceIME1BR91oXku8xj/
 kGBO4ilOlkGdQPt90uMCbdysMsXrJuBHwxVUxxGBtACgOiVuatzm254k93/ltRygwr8iQZW21Oo
 68n/tadLRgGRayHbMPRfhpWB2ehmBPoNZK8ixpLSH4XnRFGX/vsUXw48hqSxNXkA2Wlz6hn6ENc
 6XXtYaZaWjEjteMIl56eG1e58uKJdKzBWgbr92yuWB+f9yNVUpsWEk8zAa7cLtFpE82hjMF/3/t
 k+VvWZy5UStIWsXdWYbESo8PbIz16bqw==
X-Received: by 2002:a05:620a:31a7:b0:8ca:4014:6151 with SMTP id
 af79cd13be357-8cb4c00d09fmr1146147285a.54.1771286907713; 
 Mon, 16 Feb 2026 16:08:27 -0800 (PST)
Received: from localhost ([184.144.58.243]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8cb4b38e4f6sm790782385a.13.2026.02.16.16.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 16:08:27 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/6] Support for the Pixel 3a XL with the Tianma panel
Date: Mon, 16 Feb 2026 19:08:48 -0500
Message-ID: <20260217000854.131242-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 86425148319
X-Rspamd-Action: no action

This expands Pixel 3a support to the Pixel 3a XL, starting with one of
the panel variants. The Pixel 3a XL has two variants with panels from
Samsung or from Tianma/Novatek.

This series depends on the IMX355 front camera devicetree patches.

Changes since v1 (https://lore.kernel.org/r/20260210023300.15785-1-mailingradian@gmail.com):
- use multi functions in disable callback (3/6)
- add and reformat comments about XL differences (5/6)
- mention the sdc panel (6/6)
- explain google,bonito compatible (1/6)
- remove TODO item in code (3/6)
- add review and testing tags (2/6, 3/6, 5/6)

Richard Acayan (6):
  dt-bindings: arm: qcom: document google,bonito-tianma board
  dt-bindings: panel-simple-dsi: add nt37700f compatible
  drm/panel: Add Novatek/Tianma NT37700F panel
  arm64: dts: qcom: sdm670-google-sargo: add touchscreen and display
    labels
  arm64: dts: qcom: sdm670-google: add common device tree include
  arm64: dts: qcom: add support for pixel 3a xl with the tianma panel

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 .../display/panel/panel-simple-dsi.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  |  38 +
 ...le-sargo.dts => sdm670-google-common.dtsi} |  24 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 710 +-----------------
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 282 +++++++
 9 files changed, 363 insertions(+), 710 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

-- 
2.53.0

