Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2AD3C8655
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 16:50:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 967EB6E3C1;
	Wed, 14 Jul 2021 14:50:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6FF6E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 14:50:19 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id b40so3752595ljf.12
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 07:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KnxkrUTEqRfMoUrj5WW0+NjolAsyssU/z51E4EYPIMU=;
 b=D0qwaYk2DET0EoD2YgjxHwfmAi6+bbF6OLIbh3o3P9BM1CANymoReTbUX/SVKvsFeq
 iDP0zTnirwDXtvwUfzI3AL3MDYsJszNFXF3QJKIFzff5ktrvGh25hI+N65QZewZbhonv
 dywG4xxPsVXuHYG5aq3nXimdmC1rNYucHVQHQoz3XUALgKL6JQ/rJf6AwJIaWQyru4Eg
 T/Hwybsz9veGcQvy8u+7PFT/Rf7c4OpjxA47lJWJl799kswKUBwHy3JXuSOD5EccNBSQ
 eqrAORQNY/Qn0NzU8sSY7o4vZWT5jd4rGE404XByKumOY85QqqOXue3FJqJHcNY1Ykj3
 5/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KnxkrUTEqRfMoUrj5WW0+NjolAsyssU/z51E4EYPIMU=;
 b=VeylH5BQciCqo/tCEBPmCsbmfD+2MnszEdS1xKic6wF/emKvbl/TO6f/6Q+L6n/nxD
 ze0YzMJa6ROPcLXDENzoojfYIL2i1I0fede28HKBMICJqu9trDp7YqteDvHPqSUqYy6/
 IrPlX7x08LqTkDS8TlnrO/TyBYHDuicfaiKA9b+SVWxAEZHQGx7Fnnhw0UyUfM8rgndq
 P6t6hTtGnA8E3QDrexspWFKdvLygkiuWH5BV4yuTqQZN+/oqOTylhbiCGQXYU9LA/b8G
 4wmCjrU3SGL4I9CckYVnTgx/7nZ7LjYZO1+woAOZH3Pap8IGJ/N5mDM9PJkqmuNNQy9p
 kbEQ==
X-Gm-Message-State: AOAM530z05e4yrM+X57KYLJKUxAuUnnqAj9/JYdvvPLlenqY6fhQ+Y9/
 q746icohqNEyiLgsdZJXsTA=
X-Google-Smtp-Source: ABdhPJy0+O6X9p5V2DNdswNfe4eGYO4mvI+oQeHzNcapR9aRXeWowlMQeRF1qHRt3xbqNHGEW/LfeQ==
X-Received: by 2002:a2e:3310:: with SMTP id d16mr6637910ljc.199.1626274216754; 
 Wed, 14 Jul 2021 07:50:16 -0700 (PDT)
Received: from [192.168.2.145] (94-29-37-113.dynamic.spd-mgts.ru.
 [94.29.37.113])
 by smtp.googlemail.com with ESMTPSA id q66sm263884ljb.83.2021.07.14.07.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 07:50:15 -0700 (PDT)
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
To: Thierry Reding <thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
 <YO6gm0PgMGNovk+4@orome.fritz.box>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <56ca1626-37b6-5888-bc83-51433da7b26c@gmail.com>
Date: Wed, 14 Jul 2021 17:50:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO6gm0PgMGNovk+4@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

14.07.2021 11:30, Thierry Reding пишет:
> On Sat, Jul 10, 2021 at 12:16:28AM +0300, Dmitry Osipenko wrote:
>> Hello Thierry,
>>
>> 09.07.2021 22:31, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi all,
>>>
>>> Mikko has been away for a few weeks, so I've been testing and revising
>>> the new UABI patches in the meantime. There are very minor changes to
>>> the naming of some of the UABI fields, but other than that it's mostly
>>> unchanged from v7.
>>
>> Why you haven't addressed any of the previous review comments? There
>> were some obvious problems in v7 and v8 still has them.
>>
>>> One notable change is that mappings can now be read-only, write-only,
>>> read-write or none of them (rather than just read-only or read-write),
>>> since those combinations are all supported by the IOMMUs and it might
>>> be useful to make some mappings write-only.
>>>
>>> For a full list of changes in v8, see the changelog in patch 6.
>>>
>>> I've also updated the libdrm_tegra library to work against this version
>>> of the UABI. A branch can be found here:
>>>
>>>   https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
>>>
>>> That contains helper APIs for the concepts introduced in this series and
>>> shows how they can be used in various tests that can be run for sanity
>>> checking.
>>>
>>> In addition, Mikko has made updates to the following projects, though
>>> they may need to be updated for the minor changes in v8:
>>>
>>> * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
>>>   Experimental support for MPEG2 and H264 decoding on T210, T186
>>>   and T194.
>>>
>>> * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
>>>   X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
>>>
>>> * grate - https://github.com/grate-driver/grate
>>>   3D rendering testbed for Tegra20, Tegra30, and Tegra114
>>>
>>> I plan on putting this into linux-next soon after v5.14-rc1 so that this
>>> can get some soak time.
>>
>> It should be a bit too early to push it into kernel. The UAPI is not
>> ready because it's missing essential features. We can't call this a
>> 'modern UABI' until it's fully implemented. The design decisions are
>> still questionable because this UAPI is built around the proprietary
>> firmware (and based on UAPI of downstream driver) which doesn't fit well
>> into DRM world. I haven't got all the answers to my previous questions,
>> should I repeat them?
> 
> I don't know what you means by "built around the proprietary firmware".
> Yes, this ends up using proprietary firmware for some of the hardware
> engines that host1x drives, but that's completely orthogonal to the
> UABI. No matter what UABI we'd be introducing, we'd be using that same
> firmware.
> 
> And yes, this is based on the UABI of the downstream drivers. The design
> is guided by what we've learned over the last decade working with this
> hardware in use-cases that customers need. It'd be dumb not to use that
> knowledge to our advantage. This is the only way to ensure we can
> deliver an upstream driver that's on par with our downstream drivers and
> therefore make it possible to eventually adopt the upstream driver.
> 
> And frankly, you did get answers to previous questions, though perhaps
> not all, but I'm out of patience. We've been going in circles and at
> some point we have to make a decision so we can make progress.

By firmware I was referring to the supervisor OS and inter-VM
integration, sorry for not making it clear. My rough understanding is
that it's all software defined and technically it's possible to avoid
going though the trouble of supporting the firmware convention defined
by downstream, and thus, making driver less optimal than it could be.
It's still not clear to me how much that firmware is relevant to
upstream in practice.

> I made several attempts over the years to get something usable merged
> upstream so that we can finally make use of this hardware and get it
> supported upstream and each time I made the mistake of trying to make it
> perfect and accomodate all wishlist items. The result is that I wasted a
> lot of time and have nothing to show for it.

It's a problem that you try to do everything on your own and not
collaborating as much as you could. Writing code isn't a problem, the
problem is that there is no clear understanding of what needs to be
done, IMO. I have a vision of whats need to be done from a perspective
of older SoCs, but I never could start implementing it for upstream
because it requires yours feedback and preliminary agreement since
you're the only maintainer of the driver who could merge patches I don't
want to waste my time too.

> I've also been very hard Mikko with his work on this and I think we've
> stretched this as far as we can without compromising too much on what we
> are going to need from this UABI in the future.
> 
> We've gone through the process of making sure all existing userspace can
> and does work with this new UABI and even left the old UABI in place in
> case we need it.

That is great, but it is not enough. So far we are enabling a minimal
support for newer hardware here, but we also need to solve the older
problems that are relevant to all SoCs and may well affect the UABI
decisions.

It became apparent to me now that yours only goal here is to enable
newer hardware, which is fine. It's also apparent to me that you still
don't have a clear vision of what needs to be done overall, but this is
fine too since nothing is removed here and it's in a staging phase yet.

> I'm reasonably satisfied with what we have now and I don't see any
> reason to hold this back any further. We always have the option of
> adding UABI if we need it for something, or extend functionality of
> existing UABI where it makes sense. But we also do have to start
> somewhere, otherwise we're just not going to get anywhere, as the last
> 10 years have shown.

We're starting in a bit wrong direction by extending the old code base,
adding unnecessary burden to userspace of older SoCs and adding sync
point UAPI that may not integrate with the proper jobs scheduling. It
probably shouldn't be a big problem to rework it all later on if will be
needed, but we could avoid this extra work beforehand if we could put
more effort into implementing more features from the start.

>> UAPI is not the only problem that we have. The performance and stability
>> of the driver are in a very bad shape too. The modern UAPI can't be
>> built on top of the old code. It's clear now that this is a very serious
>> problem that must be addressed along with the UAPI work and I'm getting
>> silence from you guys.
> 
> We've been over this multiple times before, though perhaps never over
> email. So let me make this clear here again and for future reference: we
> will *not* be rewriting the driver from scratch.

This was unnecessary, we agreed on the incremental updates long time
ago. My point is that we shouldn't be building the new UAPI on top of
the old code, instead we should prioritize the upgrading to a modern
APIs and fixing the lame abstractions of the legacy driver.

Mikko assures that this effort won't stop after merging this first bits
and we will start upgrading driver soon. I trust Mikko. You guys want to
light up the newer hardware so much that I don't know how to stop you :)
Even if this will become a mistake later on, likely it won't be a
critical mistake, so let's not hold it.
