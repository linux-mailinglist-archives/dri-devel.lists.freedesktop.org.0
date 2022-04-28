Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 179EB512846
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 02:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 014F710E038;
	Thu, 28 Apr 2022 00:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E5A10E038
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 00:44:40 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e5e433d66dso3744857fac.5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 17:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Cs/qIUm50bD5E28nXsBBlicTWfhE4KBHVyVjAvs5x0k=;
 b=pAkU8BOu+5OIBdG47RWFaMEFj76pGvxzc09V3srgDkLutcS8VUWvOxKNlzSkz6vkuV
 E0sE2apzGXHdLvBuNpj9T/D/TcNgqoX6zeH8DEhmUe4lssJvqzEjQDLB+s8AN97Mf6qQ
 xd8BIXW+UGvlbXKFyfD7vcKHkWaVuXGTEmIrBCm1OsDS6508qierI4hShNL1Agm7zi/8
 mQMcfsz+8jmR4VmIajDnog6Ku6k8brMiOEptFai6yiSFfzSWCG2YhQKTl/xG6yAZB6+C
 9Ri9Ps+Dib/X7hNXw5b2MjloYVRAalsutvrCL1dwTd+MTWUTKQg0sfKQagCABCvGijE1
 cJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cs/qIUm50bD5E28nXsBBlicTWfhE4KBHVyVjAvs5x0k=;
 b=PJAZb5qx9anBzFJfmlKmVUEzHf40ytm1jMjt13amBhjMT0r18NvANCvgtmKwAoSOTs
 /RhQqPs8PeFMLA1QPEbJ+WuYuVYDQCGiT+1Qaa5u2bfTjXq+yeDv1m/TVvB2YQ/BMVYm
 +6frau1RcsqOUNNUdt7C4Rglnf9sExeV8xv/PjXxTwg69aIX5XrfDRpT4+LOfQop0AWo
 D38rN1B6lJX2kLhlUzy/G/AjKV7yz4LyIoML6mhQLAAohRD+N2RH+ITklQBw7v4uUFlD
 719SZ4Lc9qUy+AgICsLTVBYUuhBzbRgwWdD26YXI8TpOrrZGE3k6CNw1sWh0KG8o8/Ll
 fU0Q==
X-Gm-Message-State: AOAM533AT8gGmF7LnrgJDgb6OrGFMA9ZpPXkKu77IFjjM1a3iLNU7eoc
 5o8+asyLJ9Pn187usxJM0rE=
X-Google-Smtp-Source: ABdhPJyYSVA006Sc7IkgR/e+TIU5ljmwO8fYGH99ZM0qSnFlVwpwMmORyxMn+zGh1eI2ioMO+CeIPg==
X-Received: by 2002:a05:6870:8907:b0:e2:a4fd:7539 with SMTP id
 i7-20020a056870890700b000e2a4fd7539mr17367050oao.56.1651106680067; 
 Wed, 27 Apr 2022 17:44:40 -0700 (PDT)
Received: from ?IPV6:2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48?
 ([2804:431:c7f5:ffc4:8a9b:6b71:54e4:4c48])
 by smtp.gmail.com with ESMTPSA id
 bk3-20020a0568081a0300b003257eb687bbsm1089184oib.31.2022.04.27.17.44.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 17:44:38 -0700 (PDT)
Message-ID: <5095c372-f326-03cf-5229-69e2aac72a02@gmail.com>
Date: Wed, 27 Apr 2022 21:44:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-7-igormtorrente@gmail.com>
 <20220420153628.0a91fcb6@eldfell>
 <6d9acb8b-8b1c-957e-8dd1-1d5ed99b08a6@gmail.com>
 <03105fb1-4f4c-9f8a-f99a-045458ba4e37@gmail.com>
 <20220425111026.485cba66@eldfell>
 <caa885ed-208a-3810-bd3e-e497e2c9ba93@gmail.com>
 <5c2a80f5-5107-4fab-4df9-b0be633fd576@gmail.com>
 <4313DC33-E81A-4972-90AD-7B9DD42145B8@gmail.com>
 <20220427104302.3082584b@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
In-Reply-To: <20220427104302.3082584b@eldfell>
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 4/27/22 04:43, Pekka Paalanen wrote:
> On Tue, 26 Apr 2022 22:22:22 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
> 
>> On April 26, 2022 10:03:09 PM GMT-03:00, Igor Torrente <igormtorrente@gmail.com> wrote:
>>>
>>>
>>> On 4/25/22 22:54, Igor Torrente wrote:
>>>> Hi Pekka,
>>>>
>>>> On 4/25/22 05:10, Pekka Paalanen wrote:
>>>>> On Sat, 23 Apr 2022 15:53:20 -0300
>>>>> Igor Torrente <igormtorrente@gmail.com> wrote:
>>>>>    
> 
> ...
> 
>>>>>>>>> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
>>>>>>>>> +				 const struct line_buffer *src_buffer, int y)
>>>>>>>>> +{
>>>>>>>>> +	int x, x_dst = frame_info->dst.x1;
>>>>>>>>> +	u8 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
>>>>>>>>> +	struct pixel_argb_u16 *in_pixels = src_buffer->pixels;
>>>>>>>>> +	int x_limit = min_t(size_t, drm_rect_width(&frame_info->dst),
>>>>>>>>> +			    src_buffer->n_pixels);
>>>>>>>>> +
>>>>>>>>> +	for (x = 0; x < x_limit; x++, dst_pixels += 4) {
>>>>>>>>> +		dst_pixels[3] = (u8)0xff;
>>>>>>>>
>>>>>>>> When writing to XRGB, it's not necessary to ensure the X channel has
>>>>>>>> any sensible value. Anyone reading from XRGB must ignore that value
>>>>>>>> anyway. So why not write something wacky here, like 0xa1, that is far
>>>>>>>> enough from both 0x00 or 0xff to not be confused with them even
>>>>>>>> visually? Also not 0x7f or 0x80 which are close to half of 0xff.
>>>>>>>>
>>>>>>>> Or, you could save a whole function and just use argb_u16_to_ARGBxxxx()
>>>>>>>> instead, even for XRGB destination.
>>>>>>>
>>>>>>>
>>>>>>> Right. Maybe I could just leave the channel untouched.
>>>>>
>>>>> Untouched may not be a good idea. Leaving anything untouched always has
>>>>> the risk of leaking information through uninitialized memory. Maybe not
>>>>> in this case because the destination is allocated by userspace already,
>>>>> but nothing beats being obviously correct.
>>>>
>>>> Makes sense.
>>>>    
>>>>>
>>>>> Whatever you decide here, be prepared for it becoming de-facto kernel
>>>>> UABI, because it is easy for userspace to (accidentally) rely on the
>>>>> value, no matter what you pick.
>>>>
>>>> I hope to make the right decision then.
>>>
>>> The de-facto UABI seems to be already in place for {A, X}RGB8888.
>>
>> "Only XRGB_8888
> 
> If that's only IGT, then you should raise an issue with IGT about this,
> to figure out if IGT is wrong by accident or if it is deliberate, and
> are we stuck with it.
> 
> This is why I would want to fill X with garbage, to make the
> expectations clear before the "obvious and logical constant value for X"
> makes a mess by making XRGB indistinguishable from ARGB. Then the next
> question is, do we need a special function to write out XRGB values, or
> can we simply re-use the ARGB function.
> 
> Do the tests expect X channel to be filled with 0xff or with the actual
> A values? This question will matter when all planes have ARGB
> framebuffers and no background color. Then even more questions will
> arise about what should actually happen with A values (blending
> equation).

I dig into the igt code a little bit and found that it's waiting for the 
channel to not be changed.
It fills all the pixels in the line with a value and calculates the CRC 
of the entire buffer, including the alpha.

I will crate an issue asking if this is intended.

> 
>>
>>>
>>> I changed from 0xff to 0xbe and the `writeback-check-output` started to fail.
> 
> 
> Thanks,
> pq
