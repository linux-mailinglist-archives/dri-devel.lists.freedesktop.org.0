Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD8BABD4A9
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 12:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700FF10E51F;
	Tue, 20 May 2025 10:27:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3906310E4DE
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 10:27:43 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a064a3e143so2961638f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 03:27:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747736862; x=1748341662;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3P/6sXdHxvAwZQAHntU3mNeria1ZXDx/pMQJAoXfL1Y=;
 b=adFc5FmUeSm6fiJmvjWnjoyYvu4ymfKLKfuHA4anPYtK67NnYmPWtEUb91d8AnMHyd
 bXQOHN+fkNnwvciRVxHAhq5JCXCZSBgeckcQgPF+13vM8tQ68TDUoi0XN24B64JLrI9U
 QF++Ks/VT0eLHVDmRhBhm7kW631MC8amuSNyiyMqgo5mhfuPdzVrPHDXfOadnBMapZg2
 ZO/nOYIxU4VH1NxZYpyJOVR+PbJOfIki+v4YVvy1kKWkfeYXQfqVK3jiv91eQcutwyit
 agB4sAQUpzPOSe/I57XWepMd9YOEv0cH+2CrEuQx7Aav4CeFYNx0N3BytZLFCiFdjyVQ
 qesA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUexlnA0NkJV2fl3DzJ7kjNkfdJ+Grl101ZDS/alW5a3geIfBCyx1e0rLMrlPqE4BEfbx6VMO7a1Fo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpNa5FsLejGSGDnNiglET7qFaYjpp3UXMB6lScBOegyltPT3K1
 HbbAr3OShFo7BEDQwSgkoH8vjFeM5oZAzhUrA/YDUhqg1DKLrO6NZzyc
X-Gm-Gg: ASbGnctbOIwHLVLH/fXV8+G2uJH7iqoixOZIWheqsucOSchs46UH2htpkOQCBWk3UCf
 JIoV/zhs3sNjYKT5mdPiK2zk3N8jZYbVBYLPB7RiE7zRog+7XufrJKWiVR2JtnhhZEVsPqhZEQU
 0rI9mihdeKDp1DlnAQ2lMY8kIXdI8GMNUvDc8hAnZoUx18c3pR/EY7SyC5CXVBOWmp1NpCZsYVw
 wJ7mTuwaDwE6GcDSYYOd6lZX44gaSb6zBnody6O/HUc55h5zgdsyr///PER1Lc4+v1QOuSXPgRz
 jSqWrlRgzaJEcQbGdkS9u1SiE1ejXAR24Bi5r+xFlpHo31jrPq6UFBV0+eXD1y3AUgZQmnR7kLD
 R0i6oILEvkw==
X-Google-Smtp-Source: AGHT+IFbD69ouNWbuKJZpSGTH3v03JlXJ229ltd7Mw22fHICsMaT68q/bZfYb368nvB7oqZdaUKILg==
X-Received: by 2002:a5d:598e:0:b0:3a3:7734:729f with SMTP id
 ffacd0b85a97d-3a37734746cmr3469916f8f.13.1747736861662; 
 Tue, 20 May 2025 03:27:41 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f73d3defsm24680025e9.18.2025.05.20.03.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 03:27:40 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 20 May 2025 12:27:02 +0200
Subject: [PATCH v5 09/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-6-10-rocket-v5-9-18c9ca0fcb3c@tomeuvizoso.net>
References: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
In-Reply-To: <20250520-6-10-rocket-v5-0-18c9ca0fcb3c@tomeuvizoso.net>
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

