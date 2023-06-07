Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4FE725B1D
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 11:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B200E10E4AC;
	Wed,  7 Jun 2023 09:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AC810E4AD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 09:56:22 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5169f920a9dso567895a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 02:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686131778; x=1688723778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oKkGexFGpQmVCwwg8im28eJbpseNCLW3GXq5+ips1TY=;
 b=KzwF1w2CYLTceYhK9vABATZI8CPzx4B2xas4KT85KDV9PxFTLHPmUOIWDaJNf2/LoL
 KoL0fdBRoq4F09hgA4ss1qnuDcsWCOn+EjHeEfJc8WuicnPWhc8vER3xNllllckX8Pw4
 ESTiKXN+kXvnDoA8jUV1LZ6HB8fAMywQgjGOdOin2jQcumb9DaqM8Z7bg/OC2qJwQUhQ
 G+bJ5Hpc0O3XPB3JXeQrN3l3czYMOwuWFSspjU64VI8MlyDKwk4Wy66Jeu237mbGFBkD
 rt0bDjp+41tKwC9qd2mZewQqVnhAWmnr2H3DSHmXjElU1jIkKwDhUdxlDYM7j4Bex/nh
 cyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686131778; x=1688723778;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oKkGexFGpQmVCwwg8im28eJbpseNCLW3GXq5+ips1TY=;
 b=jHrRQT9M5Y/Xjh4OzM8HCcb/LJgRRdubMLsTGhgM97PfgeaE9ll+F++IjkAErqYgZz
 gg/2sOrnjzKPMlCebXBfSyWj/8zJR0br/1+BgSqpu/ou9cY1xW+PouodUSLjVoOnrFlN
 I7gr3HvnAia0/0lIRaOFWthRhRBcvhQ5nuUb7VxTrL1dsd4a87qEnEW0yJwKn35+yg/+
 zsCm78rf+ArX+eENr/4rrkdveqZv2CbuME/2za29SMBWoq42E3KXP+u7ANqzm49/7D8m
 qs6pIaOHQJLSmEDnRVjO1hvTiSZLZm4wEs/mtIZIpHYutLD5i2kHSc9Rmd7KDv8IJF9m
 1SzA==
X-Gm-Message-State: AC+VfDzfiiUBSfmzLMRG+FrJGBl7AWX/QglOqU8DLbER/lCNrmhyKviM
 eo4G4bfa7iiHi871KVqsRxCw7Q==
X-Google-Smtp-Source: ACHHUZ7XSrMQFYkhZEeeJtvnlLxFq2QdTjFeouEQqKbyi/ai3Lj+X3ZkmdTcG2SSjXnIaNwL3H6cTg==
X-Received: by 2002:a05:6402:5204:b0:4fc:97d9:18ec with SMTP id
 s4-20020a056402520400b004fc97d918ecmr14186697edd.21.1686131778385; 
 Wed, 07 Jun 2023 02:56:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 j9-20020aa7c409000000b0050dfd7de30dsm5979095edq.94.2023.06.07.02.56.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jun 2023 02:56:17 -0700 (PDT)
Message-ID: <4b26898c-0751-14c4-1fdf-2c4e59d4f224@linaro.org>
Date: Wed, 7 Jun 2023 11:56:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/3] dt-bindings: display: panel: add fannal,c3004
Content-Language: en-US
To: Paulo Pavacic <pavacic.p@gmail.com>
References: <20230606140757.818705-1-pavacic.p@gmail.com>
 <20230606140757.818705-3-pavacic.p@gmail.com>
 <cac57af0-aa0f-0a60-3376-234e1da7f4eb@linaro.org>
 <CAO9szn3+u_yuWb5y_aQGWA8RhW2=qPVcxcZvGWz8MbHH_DamNg@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAO9szn3+u_yuWb5y_aQGWA8RhW2=qPVcxcZvGWz8MbHH_DamNg@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2023 11:29, Paulo Pavacic wrote:
> Hello Krzysztof,
> 
> uto, 6. lip 2023. u 16:43 Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> napisao je:
>>
>> On 06/06/2023 16:07, Paulo Pavacic wrote:
>>> Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
>>> Fannal C3004 is a 480x800 MIPI DSI Panel which requires
>>> DCS initialization sequences with certain delays between certain
>>> commands.
>>>
>>> Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
>>> ---
>>> v4 changelog:
>>>   - add spaces between properties
>>
>> ???
> 
> Added empty lines between properties in yml file
> 
>>
>> I pointed out last incorrect versioning. This is v3, not v4. Or is it v4?
> 
> It is v4 of the patch but v3 of the patchset. I wasn't sure whether
> somebody would complain if I were to name [patch 2/3] in a patch set
> with different version. I will try to edit changelog to match patchset
> version.

Please maintain consistent versioning. There is only one version -
that's the version you are sending.

> 
>>
>> What about my tag?
>>
> 
> I have changed in MAINTAINERS file from "+C:
> matrix:r/mipi-dsi-bringup:matrix.org" to " +C:
> matrix:r/linux-drm:matrix.org". So I wasn't sure whether to add it.
> I will add it in future version of the patch.

Keep the tags you received.

> 
>> What about my comment?
>>
> 
> I thought you wanted me to have more generalized MAINTAINERS community
> URI that's why I have changed it to linux-drm. I will remove community
> URI in future version of the patch.

The chat should be in subsystem entry, not in individual drivers. People
will not hop between 100 IRC rooms to figure out discussion. Just like
we have only one mailing list dedicated to given topic.

Best regards,
Krzysztof

