Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBE3C8763
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jul 2021 17:26:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD8A6E418;
	Wed, 14 Jul 2021 15:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 565476E416
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jul 2021 15:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZOvl1gmVDabRs6CbWXmU6BRRJ8dMOrzdVZSIGfwjSRA=; b=P7KUfV88CSg3HLQ3zCsZhpxWfi
 rk2ErdJA/0ql0zDXEjtTMErDbnPK+HMI7nwGvIGzOYPo35QJYzrwAblpqH+T3Gis6fc0CkipdFmOv
 WM89eTTJ60NEj57J1gBx2qm7pjhD7IpXNBGn1PduwtLPohSMI4E9K3Wo3hNjFak8wH9tgE6KIFzp7
 bWRY6+9MZQl27IyCm2b/Y+IulNz7b28mVno+0gDVj4BSeqaqWsjPuIae+yyqrl1JWKZorAWXbB1R4
 Qkh3Q6a9Pi/eZxrAVrw3ItKLiOUPfiI52B4Fgp++5uKsQvSoJCfwUY3K5R4MV464ZDsRSRN73q4JZ
 3I7EIqtw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1m3gmU-0000xW-EN; Wed, 14 Jul 2021 18:26:38 +0300
Subject: Re: [PATCH v8 00/14] drm/tegra: Introduce a modern UABI
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
 <42252a14-f6b8-7e1b-90c2-1c741ba8223f@gmail.com>
 <YO6gm0PgMGNovk+4@orome.fritz.box>
 <56ca1626-37b6-5888-bc83-51433da7b26c@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <e5158cfd-dbff-68c5-c54b-932c5d35f074@kapsi.fi>
Date: Wed, 14 Jul 2021 18:26:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <56ca1626-37b6-5888-bc83-51433da7b26c@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 7/14/21 5:50 PM, Dmitry Osipenko wrote:
> 14.07.2021 11:30, Thierry Reding пишет:
>> On Sat, Jul 10, 2021 at 12:16:28AM +0300, Dmitry Osipenko wrote:
>>> Hello Thierry,
>>>
>>> 09.07.2021 22:31, Thierry Reding пишет:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> Hi all,
>>>>
>>>> Mikko has been away for a few weeks, so I've been testing and revising
>>>> the new UABI patches in the meantime. There are very minor changes to
>>>> the naming of some of the UABI fields, but other than that it's mostly
>>>> unchanged from v7.
>>>
>>> Why you haven't addressed any of the previous review comments? There
>>> were some obvious problems in v7 and v8 still has them.
>>>
>>>> One notable change is that mappings can now be read-only, write-only,
>>>> read-write or none of them (rather than just read-only or read-write),
>>>> since those combinations are all supported by the IOMMUs and it might
>>>> be useful to make some mappings write-only.
>>>>
>>>> For a full list of changes in v8, see the changelog in patch 6.
>>>>
>>>> I've also updated the libdrm_tegra library to work against this version
>>>> of the UABI. A branch can be found here:
>>>>
>>>>    https://gitlab.freedesktop.org/tagr/drm/-/commits/drm-tegra-uabi-v8
>>>>
>>>> That contains helper APIs for the concepts introduced in this series and
>>>> shows how they can be used in various tests that can be run for sanity
>>>> checking.
>>>>
>>>> In addition, Mikko has made updates to the following projects, though
>>>> they may need to be updated for the minor changes in v8:
>>>>
>>>> * vaapi-tegra-driver - https://github.com/cyndis/vaapi-tegra-driver
>>>>    Experimental support for MPEG2 and H264 decoding on T210, T186
>>>>    and T194.
>>>>
>>>> * xf86-video-opentegra - https://github.com/grate-driver/xf86-video-opentegra
>>>>    X11 userspace acceleration driver for Tegra20, Tegra30, and Tegra114.
>>>>
>>>> * grate - https://github.com/grate-driver/grate
>>>>    3D rendering testbed for Tegra20, Tegra30, and Tegra114
>>>>
>>>> I plan on putting this into linux-next soon after v5.14-rc1 so that this
>>>> can get some soak time.
>>>
>>> It should be a bit too early to push it into kernel. The UAPI is not
>>> ready because it's missing essential features. We can't call this a
>>> 'modern UABI' until it's fully implemented. The design decisions are
>>> still questionable because this UAPI is built around the proprietary
>>> firmware (and based on UAPI of downstream driver) which doesn't fit well
>>> into DRM world. I haven't got all the answers to my previous questions,
>>> should I repeat them?
>>
>> I don't know what you means by "built around the proprietary firmware".
>> Yes, this ends up using proprietary firmware for some of the hardware
>> engines that host1x drives, but that's completely orthogonal to the
>> UABI. No matter what UABI we'd be introducing, we'd be using that same
>> firmware.
>>
>> And yes, this is based on the UABI of the downstream drivers. The design
>> is guided by what we've learned over the last decade working with this
>> hardware in use-cases that customers need. It'd be dumb not to use that
>> knowledge to our advantage. This is the only way to ensure we can
>> deliver an upstream driver that's on par with our downstream drivers and
>> therefore make it possible to eventually adopt the upstream driver.
>>
>> And frankly, you did get answers to previous questions, though perhaps
>> not all, but I'm out of patience. We've been going in circles and at
>> some point we have to make a decision so we can make progress.
> 
> By firmware I was referring to the supervisor OS and inter-VM
> integration, sorry for not making it clear. My rough understanding is
> that it's all software defined and technically it's possible to avoid
> going though the trouble of supporting the firmware convention defined
> by downstream, and thus, making driver less optimal than it could be.
> It's still not clear to me how much that firmware is relevant to
> upstream in practice.

As mentioned in discussion elsewhere, there is no 'firmware convention'. 
The view I've formed so far is that the model of ephemeral syncpoint 
allocations and value resets, which I believe you are talking about 
here, is fundamentally opposed to the design intent of the hardware, and 
would result in a less efficient system regardless of inter-VM 
integration convention.

> 
>> I made several attempts over the years to get something usable merged
>> upstream so that we can finally make use of this hardware and get it
>> supported upstream and each time I made the mistake of trying to make it
>> perfect and accomodate all wishlist items. The result is that I wasted a
>> lot of time and have nothing to show for it.
> 
> It's a problem that you try to do everything on your own and not
> collaborating as much as you could. Writing code isn't a problem, the
> problem is that there is no clear understanding of what needs to be
> done, IMO. I have a vision of whats need to be done from a perspective
> of older SoCs, but I never could start implementing it for upstream
> because it requires yours feedback and preliminary agreement since
> you're the only maintainer of the driver who could merge patches I don't
> want to waste my time too.
> 
>> I've also been very hard Mikko with his work on this and I think we've
>> stretched this as far as we can without compromising too much on what we
>> are going to need from this UABI in the future.
>>
>> We've gone through the process of making sure all existing userspace can
>> and does work with this new UABI and even left the old UABI in place in
>> case we need it.
> 
> That is great, but it is not enough. So far we are enabling a minimal
> support for newer hardware here, but we also need to solve the older
> problems that are relevant to all SoCs and may well affect the UABI
> decisions.
> 
> It became apparent to me now that yours only goal here is to enable
> newer hardware, which is fine. It's also apparent to me that you still
> don't have a clear vision of what needs to be done overall, but this is
> fine too since nothing is removed here and it's in a staging phase yet.

While my goal of course is to enable proper use of Host1x on the newer 
SoCs, there is absolutely no intention to forget about the older SoCs. 
Observably, to me at least, GR2D and GR3D are working -- the test suites 
are passing (though I did not port/try mesa). We are also not regressing 
anything, and I do not think after this series we are worse (at least in 
any fundamental manner) than the downstream software stack that these 
chips were originally productized with. As such I have a hard time 
understanding the doom and gloom about the driver's state and needing 
grand overarching re-architectures.

> 
>> I'm reasonably satisfied with what we have now and I don't see any
>> reason to hold this back any further. We always have the option of
>> adding UABI if we need it for something, or extend functionality of
>> existing UABI where it makes sense. But we also do have to start
>> somewhere, otherwise we're just not going to get anywhere, as the last
>> 10 years have shown.
> 
> We're starting in a bit wrong direction by extending the old code base,
> adding unnecessary burden to userspace of older SoCs and adding sync
> point UAPI that may not integrate with the proper jobs scheduling. It
> probably shouldn't be a big problem to rework it all later on if will be
> needed, but we could avoid this extra work beforehand if we could put
> more effort into implementing more features from the start.
> 

As mentioned before, in my opinion, redoing the internals while 
supporting the legacy UAPI would be more difficult. Having the new UAPI 
in place will also guide the improvements to be made - and at least on 
new SoCs where hardware scheduling works fine we want to take advantage 
of that in the UAPI. And I don't know of any issue in the UAPI that 
would prevent use of a software scheduler (depending on implementation 
some fields could be unused in some cases but it's already the case that 
you don't always use every field).

>>> UAPI is not the only problem that we have. The performance and stability
>>> of the driver are in a very bad shape too. The modern UAPI can't be
>>> built on top of the old code. It's clear now that this is a very serious
>>> problem that must be addressed along with the UAPI work and I'm getting
>>> silence from you guys.
>>
>> We've been over this multiple times before, though perhaps never over
>> email. So let me make this clear here again and for future reference: we
>> will *not* be rewriting the driver from scratch.
> 
> This was unnecessary, we agreed on the incremental updates long time
> ago. My point is that we shouldn't be building the new UAPI on top of
> the old code, instead we should prioritize the upgrading to a modern
> APIs and fixing the lame abstractions of the legacy driver.
> 
> Mikko assures that this effort won't stop after merging this first bits
> and we will start upgrading driver soon. I trust Mikko. You guys want to
> light up the newer hardware so much that I don't know how to stop you :)
> Even if this will become a mistake later on, likely it won't be a
> critical mistake, so let's not hold it.
> 

I have a long TODO list of improvements to work on. Admittedly, I won't 
have as much time to work on it as I would have before since I need to 
start working on other projects in parallel as well. And things will 
need to be agreed on (e.g. as alluded to earlier I still don't know of 
any concrete reason why we would need to add a software scheduler. I can 
only make guesses. It probably makes sense for the old SoCs, but I don't 
know why we now need one and downstream never did)

Mikko
