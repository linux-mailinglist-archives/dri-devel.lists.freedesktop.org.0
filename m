Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E10FD383D92
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 21:38:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62AD6E11F;
	Mon, 17 May 2021 19:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144816E11F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 19:38:36 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id z12so9486258ejw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 12:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=77Mnh7A6bnQJzQImsAkDCKqT+2ZCgwbnjND7vgbiNLU=;
 b=DzSGrGqLI+chQOzYYaJy0zigRbLOEYrxqAhFY8NDh09R+r8A8GnRhRxOslauOB1vir
 KqVtTOlQ+Mh0Sak719QnItm4RaiHVxujsWzOyCjQaasS8CdpNzG2Y0M3YgBZ3hE0KMBe
 QmuA20UrVh3IqX9NmwyOrQCLwP57Asnh1SIrAOxLagzPzeMUchwvxfZBGwk+SgOOr/PS
 I0grjvmn4r8rHFZr6d3QhcnwCfeqPBl+YSo3vp01to+R4VeyR9XMj1cQo4KOYr0XqyOM
 Q7YZWv8fkeNcBNJAWLmNWw4SspOFwRPumxLTTF1JhNRXu0DU2nDtGGFz+inB46aBYMtr
 mPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=77Mnh7A6bnQJzQImsAkDCKqT+2ZCgwbnjND7vgbiNLU=;
 b=gjBgqyW9md4Q/GIEP9s41Ny4Ix4traMZ6p7EiayPOMyWJtE919myboC53AQ++8zlcy
 AvZD56wxSrrPgVkeOC40l6qKCaMxWWgMttwjw6euZB3CSqTM8hwi8w37GeQqoIc5ZFob
 ZAaZz1p3G8di3dS+SOVURz6Px9vReTVdWCn7Jx03CPaZDlwD6TVFkgkG+a1Sm5jzO+UO
 Bdbeu8voBY5quw00ZHmhfzq2jKLSWvv4dmKfL+9k4MdBDz3lkizq4kKGdZqizKfj1Zvh
 GNFQ4DN9fvaFPrUbBdkpgBMvgOnTzsb3ZEY2QCL8EDuiJD1QgaYDUh7kToWcfjXdM/HL
 p2gQ==
X-Gm-Message-State: AOAM530dqa/QWgQZu6+06iwnxtEOSP6wyVg0vLZbloc7cRBuN8YCYahS
 NB5iT5BxhRKMw9xqEnd4bIc=
X-Google-Smtp-Source: ABdhPJxpAaMeZTJKj9CVb4zXyq9oJP/YmJs0hP5jAljsq/Nto5T01F2y/r7wOg1hVX3bJlNUgAJNZQ==
X-Received: by 2002:a17:906:1cda:: with SMTP id
 i26mr1629049ejh.412.1621280314723; 
 Mon, 17 May 2021 12:38:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:bd86:58d9:7c79:a095?
 ([2a02:908:1252:fb60:bd86:58d9:7c79:a095])
 by smtp.gmail.com with ESMTPSA id q16sm8946943edw.87.2021.05.17.12.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 May 2021 12:38:34 -0700 (PDT)
Subject: Re: [RFC] Add DMA_RESV_USAGE flags
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210517141129.2225-1-christian.koenig@amd.com>
 <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5a3e9500-9d6b-a865-5385-fde43da2bf66@gmail.com>
Date: Mon, 17 May 2021 21:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YKKF4jOvM4gJT6a4@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.05.21 um 17:04 schrieb Daniel Vetter:
> On Mon, May 17, 2021 at 04:11:18PM +0200, Christian König wrote:
>> We had a long outstanding problem in amdgpu that buffers exported to
>> user drivers by DMA-buf serialize all command submissions using them.
>>
>> In other words we can't compose the buffer with different engines and
>> then send it to another driver for display further processing.
>>
>> This was added to work around the fact that i915 didn't wanted to wait
>> for shared fences in the dma_resv objects before displaying a buffer.
>>
>> Since this problem is now causing issues with Vulkan we need to find a
>> better solution for that.
>>
>> The patch set here tries to do this by adding an usage flag to the
>> shared fences noting when and how they should participate in implicit
>> synchronization.
> So the way this is fixed in every other vulkan driver is that vulkan
> userspace sets flags in the CS ioctl when it wants to synchronize with
> implicit sync. This gets you mostly there. Last time I checked amdgpu
> isn't doing this, and yes that's broken.

And exactly that is a really bad approach as far as I can see. The 
Vulkan stack on top simply doesn't know when to set this flag during CS.

That's also the reason the Valve guys came up with a solution where each 
BO gets a flag for explicit sync, but that only works for exports and 
not for imports.

> I915 and iirc msm has explicit flags for this, panfrost was designed to
> support this correctly from the start (also with flags I think). That's at
> least what I remember from all the discussions at XDC and #dri-devel, but
> didn't check the code again to give you the list of uapi flags you need
> for each driver.
>
> The other piece is making sure you're only picking up implicit fences when
> you should, and not any later ones, for which Jason has a solution:
>
> https://lore.kernel.org/dri-devel/20210317221940.2146688-1-jason@jlekstrand.net/

Yes, I helped with that as well. But I think that this is just another 
workaround without really addressing the underlying problem.

> If amdgpu isn't using those, then you will suffer from
> over-synchronization in vulkan and pay a price. The entire point of vulkan
> is that you pick up sync points very explicitly, and we also need to have
> very explicit uapi for userspace to pick up/set the implicit fences.
>
> Trying to paper over this with more implicit magic is imo just wrong, and
> definitely not the long term explicit sync model we want.

I completely disagree.

In my opinion the implicit sync model we have for dma_resv currently is 
just not well designed at all, since it always requires cooperation from 
userspace.

In other words you need to know when to enable implicit sync in 
userspace and that information is simply not present all of the time.

What we have done here is just keeping the old reader/writer flags i915, 
radeon and nouveau once had and pushed that out to everybody else making 
the assumption that everybody would follow that without documenting the 
actual rules of engagement you need to follow here.

That was a really big mistake and we should try to fix that sooner or 
later. The only other clean alternative I see is to use a flag on the 
exporter to tell the importer if it should sync to shared fences or not.

Additional to that I'm perfectly fine with implicit sync. Explicit sync 
certainly has some use cases as well, but I don't see it as an absolute 
advantage over the implicit model.

Regards,
Christian.

> -Daniel

