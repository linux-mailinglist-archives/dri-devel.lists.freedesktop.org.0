Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CDA57F0E4
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 20:10:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CACA7F57;
	Sat, 23 Jul 2022 18:10:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 138CEA7F50
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 18:10:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t17so20941lfk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pNAUhjjDBroxympyUt6U8tDnLy00vPlBr4R4mbdJytw=;
 b=z2f2fpiIj0R1syFPRFKESCT6v9mZZ1WS4rZkcNn3DWsi086CY9WoBx1WVUjTgsLr0S
 7UmKzoZaJHtUbo67i9IMKISGWxvrxu2EN9IioYUQmt4ClR6+8Ptpu5M9FRW/qeKwQxru
 eMxfRrsL1MfB/AvletWTdPpVUS4ZZm4WnBXIqCbz2TUbPONxlAuBADFVTgA5Rflw4lno
 aLS2qdg+2VlgS7rqytERlJrKl7KzmWFPyNZJS2SOCIaFUM8ap9sPtvhx+yjm6r/3DIOa
 im1TftS9l2AB5aJIqLSiUnC8r96g3RaYTZL/kjAHZaut+2nKSC0vDHBF+QY9sMxC81jw
 NnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pNAUhjjDBroxympyUt6U8tDnLy00vPlBr4R4mbdJytw=;
 b=vqIIOEDGN7204degH31Zj5cceJX4RHSfJ4+S0TyL5ovCVNgQgOpwNGlNnPDcEZcFp6
 iRXOwxB762EFnsvwAqKWoU06o1ktw+Fgqcm2XVY0fKC6N1FJdLcTJz1QL/GmPHlwU9DT
 hP9VEzple5gG4de58tzc3eae923oJDfT4mmqZwNztLgoZ4+BTDWOlYKcwIxVmiDMUH5f
 M+f3qol4mxfUKYrZr3M/EBb+XstwbU02xvRVs0XNK5lQ7gX6fTljnRtCPnOSIuTmu34d
 6XXyQacP9EmldOCM+INkBtDqV0f7QshNVJm3SURKqid6ah3H0uSia/UmaipBWW4unHMu
 gjmA==
X-Gm-Message-State: AJIora/X55t1bLUxrXc8GPLVMUHU1M0JRAEF5KZ4T5RSk7rRfBD4exoY
 PBJY/Ly0sQSYO8LLfQdHaZOIpQ==
X-Google-Smtp-Source: AGRyM1uppMfY4czX8b7SEbjQ+hS9O1TE8PqpFelKIBXcz04UpXhgEujHzGnFx2Tn80DQX6Xml6yJlQ==
X-Received: by 2002:a05:6512:22c8:b0:488:e69b:9311 with SMTP id
 g8-20020a05651222c800b00488e69b9311mr1944284lfu.564.1658599807174; 
 Sat, 23 Jul 2022 11:10:07 -0700 (PDT)
Received: from [192.168.10.173] (93.81-167-86.customer.lyse.net.
 [81.167.86.93]) by smtp.gmail.com with ESMTPSA id
 g1-20020a056512118100b004811bf4999csm1754790lfr.290.2022.07.23.11.10.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 11:10:06 -0700 (PDT)
Message-ID: <6a4c74fe-5558-5455-1f79-0289e10294b2@linaro.org>
Date: Sat, 23 Jul 2022 20:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/1] spi/panel: dt-bindings: drop CPHA and CPOL from
 common properties
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220722191539.90641-1-krzysztof.kozlowski@linaro.org>
 <20220722191539.90641-2-krzysztof.kozlowski@linaro.org>
 <Ytr+Q6kXr+f6dCfi@ravnborg.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Ytr+Q6kXr+f6dCfi@ravnborg.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Marek Belisko <marek@goldelico.com>, Pratyush Yadav <p.yadav@ti.com>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/07/2022 21:45, Sam Ravnborg wrote:
> Hi Krzysztof
> 
> On Fri, Jul 22, 2022 at 09:15:39PM +0200, Krzysztof Kozlowski wrote:
>> The spi-cpha and spi-cpol properties are device specific and should be
>> accepted only if device really needs them.  Drop them from common
>> spi-peripheral-props.yaml schema, mention in few panel drivers which use
>> themi
> 
>     "and include instead in the SPI controller bindings."
> 
> I cannot see you do this in the touched bindings.

Yep, because you always have two schemas being in play. One is SPI
controller and other is the device (SPI slave).

> So I cannot see how for example samsung,ld9040.yaml picks up
> spi-controller.yaml and thus it no longer knows the spi-cpha and spi-cpol
> properties.

ld9040 is not spi-controller, but a SPI slave device, AFAIU. It will be
therefore a child of some SPI controller, thus the SPI controller
schema, which includes spi-controller.yaml, will validate the type of
spi-cpha/cpol properties.


Best regards,
Krzysztof
