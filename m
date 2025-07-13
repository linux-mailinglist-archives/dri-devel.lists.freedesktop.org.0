Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F29B03004
	for <lists+dri-devel@lfdr.de>; Sun, 13 Jul 2025 10:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2233210E138;
	Sun, 13 Jul 2025 08:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B62810E33C
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 08:39:17 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so603042266b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Jul 2025 01:39:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752395956; x=1753000756;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=petoWFIc1yVrUA7vb5hl0SJbICvldq7drqIuMNaVr3w=;
 b=EWyCIflkc5aGivtUyfypnA/w2MOFXWE6GGO9xvSVXx9rGhzE4sGcq9aOdkbLrtN59R
 7mq4dkSv1SxstNAhUfYbXB3Wq4uKQS0EC5CcLd4FmqYmD2ovQq5IK7AKvQlO+MFZmw/v
 BB+5vNCk+jJU58MvDSWQieY6iYcvb3Nbh8RGUjAyZ1Rv0I4tJbnTRH9rqkaQoJ5285YJ
 SgQo06+G3N0pPDH1FGF2l2725nszYQdHPpAIfth3ZoINLdyxioXEtx4YA/tYcReSFfzz
 aWdCWDfyydL6R4wQtZn+grWoW7zRNk3Dp4NfAJXYLQCZIZW87lLxzH5tLwkjbecIMxd1
 vcSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiVFX0M0wSXswTa+AuwQOiDcIqIn9U/O2Ild1viCpE0L/etgNZdHd6T3ibNKt38wUgIwfC0hwvNK8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR2ReRvhpZcNiqvPy5orQdDp151sGV3x/n8QydrURmk+L3WP1j
 ey5Mq7FsfIhjxqQX2PZ9X9VRP7nnTlpsr92dI5HjvYholf93LocxdHw2
X-Gm-Gg: ASbGncs8VHuYGr75FyYRdMB1FIcQ5WkbRtCjfXhp5zXXxeqY4sLw5Lc/pYz1B3gfXPg
 Q640Rb2lSZhxMu59y/CA2ZlyRrbnOsrGYgFkUnQ3b5g4ZYDR7FZ37Nmn2fggbj3cQSvq/zzDWSA
 3SJoOLB/68ZMQNcgvV9kJpUr2dJcAQu09QsYIzQZrBZYsS2fmN7InjsShmofdzv/+RWVezccSYj
 q5RQkf9soenQn/IbQZ3aRfdZPtCBPA7cTB3Ag9r39n5BBLjuoRUc39Q6Wo/8gD5Xb1k1r5RCd/V
 j8341oJhonoqWRbXClZWCW0oU/w24jHHYVFsBNSPC47en3iAZt/c+48alA7aLgkZc9xJy1gZKfX
 zrHU1/mj0A7tYOieR2KIa8/AdcHBJdmnJzzYKqdTkup+WVNbFv5SUeqJr
X-Google-Smtp-Source: AGHT+IEOh5WdKdbW0T6J6UmEk9cmBDAiAC1DtupfJxwpMjim3iRySIz9Y05XcPSJrFS/GFvgalD80Q==
X-Received: by 2002:a17:906:9fc9:b0:adb:229f:6b71 with SMTP id
 a640c23a62f3a-ae6fbc13b33mr938047266b.5.1752395955356; 
 Sun, 13 Jul 2025 01:39:15 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jul 2025 01:39:14 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:57 +0200
Subject: [PATCH v8 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-7-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU of the RK3588 has an external supply. This supply also affects
the power domain of the NPU, not just the NPU device nodes themselves.
Since correctly modelled boards will want the power domain to be aware
of the regulator so that it doesn't always have to be on, add a label to
the NPU power domain node so board files can reference it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba550d6b9142131dcca86e8ded36e2f1..1eddc69fd9c9ed95cdc810ba48d9683e3f82489a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -841,7 +841,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.50.0

