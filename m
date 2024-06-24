Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFFD914208
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 07:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA7A810E347;
	Mon, 24 Jun 2024 05:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="a4cP8tA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F5810E347
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 05:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719207265;
 bh=uDAQz5zmfFGu24sscEM076JC2dhlA4Ny0ZDgkdcCUCU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a4cP8tA5pgK0A5UMjMLAgsRDc7uM1VNn5ZaCipthQXAVG4p8PAbWruApAkKxXKpdt
 mPjBkqF1Vu8rgHJi1OdRAWw2YXQKbZIAhpbJrFDcAKQYwUE8t1F7GA9k3ghEkmRJ/C
 d8Lq7sdmjRuM/2gRu8+6ZClZBMzrDt1SPJXnPrEmgdy9SEDwSI8gSckN32ZIenIkvF
 QtFzSfv/mgJmUfd80ib01jOecZTBDDgT6MC3/gU1zxpKdIEoTJUii02zW9rA8RGYRk
 DSuOtVHgSUn6tsPRn1W8t8Fj9e/eFD2vpDKdl3Jq+A52aaFW1nsE4X1CWIz3V6fdCn
 44givByF8npXA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 573EC3780EC6;
 Mon, 24 Jun 2024 05:34:23 +0000 (UTC)
Message-ID: <44196cb4-bc07-4dba-bf1d-9d3d0e3bc88d@collabora.com>
Date: Mon, 24 Jun 2024 11:04:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Time for drm-ci-next?
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>
Cc: Helen Koike <helen.koike@collabora.com>, Dave Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Daniel Stone <daniels@collabora.com>
References: <CAF6AEGsRLPqddgc2MKCXKD1TDFuwxRs_6Pj=oDuj4gah0D-07Q@mail.gmail.com>
 <87a5mzrgie.fsf@intel.com>
 <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAF6AEGt=8mz8S+nBQ1a3mCNLFhBrfcc5XfmNrTQ=62J-m+_3Jg@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 15/03/24 22:50, Rob Clark wrote:
> On Fri, Mar 15, 2024 at 2:28 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Thu, 14 Mar 2024, Rob Clark <robdclark@gmail.com> wrote:
>>> When we first merged drm/ci I was unsure if it would need it's own
>>> -next branch.  But after using it for a couple releases, a few times
>>> I've found myself wanting to backmerge drm/ci changes without
>>> necessarily backmerging all of drm-misc-next.
>>>
>>> So, maybe it makes some sense to have a drm-ci-next branch that
>>> driver-maintainers could back-merge as-needed?
>>
>> That's a crossmerge instead of a backmerge, and I feel that could get
>> messy. What if folks crossmerge drm-ci-next but it gets rejected for
>> drm-next? Or the baselines are different, and the crossmerge pulls in
>> way more stuff than it should?
> 
> Yeah, it would defeat the point a bit of drm-ci-next was on too new of
> a baseline, the whole point is to be able to merge CI changes without
> pulling in unrelated changes.  So drm-ci-next would need to base on
> something older, like the previous kernel release tag.
> 
>> IMO the route should be drm-ci-next -> pull request to drm-next ->
>> backmerge drm-next to drivers and drm-misc-next.
>>
>> I'm not opposed to having drm-ci-next at all, mainly indifferent, but I
>> question the merge flows. And then the question becomes, does my
>> suggested merge flow complicate your original goal?
>>
> 
> I guess we could avoid merging drm-ci-next until it had been merged
> into drm-next?
> 
> Basically, I often find myself needing to merge CI patches on top of
> msm-next in order to run CI, and then after a clean CI run, reset HEAD
> back before the merge and force-push.  Which isn't really how things
> should work.

There are many CI patches merged recently to drm-misc-next.
With the GitLab 18.0 release, CI/CD pipeline configurations must 
transition from using the deprecated CI_JOB_JWT to the new id_tokens 
method, as the former will be removed.

Without the below commit kernel-build job pipelines fail in drm-ci,
https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/cc806b74466672a9bbd4e9a04265d44eb506b686

We need to cherry pick only this commit to fix this issue.
So it would be beneficial to have a drm-ci-next branch.

Regards,
Vignesh
