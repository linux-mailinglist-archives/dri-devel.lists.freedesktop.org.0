Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA2973B667
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 13:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84C310E06C;
	Fri, 23 Jun 2023 11:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FE510E061
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 11:37:16 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2b4745834f3so8863951fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 04:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687520234; x=1690112234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Cno2LvifIIwNp8WyPKzeWjl5KgumWlzSdo3J2rjBK4w=;
 b=eVvGdkiE/BhdwotgtG29D6pMZoytFINfdK5IwTY+okHmiDV/sCVEf3F+4FvniSB4Nk
 9WMHQQJuM+6O/awFnVa8YrbnfQjgCla9YGsHwYfZJl1FfUfXCqlNz2FBmNiG36T7AxfL
 BNgskQXdwXcUaATlykSt7n163CQ7g0hjrYnc/gPnEJuURu7ys5f6dZ0x+SXzG/NrY909
 Z5VYSCRHs7rILbN73JT4mPYYtGDsbz045w5ouqbnl+o/9sGNGklOIBG9tvzGkHosPw+y
 JOq/l6K9b6pnTP2XpHU/XtmolRCIV1LUsKzlM0QPnZlIs1lCMjYYCUg+TTYyF4pDEc6u
 5Epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687520234; x=1690112234;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Cno2LvifIIwNp8WyPKzeWjl5KgumWlzSdo3J2rjBK4w=;
 b=SxG+CkDXW4Q/95M8Od7qPf610dISJTafvdlIDedBNYrdzpsakLXOhHplumWkqXuz6i
 fA7n5iOHdKnhA1f3RTk7FBf6hJxUtBN41bFaEW3ziPCOWPVaiKdoATcMD+AA9kDozAqB
 B8s4kiFc+Ql2W49QV7rjfGcxAdMBBbcL9lG3XrDGAIkbk9LC53fH2yJz2j3M1IvfKvth
 zft5wEgKzJOYtbZSeUNRczg82rMtCQmq8JELfompH0LA95/zmAklJ9HPdsERQCu2/4iD
 0iRY6wc1RnRNLs+VCnvr+5sPmbRKu5SA0ThdXiAsB5skAXWHZjAyjuqvUV1xppiFwjIS
 C8ZA==
X-Gm-Message-State: AC+VfDx2i3EErPmJgI+GsZ83lB504PwYOcSD97HPCmY2k+f+CP2P3EmM
 hQ+r5gpYW9JQOsK5OaUBbS63zA==
X-Google-Smtp-Source: ACHHUZ5bUzhJUNRIJiKNQkFux9OsSkH+TAbLk1s9ZatD90LVPofzJYwRwRWeg3QG0+fH51G+4wQCyQ==
X-Received: by 2002:a2e:8908:0:b0:2b4:6f70:c393 with SMTP id
 d8-20020a2e8908000000b002b46f70c393mr13758437lji.20.1687520234403; 
 Fri, 23 Jun 2023 04:37:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a2e7005000000b002b483003b1asm1664397ljc.69.2023.06.23.04.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 04:37:13 -0700 (PDT)
Message-ID: <ad1cf803-729f-5ef5-a6cf-667ecde0b282@linaro.org>
Date: Fri, 23 Jun 2023 14:37:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/2] drm/msm/dpu: fix DSC 1.2 block lengths
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230623013731.1088007-1-dmitry.baryshkov@linaro.org>
 <6b74cb1f-3128-4ebd-8ff9-33cc025d957b@quicinc.com>
 <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <mwxs3rvemvdizqtsfa7pxms5prgrdq2lue6lvkt2f23nehzhwr@uawaxv5jsnmh>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2023 09:54, Marijn Suijten wrote:
> On 2023-06-22 22:47:04, Abhinav Kumar wrote:
>> On 6/22/2023 6:37 PM, Dmitry Baryshkov wrote:
>>> All DSC_BLK_1_2 declarations incorrectly pass 0x29c as the block length.
>>> This includes the common block itself, enc subblocks and some empty
>>> space around. Change that to pass 0x4 instead, the length of common
>>> register block itself.
>>>
>>> Fixes: 0d1b10c63346 ("drm/msm/dpu: add DSC 1.2 hw blocks for relevant chipsets")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> There is no need of a fixes tag for this.
>>
>> This is not a bug but was intentional.
>>
>> Till we added sub-block parsing support we had to dump the whole block.
>>
>> And hence I would suggest this change should be merged after the
>> sub-block parsing change otherwise we wont have full register dumps for DSC.
> 
> This was indeed intentional, we discussed it in [1].
> 
> In fact I asked to make it 0xf00 + 0x10 or 0xf80 + 0x10 to also cover
> the CTL registers, but that change didn't make it through.  0x29c is an
> arbitrary number that I have no clue what it was based on.

This should have been NAKed. or at least TODOed.

> 
> [1]: https://lore.kernel.org/linux-arm-msm/y2whfntyo2rbrg3taazjdw5sijle6k6swzl4uutcxm6tmuayh4@uxdur74uasua/
> 
> - Marijn

-- 
With best wishes
Dmitry

