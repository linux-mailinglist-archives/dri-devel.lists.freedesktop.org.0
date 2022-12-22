Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF911653CE8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 09:21:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5670610E0B5;
	Thu, 22 Dec 2022 08:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C58510E0B5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 08:21:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z26so1625524lfu.8
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 00:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uAkQvA3Xh+SnjA47mehnFmJrTToVnvQtaeVXifEV6Rk=;
 b=RWoSYDbQMlbQ088uebiL+ygAsoUptTfvNBo/L9++PXhJBblh7qqCm3Pkse0QCPQZiL
 4AY+M34sAYZQ+4L7HQAqxkQKj5CMynrip2kJjQY2Cr8U325dXsQ5RecP7HhGinSFL6ed
 2HbQ0qRnU+tHTRl8ngGZWqVnWJtYco8xJyhFZEhmcrdHX5s3YrI+CNid2TP3zkK4Fjks
 IqT1xSblZ4pEegrPQeWidY3bCu1QW2QidkTFbdXFsns6KhABy42c38Up6mjlnRohFnqv
 VQ/CEnyafMBkl9DKHjnoYJnwXFA3HQW0GfGzTPaekHk2ZU2vAttm4pv6Tn2yEa7wKzlu
 CoLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uAkQvA3Xh+SnjA47mehnFmJrTToVnvQtaeVXifEV6Rk=;
 b=rxZck6iyvVMTVTpKuyCbRRM/9IuXzQC/clY5cWM8JKFrExieYu9ZoW1qFoByL4ERAM
 TjmcY8s8aIJ7Ibp3zdwiVLREC/t4KCUoqgchyTrXPPJ+NLPBeZlicVakjW9wvxXQlk3o
 VR+Mhm0J75aH0arE0nB5QK7RbCPDaQ41jUuP2BCvfUswGpy3b3MoQyk/5le9vyZzHmQO
 5xGtcw8S83ZqWXeQoyFi8DlKdFYfTBADKjcKpfj2saV6FLwuC2+whlPzsBUmudbJm1kx
 fBH1aYATzPl1AqaxbjWQsNJln2f6iZ7ovMIhUdYmpP4W3+CO16nAwd/43XORRRxoc2gv
 5d3g==
X-Gm-Message-State: AFqh2kpJsoCfdEooVLIRtP1Xhl2uVQxMRSoIeV1y1eFIeswNGEJuzWRh
 QXgjA2jFGwqzIVosh0OwFPmv3g==
X-Google-Smtp-Source: AMrXdXt37+6z3xr5biGtW60g1/enVSSlhcb6yauFfDNgy4Ip6QuFAVRlBq+qGgvqP00SOsqek4NptQ==
X-Received: by 2002:a19:f713:0:b0:4b6:bc3c:f457 with SMTP id
 z19-20020a19f713000000b004b6bc3cf457mr1272077lfe.34.1671697292821; 
 Thu, 22 Dec 2022 00:21:32 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05651205c900b00497aa190523sm2110812lfo.248.2022.12.22.00.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 00:21:32 -0800 (PST)
Message-ID: <e2b0f5e2-8681-10e7-8924-a1bf5040f7d0@linaro.org>
Date: Thu, 22 Dec 2022 09:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/2] dt-bindings: leds: backlight: Add Kinetic KTZ8866
 backlight
Content-Language: en-US
To: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Helge Deller <deller@gmx.de>
References: <20221221153154.25411-1-lujianhua000@gmail.com>
 <20221221153154.25411-2-lujianhua000@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221153154.25411-2-lujianhua000@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/12/2022 16:31, Jianhua Lu wrote:
> Add Kinetic KTZ8866 backlight binding documentation.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

