Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837C3D1D377
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 09:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13B310E3A0;
	Wed, 14 Jan 2026 08:47:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9FD010E3A0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 08:47:16 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-64d02c01865so1845446a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 00:47:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768380435; x=1768985235;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=;
 b=vv/f2b2V3p8k3YrjKtOuocogjwHuLpNbyxZphX8kgx0VeGaPZ98ozfBmAjsE/3OGPv
 ZwhU8Ex6NPpfHtzxbdVdsjTCdJgNMfUt8U/S7ewffev2FIXoPd96qHQPWfSmKEOMktuD
 /xYEWQNuu0cxFWP9EBl9Uk2ZfhzME4+/oaTV2GeET/sq4XVjKV1wuZglUITz8fD7ZCOI
 38ACilBRlBWOwBxtZs6xwZaZPocILpwuGMYy45kM7kYW8TylIFsYr20C26o3MqHURjUY
 EuV4gLxTrTVBFV8tRZ9NS8Pi11KutGEBGi0hfDIG9hAoyLq97JsGuaoQc3PXxKVYIdBW
 RIBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzBapTej+appumSCCBhmSWqkzBbvOe0WXuOutpNn8DdXlTWM4rWuX3pFIhtUREUgTAETp5sRMfNAY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxGjhxC2alx65W/RVkpCV5VA6M5lMuEkpAqZq+5rofL1/pajbw
 oX8vIGK3Lg1ibkAcWCWNmm47fBjmAn/woArE8aapr3ViZOzEFlRkuTA3
X-Gm-Gg: AY/fxX7PnwDkops7Qcm/a1p/C4pBX00wBd23gxtqFaShvdBe8OsCfwHHbS05TfscLsJ
 pddxkjlGYyH16o2+9qw2iisCl1TeAfqszUMNiCC/yCk4Y2Hbi1Lz3DwCkRy4PI64nCPPM1V6b0a
 cO5FSx5m6YV+6o7Rc4I+/BaYuvA8xie3nvlzoKW5UACDtSrqOtP4ldDWFPL37uNAm9Tqm60FcSN
 PJJ+nZb86PW5Heten7yVIYMTayAE2cuk73j5251A7fCbWsaE5EsRh+kDGpiFYD4GfMM9KOn9qB8
 phKjsJ39wq8MjiyLVwVtkuStikhc5rCUiml+Qx3CAA6bJeo6teqFvHiCEC1rdqrn3ivwH443zlT
 SkKOznR5F/wRLT7c/YhaKnW3wuO2oMew+QVoLLk6qPRSjDnOeD7GYLCNsml9DHa9F20BScuHD/D
 k08BrT4K4bEes0g0lnoMKKSpWS/d7ZLh0YAgmFKVLoVece58FKzASdDifk
X-Received: by 2002:a05:6402:1474:b0:64b:82c8:e7b7 with SMTP id
 4fb4d7f45d1cf-653ec45985emr1298237a12.24.1768380435183; 
 Wed, 14 Jan 2026 00:47:15 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507bf6d5d4sm22379136a12.32.2026.01.14.00.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 00:47:14 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 14 Jan 2026 09:46:48 +0100
Subject: [PATCH v2 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add
 memory pool for DSP i/o buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-thames-v2-1-e94a6636e050@tomeuvizoso.net>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
In-Reply-To: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
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

This memory region is used by the DRM/accel driver to allocate addresses
for buffers that are used for communication with the DSP cores and for
their intermediate results.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
index 3fbff927c4c08bce741555aa2753a394b751144f..b80d2a5a157ad59eaed8e57b22f1f4bce4765a85 100644
--- a/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j722s-ti-ipc-firmware.dtsi
@@ -42,6 +42,11 @@ c7x_0_memory_region: memory@a3100000 {
 		no-map;
 	};
 
+	c7x_iova_pool: iommu-pool@a7000000 {
+		reg = <0x00 0xa7000000 0x00 0x18200000>;
+		no-map;
+	};
+
 	c7x_1_dma_memory_region: memory@a4000000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0xa4000000 0x00 0x100000>;
@@ -151,13 +156,15 @@ &main_r5fss0_core0 {
 &c7x_0 {
 	mboxes = <&mailbox0_cluster2 &mbox_c7x_0>;
 	memory-region = <&c7x_0_dma_memory_region>,
-			<&c7x_0_memory_region>;
+			<&c7x_0_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };
 
 &c7x_1 {
 	mboxes = <&mailbox0_cluster3 &mbox_c7x_1>;
 	memory-region = <&c7x_1_dma_memory_region>,
-			<&c7x_1_memory_region>;
+			<&c7x_1_memory_region>,
+			<&c7x_iova_pool>;
 	status = "okay";
 };

-- 
2.52.0

