Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F278B5FA2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2024 19:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAE810F5E3;
	Mon, 29 Apr 2024 17:06:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RyR4xC19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF41710F5E3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2024 17:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1714410401;
 bh=Aie4PRYUmYZ1Kd8eLyC+G9JAvORJ8lmLAOJi0P7Lqyg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RyR4xC19moQqqd2Yxv2nTgz5yLNVx2c+1t5eXWMnlPsSnhARVrOE4IYWXg4aDGNSR
 rWKv4T8RyHXUEYlqDLJ5ADZwjiHhl45s3MmuL/91/ky6EEbhsF+OnZywlNRd7YU73C
 A7hXcQXfx3tb10oJ50ok3CNLkkxgRt7juXDUCxan2F9E/0WTp/Zyk7DLgmI1aLa0ZI
 pWY83CPAK3W3hS9th9kHVoWguD2DtAkCio8KGRvm/wOXrsBAHkdOh0mlljqc1Db7pb
 inDIJ60V2DgYASijoU7TfviCYd1O5f/GQ2cu2wT0DFP9TZ42W2gxEe/TiA8/yNBRl4
 goXKyytHFtWxw==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9B4F03781182;
 Mon, 29 Apr 2024 17:06:38 +0000 (UTC)
Message-ID: <90390c46-27ee-4dd3-b250-3fa950960725@collabora.com>
Date: Mon, 29 Apr 2024 14:06:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-misc migration to Gitlab server
To: Tvrtko Ursulin <tursulin@ursulin.net>, Maxime Ripard
 <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <20240312-bizarre-rational-sawfish-ccee0a@houat>
 <2ddb4f5e-504e-4ce3-95d2-179dc7e6bf7b@ursulin.net>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <2ddb4f5e-504e-4ce3-95d2-179dc7e6bf7b@ursulin.net>
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



On 01/04/2024 13:49, Tvrtko Ursulin wrote:
> 
> On 12/03/2024 13:56, Maxime Ripard wrote:
>> Hi,
>>
>> On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote:
>>> ## Changing the default location repo
>>>
>>> Dim gets its repos list in the drm-rerere nightly.conf file. We will
>>> need to change that file to match the gitlab repo, and drop the old cgit
>>> URLs to avoid people pushing to the wrong place once the transition is
>>> made.
>>>
>>> I guess the next merge window is a good time to do so, it's usually a
>>> quiet time for us and a small disruption would be easier to handle. I'll
>>> be off-duty during that time too, so I'll have time to handle any
>>> complication.
>>>
>>> ## Updating the documentation
>>>
>>> The documentation currently mentions the old process to request a
>>> drm-misc access. It will all go through Gitlab now, so it will change a
>>> few things. We will also need to update and move the issue template to
>>> the new repo to maintain consistency.
>>>
>>> I would expect the transition (if everything goes smoothly) to occur in
>>> the merge-window time frame (11/03 -> 24/03).
>>
>> The transition just happened. The main drm-misc repo is now on gitlab,
>> with the old cgit repo being setup as a mirror.
>>
>> If there's any issue accessing that gitlab repo, please let me know.
> 
> No issues accessing the repo just a slight confusion and how to handle 
> the workflow. More specifically, if I have a patch which wants to be 
> merged to drm-misc-next, is the mailing list based worklflow still the 
> way to go, or I should create a merge request, or I should apply for 
> commit access via some new method other than adding permissions to my 
> legacy fdo ssh account?

I have this same question, I thought we would keep the workflow with dim 
tool, but after I pointed drm-misc remote to gitlab, dim is not happy.

If I don't point drm-misc to gitlab, dim say it is outdated (but I'm 
using the last top of the tree of maintainer-tools).

So I was wondering if dim requires changes or if the workflow changed.

Thanks,
Helen

> 
> Regards,
> 
> Tvrtko
