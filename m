Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885E18C886
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:02:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9445E6EADD;
	Fri, 20 Mar 2020 08:01:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525BC6EA6F
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 20:35:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 11so4200332wmo.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9RRhROApEcb204AeuCPMJcD4+LhyGPoAGUFvTjnDbJk=;
 b=WuLvPS7MO3JjnrTdyLixJJozVeO+g7q1Bn4vs++KlrdqcqvFbmcfIvQBAOmORNBXEN
 wTsrY+3Rltjd0CtCSmKo/JSpM8G/UiHa2FqYByMaBiNH27pT0aQDVlA/F38jZWBCLA6K
 cPh0AtXXzzN1uOb1RgNafI/aAn0mNdaFWPLu7CPMl1f4ergvhXPzcc0gUtUESz7xsV44
 mF44eDc9PFdb3XgU0fjvQUIP85tl00qiJ3sd8kGOYXnyzy72PiOrOE4qQSnhWFkp9aCh
 IvgNK8o2T12ufzW65jJ+3HzRLdXDrEc4D84ZGPqMMvpLy+o7AzkWskaGWokGAw9tgDlP
 Yvag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9RRhROApEcb204AeuCPMJcD4+LhyGPoAGUFvTjnDbJk=;
 b=Gxk4yF4CPSfP1+rLZm43IhsuJlhU4RHXBtrN8NDMd0Z7SXq8piybT6iTBmngD5Jg2b
 ncvrz8F9E+cWST721ZN3QGb47MeAkgWvDp6TCRKtP4OoriPpleCAQPzIzoBG3qM2LCtv
 YLJOGzCN3UNUJnsoGzoiLeWt1mO7heq3AGp43BI08PkV7Kq7ASwTqtWNpkgbbuwGEGyQ
 0nPFOUfBMRbeHgyn6vzgf4s9cor4/Q/00ad1NtrTMpy1qEs8guUqmTiQR4BXtw08/i5G
 uV1Zq5lBv6rXNLJohGumYYyv2WsF2opLD8QSduqrScPiERyESu1veHriE28MCecxeUtW
 5mgA==
X-Gm-Message-State: ANhLgQ2RD23eDb/g66vfCxhg3pcXypN8prBgV8VOdc1Cr261C7oYC+iq
 qcfgPmDR50HgL343KKwfZYM=
X-Google-Smtp-Source: ADFU+vvN87aV9h5DQk373Le1newa2fcLju+bTKeM04zZKybI27soSbkw0cX8T8TODsUPXqH4hqsCZA==
X-Received: by 2002:a1c:c907:: with SMTP id f7mr68703wmb.121.1584650101005;
 Thu, 19 Mar 2020 13:35:01 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id r9sm4744968wma.47.2020.03.19.13.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2020 13:35:00 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: yuq825@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] dt-bindings: gpu: mali-utgard: Add the #cooling-cells
 property
Date: Thu, 19 Mar 2020 21:34:26 +0100
Message-Id: <20200319203427.2259891-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
References: <20200319203427.2259891-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:24 +0000
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
Cc: tomeu.vizoso@collabora.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, steven.price@arm.com,
 linux-rockchip@lists.infradead.org, wens@csie.org,
 alyssa.rosenzweig@collabora.com, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The GPU can be one of the big heat sources on a SoC. Allow the
"#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
overheating.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index afde81be3c29..33548ca2a759 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -107,6 +107,9 @@ properties:
 
   operating-points-v2: true
 
+  "#cooling-cells":
+    const: 2
+
 required:
   - compatible
   - reg
@@ -162,6 +165,7 @@ examples:
       clocks = <&ccu 1>, <&ccu 2>;
       clock-names = "bus", "core";
       resets = <&ccu 1>;
+      #cooling-cells = <2>;
     };
 
 ...
-- 
2.25.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
