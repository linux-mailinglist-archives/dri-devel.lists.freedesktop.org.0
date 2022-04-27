Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D48951227B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 21:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB86F10E09E;
	Wed, 27 Apr 2022 19:21:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF9610E09E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 19:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651087261;
 bh=9Hdg20mmtvV0ZaedIPIzy1RVv7ErdbV8i+JXudPDtOo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=QU3Y1g8Poxle71TYaAJVBpPT/lhpXMs9GiaCbcbs0qhBrYkKfF2WNZg/f9mn3piTN
 wM0WdfmNawsZCoS7cobMGpuIUwFtnhXjo6QJ4PLo/FKySF39t6ep8mEsbxlKcWWkED
 0iHXKo5ltSOTY+57klpTOTybz85cx9mnJ1UDMC2U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.160.126]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1noAvt0Ne4-004WhU; Wed, 27
 Apr 2022 21:21:01 +0200
Message-ID: <3d4f3cf5-c3d0-7398-abab-aa3643296bbd@gmx.de>
Date: Wed, 27 Apr 2022 21:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: dim question: How to revert patches?
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <c79789fb-642d-ee9e-32a6-fc7f79d9e3b4@gmx.de>
 <YmlRW2fAabBqWc+0@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <YmlRW2fAabBqWc+0@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7Q2L06uDkLDax6Urc8C7i7XcNQsCvJWimSBlTkpvboXZCuzMHLE
 KBn67MX4ynC+YVRgZzmkjMw+qSAlJfE22oRRQIZLxy7VA1n/4uuxenL5m0nAUZG7RmFy9Au
 SIUZib3/jLQPo3XctXZoi4+VECvUt6VHviSElOxfxltpQs/b83OGbmbllOlDp4RQXtE9Yxr
 f+3SIiMvuTFV3+kgRHdXA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:anuV85jfNYg=:KweH/QyrME369RJDSavUQV
 jumJz84aOYS2LPKT7TJ8Q5eLCbrAc8dc3vzsl/Yse1f26OCx3l+zrtehNfkEBISn0mZtAq4yK
 LdOIp+V9NoO04eUjEJlU8bddDExQHVVZ0DFWMvZeYkgMZSnMbjN3ziNzeyVWvzbyAQKhZKxD9
 QGhvzv2JfYiuM8FCMyVI5YVoPQ7cifpi5retg4UJf1/sI8HFxccxA52G89+g4osTGdSsnyWd4
 DEVqnGcGaS1oJ2L6uXahwtx8dQtRnMAEeFVB1fGgGVLrnmY6wdL+2VbMsx2SXmW2CUP95TUeY
 VGrICpuKM0Us0+t7FEKlUChgVrKsiQjlKw0f9ysMk8CzXnmqsYhWjULrmQk1BdVFjF/MYbQud
 86wfJB/YOMuV00et6XHnGFgUTu7TMe9aCq5S1usWJRNCGXi88pj1yGD4l+u8Jud2ziw6q9fVD
 mmapuaZ/gwqdYE5yAJfJBaCmXLWO+kzjDPSERzD/IMxf4EApJhNkZuTIsd6ZSwTXXjfjsvh+/
 cxL6kDGg0HtSUiB2x5mq0fyJDuueh9MChP7FvLoQ6Si5PFOFlUfBdCm5JG9vt1Em1vSRchQ9o
 dg13iPVk7AWHGDwDejiG51/75ZUXoE/pmOF3h/0dWO9DBjG/PZye7P5eW3EbSrVHmRXu2dXRa
 VNcpkyAyKeSivq8YQmuekkHCO+vA6zIST5xDzvJl/R2471wkQvKmG3eLen24Hpnt8nRsD0ACF
 UHuKUkIH4pPiEvRY0Z2es2oi9728Ml3eyjzHRrlx6puSQRVMQwj/okE8tkAnK5PkmFE7Bz8Rs
 zvpImF0bjjFkIQleQZ8vmtve9ePeBu2VyAN0sjylaFsNKgQ1mtyTQcTowWIjF37a2iKFyClDd
 juGTeH0vW95xv/HoHZCy+cJrmww6Y63775sulzFkoOVW1UO3tHiPc4L91A3jvZZHfJIfftKyu
 KqDIZIF9Q7vjo4O7PUw3otrcajqFdluWuoppMiba3zmqYgE4jsuTx8jSSw9HJuO/ek5nFlKkM
 8M9e73Hzud87orTd/HhSPhXRWAasb4BYnicHEVMUWk2d6IAiFof0sMUjDl3FTNdWx4ZtQ4TvD
 GxJjpAqCzstGwU=
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On 4/27/22 16:21, Daniel Vetter wrote:
> On Thu, Apr 14, 2022 at 10:37:55PM +0200, Helge Deller wrote:
>> Hello dri-devel & dim users,
>
> Apologies for late reply, I'm way behind on stuff.
>
>> I committed this patch to the drm-misc-next branch:
>>
>> commit d6cd978f7e6b6f6895f8d0c4ce6e5d2c8e979afe
>>     video: fbdev: fbmem: fix pointer reference to null device field
>>
>> then I noticed that it was fixed already in another branch which led to=
 this error:
>>
>> Merging drm-misc/drm-misc-next... dim:
>> dim: FAILURE: Could not merge drm-misc/drm-misc-next
>> dim: See the section "Resolving Conflicts when Rebuilding drm-tip"
>> dim: in the drm-tip.rst documentation for how to handle this situation.
>>
>> I fixed it by reverting that patch above with this new commit in the dr=
m-misc-next branch:
>>
>> commit cabfa2bbe617ddf0a0cc4d01f72b584dae4939ad (HEAD -> drm-misc-next,=
 drm-misc/for-linux-next, drm-misc/drm-misc-next)
>> Author: Helge Deller <deller@gmx.de>
>>     Revert "video: fbdev: fbmem: fix pointer reference to null device f=
ield"
>>
>> My question (as "dim" newbie):
>> Was that the right solution?
>
> The patch wasn't really broken, so revert feels a bit silly. The hint wa=
s
> to look at the documentation referenced by the error message - the issue
> was only in rebuilding the integration tree:
>
> https://drm.pages.freedesktop.org/maintainer-tools/drm-tip.html#resolvin=
g-conflicts-when-rebuilding-drm-tip
>
> This should cover you even for really rare conflict situations.
>
>> Is there a possibility to drop those two patches from the drm-misc-next=
 branch before it gets pushed upstream?
>
> It's a shared tree, mistakes are forever. The only time we did a forced
> push ever is when someone managed to push their local pile of hacks or
> something, and we're catching those pretty well now with a server-side
> test to make sure you're using dim to push.
>
> It's also no big deal, and next time you get a conflict just resolve it
> in drm-tip per the docs and it's all fine.

Thanks for the feedback!
So, basically I think I did the right thing (although a revert isn't nice)=
.
There was no other useful fixup I could have come up with, because the oth=
er conflicting
patch had the right & better solution already pushed.

Helge
