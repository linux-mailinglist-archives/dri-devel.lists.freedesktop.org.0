Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A180F26A4EB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 14:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3AF56E26C;
	Tue, 15 Sep 2020 12:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC5A6E26C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 12:19:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id z9so3245344wmk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 05:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0xP//LC/JAnxfnl6E8AG6wYjP1bfMTZSmuoa8PLIdQ=;
 b=1GseTMFv3VBD+l/ZbJu70sdyna8HX7Q9Y3kd9CNWJfzpgmcxj50frrDrMlisuErsz+
 XZvKQDDLuVqe4Rr/4XizNQyWt150VGfmxP4tUAoX2BEGFilReRHbwPYgTmWbNcwe0d5z
 Un/x6V6eDqLFZf8/C7VnXiT/BgkcN3Q7WJCPikvDNr7EK59Gi/Wc+J6/10LTgzksvFV0
 ddlyn4S8++wymZGcymJ+DvypBpjPPGBRl9I9qAz5gHapBfPyw/No727HNejEKyj5qnCp
 ABnDEkFdHy9iZwrYcf+PQbhgBwfOgseEfitn5UJUtrJkUC6VSm79gUIPrRK3v4LumHqk
 saqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i0xP//LC/JAnxfnl6E8AG6wYjP1bfMTZSmuoa8PLIdQ=;
 b=HISoEfzp3o3dwr1tt+CMZueXPn8b9MtzOg71dmM1ShpWwS9kA2mynIqxtz1IwXwrH+
 J8BOCCi/NPBZJr9TwiJqYax02DMAxEB0/J/Cp2Una3MgMKjNei1ocWyVetOAccf4oMWD
 wxSGRfLIdHIyOjCXEFO13engHoAri5/2NXZX8fChkEBsZqqFEoddhK2zZWBaHY110vFv
 1P6l4SqjUVvbgfta6nQ1uewliQr+o/Stsn6KHwFDnQIcZhxc/AmXGJXJvJvycbh9OKyG
 5PpRCi+gtRpVvDYVZG3gDff6tmRH8a/e1rBNerU/56yeZCfB+d6H73kiMpnwS/ljc4QO
 POpg==
X-Gm-Message-State: AOAM533K7Pi38gdtbCocaieqhBHDo1Y2usOKCbp51UVb50MylwN5kluT
 ZrsIISXcojo8Uv2rFf9AwBIX3Q==
X-Google-Smtp-Source: ABdhPJybSb0kYSEofFmaWgshAySRgZC//CUx/9p1zAMvIm0aMmbt7ZrLqp91l2b0uPGrWrXR6CHjUg==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr4474794wmb.170.1600172357860; 
 Tue, 15 Sep 2020 05:19:17 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top Display
 Optolelectronics vendor prefix
Date: Tue, 15 Sep 2020 14:19:09 +0200
Message-Id: <20200915121912.4347-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915121912.4347-1-narmstrong@baylibre.com>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
MIME-Version: 1.0
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
from Shanghai.
Web site of the company: http://www.shtdo.com/

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a1e4356cf522..fecdc7200b40 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1037,6 +1037,8 @@ patternProperties:
     description: Trusted Computing Group
   "^tcl,.*":
     description: Toby Churchill Ltd.
+  "^tdo,.*":
+    description: Shangai Top Display Optoelectronics Co., Ltd
   "^technexion,.*":
     description: TechNexion
   "^technologic,.*":
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
