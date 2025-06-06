Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8658CACFC9C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 08:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB3110E806;
	Fri,  6 Jun 2025 06:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0AC110E3FA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jun 2025 06:29:09 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ad1b94382b8so295547866b.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jun 2025 23:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749191348; x=1749796148;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJr+6I0y8wgx5+GjQkoroOueGabTjocLtcws9SVOMk8=;
 b=o4BuhZj77uLjQfpadB0PUPaWG1APQHde/WPzWZnklvXFzUN0KhdXCLDIkfra88CsAv
 N85sekzWtwvPvB+8arwqgWD1UYUFrTIWaq73ZuTHer8j6tJdAkvJNPvBsnVMwStXEvv7
 B95fTkukrPJgewdpLoE7drCfBFtSKH4L7kDusDW1ODTgVOGYFebtbhAtSw6abEvj9BSG
 8pJDxSNzecfZjg0MpYvKlgqZ1RMIpjmfeLT5EuQyw0xqp5SHXQdPhM0QP3J62I100iaU
 TELWFQk3C1zsDkdfQan5slL6tP1gY/DpfuPCDSctJ7c/5Y7ps/mPrIzE6rryh9PBOjVu
 ga8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK/ZDY1BlNjEZkK1Epr+saLQ8hy7QXfcUME5PhrSpc6+tdbLyxkfoUrRL9Nl+pP899R+zi3cDyt3w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyhf+T+cLAu6JeLCvRKI8w5FH/iQXNqGFgKiFjwy5MDnZU29e+o
 Ubb0DxYH6B17Wv2uJJ0Vb6TZc1EK6RPLjQ6xdAZhNv0XTcp8P/htFJqcGC4tJuzp
X-Gm-Gg: ASbGncuiiVBd/X2OTTKKchPjo3hETltfIOOJCDxvdBlPwRkLP1VYSPzEk6NJ7DcS9Ks
 7G1Y1XN+KAwQVt8TFek3C/9YjMiZPedxz/QOZl0MjEZUZAOxbnuKs/7/D6B4S8fgbv1Jlf7BW7H
 FosW6FPGds4KvhupKGp8ZE+rsEYHmkAMzbIH35mc5XmoiYqx52ocY//fXVF+vlezGaiDCCCVPIf
 30YRJ6XXmSVBE2PzrGhKTSmdLjcB/m3u+2Gr2y1SsatIwgZuIiSTzCpRLbNp8dlgoQpvIAJ7jdA
 3Z3tOiRUqG3B7skKpwuLbAVCKO3NYmBfdNjMVdsNw1SjcdRuvmFUITDd+AF9rNxi2kWSVrdFJIX
 zrCkkaOsWeARNeg3NeCvX
X-Google-Smtp-Source: AGHT+IHnyqurZxzafHeloJvbM/ETAgSyRUe/eH/yNdQk8BARF2W2S6z0ut2EY9GgmVYWL9DWoqgdpw==
X-Received: by 2002:a17:907:9694:b0:ad8:a9fc:8146 with SMTP id
 a640c23a62f3a-ade1a9e82c8mr145557166b.44.1749191348270; 
 Thu, 05 Jun 2025 23:29:08 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jun 2025 23:29:07 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:27 +0200
Subject: [PATCH v7 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-7-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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
index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..335b4489691b6299c4fe28342e827f07c920c665 100644
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

