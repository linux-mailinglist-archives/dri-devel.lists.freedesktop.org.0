Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4EE5ABA11F
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 18:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E147E10EB38;
	Fri, 16 May 2025 16:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C11910EB38
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 16:53:47 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so16923595e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 09:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747414426; x=1748019226;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DTsKYei0TKRuiGpGV/2kNvyJqAo04bcMiePh7aZi7j0=;
 b=KW70HlFNnnSTQtCzPXW3RTvPkGO/oPybUU0UaAQzd3JxdjWihOsP40Dhf7a9r1SXiT
 icyShEGWGgQ9CStI+8PRCPmXhhIXFKdZ3nw7nQ4lePdcCxLS0t+x2Z0kWhj3H1tCYZ7L
 rFt+0FEJuYZZz9FAH4Kgk3TeZD5Dfu1Ulix2tTr+ZH9313H4PlWM3gEd+z5Jl89nhRPn
 VZR9ll2ESLLUrtfmks5Bqmk1Gb7IkzgUbklE9rUUtOviVyQPdIqOhWxNIlHzNnhw1PPX
 8aROipzgfH+YJ8aHMqe4ZWEppR/2Vy/Jyr971VyXrhLRducGsuC/K0na+hPs2dUv1JK4
 uzLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0LEvIO/vE4qhDe/WoFaIZtZnhZxw2KucenCq31KnXMEUpltuivZmLDMk+oZFFWkAnf6+Z3727S8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU3MICLMUkaEnWIwdAnuLKlvXx4BxA/UL+5nHkZFy2Vf5MwJa1
 rWryvgaM7I7q8zHvHKLcqXVPeD0RdXfRGK+XTRfHkdCCszZr69VRbtqN
X-Gm-Gg: ASbGncu6llQGayG0x5P0PkTVe5zp3mwG8YhfQlSUrsuYDxhIWFUxltdPjhdAJtQdiK9
 hLMLV9BzlZrJLCr5ZlBBi8SrnrQzKr5+If/nsD7D0E8MS424ZtpQCbrtEY91WJR17qhPhAFhYtz
 6W9tS2bcN62y5FgxlkKb9KbW6yTNpHIHRoogQyB5B16TsLIuhfAW60uAaPuiWFON+Ut+XNBZT9n
 5Hfqd4EjBf0IcsOxinS9AewJ2Ma97ZmtZ50qKZ+bIGl/y3HmgEVsXTdpR8dmJj2JhxE3MJ7iyeK
 MDczwcYpcbjLtC+ndh83n5jGjV5+2noM2UdN9R9q4tJzJYSY+OveScjN1wyg4kcHbhu4Sj72PUt
 rPfQJ6O58+g==
X-Google-Smtp-Source: AGHT+IG6xhwGZJzajazwVgVx2jcHoh4QWUUDGiZvS1m1Ru92pKqvh+bIatIT9YOQeA0bqa0UskoGJA==
X-Received: by 2002:a05:600c:5491:b0:440:6a1a:d8a0 with SMTP id
 5b1f17b1804b1-442fefd6da8mr27032725e9.7.1747414425710; 
 Fri, 16 May 2025 09:53:45 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 May 2025 09:53:45 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:23 +0200
Subject: [PATCH v3 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-9-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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
index 7b961ab838212fad8e4a70390fdc917a828433a9..d7eebaab78255d34d4bf57d430f4a902e6c1f110 100644
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

