Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9062FE57C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 09:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C7B6E8E8;
	Thu, 21 Jan 2021 08:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 151896E0C4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:59:15 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id n186so18041383oia.5
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 09:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U6vYGtVByg2m5erRhHMzBzAjaP5prWspvQEAVY9PBM=;
 b=BqVUi1lHHvSjnBV1pZlQumIEQjIPfYjmend3IeZrB4kymw0W0EBFwYxIBa9xtpIJXv
 t8JsEZN8aXoaKP9glxERsAufIB6lmV6RfQxH8tEvfXB5QLV3q3qd1Sf5GWvEzeSPK0a0
 vw9ehStEHB6v1ru32ioXtxy7ebo2fPzFtps1neFaKjpt3AD7PMSKrIH8OLI2KeoT6Jty
 D5zOJZs3huE7HniE37GXu6sRfpKL4qzjfGiA0dChn12nRzHDSnSI5lQUkT4dRDtT7m8B
 V8HPWyg3stVghFtEizTYR/jb5ASFjZU5p2sq/mnSeRYa/sQ6k+7WvA11GQC1APLkIfAf
 +vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3U6vYGtVByg2m5erRhHMzBzAjaP5prWspvQEAVY9PBM=;
 b=Q4WkgigTVnlUNpkVGtADOY8Thd0OSsFywCI/lhyo9PwXXjKzfy/9I9WuCqhovrh+Wx
 ULCXGQh14+uFzo5HwOeOtY/TNCy36gdHTT6D9qRWV0Eax/wzvvdMrS3P2L0DpeErqeO1
 BPGVqjocP0eBAjTkW+KWj4jgHcBx5+Vmj/QOYE+BKeJrSJMkiQZsYSKsCLPHOioqsxBk
 7zeq4oAELaLYtaAD+N9frFvFoSG3nyOrBDG5CqBP0yG6vXHUFR1ZMisawhZAxp3uRepE
 r2NxVcDFBX10ud1bEnMLy1XXGicBziGUsDcF4PLRuI1zqfjyu5pgeM/rkF+/4SxVfsUf
 GjNg==
X-Gm-Message-State: AOAM532dXqwZF95SCrip7WwLIKdmgSUyl4LfRiz0dvUux7wiJ0XXoOj8
 sY67YntOiubOnD4G8Kg3EPrGPg==
X-Google-Smtp-Source: ABdhPJzMa4naberyKAQmIyMibf+8/N+b6lX58rrLjrB7kNI9H0JT/6aWR2QZBr4hkaZHhrv5qOUoXw==
X-Received: by 2002:aca:a9d3:: with SMTP id s202mr76631oie.140.1611165554215; 
 Wed, 20 Jan 2021 09:59:14 -0800 (PST)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id p25sm507421oip.14.2021.01.20.09.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 09:59:13 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] dt-bindings: dp-connector: Drop maxItems from -supply
Date: Wed, 20 Jan 2021 09:59:22 -0800
Message-Id: <20210120175922.1579835-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Jan 2021 08:52:32 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The meta-schema recently gained a definition for the common -supply$
property, which denotes that maxItems is not a valid property. Drop this
to clear up the binding validation error.

Fixes: a46c112512de ("dt-bindings: dp-connector: add binding for DisplayPort connector")
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/display/connector/dp-connector.yaml      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
index 1c17d60e7760..22792a79e7ce 100644
--- a/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/dp-connector.yaml
@@ -26,7 +26,6 @@ properties:
 
   dp-pwr-supply:
     description: Power supply for the DP_PWR pin
-    maxItems: 1
 
   port:
     $ref: /schemas/graph.yaml#/properties/port
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
