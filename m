Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEWnA8CYimkvMQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D2A1164D6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 03:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD1710E13B;
	Tue, 10 Feb 2026 02:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S/FcXQOm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2EAA10E4A0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 02:32:27 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c5265d06c3so679824185a.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Feb 2026 18:32:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770690747; x=1771295547; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K6e25tnjW36XL3uDImZMRFVix39SxJYTW+Nd+409rRA=;
 b=S/FcXQOmT4yFYE9dkYmkJSiXRkNRJ2HidfpcEbMQcY72zUkbp8sjuGZ5WMgiiab6GS
 8ggO/h7lR03WrjB6aMYvrvl9gVEmwdNo91KTl+A2/3v5LEy9eoLQWBqT3Jvsft/Aqlow
 BnCmYE/k3suC3gvq5wSSiQ0FiEHmv4F4vAg77Reg6/HsYgkGVTBAoUbnY9Vl/rTBot5X
 iwsuJIr601JAwXgaUyb0yOwmjsCL5DpSMVnV52mdCmY58GBxkwqsp9FfR4lMqSPeWjFO
 mG2NA0MmYwS9RxdP1NEEQ5cD5cOr54PrjOMsmsjvMNXqPO/ozhQ3wsJptL2+G0i8bG2f
 ZXYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770690747; x=1771295547;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K6e25tnjW36XL3uDImZMRFVix39SxJYTW+Nd+409rRA=;
 b=s9z3C0M11qCWGv9+EUp5lj+6gMqMjQWunx7KNHAmbfVAxrCz+NKit5lBSjgFmH1dcF
 iZQL05QnTSCEVrKCyxZKAOUGj+peYdvj4HBB6fTG8ArRq5+ys/dFRqGmd1+7ehPn6Qby
 1lA15LNgXJlruuZCAOdHTcz7XhuBVTt9VjUxyBCaVZQEKLBz5Aj/j2yvag52lMK8LYYq
 LRR4+pXT/ls0SlPtrgbFF6tqg0uzsWun0NT714eSQFQldvlsOzqjdQ6cFz+h577Hn5gw
 bMNb8mJIqG4L5Wy1qETv+RinMIoOliCtJNWcdeiEIMwB63V//Y6D4htB8sE1MAbpmHRF
 zELA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZfXlDZ3AuE+VcS8VKKJ4dEXgylwHx0z10Abl4VYYzwRe5AFhJcDCXdJ8mnD3rPZnlG9EUNJ5cy3k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywe+q1EoWuxn8QxXJTkIifU0YcrY4Tl4SFC5gKMe7KOU21o0mbQ
 jb0m20HGdAhedY3hDzUwn0qjtvBw8GD+au0+AeiafcFI3ef0l3+Bqj7k
X-Gm-Gg: AZuq6aK/YnpPXuStu6xLjlMYPq3vmFi4Tn5LYgtqD3XAerSBfUMlNcXkLNB0r5O4Msz
 V+2nRrKkQ+59GSTgkVdScHd1306xz3GHot/Q5onfOO+Xvytmwx8GHTeE669AIVBwYn7Xopl3/Pi
 REw3VoC4QK4poFIsE50hUO5S0QARr7VhgItjTysUZ+UaRka9718bQKjleQRUS1Q/Nn0ntLxbs4M
 3MxsZrKcEBR3x5lCOP1lSq0x6gOMVBuVgFKk/BXCwYzd4UEvJvwGpjB1AjXNNdI/Bz+sVjXFPAr
 E6KhBl1UEVyaZOfoXu4Kaf8Eij6riNS/ArTkMKYq8F66Hs+JU8AerH034Gw04lpthV8fKfpPsxz
 I47R4ySstxYQ2ZCNiefuJS3mGz5j0wk27yEW0IRgdmMrZhxmSKsoVVm23y5J8CkIsMM3PlIU25w
 omCw4sRoM1n9ZzHmq15s0IcgShilrBBpmPwOYho8MRcTKGfPi+Rc3b2wj7CohcfM9JMO1hc9a9C
 B+jCLhTTz5iCdA=
X-Received: by 2002:a05:620a:28cd:b0:8c6:dacf:5dbd with SMTP id
 af79cd13be357-8cb1ed7e290mr122784185a.18.1770690746818; 
 Mon, 09 Feb 2026 18:32:26 -0800 (PST)
Received: from localhost
 (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf7aedaf7sm906298085a.15.2026.02.09.18.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 18:32:25 -0800 (PST)
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
Subject: [PATCH 0/6] Support for the Pixel 3a XL with the Tianma panel
Date: Mon,  9 Feb 2026 21:32:54 -0500
Message-ID: <20260210023300.15785-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:thierry.reding@gmail.com,m:sam@ravnborg.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:yifei@zhan.science,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:thierryreding@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 76D2A1164D6
X-Rspamd-Action: no action

This expands Pixel 3a support to the Pixel 3a XL, starting with one of
the panel variants. The Pixel 3a XL has two variants with panels from
Samsung or from Tianma/Novatek.

This series depends on the IMX355 front camera devicetree patches.

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
 ...le-sargo.dts => sdm670-google-common.dtsi} |  23 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 710 +-----------------
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-novatek-nt37700f.c    | 294 ++++++++
 9 files changed, 374 insertions(+), 710 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)
 create mode 100644 drivers/gpu/drm/panel/panel-novatek-nt37700f.c

-- 
2.53.0

