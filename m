Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABB075ABD3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C514210E589;
	Thu, 20 Jul 2023 10:23:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D29F10E45D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 10:27:57 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51e57874bfdso9515556a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689762475; x=1692354475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cvwLnHrPPW9mN3eP3ToOVyAY+fURq9KMI1kYnyRrLew=;
 b=IXSAPoPfCUgRMcJhHe431METrVC72aVsO6ZCnjIjoJb9XJLLXsTyQolXnG3BjDBrOH
 jmxYDc2gv6Z/vdbpNnc8X8gD39giatbIcWHfY7q0CQ7EoV1rXdM31UWr4JSNcYwea0bz
 3wrNDsiUudtaGvjYkwNuxRBpFgYN4mHoFMXqB1wpbAmaQKasCNhyYkDdoWyz//4uzkGG
 wE3V1Uq1sP80rO8q42uZ2aQ3EDsPYQOjM8Qw0i1iqRB1QAMNv4s++nNd4kT8HOUbqwfE
 MCVUeV3e71HJ9pKcKznY43VIH3oiK2Mj2nhJZdqcd8hdIjWBJrARjYBVWjZz0i+G31pD
 Dx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689762475; x=1692354475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cvwLnHrPPW9mN3eP3ToOVyAY+fURq9KMI1kYnyRrLew=;
 b=QL6Sie7etXBL1VskmWmUh/arxnMgJVn1DPvYuXPXSMBcNPC2tynJv/vK65Fwo4Rh94
 S0uyDf7cq1VHfbTKwr5YtFJ16ccMDt4vYvhD92r93RgcTX7CuyDCPLbBQ87+/UOJcvNy
 1ktAAMY4kIxuhXeS7Dm5Mh6gf21uHtAY2tkIoiTTYzKEQIa5XCWubDdyiyaYRYalfldq
 1WIHXGWhky04EFBLwYXO319SajvMbGflsDSNMfWeZKdJMMQ7I2RqtJz6FvBS6GlRIeN0
 CNHqRkSoGQwhhwbM4z0dXp0630S3ECYQQVPwK+PDj23J+nvVvs3z1Qd4g8yP2s3swbTZ
 wTPQ==
X-Gm-Message-State: ABy/qLYXFOI5+aGqR+4/aVVG5sQrZ+icp8h3qSxCH5EcLp6RIFtxPnBE
 JFOjLCJTENVSUns19gJfWno=
X-Google-Smtp-Source: APBJJlG7YrCpa9YjoiINUKiLwzmGgNdxKjiO2arboOheCtcorFw/xx+U7Yt2QAJBzyd0jHvcU1jdhw==
X-Received: by 2002:aa7:cb57:0:b0:51e:2a56:91d6 with SMTP id
 w23-20020aa7cb57000000b0051e2a5691d6mr2434166edt.19.1689762474993; 
 Wed, 19 Jul 2023 03:27:54 -0700 (PDT)
Received: from localhost.localdomain ([2a01:c844:242b:b300:215:5dff:fe9c:4c81])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05640202d100b005217412e18dsm2520457edx.48.2023.07.19.03.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 03:27:54 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/2] dt-bindings: ili9881c: Add TDO TL050HDV35 LCD panel
Date: Wed, 19 Jul 2023 12:26:14 +0200
Message-Id: <20230719102616.2259-2-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230719102616.2259-1-matuszpd@gmail.com>
References: <20230719102616.2259-1-matuszpd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 20 Jul 2023 10:23:05 +0000
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
Cc: Matus Gajdos <matuszpd@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for TDO TL050HDV35-H1311A LCD panel.

Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index c5d1df680858..e7ab6224b52e 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -18,6 +18,7 @@ properties:
       - enum:
           - bananapi,lhr050h41
           - feixin,k101-im2byl02
+          - tdo,tl050hdv35
           - wanchanglong,w552946aba
       - const: ilitek,ili9881c
 
-- 
2.25.1

