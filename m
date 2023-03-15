Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D926BA9FC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 08:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8E9B10E950;
	Wed, 15 Mar 2023 07:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC0910E94E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 07:51:17 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id ek18so40783092edb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 00:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678866675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=d911BX05CiPkms8AKztZoQp6q7GS5syhqZ58jXzG8VE=;
 b=ZOMey7ZhXDYxrd6lgeXdkjCnUX0Xam3eF9j80XI2IE8e3FEzxvB6zLkFKz4qE0kLUl
 mJ+4Sn2A1b6wmIXVS61RepqHwS8ZIr2iLW96gqt89Z4wFiylSSOYYDOuRdloaptLqQZE
 t5VHemA7dW9Qq4X5d13Yd8NQ2SkxIjYlxWgMAF1bE0Rhievdnrt5J9ALMtSo65L5r4Z0
 kWeAr8T71uEaD5WwNLTk8ArZ3aiMWCOHJkxlHOdb2UQMOLxt2CAbrZ+Qxszl5Zy+/Hgj
 tvAAswePut3Mbr6HmtPT8Q2hCRCSFNlueFzhSAFd33p7vfHFkSwrkUosXXkfatxlzCJX
 lYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678866675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=d911BX05CiPkms8AKztZoQp6q7GS5syhqZ58jXzG8VE=;
 b=jMTnZHwywXLopQBZ5B62wZaxX2H/A6RUHQhQoNu2ofjWBQikm9zh/G3KXtd/p2c3HI
 qNY733MvEbTGn5tKMYibO8KBPhc4lG8Y7X0OM0mlgpD2mfwCpWR+Oxf4R33GJcQyJFS1
 RHF/WSnzyuNW+97dk64UmQC4lN/1ztQtEGVTiFBTgIoz9pjNw8ap1kGKCRvcmAlW6bbM
 Ep30Y3vPyyxOZPsal5TSOrvzy/KGvvY5HOP+puWJo0wW9FQYNZqDi1FNvcyeuWgdAJco
 L7g68jF7SYg8M3o5nbAG09MYuiyYD8a5TbiXUU6nF5w10LLXlZTDCsWlHwWDWdDOVJnw
 +sqQ==
X-Gm-Message-State: AO0yUKW4rYhmnaevGm2W1IJx9sO6KHLS6KioGDRIdYMPoXExmXCWgdzF
 FYeGPf3BQZnwf7D9Sa1Vpx44Fg==
X-Google-Smtp-Source: AK7set9EccNsOU9Upy9ZTTa9EUYd+AKvXz7iJKuDZ8Q/NNbXPcskakPQHUFzolc0AD1cp5Jh0j+hjQ==
X-Received: by 2002:a50:fa93:0:b0:500:2a9d:1870 with SMTP id
 w19-20020a50fa93000000b005002a9d1870mr989231edr.13.1678866675656; 
 Wed, 15 Mar 2023 00:51:15 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:940e:8615:37dc:c2bd?
 ([2a02:810d:15c0:828:940e:8615:37dc:c2bd])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5085cb000000b004bd6e3ed196sm1933242edh.86.2023.03.15.00.51.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 00:51:15 -0700 (PDT)
Message-ID: <a6d8d360-f379-1382-7700-7bb04de6d9a0@linaro.org>
Date: Wed, 15 Mar 2023 08:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
Content-Language: en-US
To: Gerald Loacker <gerald.loacker@wolfvision.net>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 12:56, Gerald Loacker wrote:
> The sitronix-st7789v driver now considers the panel-timing property.
> Add the property to the documentation.
> 
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

