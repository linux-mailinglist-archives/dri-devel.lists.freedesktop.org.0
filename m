Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F6C722B2E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DE810E2E9;
	Mon,  5 Jun 2023 15:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484CB10E2E7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 15:35:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f60e536250so43846585e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 08:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685979355; x=1688571355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d8VaZ858WGTztv9OyCXzp4p0rlgykAZTm6ZPkmQwQoQ=;
 b=Ig604a9q9Z49rU8shBVGVHdxumqDNFzpGaq9ADNd1Hi0+LJKnUCcjak88DsuRZhFZ5
 CC+Q+IEKQt28X1hdjwlFVIHoyMvKChf0HJui2D24AT3s+b6PFHoiSMtiPvRYuaaERawT
 +6DK8U6+FS0CRUPUduNFuRiXdsnOmp6+3IZmXNgCw8hFDRFe9xyarcjIqguNa8fhq3le
 1SqfAOruedLvMAURQGH+xZ7L0il8z/fKcgBhLe2nKUasfi0pea8SBFyPKT/QpQ4Vxez4
 YTvogruLnA/kbrY70MTdUaJlEZL03CNPTKZX+zV6dvClANaCs6GRIMlRVdekkrx6kEWE
 M/ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685979355; x=1688571355;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d8VaZ858WGTztv9OyCXzp4p0rlgykAZTm6ZPkmQwQoQ=;
 b=ekkHHkRkTr9bKbf3TOMsDD545jnnHzTwWD/jxgDjBmPIi11t6QoKDFbgtGafYQKsIH
 ZrDx56m05acHes4Bman2kMA0436io6UuVp3WfP9AmoSlNe9utKZFlDQv3uNYtqfChnDs
 ndWnmMyCO3mLO+LWarRC6MA3ljA95REG84O6lpKr3zVIY6+5Rf9UVAnXq4x7vOOoyjqF
 lIyDsufTPgAOgFYVYfEL7YL0UEhUTZByYoYpXa5WACiOej0Fo15Cf4r27cHsyF4Tolqe
 wQcL+J7O9K5tmcgkX1KBZKLIkNB8aiXl/GH7ACgCgZwpT/WGKw+jtH5ubQD4Hq1ocLIZ
 +Big==
X-Gm-Message-State: AC+VfDxEFEGDC2GSIcGzA4iORwHZgNInPWBud2mM7/IUZO9+21SFk2W/
 uUznNZfvxzVWDSrEjoefx98=
X-Google-Smtp-Source: ACHHUZ6S2Rl1SW8Qv9aPJ1WgwuSiwYk0NFonaN17KfpBpEjkfwk+S4Eyc8eYs6b+KMqaExMNUFhRrQ==
X-Received: by 2002:a05:600c:220f:b0:3f7:395d:6585 with SMTP id
 z15-20020a05600c220f00b003f7395d6585mr3617671wml.15.1685979355325; 
 Mon, 05 Jun 2023 08:35:55 -0700 (PDT)
Received: from fedora.. ([95.168.107.36]) by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f7298a32ccsm9741165wma.41.2023.06.05.08.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 08:35:54 -0700 (PDT)
From: Paulo Pavacic <pavacic.p@gmail.com>
To: neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org
Subject: [PATCH v2 1/3] dt-bindings: add fannal vendor prefix
Date: Mon,  5 Jun 2023 17:35:37 +0200
Message-Id: <20230605153539.497602-2-pavacic.p@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230605153539.497602-1-pavacic.p@gmail.com>
References: <20230605153539.497602-1-pavacic.p@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paulo Pavacic <pavacic.p@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fannal is a one-stop-solution provider for touch displays in industrial
application, committed to delivering a variety of professional high-quality
products and technical services globally.

Website: www.fannal.com

Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..f962750f630a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -462,6 +462,8 @@ patternProperties:
     description: Facebook
   "^fairphone,.*":
     description: Fairphone B.V.
+  "^fannal,.*":
+    description: Fannal Electronics Co., Ltd
   "^faraday,.*":
     description: Faraday Technology Corporation
   "^fastrax,.*":
-- 
2.40.1

