Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD43CEEBCD
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 15:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D2210E04A;
	Fri,  2 Jan 2026 14:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CaYDvii0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DF810E04A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 14:17:16 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2ae24015dc0so11505622eec.1
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jan 2026 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767363435; x=1767968235; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=M6JQu04Ya/eThlA1Fh5omtKaI5pVRfLCtH3qPoS+Xq4=;
 b=CaYDvii0ybV7fCQCvmqlzPPlSe5OMue7gHH+5+kX5oJqEvrjMwhB+I/PTTKCu/WvbH
 EVpDwwKBfC/+EEkeCbhMeY5aR553ZIZE+8M+7vzbfogR5P2hc6Bcy1RsTNhChOpATZa7
 fmmu26ywVF3v4iinLMUPJNpe2VtG3GCbcwPnCuUX72aYbsypUhqlz4TQOZnQuKUoO0gr
 N/50pSqmBegI9zGlO6qH4uuZ8uQ3mjDEtJlygSeiILbmnEMnH+HpZoND0lWsQvKdmY51
 vSsyM3m6eaRkW2nbZlRUwOOG8xNrwECRD1o2OiJmDZxeaOx3bJmBoscQ8Sh/ztiBLWJn
 f/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767363435; x=1767968235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6JQu04Ya/eThlA1Fh5omtKaI5pVRfLCtH3qPoS+Xq4=;
 b=dlznnyppVxF91XHyJ+WIzN41b8Ay2Ckt/tfr4CgZMi4+yRYF3li5H4OruM8NpovC+v
 be+ZdZv87rT9R76hY14MnZCteRF1TrIYCH8+Kq5TGUiOPUuV1OPg+56gzfUKeRwnZ+H3
 H5PNhiO8AZCdmSOp2C94zCrwLgvA5A/djUlIVGB612lWRJ8ypZrXbQS9lYvz+9xCY8y+
 JQiyPuZGT9DOvYdgZfnAnJaAxSoauXoBtzuRsRY0IpCgKjLTApEI891ksCYbKGWnCK5R
 x5S4DQX9lihG/TQnCOQfHDPimmsAv8cmaxV3RTO1I0m2khkX3ecM+Mvb8ZDlCvuP6DYO
 PdvQ==
X-Gm-Message-State: AOJu0YzPH6yiHE5DadfhGJOtnRu/Q+vfY6K5xJCXhAzcFnNeRmAWARlL
 7SyQXPg2BW1qCV4ZdOAZPC72ctGPcSf4hGRYZTDmHwQqSqbOVSMqVS8w
X-Gm-Gg: AY/fxX4exxfAIPkvwAxG3VzbDaZ3hywM8E5nmheQX4ZZ7v4Qk2wRQDne2MZeCzA7EJA
 THeuj5CXr5VvzwJg9GWuhRkx+GgBWQh3fBnlJcq/Rqglh/bjtoLU4+nCLMeRYIXWVJcrQHHFDTS
 uPvwEPETJvnpH00vkmjcMeLbYCzpnm5IllO6JDs3Nj6hmEM8NAhmUj+Xl+AMUmzA1zWkxp/Ww4v
 +hMv12Eg0c/u1x7ZDiSovW0Dzo8zhnAmmVumQEKGuWMBp9blbsyckX2bH2DYxysiYzqiA+ImYfx
 SFyLa78c29CDES6tPx8Rx5IYtPgjsfAfoPqUnboJf9k8gIFiegM5ld1bbcgnwF7+VqqUlU4yiqo
 eLvQYGELUv2eQ7Fv1sGhSAjP52ukRbJXe0IhDnan8BMyMe9MNAlwJrCsTfv7AtJX0LSnTPSd1Qg
 We+Wr51Ua78JNWCwS7DntiqCs=
X-Google-Smtp-Source: AGHT+IHRbwHKS1jnctTSLGEsxcB++H91ndItbrx0Rlhh25Za0CVwv3MWEfAnrIj2LVHXsV3dEr2p2w==
X-Received: by 2002:a05:7300:f68b:b0:2ab:9d23:f0b1 with SMTP id
 5a478bee46e88-2b04cbcb383mr26238952eec.13.1767363435158; 
 Fri, 02 Jan 2026 06:17:15 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:388a:7a66:ea1:ff85])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b140c42ea3sm840356eec.29.2026.01.02.06.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 06:17:14 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add Innolux G150XGE-L05
 panel
Date: Fri,  2 Jan 2026 11:17:05 -0300
Message-Id: <20260102141706.36842-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Fabio Estevam <festevam@nabladev.com>

Add Innolux G150XGE-L05 15.0" TFT 1024x768 LVDS panel compatible string.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Keep the entries sorted. (Krzysztof)

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index fc244fbb5a54..2a1c616aac9b 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -178,6 +178,8 @@ properties:
       - innolux,g121x1-l03
         # Innolux Corporation 12.1" G121XCE-L01 XGA (1024x768) TFT LCD panel
       - innolux,g121xce-l01
+        # InnoLux 15.0" G150XGE-L05 XGA (1024x768) TFT LCD panel
+      - innolux,g150xge-l05
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
         # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
-- 
2.34.1

