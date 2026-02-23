Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIEXLGJinWksPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4EC183C62
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5632310E4FE;
	Tue, 24 Feb 2026 08:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nnAhSUrP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB65110E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:26:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-436234ef0f0so3088775f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 12:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771878403; x=1772483203; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ivLFEX0VjM8aamrUCn9NRe0LlRXjsOp8n2ePF/1BUV0=;
 b=nnAhSUrPjOSNex4+eCMhxH2r2XaYtDFKNjW8l3ViHZ5EjJ5BHA1MZDNXJAqVdNVamP
 sCtNcySHg6fYXpVwOR5MLtm9U68UQJp3PTNK5bVx4jTIvhbpsSfYh/AjmeO4/uaQPS/u
 sBGPRxv/YZHuWP5tiJ0GGhP0i9RWwEon1AM7fTRtyU1NYe8ZC+sCCxXLBlUFlcdxUE5Z
 wo/y4YOXGBt8iJvlc5kypvt/N3igPZw16twhHSfrLmE4pp0p/1DrRW6od2pe79niXEf3
 6fTodSS1nnplw+4X8YqbPKOdkSXNEHiQ9eZ/U1djjvQFI18ozw1EEkQjdceK0G0czh8x
 xdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771878403; x=1772483203;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ivLFEX0VjM8aamrUCn9NRe0LlRXjsOp8n2ePF/1BUV0=;
 b=Uj9RAc2h25j5KyLkP6wWjniMR3up21QOAONJoRpnwafcc2q0gzxqk26R9Rj3mArGd2
 S8Nz4NPkV6qqONInI/oiGECoiXOjkXIAnlT72auifFwrvKxQ4j27c3OJfawm+IC7arpi
 dF+2u26L4+2rmKtCP/OzR6OKuKW8PUcpGFFHCet0nwRmZcwPga+w87P/blN3nzaxzJxr
 oNSJ1UnVHzb18mTWObBrboioW9Czl7qqwn4BwIsPu+nv5zeCBOprLbfOFmruIGxgBpDS
 BeJq2bVBzc1E1wwRixU4x8o3WmVLPWvG3IS7d6xwOWipmIqGpzwIGMUyXjxnxRFqrNTP
 Bqaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM9tjzpHX43rjmCmjCXNf0q4wzSM0kDlUyvoGO69fKYJeiR50IspHHznX9ryutCJQXvtU5Heb0sO0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxeRmDkaH67gy/3aqmoK2kX7fs7ZAuPnpdgvW9eNcH0nCrPzK/J
 ECRaSWingNYYiTnbygYYR30ED/xGPPr4N4vGRJwxR8T21dL8Z1aEALo9
X-Gm-Gg: ATEYQzykEPxlB+xuLy2HXHSie80Gko9By70rJoFfrg+XwIOOD6mHreK/eZBfunwkNH8
 hZdrUsiJRW29mVRxXBQcKXjqOVsJMINiKdsgLMZrI6arBk8jOVgjgOVtiQKdIQ1X4U5YJ2adsCv
 rv42Y1HxVL0lLBRfXetqGwt+LCskzrINB8PshpueuTtaZCrYLPn/QKKuic6Nobgvz59IeI7jYtu
 /CE5UoUwsXuaoy+6nWC8DmYtl3ZMDY/5Wp0yiQOAnJRqKN36R9/yB5wDNsNv5FkTGKVVggH9GVG
 wmT+NMUvzuyHa1Kc0JeKKz5P0etpFMYaw32FcGSnUEHNcQSdwwbIG/ueboH8mkzaR3N6GbThIUU
 UUSQB1UQDsaEoQ1H7m3DdtOjsHuS0L0GXOnk13TnoGiGiXSA4pZNM2OXFdzNPTALFckF+xq1ehj
 p/fIGR6vI0f9dAbqo+nLcCN6d2w7d9lFO0w56yRd4SZPboPVoxXA0jc09ke6fQMmI=
X-Received: by 2002:a05:6000:2086:b0:437:70d3:44e7 with SMTP id
 ffacd0b85a97d-4396f182eafmr17920136f8f.30.1771878403065; 
 Mon, 23 Feb 2026 12:26:43 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il.
 [46.116.183.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d54c5csm21369551f8f.38.2026.02.23.12.26.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 12:26:42 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [PATCH v2 0/3] Add support for the Samsung S6E8FCO display panel
Date: Mon, 23 Feb 2026 22:26:19 +0200
Message-Id: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12PzW6EMAyEXwXl3KycAA6gqtr3qPZgErNE5a8kR
 a1WvHuz0FMvlmak+TzzEIFXz0E02UOsvPng5ykJ/ZIJ29N0Z+ld0kKDRtCqkgtNPKQbbc9BYo2
 uMwyuUiBSZlm5898H7/126pU/vxI2nqYYOQQ6sE32+kdFnecIcFE51JXUcqPhupD94Bgvdp6Ht
 ye6pcDSzuPoY5O5ogYkVgWVncrRcotGta0qLLs2OR2VCI5QPEv0PsR5/Tk2bupocT7W+b85m5I
 gjSlRQ10Y09XX+0h+SCVGcdv3/RciVKtnLwEAAA==
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
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771878400; l=1924;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=8bHk8MdMB1v+e83W/P1wN/oW8o7vVn+ttLbKDWFw8pU=;
 b=xu1BE8v9ZdaiTG0UCfPa6sXz623s0YGNGQ34B1No2peoawNJl5w7hg0DspjP4jP+H2PaLAFbu
 sp9Bur8nv/XD7MwEhKZwK1yzHGgIkmAthxzmVAfKxu31ifQO94USORv
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
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedaya.ka@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:yedayaka@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com,oss.qualcomm.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5A4EC183C62
X-Rspamd-Action: no action

This adds a driver to support the Samsung S6E8FCO display panel found in Xiaomi
Mi A3 (xiaomi-laurel). The driver is generated using
linux-mdss-dsi-panel-driver-generator[0].

The mdss reset dependency makes the screen work more reliably.

[0]: https://github.com/msm8916-mainline/linux-mdss-dsi-panel-driver-generator
Original tree with patches: https://gitlab.postmarketos.org/SzczurekYT/linux/-/tree/laurel

Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
Changes in v2:
- Changed commit title like Dmitry asked
- Fixed copyright header years
- Link to v1: https://lore.kernel.org/r/20260223-panel-patches-v1-0-7756209477f9@gmail.com

---
Yedaya Katsman (3):
      dt-bindings: display: panel: Add Samsung S6E8FCO
      drm: panel: Add Samsung S6E8FCO
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

