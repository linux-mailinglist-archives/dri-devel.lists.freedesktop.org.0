Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C266A431E
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 14:42:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A751210E14E;
	Mon, 27 Feb 2023 13:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE83610E14E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 13:42:50 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 703AC56A;
 Mon, 27 Feb 2023 14:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677505368;
 bh=6V+kECN/5jilXYl8XU7eM1D7wrxhKkzVwFcofciVIlk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EQLvvHl2ZllvdLJsI/JNMroAbMr3zPmzcWIAoK2vXhc1fEktrvs1QdZRrasPGo1hw
 GO2MzIsoPqb0WMRpPpS86RgUSEix/eTZN50dlcYMcnGLfbsEU3HjC0SUVLBenpNca8
 UXYG0FKYcun+LM210n56p7cDyVf/I1v4NdkXyaaw=
Message-ID: <ce545ef3-9299-cf67-88a3-209d8ca9970e@ideasonboard.com>
Date: Mon, 27 Feb 2023 15:42:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: Fix building pdfdocs
Content-Language: en-US
To: Akira Yokosawa <akiyks@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20230208082916.68377-1-tomi.valkeinen@ideasonboard.com>
 <307dbafd-6fe7-1b75-a484-67553529a5e0@gmail.com>
 <20230226114744.7221f460@coco.lan>
 <a0d52b30-265e-056e-0e67-6873d2c3b9ee@gmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <a0d52b30-265e-056e-0e67-6873d2c3b9ee@gmail.com>
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
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Airlie <airlied@redhat.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/02/2023 14:06, Akira Yokosawa wrote:
> Hi Mauro,
> 
> On Sun, 26 Feb 2023 11:47:44 +0100, Mauro Carvalho Chehab wrote:
>> Em Sun, 26 Feb 2023 08:39:32 +0900
>> Akira Yokosawa <akiyks@gmail.com> escreveu:
>>
>>> [+CC: Jon, linux-doc]
>>>
>>> On Wed,  8 Feb 2023 10:29:16 +0200, Tomi Valkeinen wrote:
>>>> Commit 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats") added
>>>> documatation for a few new RGB formats. For some reason these break the
>>>> pdfdocs build, even if the same style seems to work elsewhere in the
>>>> file.
>>>>
>>>> Remove the trailing empty dash lines, which seems to fix the issue.
>>>>
>>>> Fixes: 8d0e3fc61abd ("media: Add 2-10-10-10 RGB formats")
>>>> Reported-by: Akira Yokosawa <akiyks@gmail.com>
>>> Link: https://lore.kernel.org/r/12250823-8445-5854-dfb8-b92c0ff0851e@gmail.com/
>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>
>>>> Note: the offending patch was merged via drm tree, so we may want to
>>>> apply the fix to the drm tree also.
>>>
>>> So, the offending commit is now in mainline without this fix...
>>> I believe this build regression -- a real build error of "make pdfdocs"
>>> -- should be fixed ASAP.
>>>
>>> Tomi, Laurent has suggested a typo fix in the Changelog.
>>> Can you respin ?
>>>
>>> Or, Laurent, can you do the fix on your own?
>>>
>>> Hopefully, the fix can make v6.3-rc1.
>>
>> Better to wait for media PR to be handled. There were some changes at
>> the documentation that affected the patch. I guess the bug is gone.
> 
> You mean the PR at https://lore.kernel.org/lkml/20230226114551.68480d44@coco.lan/ ?
> Unfortunately, it has had no effect on this issue.
> 
>> If not, we'll need to rebase the patch.
> 
> There was no change in Documentation/userspace-api/media/v4l/pixfmt-rgb.rst,
> so rebase is not needed.
> 
> Should this bug survive v6.3-rc1, I guess this fix could go through
> media or doc tree.

This patch applies fine on top of current Linus' master.

As this is a media patch, and the offending commit is now in upstream, 
maybe it's better to get this fix in via linux-media rather than linux-drm.

Mauro, can you pick this up?

  Tomi

