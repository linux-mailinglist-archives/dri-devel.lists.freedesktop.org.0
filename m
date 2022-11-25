Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D346397DF
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3D410E164;
	Sat, 26 Nov 2022 19:00:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E39F10E77F
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 17:51:38 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so11782834ejb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 09:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:from:to:references:content-language:subject:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=j3p7tT26N5nv9jwZTpAGLQVIuQF0syqGYeXV1inHrDo=;
 b=HtErPB5aovCyUz7xbjLaZdhEe7kvddMmtEnHaZq2tjhMgrwqk5uNDghU/fJRPnx83j
 5TjqZma6dlP7l6DWyL8H4kWzRcs+Bu/P/z/2S1birSqDZH1Avu4XoL1IcpR4XcMCL40y
 nn+xXsfu0mmmB2XDnRu1w8mhoekgALNX90FPHG3jiBPvaBeBTbZHR4sQLwyA7huK1dE/
 iVdVKhCpJwQN9vgjyiL0O0NBMpDZLPkd4yyOfTXuv7Dd6ONPv9qRlxMrl/SeVOyUo1eK
 CQy5hUdz8DVmpEEd6Bsmz2tZ9h8SSXH9CxFPzVbCTM8jBzPd+fSmn3yezbocCvkUlZ+5
 o3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:from:to:references:content-language:subject:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=j3p7tT26N5nv9jwZTpAGLQVIuQF0syqGYeXV1inHrDo=;
 b=IjH4YUvRwhAlyZ5aQ1Ty/yk7/lSG1/XfHEIN63wSY2IFHJZNRu1cj+jO66GXcfrPLf
 h/LNQVar1evspavCwrf7MUiN63plijYB7aRC8uHZ2pIjRIm+uc46qYSdI2Ltf7YpkX+i
 2zSfgJJS+QxU8D6YuiKAJISR68G4mb5nDNjGyefvXL3ZEEsgzLGg/Yh/TU209wNK2deS
 LliYUdcCfCmK7XPPemDhqry4EZiE6svcWU8dvFbotH3HcriItHB3IoUlwC+8eVrf3ETd
 LLaHgJtWsOyWg4/Iw5G7abxPDMBnimV97Ygt3Dn7HZAMJdgM2NSf/qxMCCD2X05SEKNO
 HPYg==
X-Gm-Message-State: ANoB5pkFMOw3KZGIZIqKoG2O2UMmn80psJ3d0ImsYwtA7CBYoujIC8ek
 OXKl0ZqnZMhmkFiJ7aorJEE=
X-Google-Smtp-Source: AA0mqf5lrhvySdY92a1w8yOZEP3Rkts9Tur2fgxotDyZ9u0Izr/4DXRq9UA8juSCo01HdCRZWKm07g==
X-Received: by 2002:a17:907:8d1a:b0:7ae:6ffe:a118 with SMTP id
 tc26-20020a1709078d1a00b007ae6ffea118mr32891503ejc.250.1669398697034; 
 Fri, 25 Nov 2022 09:51:37 -0800 (PST)
Received: from [192.168.178.2]
 (dslb-092-072-004-196.092.072.pools.vodafone-ip.de. [92.72.4.196])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a170906064e00b007305d408b3dsm1795457ejb.78.2022.11.25.09.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 09:51:36 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------E192SWiJ85NHfQDZMie3ejq0"
Message-ID: <43ccb0fb-119b-1afe-758b-e413729dd704@gmail.com>
Date: Fri, 25 Nov 2022 18:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: [PATCH 3/4] dt-bindings: display: panel: mipi-dbi-spi: Add missing
 property
Content-Language: en-US
References: <f5668d69-806a-f8c6-5279-7e84b824bd7a@gmail.com>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <affenull2345@gmail.com>
In-Reply-To: <f5668d69-806a-f8c6-5279-7e84b824bd7a@gmail.com>
X-Forwarded-Message-Id: <f5668d69-806a-f8c6-5279-7e84b824bd7a@gmail.com>
X-Mailman-Approved-At: Sat, 26 Nov 2022 19:00:23 +0000
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

This is a multi-part message in MIME format.
--------------E192SWiJ85NHfQDZMie3ejq0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The power-supply property is currently only mentioned in the description 
and not documented in the properties section as it should be. Add it 
there. Signed-off-by: Otto Pflüger --- 
.../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml | 3 +++ 1 
file changed, 3 insertions(+) diff --git 
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml 
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml 
index c2df8d28aaf5..d55bf12ecead 100644 --- 
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml+++ 
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml 
@@ -80,6 +80,9 @@ properties: Controller data/command selection (D/CX) 
in 4-line SPI mode. If not set, the controller is in 3-line SPI mode. + 
power-supply: + description: Power supply for the display module (Vdd). 
+ required: - compatible - reg -- 2.30.2
--------------E192SWiJ85NHfQDZMie3ejq0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    The power-supply property is currently only mentioned in the
    description and not documented in the properties section as it
    should
    be. Add it there.
    Signed-off-by: Otto Pflüger <affenull2345@gmail.com>
      --- .../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
      | 3 +++ 1 file changed, 3 insertions(+)
      diff --git
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
      index c2df8d28aaf5..d55bf12ecead 100644
      ---
a/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml+++
b/Documentation/devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml
      @@ -80,6 +80,9 @@ properties: Controller data/command selection
      (D/CX) in 4-line SPI mode. If not set, the controller is in 3-line
      SPI mode. + power-supply:
      + description: Power supply for the display module (Vdd).
      + required: - compatible - reg
      -- 2.30.2
    </affenull2345@gmail.com>
  </body>
</html>

--------------E192SWiJ85NHfQDZMie3ejq0--
