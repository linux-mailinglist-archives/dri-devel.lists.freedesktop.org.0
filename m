Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40A670BFF6
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 15:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A200A10E15B;
	Mon, 22 May 2023 13:45:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E63EB10E15B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 13:44:59 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3063433fa66so3773811f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684763098; x=1687355098;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Wrxc82AX1iOJYtOkrdSiHbyYQwIiUqCRSy56LKL+7RQ=;
 b=PeRP7D2tNTmANHFr+RJZi+8482L4g+VoNZb8isZOSSRiNHWIpd4EIAZByraLFeP9Bs
 oVvdhQGl5pTvMj3s6iWdS29mUC9xigEI2suSLuYRko2fja7H0c9Y4Mif9vSH82MZ/JQX
 aMDPNIegPITPbK5WaOkDoP0Sv0Pb/HXtT7QGMSOddM2auxgFk+1T41ULnvXFNBz/+pLh
 MSzTLJbvLWlS6xn2NKnwTVUI+MK11TLZKryDxQr8slQtiBier9fqQTPQlWKDyIqXnwK9
 NAe+NUyTCOfSDzc+zOFjV1Y41aHO3wBVgJI7aM7gRmHuDqISYe6mabJL1dFHjuiyRfSZ
 M9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684763098; x=1687355098;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wrxc82AX1iOJYtOkrdSiHbyYQwIiUqCRSy56LKL+7RQ=;
 b=AC1dmyGjLb0eGwGOSmE+YeCz6LWk+Qvo0pQ39tYEbMuIp47mJY/PdkmJfbYzWh4ES3
 tf2khy9Zcmc7USN8mav+ZkKtXsban9Jk0jtEwUXF+X+EZUJ7F4ixLnkslNW4Ptn2lkuW
 xa9T1w3YQ4pYFCiJ3fFuI1yHZWq78KnpD5/aiIqqJKf21+7gT4L334//p9BLdPsUEtBj
 aLNqWPXjU2dTBW6W4bZvkHk8BiqZxr4HytAivxEtzWjMKZmizZG0mwEgNywO75sUdFuk
 ShDZS0WO3FsYaBKABhMzKnOPARijuQSqaSiJGffc23N/gK66GKC3Ed+1ZDUOGCgPYBmb
 18kg==
X-Gm-Message-State: AC+VfDyXv/NZpBN+6AmooZ+Ssg4e4JWSKh8eJhj9miVcyFdGNfmVnuX7
 FNvqHs3o/8iAVSJnawMsyVGPCg==
X-Google-Smtp-Source: ACHHUZ66W79JRymYpqr+33Apra3p6DHzxWUXT7NFKG4LKxRr1ITkSaUc3PVwIig3EefGmxnv9imgRA==
X-Received: by 2002:adf:fc08:0:b0:309:3c0c:b2c1 with SMTP id
 i8-20020adffc08000000b003093c0cb2c1mr7102196wrr.23.1684763098165; 
 Mon, 22 May 2023 06:44:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a478:d61d:5bb5:7df?
 ([2a01:e0a:982:cbb0:a478:d61d:5bb5:7df])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a5d4f06000000b002e5f6f8fc4fsm7829465wru.100.2023.05.22.06.44.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 May 2023 06:44:57 -0700 (PDT)
Message-ID: <88e30362-d21d-62db-cbc0-85c7f9a286db@linaro.org>
Date: Mon, 22 May 2023 15:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 1/2] dt-bindings: samsung,mipi-dsim: Add
 'lane-polarities'
Content-Language: en-US
To: Fabio Estevam <festevam@gmail.com>
References: <20230514114625.98372-1-festevam@gmail.com>
 <a6e549e3-a898-c7b2-1c72-4c6fa2866388@linaro.org>
 <CAOMZO5BTAPPs+KsW7+GnBTJf1dLMKuAzZa-HRXtQ+ZTWz+EOxw@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAOMZO5BTAPPs+KsW7+GnBTJf1dLMKuAzZa-HRXtQ+ZTWz+EOxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: neil.armstrong@linaro.org
Cc: marex@denx.de, devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 jagan@amarulasolutions.com, krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2023 14:53, Fabio Estevam wrote:
> Hi Neil,
> 
> On Sun, May 14, 2023 at 9:29 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 14/05/2023 13:46, Fabio Estevam wrote:
>>> From: Fabio Estevam <festevam@denx.de>
>>>
>>> The Samsung DSIM IP block allows the inversion of the clock and
>>> data lanes.
>>>
>>> Add an optional property called 'lane-polarities' that describes the
>>> polarities of the MIPI DSI clock and data lanes.
>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Could you please apply this series?

Done !

Thanks,
Neil

> 
> Thanks

