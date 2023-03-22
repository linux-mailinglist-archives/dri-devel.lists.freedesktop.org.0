Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DDE6C4834
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 11:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 381B810E909;
	Wed, 22 Mar 2023 10:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18AB10E909
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 10:49:10 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id t15so16512439wrz.7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 03:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679482149;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=DtazAy5ZBr6/UsaCHvXzNZIVTK1+Lw3Zmf5vXwd6UW8=;
 b=TeJU+m39p1LJTsyatJZX39zHQY+azvG5cNB8UkHlNt44ynGeVVujIZrl1EbqcjHMP3
 xwfy6kRQhgzl+XoZz0K9ffDNFk15ChYBWcYMhzPAgtn0kj1noxnOhfm+UGC8aUtLWc4Y
 NtYTc/oKxM90c65mGj2nijp0fn7SClIZ4RUS3pwBNx3QWQVldxY5ZtKM3jfdSGmF8b7a
 5rZM1LNndashS/11eHwMWg424JDkSbJhTW/Jk2nlctZzevEdYCh2QmTUBq6DCJ7J5eaq
 5QxvyPvOOk82QyWVE6vJBb7WzgujXkNbGw0IqXj+9QpFwPGO55s8ELTj/SC4Jq1r/jQQ
 lvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679482149;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DtazAy5ZBr6/UsaCHvXzNZIVTK1+Lw3Zmf5vXwd6UW8=;
 b=F6mJrV4HxLYCnQdHc3Fc9raiCH3MAB/HHlwyUTBArXs7DoIMgGaE4Wn6GTWF3GvmPx
 GcPC1D/aI+OqIv+slbpncYdgdNmWM0W7r/VwrIHE49JqQ7RQs9DKq+9y1aR865uxlM3y
 wMw8np4Ygsc5bQEvGLWyMDtr+9YO4PCMEJtgD/RAx0Jmpbw8cXvAX1WJMsQdHEmwmEns
 FXWMs7aJkThacXoxpFM/jU39LPcA+rUF2j49QMYTtrl5oowgZZ71CEDwYUtLIGVzyFYl
 la27tDlKcaXsngvwJhJdMRSw5+VDwiz10NUpcI0EnuY5hO6xijniOqTN38s+iCHmXjw5
 xguw==
X-Gm-Message-State: AO0yUKXkrQAi6IIxQrMVBi6BVENP0fD/3z5ASJZ99KDYXtyd1FUz7UMf
 8CenIi4gBdbasDTVUx52Gme2+Q==
X-Google-Smtp-Source: AK7set+2D6IK/mOn0v0700qQcCXrBEpJ6MI97aLA0wGLOC01QTc21OkrUob9mXzfNg7l2i80ksL3eQ==
X-Received: by 2002:a5d:56d2:0:b0:2d7:452f:79ec with SMTP id
 m18-20020a5d56d2000000b002d7452f79ecmr5062020wrw.7.1679482149187; 
 Wed, 22 Mar 2023 03:49:09 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3606:a601:f273:994a?
 ([2a01:e0a:982:cbb0:3606:a601:f273:994a])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a5d4d52000000b002d1e49cff35sm13549283wru.40.2023.03.22.03.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Mar 2023 03:49:08 -0700 (PDT)
Message-ID: <b669be41-0b8e-6f69-2aeb-a79334a90e94@linaro.org>
Date: Wed, 22 Mar 2023 11:49:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/panel: Fix panel mode type setting logic
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Jianhua Lu <lujianhua000@gmail.com>
References: <20230314114451.8872-1-lujianhua000@gmail.com>
 <CAD=FV=X7K2KQoRCsr17kj-DWiPs7h_zfcYxK_cdBVnC0wR1NwA@mail.gmail.com>
 <ZBEJdX6WVZ3Kqdo0@Gentoo>
 <CAD=FV=VgWSvrpCdi2pRr0JctHxcq1-qNJSMAxEVva6nEnv3e_g@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAD=FV=VgWSvrpCdi2pRr0JctHxcq1-qNJSMAxEVva6nEnv3e_g@mail.gmail.com>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 17/03/2023 01:23, Doug Anderson wrote:
> Hi,
> 
> 
> On Tue, Mar 14, 2023 at 4:55 PM Jianhua Lu <lujianhua000@gmail.com> wrote:
>>
>> On Tue, Mar 14, 2023 at 10:12:02AM -0700, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Tue, Mar 14, 2023 at 4:45 AM Jianhua Lu <lujianhua000@gmail.com> wrote:
>>>>
>>>> Some panels set mode type to DRM_MODE_TYPE_PREFERRED by the number
>>>> of modes. It isn't reasonable, so set the first mode type to
>>>> DRM_MODE_TYPE_PREFERRED. This should be more reasonable.
>>>>
>>>> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
>>>> ---
>>>>   drivers/gpu/drm/panel/panel-abt-y030xx067a.c     | 2 +-
>>>>   drivers/gpu/drm/panel/panel-auo-a030jtn01.c      | 2 +-
>>>>   drivers/gpu/drm/panel/panel-edp.c                | 4 ++--
>>>>   drivers/gpu/drm/panel/panel-innolux-ej030na.c    | 2 +-
>>>>   drivers/gpu/drm/panel/panel-newvision-nv3051d.c  | 2 +-
>>>>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c  | 2 +-
>>>>   drivers/gpu/drm/panel/panel-novatek-nt35950.c    | 2 +-
>>>>   drivers/gpu/drm/panel/panel-novatek-nt39016.c    | 2 +-
>>>>   drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 2 +-
>>>>   drivers/gpu/drm/panel/panel-seiko-43wvf1g.c      | 4 ++--
>>>>   drivers/gpu/drm/panel/panel-simple.c             | 4 ++--
>>>>   11 files changed, 14 insertions(+), 14 deletions(-)
>>>
>>> Can you explain more about your motivation here? At least for
>> This demonstrates a bad way to set DRM_MODE_TYPE_PREFERRED for panels
>> with more than one mode. It mislead the future contributors to send
>> a patch with this piece of code. There is also a discussion for it.
>> https://lore.kernel.org/lkml/904bc493-7160-32fd-9709-1dcb978ddbab@linaro.org/
>>> panel-edp and panel-simple it seems like it would be better to leave
>>> the logic alone and manually add DRM_MODE_TYPE_PREFERRED to the right
>>> mode for the rare panel that actually has more than one mode listed.
>> I think we can order it to the first mode if the mode type should be
>> DRM_MODE_TYPE_PREFERRED, It's also same.
> 
> A pointer to the original discussion would have been super helpful to
> be provided in your patch description.
> 
> Personally, I still stand by my assertion that I'd rather that
> DRM_MODE_TYPE_PREFERRED be placed in the actual data instead of being
> done like this in post-processing. To me the old check for "num_modes
> == 1" is basically saying that the people creating the "static const"
> data in this file were lazy and didn't feel like they needed to set a
> DRM_MODE_TYPE_PREFERRED when there was only one mode listed. Thus, we
> can add it for them. When "num_modes" is more than 1 then we shouldn't
> allow the people making the "static const" data to be lazy. We should
> force them to set one of the modes to be PREFERRED rather than for
> them to have to know about this magic rule.
> 
> Thus, for me, my order of preference would be these (note, I've mostly
> looked at panel-edp and panel-simple):
> 
> 1. Leave the check as "num_modes == 1" and document that we're
> basically allowing the people writing the "static const" structure to
> be lazy if there's only one mode. Manually add the
> DRM_MODE_TYPE_PREFERRED flag to the small number of cases where there
> is more than one mode. Possibly add a warning printout if we end up
> without a PREFERRED mode. I'd give a Reviewed-by for this.
> 
> 2. Fully get rid of this logic and add DRM_MODE_TYPE_PREFERRED to all
> of the "static const" data. I guess maybe we can't do that for the
> "timings" in panel-edp and panel-simple. I guess for those I'd be OK
> with just setting PREFERRED on the first timing like your patch is
> doing. I'd give a Reviewed-by for this.
> 
> 3. Your patch. I won't NAK it since it seems like this is what other
> (more senior) DRM folks were suggesting. ...but I don't love it. I
> won't give a Reviewed-by for this but won't object to someone else
> doing so.

I'm aligned with Doug's analysis, I don't have a strong opinion on
what to do, but 1 or 2 would be OK.

Neil

> 
> -Doug

