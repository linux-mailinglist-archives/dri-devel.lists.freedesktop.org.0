Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833CA6B720
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3296410E761;
	Fri, 21 Mar 2025 09:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ZCoSAhd/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFB410E74A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742548851;
 bh=agRf8CU/mixndGuRjt2UnY0yP+aqUWvJ9325H1i2b3o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZCoSAhd/L09tGNNIlb/+fybcr+lKdnh+Zp63yEoIG07U/BA3utBshwYj/dDGuWRsu
 5LoJROXofvS7vGdneMm1z7itfgPZGoSjDXSD0P42nTSFSNr2d/AhrSdq/Zld2GA1yL
 b7hL6lMnyJu1KByCmS/CoXl5W7M+gnpMx8bLWSMNZUyIMB0BKZDh4u7teoNhk0CS42
 4a2ZabyaNzNvdWdczBL1Vw/Xh6OLKyjhx6fnHJl8HuxPYouR68PMBQycFbJypQ7Pzb
 fEp3/cYPVfQD6DWzU6MoTXwLMs9T0RFPlLzN91T4sJMEhLXkiOqXKl4MF9hLyL5rwR
 bjmDwf77WiNfg==
Received: from [192.168.50.250] (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EC1017E0E01;
 Fri, 21 Mar 2025 10:20:49 +0100 (CET)
Message-ID: <d6428327-5d3b-4162-8caf-041842e73d25@collabora.com>
Date: Fri, 21 Mar 2025 14:50:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DRM CI
To: Maxime Ripard <mripard@redhat.com>, Helen Koike <koike@igalia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, helen.fornazier@gmail.com,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 daniels <daniels@collabora.com>
References: <20250319-greedy-sturgeon-from-avalon-ac758f@houat>
 <ab1d875c-7a1e-47a3-b786-85fb46c42bb2@igalia.com>
 <20250320-benevolent-quokka-of-cubism-c1c0ce@houat>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
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

On 20/03/25 15:03, Maxime Ripard wrote:
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

Thanks for the patch.

Will we have this gitlab-ci.yml for kunit/compilation and for igt tests
on hardware the existing drm-ci?

I tried adding kunit tests (only for x86_64) in existing drm-ci. Please 
see the below commit and pipeline.

https://gitlab.freedesktop.org/vigneshraman/linux/-/commit/dda0c011c26611132238f0769482a95ceae0f515

https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/73091231

Please let me know your opinion on this. Thanks.

> 
> There's several layers to it:
> 
>    - The most important one is I don't really see much to share at this
>      point, really. The containers creation is a good example of
>      something useful, reusable, and that I did use. However, drm-ci uses
>      different defconfigs, its own set of hardcoded compilers, etc.

It uses different configs only when building the kernel for hardware 
testing. For the build job, it uses the default defconfigs.

> 
>      I guess we could try to improve and consolidate it, but for a script
>      that simple, I don't think it's worth it.
> 
>      Similarly, I don't think it makes sense to try to come up with a
>      super generic implementation of kunit, when there's only one user.
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

Will the msm maintainers update the expectations in a separate repo and 
then merge them back to drm subsystem ci folder ?

Regards,
Vignesh

> 
> Maxime

