Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31C611BD4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 22:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1246A10E8D3;
	Fri, 28 Oct 2022 20:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7510E8D3
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 20:50:16 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 t4-20020a9d7f84000000b00661c3d864f9so3642254otp.10
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 13:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UVGg0nA9wNIi0Jewzc4LnXJCRV2Q026/w/hAmHhcOh8=;
 b=H1029xbs79t9tr1kbLWT6fPLxjSzS7siE74Xl+uCOWnjSt7j4GsyKbM9xkyum3YzkD
 GVI31mt+VG0CBbNOGzUwk5+mGquDS9iC8rWCj6jE3gbpP5STHe5EiOEsXzWvHq75/MGR
 tyMUngcCL18QYIyyznBywbOpQr7K0MIVL/RMjhO338L4mV2IoSNmR4HRaUWSgv0Utpf0
 bzocEPVz5dgfO+but3uoUR7XAwQTXbgj3iYzfBDSFszqBH8+6zx8KnwZfuk6Bklcpc0i
 KmkkR7vgO5x6b4ndGauKWhsPGIOCynxKkQqA9bHpj0qJFOqC1yIVQBQcjA97Bq8NzuXK
 7b4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UVGg0nA9wNIi0Jewzc4LnXJCRV2Q026/w/hAmHhcOh8=;
 b=HKMYc4y6wV+xj6UfFZevjmBCCGZSZxjYd/j99xKv/g3Xv2b1PeE5QUVVuTwdSsjCJ5
 DtTQGzaa0PhIp+Btox4sqUAXqYtSB8yOjGMXiUYgMlbsRqm9EWHdSsiusLT/qA94JAHn
 CApBty5PrJpwzHPoywSRb8OqVv8/7KPRjDQ1ILK/zMAwxo8c3Q2pEQE2dHiD8v/Wt8wI
 zjrEpUyNONWaT5fMllwpXs+Fj/uRdLITu4mrKdy31HXD2+OQDnqkbkutVZrEpxKHhXJ6
 xyXNaoopQ0SjVC8p2HUrfvg6o04CKdIknEP4S+zjbyCloSQKbve34TlULR8YBlmhL2T0
 vc2w==
X-Gm-Message-State: ACrzQf2vbO01tMHNC64O/r9Z7RIEkFSmg2tcS8tozz+GtlkqwaZrdb6l
 LBEqvpWZw86cFGa8u5Y2VN70FfmOwRE=
X-Google-Smtp-Source: AMsMyM7z/qJohmTz3kBHDxakuJsKlqG5QpkR37Wxh1gqzFB33xlQ8lYPL1ISD+5AICD4NY7ZNulJ+w==
X-Received: by 2002:a9d:7002:0:b0:661:caa8:5fab with SMTP id
 k2-20020a9d7002000000b00661caa85fabmr607868otj.274.1666990215577; 
 Fri, 28 Oct 2022 13:50:15 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 i2-20020a056830010200b0066756fdd916sm2090778otp.68.2022.10.28.13.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 13:50:15 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V4 1/3] dt-bindings: vendor-prefixes: add NewVision vendor
 prefix
Date: Fri, 28 Oct 2022 15:50:07 -0500
Message-Id: <20221028205009.15105-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028205009.15105-1-macroalpha82@gmail.com>
References: <20221028205009.15105-1-macroalpha82@gmail.com>
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
 sam@ravnborg.org, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, thierry.reding@gmail.com
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
index 6e323a380294..c6aa7b3d1455 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -883,6 +883,8 @@ patternProperties:
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

