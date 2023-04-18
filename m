Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDC36E6079
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 13:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79ACA10E779;
	Tue, 18 Apr 2023 11:56:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219C510E779
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 11:56:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v3so2357676wml.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 04:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681819000; x=1684411000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T9oSeZGJaO3G9BEkK1S2Mgd4sINffRf+WgKyKKehfmI=;
 b=EXHJXEGXy79uUSSwalxffycq7KWxOyLGcigWWbEvbe4A/tHuCrJx3bi9fyVr30xbvt
 2ohr0yYvurqh89V5/02Q1Lxqa1lcYhqwJT9gY2OkB9rEfs9TqLQHFDOXD5xueuIZKLIi
 0enhdobg6t6Pn+69lbxkw5PDTNIKBWJC2ntey0mtiKfSW2kKhayCaxskZc6WC/vPvrhO
 bC1syUexCP1omtV1npNjjcM6CzulU+hIVBIJEb6WXUrn9tqFidigErpnMAl0gPt0EZ8e
 vjD7hAefkxeTGZK7t8fEssZ0/C8eTQFa8cG8kZc3cSanJT3q9kEr34rQ5C6FT2zXaJ4j
 khRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681819000; x=1684411000;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T9oSeZGJaO3G9BEkK1S2Mgd4sINffRf+WgKyKKehfmI=;
 b=R4wmP1fC91apABlL3fHLq9HXaiP/Dl6nbg7EMiAhsE1UPrmqFCiBod66KkleDoRsS7
 Rv5F+g4bweiF3qD1VEE6nBvse1/6chhf/LYWKNPjbIaoT0hbee1XtDmk4M4TqzrYOUXL
 6pkzhuHnr4aFlVeUuqLDF25TF9ac2bqRJ1P6vwmA+wyZ8g2ugmnFfHMJPR2N233tlU3K
 1YGC7jXkZQcUE1mqpwYTqK8ppl5f7zBxcWd5ft60U/KV4bXQXC8M9Yrk9xqs0m8+YjoQ
 PicOHFctJzbYQ2zJB8TEyuHWpxkn1U3Ntfm6TRSNNoSEb55JCtmwvVVa7GzicHIqPeUq
 +Lpg==
X-Gm-Message-State: AAQBX9fEfRW4pwBvYh20ut5mg9zkBR+hwdERLA4W4MfBZPL75z6141Jn
 hS6TSN2FLd6Qepzc7A9C8/8=
X-Google-Smtp-Source: AKy350bbx0bJ/4L8a44U/aCtvaM2RV9kN1tMXWOPsHUuu0HTywAsjz+gzSejmnkzvEnhtHbDS3+jEw==
X-Received: by 2002:a05:600c:b47:b0:3f1:6cdf:93ac with SMTP id
 k7-20020a05600c0b4700b003f16cdf93acmr7012569wmr.17.1681819000111; 
 Tue, 18 Apr 2023 04:56:40 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003f04646838esm14855802wmh.39.2023.04.18.04.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 04:56:39 -0700 (PDT)
Message-ID: <1e55328e-aaa2-78e3-ddc8-c2717f6283f5@gmail.com>
Date: Tue, 18 Apr 2023 13:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek MT6795
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <20230414054345.ip3ug53ivr3elbpy@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414054345.ip3ug53ivr3elbpy@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 linux-phy@lists.infradead.org, kernel@collabora.com, xinlei.lee@mediatek.com,
 kishon@kernel.org, phone-devel@vger.kernel.org, jassisinghbrar@gmail.com,
 linux-pwm@vger.kernel.org, chunkuang.hu@kernel.org, jitao.shi@mediatek.com,
 houlong.wei@mediatek.com, chunfeng.yun@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 14/04/2023 07:43, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Apr 12, 2023 at 01:27:13PM +0200, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>> block: this is the same as MT8173.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> I assume this patch will go in together with the other patches in this
> series via an ARM tree? (I.e. not via pwm.)
> 

That's totally fine, I'll take this patch through my tree once everything is ready.

Regards,
Matthias
