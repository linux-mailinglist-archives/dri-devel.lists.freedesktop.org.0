Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2539665E904
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 11:31:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797A110E6E4;
	Thu,  5 Jan 2023 10:31:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 58646 seconds by postgrey-1.36 at gabe;
 Thu, 05 Jan 2023 10:31:21 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD8CB10E6E4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 10:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1672914679; bh=HdTaM69YzlM7AWTFyHXLA1zjDBcCzf/dJ1df7pUtA/k=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=RXTvGhBnhOsZEJOiek0QbgAawv2ugUNvjAp/Y1+lP9ebOptf9YrENXHWSZQRoWiuN
 DBgX/+oWDob8rhh1P7qLN16NE9s6xXS/sC7Rnd7QGk8qS5vKbY36ClWTiOwqvGIDUe
 38PJGWl5xFCU4mDQVzHFuu07/GnG11zhF6fcg5LtB3qf6m8C0RisBPjIEpOSAtm36g
 LlQ6nXOQRBeirG3OqBZoUDxAKm5cE/FZ5mx1o374j16yKl8OpH2tWEgQdiQTrp76eb
 7mRwS4JR8io0jLdvDvSOMHwiOxAxu4bNqN3VMOacwcNCdY6LHWS5vxiAUBBaGbwZ88
 mB6QnrOFQ82OA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([92.116.173.134]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M89Kr-1p8igv3HSV-005KA5; Thu, 05
 Jan 2023 11:31:18 +0100
Message-ID: <ed7a65bb-f521-e5a5-85eb-0f24b023421b@gmx.de>
Date: Thu, 5 Jan 2023 11:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [GIT PULL] fbdev fixes for v6.2-rc3
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <Y7aGw/irynC61O85@ls3530>
 <CAKMK7uEnFBo_YfU8OTvMS8+YkoGS=vmpGQPMa9PKxGOB3pd7nA@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAKMK7uEnFBo_YfU8OTvMS8+YkoGS=vmpGQPMa9PKxGOB3pd7nA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vP4qg4Ik2xnHi9jKgGd7IyG0tMSl/rKMrdlhpkkF4WKn94KVpl7
 AidKo+tAbMC5shZXoITBMNCJ3aEWzPY0DEVApA6mj1lhpaDWgkeGdbz7PQ8R6z+jHK788qP
 PUP5FpjrAFOksi6//oVXlUJUz7Pki4XBF7A4UjEk3O4yLmw1cf/4aUOI/iVZO+UNU3IfBj1
 C/92kRV1UM+wW2+OtwGCg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JKWTuPJdwUo=;76xy/qSTu3Q8WMlQ9AIUR0ckxBy
 1JvLVdlUcX2Tzq2k5NOvR6fKfIlbBlfTJ1vzpHAhpD6G2pC4MkBJfZw5HQj6jFLO8Wz60ctT3
 0E+SpPCC65G65hWl/k2roZ03uk7h+tfM8s0db8ynyrQ1F6vFR+SkQ0cK7wVgpSbMgsrDY5YpG
 yz4xiEH6s51mq7jpJw743aQNk2LBMShrYSk8LhyzOTNJFoattXtVV6DkiapnoS6hI/sCBf/VD
 0Q1Nz2MqoKvmZ6OeEkkPH1WUL2SsmsojHevh3F0tbfjQcgvNSF+i6QyAC98AYmf62of1fwvrd
 so8XE/tX6Ae6mm0xEoNvBW4UhbyF7vWloBEgzASFWA1ZzmaXNxfZSbxXw3nDoQd+Env+R9GdF
 nZHsuTmJjcWPkMqBXgfDAG2AZsl4hgn6h+wBEGQwXpnwN1pkKWlEFCHWuP6CkQ3pGtwQQbZDU
 /UMXw1ixmzkTxtpezMd3wfsBHXu3abfuVuKWPEUZnQ5VfCGQ4vEXDm5C2NPl4QWYJChOMCQaM
 2qcWTiSt5b0deo6MIVJ6M/l3gOjmh8DE7+4T/FmsqP0NKNK+CjkOxPY5NJb3I6xGKrUmhmnpL
 vjCS2erU0RoYmF+xvQqzWOaC3ELnDdB/FBqHQUE8WKBSda1HPZSWaT+RZ7DPCfRVJFEWqsKTz
 rcM7PTNgSv5jt+DidbgUF2KOOXDSzkQg0u419GMVR3VHXHM2qpNDHsHoTL19x2n+SbU5wxI9L
 fppl2XVAD3+sNTdF9bW51RyUmHdI6Y+ERh6kpIWg+etNEk5IZssvje0nVYFAE9jFhIJrnJXeA
 rxx0JxPLYyYBAwEt772EyMd6KTos7EfhgKjwTL2D+IbR+ZiIaAjKyPbgrbu2/U5TFZN1+uom9
 7M3TYZDyPXD2mkneLj+X0fl80uCERzaInhFfwcLuyv4QZs+FWGAHuxJUvArlaYFhgX0SVS2iu
 i3oLFPcBYE4vunUEjepTHhmOC/s=
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
Cc: linux-fbdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/5/23 11:22, Daniel Vetter wrote:
> On Thu, 5 Jan 2023 at 09:14, Helge Deller <deller@gmx.de> wrote:
>>
>> Hi Linus,
>>
>> please pull the fbdev driver updates for 6.2-rc3, to receive
>> fixes for matroxfb, offb, omapfb and fbmem.
>>
>> Thanks,
>> Helge
>>
>> ----
>>
>> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e=
71c2:
>>
>>    Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>>
>> are available in the Git repository at:
>>
>>    http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.gi=
t tags/fbdev-for-6.2-rc3
>>
>> for you to fetch changes up to 764043cccd7232a783753a612d628fc0cb7854be=
:
>>
>>    fbdev: omapfb: avoid stack overflow warning (2023-01-04 19:09:40 +01=
00)
>>
>> ----------------------------------------------------------------
>> fbdev updates for kernel 6.2-rc3:
>>
>> - Fix Matrox G200eW initialization failure
>> - Fix build failure of offb driver when built as module
>> - Optimize stack usage in omapfb
>> - Prevent use-after-free in fbmem
>>
>> ----------------------------------------------------------------
>> Arnd Bergmann (1):
>>        fbdev: omapfb: avoid stack overflow warning
>>
>> Hang Zhang (1):
>>        fbdev: fbmem: prevent potential use-after-free issues with conso=
le_lock()
>
> I looked at this, and even by fbdev locking standards this makes
> absolutely no sense to me. I think this should be dropped before we've
> reached some sort of conclusion on what is going on, or whether this
> is just pure static checker conjecture without fully understanding how
> this is supposed to work really.
> -Daniel

Sure.

I'll send a new pull request where this patch is dropped.

Thanks!
Helge


>
>> Paul Menzel (1):
>>        fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
>>
>> Randy Dunlap (1):
>>        fbdev: make offb driver tristate
>>
>> Xu Panda (2):
>>        fbdev: omapfb: use strscpy() to instead of strncpy()
>>        fbdev: atyfb: use strscpy() to instead of strncpy()
>>
>>   drivers/video/fbdev/Kconfig                |  4 ++--
>>   drivers/video/fbdev/aty/atyfb_base.c       |  3 +--
>>   drivers/video/fbdev/core/fbmem.c           |  2 ++
>>   drivers/video/fbdev/matrox/matroxfb_base.c |  4 ++--
>>   drivers/video/fbdev/omap/omapfb_main.c     |  5 ++---
>>   drivers/video/fbdev/omap2/omapfb/dss/dsi.c | 28 ++++++++++++++++++---=
-------
>>   6 files changed, 27 insertions(+), 19 deletions(-)
>
>
>

