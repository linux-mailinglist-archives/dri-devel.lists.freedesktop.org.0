Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E92A6A64B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 13:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD1A8951B;
	Thu, 20 Mar 2025 12:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Hup592GA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F148951B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 12:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W1zaLpd2shXaNgc1+Am8Z9S48EfoHj3ziX49YShlC30=; b=Hup592GANx8Lbp2WlFPK2LOGbn
 poJkHFk/vLA0lHZNCffVv2Gp5hY8Eg7o6QkJDh59x4E5FVWojxY1QKBjfP7C2uT5m/6AZQmdOlMwo
 9XfNX51yTiGiHxdHXXTaNP5SMg693rljKMbn72Zntr4dcjcBUskd9jI1ydYILY8dg48Plbiuh7F63
 ceA4oCM0I49UQmroJeQy9+jCKNp4/mhkkrOO+5iJhgejnvcVxhrDObASAobk9Llc4IPbu/qvVwcBs
 YLDe2rN3ug/rfYfcJ+Z4LqyywFVRTEJisT8Sy0kGVk3dKR4QHIiKEZtq1l0EmgLYuZgWrcru1y3Zj
 fMYEfa/Q==;
Received: from [191.33.112.135] (helo=[192.168.68.130])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tvF4k-003itx-VH; Thu, 20 Mar 2025 13:32:43 +0100
Message-ID: <5db038f9-b353-494a-aa11-9e6a95932537@igalia.com>
Date: Thu, 20 Mar 2025 09:32:36 -0300
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
Content-Language: en-US
From: Helen Koike <koike@igalia.com>
In-Reply-To: <20250320-benevolent-quokka-of-cubism-c1c0ce@houat>
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

Hi Maxime,

Thanks for your reply.

On 20/03/2025 06:33, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 19, 2025 at 02:39:59PM -0300, Helen Koike wrote:
>> Hi Maxime,
>>
>> On 19/03/2025 11:11, Maxime Ripard wrote:
>>> Hi,
>>>
>>> At last Plumbers, we agreed with Dave that a good first step to ramp up
>>> CI for DRM trees would be to enable build and kunit testing in the main
>>> DRM tree.
>>>
>>> I played around with it last week and wrote a good first iteration of
>>> the gitlab-ci file.
>>>
>>> https://gitlab.freedesktop.org/mripard/gitlab/-/blob/main/.gitlab-ci.yml?ref_type=heads
>>
>> How about improving and using the current DRM-CI instead of creating a
>> new one?
> 
> Thanks for the suggestion, and I did try. I don't think it's a good
> option though, at first at least.
> 
> There's several layers to it:
> 
>    - The most important one is I don't really see much to share at this
>      point, really. The containers creation is a good example of
>      something useful, reusable, and that I did use. However, drm-ci uses
>      different defconfigs, its own set of hardcoded compilers, etc.
> 

This is the effort kci-gitlab is doing (see last patch with a drm-ci 
proposal), to simplify things and remove the dependency of mesa-ci.

>      I guess we could try to improve and consolidate it, but for a script
>      that simple, I don't think it's worth it.

Well, we are splitting our community in some way...

> 
>      Similarly, I don't think it makes sense to try to come up with a
>      super generic implementation of kunit, when there's only one user.

No need to a super generic implementation. At least in kci-gitlab, there 
is room to very specific implementations.

> 
>      That, of course, can and should be reevaluated as we test more
>      features and the script does indeed become more complicated.
> 
>    - We discussed it during the thread with Linus, but I also don't think
>      a one-size-fits-all approach is going to work. drm-ci at the moment
>      has plenty of reasonable policies, but which people are still going
>      to have different opinions on. Like, whether you want to
>      aggressively update IGT or mesa. Or whether or not you are willing
>      to disable KASAN to accomodate db410c and db820c. The choices made
>      in drm-ci so far are reasonable, but choosing something else is just
>      as reasonable. That's why I thought at the time that providing
>      common scripts to include is a better way forward than a gitlab-ci
>      file everybody is supposed to use.
> 
>    - To some extent, the complaints Rob had last week about drm-ci
>      expectations not being updated fast enough in drm-misc are related
>      as well. It could also easily be solved by drm/msm having the
>      gitlab-ci script and its expectations in a separate repo, under the
>      msm maintainers control. And then it could go as fast as they want,
>      under their terms, without creating any impedance mismatch with the
>      rest of DRM.

(I confess I'm not following that thread, I'm guilty on that)

If we are going this way, maybe it is better to remove DRM-CI completely 
from the kernel code?

Just to be clear, I'm not opposing anything, I just want to understand 
how everything would fit together.

Regards,
Helen

> 
> Maxime

