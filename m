Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHSdKltinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2223F183C02
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2141D10E4EF;
	Tue, 24 Feb 2026 08:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KuenMXb8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31710E454
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 14:24:11 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-437711e9195so2851976f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 06:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771856650; x=1772461450; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=I+2zu6waZ9ZINHmOeqTNg+8QIhX87rWd1dofyBo/XGE=;
 b=KuenMXb8XNYeFepmnNPiSn8Cc/nW/9k5w1YcJfQtWyNlyoDyFXpyUMTBh2dElO0Wpj
 UbKtEAEWPWrOn+vWmcqpwy7kG1KTdracOGGbLr+18Zfg0vhkt4/UtDfFTbJlhLXZUd6I
 DzLG55S6DwX84s7TJMM2mIoeK1e11jZnb2f/C6qUhL2FF+PSvByz7dAxBu+W0aEwiEAm
 uorDwJDbxr0dgpYXlWw5a6322mLd8zv4/vd9wCRJSqn2xjVuZgc5HK69rNOYC84cs68p
 AjupHII7ge6hhHGEUBLUx9iTqqR2YL75dlhCtJB0mpgu7bHP9cbFJNu0g15Hh7cnH8wB
 CCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771856650; x=1772461450;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+2zu6waZ9ZINHmOeqTNg+8QIhX87rWd1dofyBo/XGE=;
 b=qFL33akUiGox4Ja8LMGl2yHANoGcNb7oLLjAYcqjSf17Rr/s84KeS2zq3RXoKfUnDi
 k0wIAbkJimns63WH6PgFI8FHRv6QnCEY60DlAzduI6WhqoNvh8eUrgjRWz4HtMnxiD1a
 WBEAEzM7LqOzmHmhY82gYPEx11rRiZlPOcaWdQGp5PWvlFTA4TUb21xGRJ5yLG4/ZWNV
 vePvr8XI+OSphAT0DT3m5AlYRTRq6P6k5vT/3Uoy5ZAu4ZAge7kcJwgSEWIauVdxXlyW
 G0E4sOEcGuQ6VNj256eqKT4LN+becNEkk3bgBvgYAgn2onp62ovqfOrb70hpLH+K6qi3
 MFmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJIzcwRUle6rL9LqIFW7T26RZ6pER564KorUAgBTAG+XD5sYWzeUlqm4vTIK82LtGyIgwuEAs6eGk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFnJ8CspcDumTdBqKMAb10/3lVqz5nf/8+kbisIcIbaeLg+uea
 uM0OO/PDtbtzd3ZccY/SgEEs7rl2MwSdIx/KiOUhMLnZq4d+3O5fCl9E
X-Gm-Gg: ATEYQzx5QoYbGoLDyIJJ5QmyYOPDn7TF0X1U4IkxAnv32jiI5BCBvnF9VmfZ5YuiAV5
 M48n026oUnhjGi3+RprVoPY8Sv0JXuzwjR3plBSB1EZri2dwgSzVtRmVUbetACM4zGqyeo2zOwH
 cnRmY/0MHT5ORXN8zzjF1bnitfzFF+tOw6Pq+6VGf+kRtm+vnAqsw5GIXM8eYn3PHd/yopKGqEV
 6B71Mde90GUJQzzN56qmqRaO4jPPIPVHvwWmy5Xpen83iSUllN/kyfFnPv9UiurdEb/LcVwEc0G
 +xRonsdvkZGa8aWhtjP+NyX15Y89fbGq2uTKVkvNILXepwmSk2XrCtdTA+Lk+fYo6bii58Uj9wK
 uw4Yj/dbSArhmPdnuy4YyBIxoROnfMOC9BZxyiD4JorB7l4czC/oqG/1665Ih9/X4C6SkSqxDWX
 6RqG8LuQtVhlIOiByLt47r116NUfZr4yUwYNStzXVqMGXg0ksJPj1YLDTAHCJXCLQ=
X-Received: by 2002:a05:6000:4021:b0:436:30b0:75a0 with SMTP id
 ffacd0b85a97d-4396f194254mr14347361f8f.37.1771856650195; 
 Mon, 23 Feb 2026 06:24:10 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il.
 [46.116.183.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970bfa1bdsm18713233f8f.3.2026.02.23.06.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 06:24:09 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH 0/3] Add support for the Samsung S6E8FCO display panel
Date: Mon, 23 Feb 2026 16:24:01 +0200
Message-Id: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MywrCMBCF4VcpWRuZpO3YFhHfQ1xMkqkGe7OJR
 ZC+u/GyGfgPzPcSgWfPQTTZS8y8+ODHIYXaZMJeabiw9C610KARtKrkRAN36UZ75SCxRtfuGFy
 lQKSfaebWP7/e6fzrme+PxMbfKHoOgb5sk+3/Kuo8R4CtyqGupJYLdceJ7I1j3Npx7A4f2lBga
 ce+97HJXFEDEquCylblaNngThmjCsvOpKWlEsERivO6vgHnV3Bu5AAAAA==
X-Change-ID: 20260218-panel-patches-696df7e0d810
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771856648; l=1749;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=9y6D6xz5iEV1RlXfd71tFKG5C2AsAHLINlsH8NwvLQ0=;
 b=bRK40Pbiz6nb8aMZHw2Gw0SSib4spnpKUOIEypjCEEzz9zafYDQ4AM/cItCrg+kY/HpmLeuXD
 JlbZADyy9m0Bb32QxKGHHw0udZ0m9oXx9n7c/BeGyZy1aXE8cyptzNK
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedaya.ka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:yedayaka@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2223F183C02
X-Rspamd-Action: no action

This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
Mi A3 (xiaomi-laurel). The driver is generated using
linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FCO
      drivers: gpu: drm: panel: Add Samsung S6E8FCO
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel

 .../bindings/display/panel/samsung,s6e8fco.yaml    |  64 +++++
 MAINTAINERS                                        |   6 +
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  94 +++++++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-samsung-s6e8fco.c      | 293 +++++++++++++++++++++
 6 files changed, 470 insertions(+)
---
base-commit: d4906ae14a5f136ceb671bb14cedbf13fa560da6
change-id: 20260218-panel-patches-696df7e0d810
prerequisite-message-id: <20260216233600.13098-2-val@packett.cool>
prerequisite-patch-id: 3fba84f11111406e0d530013fd45ad0eb389786b
prerequisite-patch-id: 81440b7f28f9101d3dc5d4bad6dc86e39b81a026
prerequisite-patch-id: 53469d8c9810169d058f1bfd27ac8399038aae74
prerequisite-patch-id: 80809bee71eb6434f6699d5e5f8c7f9d4bcd1ca7
prerequisite-patch-id: 0269e01c9c54a37bb92983635cd516342189aee5
prerequisite-patch-id: e2bbf7c452d4da6d71b1a5194e0d7ce46584e113

Best regards,
-- 
Yedaya Katsman <yedaya.ka@gmail.com>

