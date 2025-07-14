Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85205B052FC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 09:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD6B110E53B;
	Tue, 15 Jul 2025 07:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=scandent.com header.i=@scandent.com header.b="KX5Ic7ZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E070C10E0AB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 19:17:37 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id
 af79cd13be357-7d95b08634fso299357085a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scandent.com; s=google; t=1752520656; x=1753125456;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DFaUvrWskEjlMQIRMtJ+VSKoC1NmEmJ9Sv4J3gL+c0w=;
 b=KX5Ic7ZPCUCtcbPEuG0sBYWPdt1z4u29zgF93aCE0Xban3be3vRXqrsvI62QzYs0g3
 ZpaJFB7YG388NdYJPrEx1aqu9LYgMS/uMZUWx9I+PWChssg+E/cikGz6WM+C/WgEsuwA
 Ywhn/PzNQPRWujSakvqZ94W8ocCxFqvOoN4TSA42YyaYAWqIiM2ohHOhW1TqYQcn3Yy7
 bdT4Ae3Cj8HSP8tzqqQgDNI4pa3VGcCK0VNkdZutIFGcTw3fCfccVt5B+a457mUP9dMO
 DMOfetxU19ZTzRRouqpdRfEBM557i9XKgVA3UhTZEEeruRTzvaPnnDPpbWn4cQRx92mW
 bPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752520656; x=1753125456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DFaUvrWskEjlMQIRMtJ+VSKoC1NmEmJ9Sv4J3gL+c0w=;
 b=POWhtH8k3b4jhcSqWr7Ib3nT53ED3BEgM83Uj4bk747cabECtY0SVdXZvbkdWMwVnP
 qEmlRzGS9VKyehcWZfRsMgRkX0y8woxbKXr7NrSavqd2AnmGT9zkCBC+bxfBuiljpN9X
 q1U7rZc/UoC0kwVHNIsUVMR7fvyU1M7qxncZf/KZUAtkDdWFFNey/lU+ccsi5hvtEPgI
 neBEt8mGZDulRPav71Ny8I1QxYVQBSY8aKYHrR0PahpYvQwnACzj90FiewLCLnHKusMI
 cwC6iyH4I+Y/z/QCRbaA097FU69UUHD9d6ik2724Eh2GQhz88iRgaJNHRkKRegYbcrbt
 8U+Q==
X-Gm-Message-State: AOJu0Yy17WGBDnjLuXZ7g6xlxtcw5mpzA6g6nEwKHT8T/4BOuOvaWNl8
 NwqucJVL8U9JOxCHLZ7HaMcPM0pvhaGf7/fpQdRhjokywOxwbo4aRxD+qJ9p6q9fAZ37sA0sUfB
 Fo91ORGk=
X-Gm-Gg: ASbGncty4MS6+9ZRGq5FftQETTMEXocHjFrOS4NTjfMci4wtjaHzX4OsCuw4vl9k7I/
 c2PJuyX8VcYGBommEmkZtrzyW16M+8J6+j4MY5/cCTueOENVh4KqQaLR6VdQaILhSh4xaWcJuK0
 5VzCjCbNG4fcRRJQaiSwcPG9wLaD0ZgIUAlDKnxrmkVynHNJYEDIP4w5HA7WvdIjnm6wy0aNq7i
 yQqqyT3U28N6GiovyT9KaEli1qAvcfGywzysV9NZnEo0q2zf6fe/BaE95wpZ42spHMx2TDozCq/
 mQa2p5f2or9xeITbTHG9dBTKN3UVY3E4EuwEexc9H88G/E+8xcASwVS/rXcbKZaHANN0oqoN4yU
 mCQMoLAjwWe1HKMXh/fi3GEMyJAh5j3BZHtA1UQt7XkAGOrSL
X-Google-Smtp-Source: AGHT+IHrsHbbxm0SrpAxoF0c4hV0uQgYrBGTUzRv9iZiq/DU11326PFaQC3QWJvvDB74/arilf2aXw==
X-Received: by 2002:a05:620a:17a1:b0:7e1:9c2d:a864 with SMTP id
 af79cd13be357-7e19c3cebf1mr1063320185a.44.1752520656434; 
 Mon, 14 Jul 2025 12:17:36 -0700 (PDT)
Received: from vserver (ool-44c5118c.dyn.optonline.net. [68.197.17.140])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ab801e542bsm1482521cf.3.2025.07.14.12.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 12:17:36 -0700 (PDT)
From: Richard Yao <richard@scandent.com>
To: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Akshay Athalye <akshay@scandent.com>, Richard Yao <richard@scandent.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Caleb James DeLisle <cjd@cjdns.fr>,
 Andre Przywara <andre.przywara@arm.com>, Junhao Xie <bigfoot@classfun.cn>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Tianxinwei name
Date: Mon, 14 Jul 2025 15:17:21 -0400
Message-ID: <20250714191729.2416-2-richard@scandent.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250714191729.2416-1-richard@scandent.com>
References: <20250714191729.2416-1-richard@scandent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 15 Jul 2025 07:24:49 +0000
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

Tianxinwei is a company based in Shenzen, China, making LCD screens.

Add their name to the list of vendors.

Signed-off-by: Richard Yao <richard@scandent.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..cba78c531d92 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1548,6 +1548,8 @@ patternProperties:
     description: Texas Instruments
   "^tianma,.*":
     description: Tianma Micro-electronics Co., Ltd.
+  "^tianxinwei,.*":
+    description: Shenzhen Tianxianwei technology co., LTD
   "^tlm,.*":
     description: Trusted Logic Mobility
   "^tmt,.*":
-- 
2.50.0

