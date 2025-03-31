Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCBBA76C59
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 19:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E3FC10E07A;
	Mon, 31 Mar 2025 17:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="F/V0Gqpi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A80A10E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nqpiqL1pRJBmt2edeyHbKtJnuEH70avCHbilMf7Zby8=; b=F/V0Gqpi2lRLW5QtGgWQmHXta6
 HmRP7dVo4+Vu/gdhg7f3KruHQZZKmSaO8LRQRdfZQ45DbmmQHrCJNZlaALc0D1EtZeD3Cs+vJIhQR
 mk+d6cs3TL3g1zBWF9nFww56xS+SLg98tb1SYXeOiGX3ieqzxkabdpHCcfl3cLSwXK0SNUgO3cKX6
 UCLEa7+Fu4KONPlluK0vQqSmA36zFDtRKmFHFcwHkPHQmHRlqPnNmcgpgZrsuL6xyRjlBlo5f5Q1D
 FpegmQIUCgIqDrJYmLmTSLW5hYb6vKOVYiE8Smoi4dupJ7dwoIgrY3Em5/J0esEJEaWpONS5EUJrE
 nJ/GS4DA==;
Received: from [189.115.14.110] (helo=[192.168.68.130])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tzIVU-009IID-8C; Mon, 31 Mar 2025 19:01:04 +0200
Message-ID: <f2109b3e-ff56-4bbf-833a-442f5489c8ee@igalia.com>
Date: Mon, 31 Mar 2025 14:01:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DRM CI
To: Maxime Ripard <mripard@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Vignesh Raman <vignesh.raman@collabora.com>, helen.fornazier@gmail.com,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250319-greedy-sturgeon-from-avalon-ac758f@houat>
 <ab1d875c-7a1e-47a3-b786-85fb46c42bb2@igalia.com>
 <20250320-benevolent-quokka-of-cubism-c1c0ce@houat>
 <5db038f9-b353-494a-aa11-9e6a95932537@igalia.com>
 <20250328-gay-jaybird-of-wind-9dcca2@houat>
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250328-gay-jaybird-of-wind-9dcca2@houat>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 28/03/2025 13:11, Maxime Ripard wrote:
> On Thu, Mar 20, 2025 at 09:32:36AM -0300, Helen Koike wrote:
>> Hi Maxime,
>>
>> Thanks for your reply.
>>
>> On 20/03/2025 06:33, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Wed, Mar 19, 2025 at 02:39:59PM -0300, Helen Koike wrote:
>>>> Hi Maxime,
>>>>
>>>> On 19/03/2025 11:11, Maxime Ripard wrote:
>>>>> Hi,
>>>>>
>>>>> At last Plumbers, we agreed with Dave that a good first step to ramp up
>>>>> CI for DRM trees would be to enable build and kunit testing in the main
>>>>> DRM tree.
>>>>>
>>>>> I played around with it last week and wrote a good first iteration of
>>>>> the gitlab-ci file.
>>>>>
>>>>> https://gitlab.freedesktop.org/mripard/gitlab/-/blob/main/.gitlab-ci.yml?ref_type=heads
>>>>
>>>> How about improving and using the current DRM-CI instead of creating a
>>>> new one?
>>>
>>> Thanks for the suggestion, and I did try. I don't think it's a good
>>> option though, at first at least.
>>>
>>> There's several layers to it:
>>>
>>>     - The most important one is I don't really see much to share at this
>>>       point, really. The containers creation is a good example of
>>>       something useful, reusable, and that I did use. However, drm-ci uses
>>>       different defconfigs, its own set of hardcoded compilers, etc.
>>
>> This is the effort kci-gitlab is doing (see last patch with a drm-ci
>> proposal), to simplify things and remove the dependency of mesa-ci.
> 
> Do you have a link to that patch?

Yes, please check 
https://lore.kernel.org/all/20250123135342.1468787-1-vignesh.raman@collabora.com/

There is a link to v1 as well, where kunit is mentioned.

> 
>>>       I guess we could try to improve and consolidate it, but for a script
>>>       that simple, I don't think it's worth it.
>>
>> Well, we are splitting our community in some way...
> 
> I don't think so? In KMS, we tend to provide a default behaviour with
> helpers, but any driver is free to deviate from that if it makes sense.
> One of these reasons is that there's no point in trying to make
> something specific to a driver generic until there is multiple users for
> it. So we have plenty of drivers that don't use the helpers and the
> "default" solution.
> 
> A community isn't a single codebase, it's a single set of people working
> on the same set of problems. If anything, allowing deviation is better
> for a community, because then we can have the discussion we have right
> now, and we don't work in silos.
> 
> Now, if we start saying "ok, any CI in DRM must be done on Debian, with
> bleeding edge mesa and igt", then we're splitting the community, because
> it just won't work for some people, and they'll still have to make it
> work.
> 
>>>       Similarly, I don't think it makes sense to try to come up with a
>>>       super generic implementation of kunit, when there's only one user.
>>
>> No need to a super generic implementation. At least in kci-gitlab, there is
>> room to very specific implementations.
>>
>>>
>>>       That, of course, can and should be reevaluated as we test more
>>>       features and the script does indeed become more complicated.
>>>
>>>     - We discussed it during the thread with Linus, but I also don't think
>>>       a one-size-fits-all approach is going to work. drm-ci at the moment
>>>       has plenty of reasonable policies, but which people are still going
>>>       to have different opinions on. Like, whether you want to
>>>       aggressively update IGT or mesa. Or whether or not you are willing
>>>       to disable KASAN to accomodate db410c and db820c. The choices made
>>>       in drm-ci so far are reasonable, but choosing something else is just
>>>       as reasonable. That's why I thought at the time that providing
>>>       common scripts to include is a better way forward than a gitlab-ci
>>>       file everybody is supposed to use.
>>>
>>>     - To some extent, the complaints Rob had last week about drm-ci
>>>       expectations not being updated fast enough in drm-misc are related
>>>       as well. It could also easily be solved by drm/msm having the
>>>       gitlab-ci script and its expectations in a separate repo, under the
>>>       msm maintainers control. And then it could go as fast as they want,
>>>       under their terms, without creating any impedance mismatch with the
>>>       rest of DRM.
>>
>> (I confess I'm not following that thread, I'm guilty on that)
>>
>> If we are going this way, maybe it is better to remove DRM-CI completely
>> from the kernel code?
>>
>> Just to be clear, I'm not opposing anything, I just want to understand how
>> everything would fit together.
> 
> I think it really has value as a "library" or repo, kind of how github
> actions work for example. Providing something that would, say, configure
> and build the kernel and report the status as a comment on a PR would be
> awesome. And there's no reason not to share that. But I believe every
> maintainer will need to glue the whole thing together how they see fit.
> 

Sure, I just don't want us to re-do things all the time, if we manage to 
find a way to share I'm fine with that.


Regards,
Helen



