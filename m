Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2176F4BEB88
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 21:02:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D1910E42E;
	Mon, 21 Feb 2022 20:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE7410E42E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 20:02:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id w27so2864914lfa.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 12:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fb+j2sk074uBhHwnP84qNW+Wlx2FB7d28dJPNkXMgrg=;
 b=gfZpsarTMe8zv8kNNuq658hFcX165O74Khr5ONbccSUuNk9HZplFmoclpWHVjrtTP1
 CjB0a7K9VEof0eheFxjkWmb1/BJ3TM3xpxUE8qpaHHfjK/lcJcWQL5+0e/YMOOi57TQO
 tOFQzm9J531Nfysi9H9SFHqFRDal61VkFMN/61bQ7LPvsbWiac7qjr47Wf39nzwi6rhC
 s8R5VqTz32sZJQlodkO5eG4h9VI/ZjdRqH7NP1+wSYeGx6QTtg4yzJheiIvIbKCFzm2v
 CWtpbzNUrZzSH+r8xrS+4iuIcDsucGpyTcRgV33dFhy7Kgyk2V5uOa6YjBXMKz03AvYb
 +6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fb+j2sk074uBhHwnP84qNW+Wlx2FB7d28dJPNkXMgrg=;
 b=1uibEhU++KiQWDpT5L+m5Pcr8k/RzsZLH1MCQgt8K2jYU4Ukdm1GhTze8olMHAtYsA
 wyE26mA22nYk+Y5U6prJMVmlhX3mNIE4NM+sSUVwV2WupFbc002/FHkz63YQj8Zhwmqc
 KGPSHEgibKpQXMKOHTSVE2i7dD1Pk/zd+fO4xfqTcfhakK3v74RbUqWpKGb5+23ersYJ
 jZQMprMZCocKXdH0xpC2Y2Vx5NKcULriEzer/kyOsyeansRl60f2HL2A3RDHfJw9udmR
 wRjKOjCpj06yVXdt84VBSzPci3fHUBpMQK2zBQWlp9jezDP4we3JvlO2syQMhUQhcmDe
 1Lww==
X-Gm-Message-State: AOAM532r2LHwnWeNMOirZHWAezOhlDSooBoIiDvGzqB51Y6dSviTHFPi
 PiaPH/ZEI166/64H4EZPlkk=
X-Google-Smtp-Source: ABdhPJy4/bripNm193lusUsi4gc6siiKT+oZ6eEPNsLASVQRtAyZf8khtnW/p16T4mOlUK/g6+a8vQ==
X-Received: by 2002:a05:6512:3310:b0:443:4c51:6b60 with SMTP id
 k16-20020a056512331000b004434c516b60mr14689786lfe.398.1645473750057; 
 Mon, 21 Feb 2022 12:02:30 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id v6sm1451504ljd.86.2022.02.21.12.02.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:02:29 -0800 (PST)
Message-ID: <bb533634-6cde-3835-db11-7b6191385294@gmail.com>
Date: Mon, 21 Feb 2022 23:02:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 9/9] drm/tegra: Support context isolation
Content-Language: en-US
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 joro@8bytes.org, will@kernel.org, robh+dt@kernel.org, robin.murphy@arm.com
References: <20220218113952.3077606-1-mperttunen@nvidia.com>
 <20220218113952.3077606-10-mperttunen@nvidia.com>
 <2b4dd244-f918-4d26-2322-00a0bb226ccf@gmail.com>
 <ea65fcd6-9451-7f5b-f4a9-57b8575f09ff@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ea65fcd6-9451-7f5b-f4a9-57b8575f09ff@kapsi.fi>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

21.02.2022 15:06, Mikko Perttunen пишет:
> On 2/19/22 20:35, Dmitry Osipenko wrote:
>> 18.02.2022 14:39, Mikko Perttunen пишет:
>>> +    if (context->memory_context &&
>>> context->client->ops->get_streamid_offset) {
>>              ^^^
>>> +        int offset =
>>> context->client->ops->get_streamid_offset(context->client);
>>> +
>>> +        if (offset >= 0) {
>>> +            job->context = context->memory_context;
>>> +            job->engine_streamid_offset = offset;
>>> +            host1x_context_get(job->context);
>>> +        }
>>
>> You should bump refcount unconditionally or you'll get refcnt underflow
>> on put, when offset < 0.
> 
> This refcount is intended to be dropped from 'release_job', where it's
> dropped if job->context is set, which it is from this path.
> 
>>
>>> +    }
>>> +
>>>       /*
>>>        * job_data is now part of job reference counting, so don't
>>> release
>>>        * it from here.
>>> diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
>>> index 9ab9179d2026..be33da54d12c 100644
>>> --- a/drivers/gpu/drm/tegra/uapi.c
>>> +++ b/drivers/gpu/drm/tegra/uapi.c
>>> @@ -33,6 +33,9 @@ static void tegra_drm_channel_context_close(struct
>>> tegra_drm_context *context)
>>>       struct tegra_drm_mapping *mapping;
>>>       unsigned long id;
>>>   +    if (context->memory_context)
>>> +        host1x_context_put(context->memory_context);
>>
>> The "if (context->memory_context &&
>> context->client->ops->get_streamid_offset)" above doesn't match the "if
>> (context->memory_context)". You'll get refcount underflow.
> 
> And this drop is for the refcount implicitly added when allocating the
> memory context through host1x_context_alloc; so these two places should
> be independent.
> 
> Please elaborate if I missed something.

You named context as memory_context and then have
context=context->memory_context. Please try to improve the variable
names, like drm_ctx->host1x_ctx for example.

I'm also not a big fan of the "if (ref) put(ref)" pattern. Won't be
better to move all the "if (!NULL)" checks inside of get()/put() and
make the invocations unconditional?
