Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93269ABBF76
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 15:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D305C10E422;
	Mon, 19 May 2025 13:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF1410E420
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 13:44:15 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so31154025e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 06:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747662254; x=1748267054;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3P/6sXdHxvAwZQAHntU3mNeria1ZXDx/pMQJAoXfL1Y=;
 b=QrcLPZRzXgzoMgtySdqQo16UjkaUNxlRHn0EuzgyhknKer7mIsngA6+nKajQXN8Mez
 oQbMdxONjk6/xc8jgOQrGhVfv9jrPblZR4TfOHAp0Mv7ChsIXuUi+2sYhjd35uc7Eb9S
 XSP9Uh8Wirecdk4y7Ys+y/2Wb6zZyq7hKQm9uJGQD1oE/OeHxAzZsNtKCJWkAIbW9yuR
 9flmidWMdeOC1KU9iaYUexOj+YsK34ez7UCyJSo6ZUjvc8+yAkTaDR06QF1vuNVO02zb
 FD84d0+1kYCzYHPs0Lo4Q60/UY9R2W0qQOqfTpp2Tgcl8ArriVVGoAM9QwJGUQJ7mXTo
 U94g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWveX/L1cVxQbjEXLny4TXkKBzR6EFIX+Z6zCHUA5IWlkWuAcKQjLBNpCAoOiplfgmhpFCet7EJJho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2Qas5Jvl4pj8XfI60yl26BUVYvOti8JOps59wMq99Q6vK7Z1Y
 mgxL80ES2xZ4zcgJ6r9NdM2LPEnUclJaa1AxAQgoOlB/5+xa7a9yvx3dy6uspu9U
X-Gm-Gg: ASbGncu5b0fSvm0hHLDFwKhdxcu6+nvM5ysrwnhAtwtmagzziy7nuDrqaVg1RzLrDu4
 y8U1bw3f80RJ4hAqsiAtmOVtvx08V/ePjaqAQwfgZFIB4Ky1JpWDvaucf8PYPQu2V4wzcGJkNVv
 CxgEdniFSxLlSJaNjSkdeKpI03WveLhyk3YZqFrtFu14jS55IIOvVjqeEmtQLwnb8yK7nCR76u/
 a1BHMKlMiNLJbWhYBM7+fvX+9ml8TLJMd4tkDzhPf9jTLW12SUGan7orHjAKNJM+NtXK6TDeNoJ
 cEYUTD2Rd/V/9RkT0Kw2yx0FQWMzAnhcjZvFjs7NJ/aD3DS57R+edX9fVeN2Z3IpUj+WMXWdUnT
 +09wJ6zirFg==
X-Google-Smtp-Source: AGHT+IED7kzUlsknohwGAlzr7xKPhQnubsTHrLBV9TQD7zLZAZYPSMl1+k3sZJ6J83oZcqAr5dxyHw==
X-Received: by 2002:a05:600c:1553:b0:43d:17f1:2640 with SMTP id
 5b1f17b1804b1-442fd665728mr107456505e9.26.1747662253514; 
 Mon, 19 May 2025 06:44:13 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 06:44:13 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:41 +0200
Subject: [PATCH v4 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-9-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
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
index f5e58851047e80b23f9ff3244692ad868ddc1ff6..3e5199355a12f5c9ed8b6aea1dd95dcf8cbf1846 100644
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

