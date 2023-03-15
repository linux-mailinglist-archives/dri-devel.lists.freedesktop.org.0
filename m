Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39A6BA9FD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 08:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD0D10E93F;
	Wed, 15 Mar 2023 07:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5085010E93F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 07:51:49 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id cn21so41774887edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 00:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678866708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rtzm0dNUyTJmBG5J/B6707/S4Pte/iFJwCqbn2gvJ4Q=;
 b=K0IWxPweceXAJvkwMSWgRYi4I0hvq6aPbbv364Bjric9zjIFEbo3n9Igv48yqx2rqI
 XHYD6/H9RT/RK0ZV7w2eqjM9mc4nUEVICafT/otoipMQcv/TgDQGpLqMsDHabxSsuLP0
 SIIVhUDvPaL34MBChXeH5dmhvF6l9TPXW8mky5o+/3v/rkxWC5lfxUfZlFmFvcYnREUk
 +d2aNLRQQY7h0ur9ZgNASYWxheITEDCirxa2lxqzKPUPsuWzNGMmb7T/KWDFLg/+x+R9
 +lV9F2o8uZy34GGYwCSpQil7pG8hKYb6v7KuOXP9HkStLHIOz+0d0QavdbW2ZWhdj90w
 2PIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678866708;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Rtzm0dNUyTJmBG5J/B6707/S4Pte/iFJwCqbn2gvJ4Q=;
 b=1EVMclzrsDEmxBwdRdeebo1vFozN7V7LT53A1a0irQb7k8YV5nZdouvpbEXHt69ahL
 JmYvTyG4RB5V7j5QC6hncSZmpwMhuSnfmX154f9VkBEulLeC7A2MhV92oma5oRt/TcXq
 tN6QIik1+XYh6FIFIk+ebeomSbVJ/OLYrfZSuRc/SmgSaSmbCHHBZAC5UUZFxx64JP5a
 PRXhWd8bxz5YavCMxe1A24jm0P3EeKEeE/dnGKj8aULR4wjjEWhrWVabfaXIyiixkzQi
 CuQ3TvCDxi+jYDqOfjw/slwpSbahzeKj2enQj7j8O8IwJS1PK61yYVCSHgmNcZAeVw0o
 mVWw==
X-Gm-Message-State: AO0yUKUOTX1ZG2yPjZQPQ91XA1QZfgJfma9DaogG3ZkTVVXu+OUUqJk2
 +NifYKjOFoQckdsJYEkHmLNiAA==
X-Google-Smtp-Source: AK7set/yWRYjCKp5mLx+kg3wkMH72NDHq+jXSu/2+L2Vhk3CVxWK3EAQVP3YmAnhLQmqFJQLGyRcuQ==
X-Received: by 2002:aa7:cc18:0:b0:4ac:b614:dd00 with SMTP id
 q24-20020aa7cc18000000b004acb614dd00mr1439146edt.30.1678866707846; 
 Wed, 15 Mar 2023 00:51:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
 by smtp.gmail.com with ESMTPSA id
 18-20020a508e12000000b004fa380a14e7sm1974222edw.77.2023.03.15.00.51.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:51:47 -0700 (PDT)
Message-ID: <8ce4e54d-1e90-99ec-3fb3-00c70adb6bf9@linaro.org>
Date: Wed, 15 Mar 2023 08:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] dt-bindings: display: seiko,43wvf1g: Add the
 'enable-gpios' property
Content-Language: en-US
To: Fabio Estevam <festevam@denx.de>, neil.armstrong@linaro.org
References: <20230314111724.1520178-1-festevam@denx.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314111724.1520178-1-festevam@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 CPHEALY@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 12:17, Fabio Estevam wrote:
> Add an optional 'enable-gpios' property that can be used to turn on/off
> the display.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

