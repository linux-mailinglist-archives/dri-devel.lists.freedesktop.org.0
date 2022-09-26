Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C85B5EB111
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 21:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E4410E779;
	Mon, 26 Sep 2022 19:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2604C10E776
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 19:14:36 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 t4-20020a4aa3c4000000b00475624f2369so1271280ool.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=MR8x5tCxo5+AsVIz5WY2dO7QkwtS6s1ctIFSET3Abos=;
 b=L65alZtt01iELtJ1IiE7y7QJwZaYNPYo4cwTkNruRqcegN1RUG6lT+YA1Bff/H8uCZ
 lwXf6/hOGdeueLuNLyEtr/GTdRB1mrQXwqwHllidOinFRjB49qn4O1GBYZ0BwBSdYE06
 XnNuqxh6IqCIjm9Am3vZX0ez7Ovf1TjkzgRPC2JIlo9FXPzkklA6SVv6uW9iwzp7mcp7
 6Gol7vopEh7RoUzbEGJi43kb87CJ35qg6pHzBM/+4dEHsWtzef67/LxbmwccRQaKccXz
 ahRwZzCwqPQnUv8dlZBffMZkoN8CmwRPx/XQd07DbdXABTcV+07/LhgOwWj1JniZydq1
 4hgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=MR8x5tCxo5+AsVIz5WY2dO7QkwtS6s1ctIFSET3Abos=;
 b=bv1NrwdgVQXuN9o5jz03zraa8mXUKjSap66hA8O5PfaDLSHdQBntbz9dbJBm8jelBj
 uihb0NNnjcDnHdD1k8Y4wpspia0zMAvylPAW+pFXKcohWb+oE1VcwyufpbHJOAW2psMi
 72ZctabbiUgxnjJNIXTWsScHVum6QIEiOztUQIuKjNTZaMIFTu5OKQeX5ajD0N0ePAEb
 X0bqXuF79lYgii0cCYhWltSKFx8BoL16Q5TzBLgJI/xZFSZCIdeDeLLAIOV2LSmbugT6
 1hvOu3/b/TnweJ97R0Vb3XNSQBKE0XbYaxIsy2IDXp6MPHZP0IIqIbmeK1Bt1REFH6g3
 33iQ==
X-Gm-Message-State: ACrzQf3jC/pSE882W0PlhVYZQ53oi6XHQF2nFPMR3xMrC2amm65v+j0u
 Kd/Bvc0tZpuGral8lelAYEvnYyDVffo=
X-Google-Smtp-Source: AMsMyM7Dq6DumkgXKLXqbaaLst7icSp7XqBUH1rcC+01MfB85jDCGybIlp1dy7fSgBgjokbyMOcnIQ==
X-Received: by 2002:a4a:1843:0:b0:436:1611:6b51 with SMTP id
 64-20020a4a1843000000b0043616116b51mr6659381ooo.18.1664219674992; 
 Mon, 26 Sep 2022 12:14:34 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 p130-20020aca4288000000b00350c5d946casm7278131oia.4.2022.09.26.12.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Sep 2022 12:14:34 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 1/3] dt-bindings: vendor-prefixes: add NewVision vendor
 prefix
Date: Mon, 26 Sep 2022 14:14:26 -0500
Message-Id: <20220926191428.4801-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926191428.4801-1-macroalpha82@gmail.com>
References: <20220926191428.4801-1-macroalpha82@gmail.com>
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
 Chris Morgan <macromorgan@hotmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org, maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

NewVision (also sometimes written as New Vision) is a company based in
Shenzen that manufactures ICs for controlling LCD panels.

https://www.newvisiondisplay.com/

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..d9c38e214863 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -873,6 +873,8 @@ patternProperties:
     description: Shenzhen Netxeon Technology CO., LTD
   "^neweast,.*":
     description: Guangdong Neweast Optoelectronics CO., LTD
+  "^newvision,.*":
+    description: New Vision Display (Shenzhen) Co., Ltd.
   "^nexbox,.*":
     description: Nexbox
   "^nextthing,.*":
-- 
2.25.1

