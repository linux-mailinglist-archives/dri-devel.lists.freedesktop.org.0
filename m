Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9158ACD8ED
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 09:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE6010E6D9;
	Wed,  4 Jun 2025 07:57:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686B610E6CE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jun 2025 07:57:40 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-60410a9c6dcso2502322a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Jun 2025 00:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749023859; x=1749628659;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jyqlZAcdTFyJYPhP3doh/0zsI0IchLs8FmT00VqXdQ4=;
 b=rna1GTdfLjqYC7dLis37pZpPox5L23g4DqT3kCcshaISY9hRozhz/QeS8pE/bTanAD
 wUwSuP7Y+MHkLazKDpTfhNiOdOiTPtOkso1CtM5WvoLwrITQQMMDVDQP7DHVk061MHgK
 4YAc6ceVAG9WF2iCcx/U/5v5tSltHq7dOjUsTxq5KU8J2EgVeRIqD1qzIy5WaoLcidye
 OEqprRX+0Npf5dht3CHR4lxOflYO/2714xEFiBuXBnqKkQFn8+SebK+v7CqdHR9sTHbB
 DhF+pnrdmZjCd9JGn4pf4VGgM12hl+axFYheiUd0D7yEZ8qqf4X2J90iRbywJZoekGFD
 tk2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaciL8Yr6PMQbRlE5lQqDN83OJ11mVp9m7Mgowxv7R+dP2DtwBeW5dVGBNVXnFjpN/8niNxWSOzZQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN14XRXUtcfQpIkVxx9sMgCK8uDBzQzDNyOU9a5FIZlPwkHuqs
 CljERLVdcfQ0e7CLtTI6WindgsIX4jZc4n1E4mSOEFR0letlAUUcoiAa
X-Gm-Gg: ASbGnctHml1R+ixToAg+pbfbWguA4/RCTqvgIEsP0AIsqEDc9zw6M/kzdMkC6OD2+pH
 WIquF/uvDQI84wWs6Mm0oIIlQ27RnoUiJnH4sHqpyHzKJSMMrMQ9Wj68bHL1gWXF1Wsd3i73WpA
 OriqZnCulnRVpnCO0oXPBVnNFZ7pmPErutuw6QKAeWjZtI57gh3hkCz/VkOYLP/gatO9Ss6G9Kv
 pX94oealk+YCJyFTUJugRKxkTosYhdaAaSFMErzdn15x1wAcPE8mLue4QTqrmX00N7s+VSt1HGD
 grXpV63VvUSbDonaMa1N9i/tSNRSX9XiVJAmFLo3V97kqbg876oihNF4eyyWRs9+KQPn7RtFSsK
 DIe11o5Pjrg==
X-Google-Smtp-Source: AGHT+IGSL2u81m44PshHtM7hdBSEpD8DSsBTKjhSOsPhct3tLEmRi8Q1fHTg1PC7eFwd4tUCzQ2s1Q==
X-Received: by 2002:a05:6402:2690:b0:601:fa1b:cb2a with SMTP id
 4fb4d7f45d1cf-606ea17e694mr1966918a12.26.1749023858889; 
 Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-606fb36a160sm348569a12.45.2025.06.04.00.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 00:57:38 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 04 Jun 2025 09:57:22 +0200
Subject: [PATCH v6 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-6-10-rocket-v6-9-237ac75ddb5e@tomeuvizoso.net>
References: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
In-Reply-To: <20250604-6-10-rocket-v6-0-237ac75ddb5e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, 
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
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index ea831bb6e2ccc64c811f885a4964da7617c255d7..a44dfb376fdf4c29e1bd307d9a7d1621e11d8c59 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -837,7 +837,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.49.0

