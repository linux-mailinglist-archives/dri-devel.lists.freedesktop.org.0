Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E15DE6CFCC7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078A210ED0B;
	Thu, 30 Mar 2023 07:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C75210ED0B
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:31:22 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id o20so15724481ljp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680161480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VHL5ko9/VwXTcT2Zsf55zIWSDsPldEV1a3bS1y8GpSY=;
 b=OwqeseOtwKXRW1SixaPHbovNygVE/jNCrLgZuc9+5KPoypyNOVCY+eYOqsDPDtEAn8
 Mc6jriM0bHRXmQyqzOED79vTsum2oXUWpk9QXOYuQuxVLL+0sUM/bZMGG3KmZP6X3RGu
 H6o7NcRRJUnlhS2xer1ncMUkl9aOSY4+H6tKi3KKpobWhDWlp46j3b8EhhVfJX9BAzz+
 gSjpc3fH/v/v+zCJ20V+6RKbQZQLYS4pBq8uflKcKvYvdQzgq+hH9ncMWE2Aqe+Fhbvz
 p9b+uSUbnUKTMAM/dV8GftzPrZX5jheDehaRr8e0LWXyMpcijO1plqJQPJ4oznRfhcR7
 8fgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680161480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VHL5ko9/VwXTcT2Zsf55zIWSDsPldEV1a3bS1y8GpSY=;
 b=utd7ZKzQ7sHeY0/kebt9oCiTGNy5yfVjKVSF/vKBVMHebuKwY13EPSp4wJwx92ERrA
 HE5wjXYrdui4rJ08pne9p87FVLqY1h2tCQnDDTuUck7xjCG7rVJuIpOY5qOCue9mA5yR
 kYFHD4WaLrR6szZ13qntAUxforiRUSg6tSHg5ZhqbLnJ/5z/t8CkTdFPsBxjDP79v3o0
 Vha4etzTI5NLTB3NkHffdKVcQKJ0mZA4TCBtiWzKfsXJxi4FrHs7fsbvoBz2l7YShlc5
 JCNWJdCod8Vgn8Rg15S1rUN6tNm36hisF4ukUC0CBmBiSV6On/G9dHzJVRY6pEHYbLqI
 u15Q==
X-Gm-Message-State: AAQBX9dSqmRMYSGpBILeqaDO10HEtLaq9cYPSpk3/zxdCgIUyKgEvyhR
 XF+fsQewB8eLOdSRHjF5vliW0A==
X-Google-Smtp-Source: AKy350Yjtu4A370ptMDZizNAxeGXtnHwZUOvMmf7DRxQBDfiwAkWLKS6X2CMwWxjRcSCko+5mZzH6Q==
X-Received: by 2002:a05:651c:227:b0:293:1565:4353 with SMTP id
 z7-20020a05651c022700b0029315654353mr6736375ljn.10.1680161480218; 
 Thu, 30 Mar 2023 00:31:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 y1-20020a2eb001000000b002986854f27dsm5780478ljk.23.2023.03.30.00.31.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 00:31:19 -0700 (PDT)
Message-ID: <4dade510-21c8-4c2c-176f-205aadb719e0@linaro.org>
Date: Thu, 30 Mar 2023 09:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] dt-bindings: display: seiko,43wvf1g: Change the
 maintainer's contact
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>, neil.armstrong@linaro.org
References: <20230329201150.741106-1-festevam@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230329201150.741106-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: marcofrk@gmail.com, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/03/2023 22:11, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Marco's NXP email is no longer valid.
> 
> Marco told me offline that he has no interest to be listed as the
> maintainer contact for this binding, so add my contact.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

