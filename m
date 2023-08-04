Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DE76FC0E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 10:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA7410E683;
	Fri,  4 Aug 2023 08:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEE210E683
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 08:30:42 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-313e742a787so1093768f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 01:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691137840; x=1691742640;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=QYrStqEM0cThZwoI/cPXMGOMxkPAFk/7V/s5s/EM5cA=;
 b=KjQAdFIEn7Ro3hrZPKzuvP5ENbD/1v+6fbdMUiYhWbsIWi7LI7xi5v5pdv+rryRX/F
 f+Svl9p8OzyUgCcv4r1/a2vlHsg0qfsT6pVTwBbP5ohmeYfI8MrOJTrIQFAXVPuYIMVr
 29f9fdFn50dUDq9JoFczTMyMb0ow4uCrQ/8STAU/nVxdslsmK3TjrRyVLt/iTzNh+Ns+
 7GNYP4PusvqjkXCaEk7MpBSTIjsgUWUL8GjsIfN+cemFzhIiqSLzZzrehiZMm477iEez
 CjuxiYuMTFjRkGBg/ALnsFVSfQEX3ZzIsSzsnRYfz2ctJvGNcedtln8HIgURbS0aXN9H
 nJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691137840; x=1691742640;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QYrStqEM0cThZwoI/cPXMGOMxkPAFk/7V/s5s/EM5cA=;
 b=UsEam8xpoeY9/3qEb9GFta19NxUOKctX5CPE0nDzgi9O5jsjGvq3Mn6qZoV1LamtYk
 n4koKZgDglHOTTwPzdwVujIzmu9336nWQG7u65/OeiseVbw/k6+reC88wmwAh3u6c/1U
 HZ/sAZhtjK/SJuofa2gy9VlkSEfmutRTs68CTbwpaq7L0RlHf/Js4wnC7QB6kNKBzhCv
 CUZzUx78C1drA5p8E9mlORg9i2vEJEVGeRWkGX2rmy6yyRNTBvyHV4dYNDG4GRUecVEo
 AiLf616R+VpWNsPCuK/I5H1f1zwUyxdEtsi5h4L22lCj03iuWUTfox7axxJkNSRkwqaP
 /v8Q==
X-Gm-Message-State: AOJu0Yxo/fN2nldJNuRceNzfqVCXLr/vODleVBm4b38zPA+8Cps/CvJV
 +EBiX+K8mxD0X8dYCNaeybjCEA==
X-Google-Smtp-Source: AGHT+IGmsm/JtL8yLdEbpyXwX4F3kWfcIGHPa2uTtbJSiv32jPeo95BTCrjkn3fXjABnyLsbFZgumA==
X-Received: by 2002:adf:f008:0:b0:314:1228:c4c1 with SMTP id
 j8-20020adff008000000b003141228c4c1mr1242706wro.23.1691137840638; 
 Fri, 04 Aug 2023 01:30:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b526:9083:f5a6:4af1?
 ([2a01:e0a:982:cbb0:b526:9083:f5a6:4af1])
 by smtp.gmail.com with ESMTPSA id
 s18-20020adfeb12000000b0031779a6b451sm1894770wrn.83.2023.08.04.01.30.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Aug 2023 01:30:40 -0700 (PDT)
Message-ID: <cc854764-805c-a46a-0210-edf7dafde0d1@linaro.org>
Date: Fri, 4 Aug 2023 10:30:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-US
To: Marek Vasut <marex@denx.de>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
 <bf95af44-2510-1835-dec9-183144de8413@denx.de>
 <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
 <CAF6AEGsfbUMCS4QTfqoyYetqea_ov-AET-iM54B-HvYpwwZvmg@mail.gmail.com>
 <25f3026f-3d97-a5ac-862a-da6dc5f8d830@denx.de>
Organization: Linaro Developer Services
In-Reply-To: <25f3026f-3d97-a5ac-862a-da6dc5f8d830@denx.de>
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On 03/08/2023 20:10, Marek Vasut wrote:
> On 8/2/23 20:49, Rob Clark wrote:
>> On Wed, Aug 2, 2023 at 11:16 AM Dmitry Baryshkov
>> <dmitry.baryshkov@linaro.org> wrote:
>>>

<snip>

>>>
>>> Can we please end the argument, land the fix (this revert) for 6.5 and
>>> work on the solution for 6.6 or 6.7?
>>>
>>
>> Even if they were in-tree, breaking existing hw means revert and
>> try-again.  Especially as we get into later -rc's
> 
> Then just apply the revert, I don't have time to debug this right this moment, and it is anyway meaningless until I can look at the bus with DSI bus analyzer.

I'm applying it, then I'll like to find an explanation when you'll be able to run the DSI bus analyzer.

I'll be able to test for regressions on the db845c board if you require, just ping me on irc.

We should clearly define those flags actions and probably add new flags to reflect the way the qcom
dsi controller acts.

Thanks,
Neil
