Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6DA6397E3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 20:01:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899410E165;
	Sat, 26 Nov 2022 19:00:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46C610E785
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 17:57:25 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id f18so11904549ejz.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 09:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vbRnJZLZimHWsGzRHTMEcRloTQuJ50SlssIRdpmahOs=;
 b=WLSyqVO/wsM9eNLKGkI5R/6DTuNUeLXYT6SaaQZ4v4pPyKuGdbNe+rdqVzDLMziHYP
 SscsKUjrxJ4kCM0KTqeCbTGyC4d9gaUODE8Zo35ggje4LifKSo2it+1qg157950YxLBD
 S2rcVIk05h9JS1uljIZ+1QHf4S8SODen0qykk3B30AjJayPNd5dYYkbESOu9XdrACpk+
 +onN/3M6fFHgoU074a9mxMr+ouyGFVjvpiqnY6wRIHk0GMX1+VVQr2J78R3tmyOwOQJI
 baS+zPxOce7/8rGgDDaEGEro50GOYY8ZMqAFc+BnlmeB6eYEPomA3APvZEgnjlY/435h
 aRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:to:references
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vbRnJZLZimHWsGzRHTMEcRloTQuJ50SlssIRdpmahOs=;
 b=mnWD0CqnzDu4JCUaGqHtZTvrir8S82KoXJg7QonlwjBNqUJAECqpJCculehbVMqGFx
 WxDNNb5Iq4HO02BLIeKLUWXjcZ6xGt3s1ZrBnmMlnzxXXNxxWvmd/pqvNRg/BH6cfrAi
 i7plmedNxh9gXTc6e8BqmB2O1HMGSQ4Ew7ye5stmQCMergtKBR/lDCpaNTsgDHXGi5/y
 gV+Uc7/YdkT4wm0SddExJA3KEfMM7iAWxhEzTWn0VXsPXEBLQs+2QPXzAJOlisCRZ3gi
 8O2B8ifla6aMmk5CRY912IksqATdJyAwxTzJXL8qytHARWXpIBijdkxvvEYArvsD/uFx
 ky3g==
X-Gm-Message-State: ANoB5pmOkLWXL3sIavk60h1nKvB+Tcwk2RYmn2JdD/1hZoGEyoMeEkyV
 VJnhRJVdjWRC8o3iMKLMMdw=
X-Google-Smtp-Source: AA0mqf4hyqLTkqhO3vKi5JfsbhKQpcKYiIiI8Yu0KuqqvXAGFw/uV1xzLJV/0HIg3YYneVzw+NdmoQ==
X-Received: by 2002:a17:906:1844:b0:77a:4bfe:d6df with SMTP id
 w4-20020a170906184400b0077a4bfed6dfmr33873692eje.396.1669399044408; 
 Fri, 25 Nov 2022 09:57:24 -0800 (PST)
Received: from [192.168.178.2]
 (dslb-092-072-004-196.092.072.pools.vodafone-ip.de. [92.72.4.196])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906495800b007bb32e2d6f5sm1791287ejt.207.2022.11.25.09.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 09:57:23 -0800 (PST)
Message-ID: <81722eba-3910-2117-8b07-bb030ab754dd@gmail.com>
Date: Fri, 25 Nov 2022 18:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: [PATCH 3/4] dt-bindings: display: panel: mipi-dbi-spi: Add missing
 property
Content-Language: en-US
References: <43ccb0fb-119b-1afe-758b-e413729dd704@gmail.com>
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
In-Reply-To: <43ccb0fb-119b-1afe-758b-e413729dd704@gmail.com>
X-Forwarded-Message-Id: <43ccb0fb-119b-1afe-758b-e413729dd704@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

The power-supply property is currently only mentioned in the 
description, but not listed in the properties section as it should be. 
Add it there. Signed-off-by: Otto Pflüger --- 
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
