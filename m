Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375FD1AB0B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 18:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB20310E369;
	Tue, 13 Jan 2026 17:44:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4DFD10E369
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:44:49 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-64b608ffca7so12290137a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 09:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768326288; x=1768931088;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=s8k0pXMV1y8Iq4ImwhXf2ahDkvy9IQZJDHOXmgWjWKM=;
 b=JUe3znPirNyd/bhu8VQlPQf31gqjKaXCzhv5jvdk88O27ISwXfOu1ZXs/zoQ4G0WJD
 Q+QLjpBx2rBRS2KqgzIt5M2wAv0FmacckNkssfDxX1X++HalUlqYJsWcRhF/UJnVEhY4
 Vjd3dn1nPg/RZ9LnePpvAS8RjPgpm+um16BNujILxt6eTh7cfVrvxIXsXE6yTWa//E10
 DqtGqmCMbi4tpQUwxp66ZphLn0wFB/FoJO+uSS09OPLX7WmH6Ud3uuxGbboshcakdvRf
 DizL/3RMo/FuljdVAQOI4Ybysn7fyOiYEfUaV8x6qh7LJ0yB4mkxaTbh5xflkCNLdxC/
 Hrjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpEgYfvdOojOl2q8X8y8CGJgLZsn4HXsHhmCsi8rJBq7x5kbx8CRJdNklbt8GsIDg3Ofz5IikOfyk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzC0AcNy9M7U3Q21d+gSg1Nl5BE2S/DsDNhj4JBLmNNgWhI6Rg
 c1kKYbtiOWO0U08p4nKBJBJWm/B/5v3gKikvdik05TM9Zruc8xgze2Mi
X-Gm-Gg: AY/fxX6VZV9DGeyAzEAfdi7JmHTfETYG2ekk48f7hqX8tWZzBI6YfPI4q5d3pEVKWg/
 iUcapKWOVH5C9nZylSnSW5H1vfImPaahx1cVqhuAktU3zcmfPFXCS1KRIQoyLIvOhsPw+9jCHrp
 423HJTAxLDN5rEt6u3tsjMgyJdfYnIRdrnYBN/HKAf1uBNElsGESFl1ZvccaP7a2rPAwdJdGa4W
 p3FGjrG5WaqPUoCyB8xVKfcdzI46zYdpTWNqKuU0Vmr4/4zMcNfRyv9r1s8RdyvCvwMOEkMd6f+
 vLh7oBVgEijuTn5MNnqP0vvfD3ONOoyaBgW6gqLsH7/uszLjjE3XhBO+7+IEmJn5jca/VRe9hmT
 /r9SGAQwbO48Dcyg2ckV+RYcpH/vQfGfnCkZuC+bm9aCFFboSCK6kAI1sXFkeQu7xkW/dsu9GgS
 AbGQ9jQbUqCAiLY3A67/9V2cv5Rolzo7UONEI9akkDof2q2w==
X-Google-Smtp-Source: AGHT+IE2YWlpMgqpFTSUm4yiwlEdYSG2L29zcJaQPD88F1bJ4MCCWbGfpor4ndxKjRsmJ+9m366jmQ==
X-Received: by 2002:a17:907:7282:b0:b87:892:f440 with SMTP id
 a640c23a62f3a-b8708930758mr832434466b.38.1768326288113; 
 Tue, 13 Jan 2026 09:44:48 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 09:44:47 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:35 +0100
Subject: [PATCH 1/5] arm64: dts: ti: k3-j722s-ti-ipc-firmware: Add memory
 pool for DSP i/o buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-1-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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

