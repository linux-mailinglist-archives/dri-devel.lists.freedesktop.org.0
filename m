Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296BD1F0F09
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jun 2020 21:14:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA9B6E3AC;
	Sun,  7 Jun 2020 19:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA296E39C
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 18:57:35 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id j18so4708221lji.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 11:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dYJTTF8rWAxRJdQ4tpKkvqb5inrmde6SNOd9Wsb86uU=;
 b=M1OyI1BobX9/9LpEyl22fsRNK130NEOqmz32VAHPzSM1Jn0Jgeu+H0s0r2TeRcePle
 h9Is+YKeOhPizw0mpkiwJ3bB7FhpqJoPLtkpTUt+b0ss6gSBYfBvbgv63COEx8+GNrMa
 9nEGUA9oostXE77s8kjPn3LzX5ZUdm79qr1Tmv0GPNFbayzfPxFE398B0XQ6r7Lifw9I
 T8LOy3FrPoBOlH+CEGWNBTfBif7g48muxQpid56Kj3+8BwtY8VHeLeivMLYcIOcehC54
 MJ+mLF7s2GP9WvscYfNJE9FMO6KxtBgVDQbQC7ulsn/cmUL5YZQkRcICDW6v11nbbqnq
 Nmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dYJTTF8rWAxRJdQ4tpKkvqb5inrmde6SNOd9Wsb86uU=;
 b=VXnCcNlBanQr7sjfGMh4PsKNoVoJfyv5QSI8TQoqVe8v3w1WgVglGwE6cNw3pf6IlU
 pGAaTd3Cj319LZHSI2o+0D6OgaBkWpyoYSHyuc3XqmjH4JJRZR4Uq80F7Ve25HOWTGZK
 /H5Kzgxy618cDZU6FK3e3gLClbLmFP1N9xdjWoeFUqFd/IrMsgHED5+5f3HFRUTVxgxj
 L1GN/NVKjXkl4aqWirybOw9DCh12SECk4/JswPgDomsQboE6//OgG9iifLJtlP8D82Sj
 3fUOGxxRV5ZsEz4gABzBFL6E5v0G0cPcXcoXSsaDV0oRVlrG24QBb2ELRjQ5+5qMjLrI
 pHKg==
X-Gm-Message-State: AOAM530p9oh3Pk+JuCGW5KjbxJWaNfIIJ2uRBeGxYZUb1wRVyen9+3ed
 p9vNCGTB1o5NWhEl85Za9+M=
X-Google-Smtp-Source: ABdhPJx2csaExXW3XWL310NKGsrymfkpOB1JCiNFzP5oJ3MJ+j++QdDd02RZi3yI9m4WaFuHTaTeUw==
X-Received: by 2002:a2e:b5d0:: with SMTP id g16mr7425214ljn.246.1591556253743; 
 Sun, 07 Jun 2020 11:57:33 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id e21sm3650953ljb.135.2020.06.07.11.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 11:57:33 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v3 18/39] dt-bindings: memory: tegra20: mc: Document new
 interconnect property
Date: Sun,  7 Jun 2020 21:55:09 +0300
Message-Id: <20200607185530.18113-19-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200607185530.18113-1-digetx@gmail.com>
References: <20200607185530.18113-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 07 Jun 2020 19:13:00 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Memory controller is interconnected with memory clients and with the
external memory controller. Document new interconnect property which
turns memory controller into interconnect provider.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra20-mc.txt          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
index e55328237df4..739b7c6f2e26 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
@@ -16,6 +16,8 @@ Required properties:
   IOMMU specifier needed to encode an address. GART supports only a single
   address space that is shared by all devices, therefore no additional
   information needed for the address encoding.
+- #interconnect-cells : Should be 1. This cell represents memory client.
+  The assignments may be found in header file <dt-bindings/memory/tegra20-mc.h>.
 
 Example:
 	mc: memory-controller@7000f000 {
@@ -27,6 +29,7 @@ Example:
 		interrupts = <GIC_SPI 77 0x04>;
 		#reset-cells = <1>;
 		#iommu-cells = <0>;
+		#interconnect-cells = <1>;
 	};
 
 	video-codec@6001a000 {
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
