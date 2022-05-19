Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DA052DA3F
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:30:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BD210F1ED;
	Thu, 19 May 2022 16:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D6D10F1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:29:53 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id y66so1036170oia.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
 b=I6imaRrfGnZliOI69/LwjY0OorZ3F7ezKE/07z/jV5EhH/5ay2ypwNz8GeRjsqTc3C
 Qcp0Xv7cf1asBOHcy/1xF1bpujjPBb/e2jYz62I0AI2fArRfY5tNPBb7KHdibOpEOFiA
 vQd0jpq5B1tMNAk/IqR3ux5jRwvl4Ze6dzqixMXZWY8qcMqwKYQEwlUru9458f91HrJQ
 qVB4U8555+SZ9kPU50Krq1hzllXHxHY0uBgm04cfUsQnhvQdwcBD4HUcOJLYI0D1l9iz
 4jl8ttgynxGv44A5BRgNgDfANXr2h0QI9GQd8WjCQo3Qo/cfZmQtaVxTTrwi3Sz2OWl5
 EF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rU7StC0vWHC6lDgyRB9OrYSRZCxJxqMjaJg6rAe9Yu8=;
 b=BfjFN/urY4YYCgISh4wsQ/OjTNJKDnMP+NyuIPDfXzMonR6RqSaRub9Y6tQ8eSI3xD
 My6CbHt1UbRVdhb3PULezUwUFXJQsE2P8ov8Lp6Abp/h4ZWqhSD6OSBVuhE2V27wr5VG
 mnHosP/ziaffaNDJe/Vyr+eb4i4IkB7+H+De7ccc2dI9JRNhRELC0kPgyxJ0uhwLRHAK
 u4vrLil85k3aeu2ybeUloVbqLp6L6XkbKcY8jd40K5GiFLRazoVhui7U6ya43YtpPgjl
 xPNVyNeTmVTr92DeQzmu2owBiYMtqbYffNQnvzmBE/cVQk4KB8zbRiNNg4T7ysSlXDJb
 y/UA==
X-Gm-Message-State: AOAM5316KMjw+Mu2+FdFhQs2xbPQiVnBb5Co7CyouWm8NKO1r9rT/QQ1
 cT3fGx6pOYoZT5ExakKjQCzoULfCBZOo8Q==
X-Google-Smtp-Source: ABdhPJxvaEapVVMCSpa9P/lKDR01HM552ZAL24tsPY0z1yBhN8SghENEDuiSNbss5XiE7D5Mc1gRRQ==
X-Received: by 2002:a05:6808:1813:b0:326:a3fe:2259 with SMTP id
 bh19-20020a056808181300b00326a3fe2259mr3104120oib.292.1652977790795; 
 Thu, 19 May 2022 09:29:50 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:29:50 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND 1/6 v2] dt-bindings: vendor-prefixes: Add Geekworm
Date: Thu, 19 May 2022 11:29:30 -0500
Message-Id: <20220519162935.1585-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519162935.1585-1-macroalpha82@gmail.com>
References: <20220519162935.1585-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add vendor prefix for Geekworm (https://geekworm.com).

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45..c0c7627c6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -455,6 +455,8 @@ patternProperties:
     description: General Electric Company
   "^geekbuying,.*":
     description: GeekBuying
+  "^geekworm,.*":
+    description: Geekworm
   "^gef,.*":
     description: GE Fanuc Intelligent Platforms Embedded Systems, Inc.
   "^GEFanuc,.*":
-- 
2.25.1

