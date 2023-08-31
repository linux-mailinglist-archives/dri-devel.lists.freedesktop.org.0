Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B86C178E8F8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 11:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67B410E1AC;
	Thu, 31 Aug 2023 09:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3F310E1AC
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1693472525; x=1694077325; i=deller@gmx.de;
 bh=Z3/WXbzpGh0X1vA04EAjzYhScxnI0aPgGENMGpZ8MkI=;
 h=X-UI-Sender-Class:Date:Subject:To:References:From:In-Reply-To;
 b=CXcX2uWw42XHJnL9r1sYGIzWr6J53lUoCXj87oAq1eFKvTf0Dcej6EdOT78lTHs9OM8RHJz
 EL4BimG2n+PZSLIC2J1o0SyRX0cw9CPzVanCf+CjDPzAERcX4sPZ5S0aJ/OCnfusv8Nnr+s8h
 aS9hvqHHXzKatBpgE8HeEjqJEzs+oKCe0eqoSSWSzvH3Avgr6pKeRWIe5xsCysK4Vypjzsbjt
 za6vU45yv5H0DtMlI06R82mtNjYsit1rKwIxUwXPU6VmktUvkTx05hk80Txb9fwq1mVckPf1g
 eHOCaB6ugwfn5o1aGSCSc53I42ahXlc7U9h+cVtxEgohB03yhavw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBm1U-1qWAzJ2lhM-00CCRo; Thu, 31
 Aug 2023 11:02:05 +0200
Message-ID: <d0646771-d426-45c6-e189-517b1e6e6248@gmx.de>
Date: Thu, 31 Aug 2023 11:02:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] fbdev: Update fbdev source file paths
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Jingoo Han <jg1.han@samsung.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20230829200253.1473891-1-j.neuschaefer@gmx.net>
 <d9a02d20-8b59-cbdd-d054-eac14f9771d2@suse.de> <ZPA26xdbTRdfuveS@probook>
 <ZPBUdJwZzvYYrNei@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <ZPBUdJwZzvYYrNei@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:O2yGuAHpJ+Kd6jLLCyCriT0fI4YNGD0ZOhRGg+ixiMnJRT1rk93
 1lOyBX1xAEwHlixvdpXP7tNpzpq3/9rktNxBMTSmJiKWn8ULng7TkyBK9gYceiWtSiYrR7N
 k+G+8oheT1KklcR2KTHrJzJnNSoR8OyJ46AnlRFLN++ij6S5GTThPOsqwu613Dy+f+hRNRL
 J1rADhVvUPpSM+9Dj+Qmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vlXaveO6BBE=;YfnYiTUou7/PzAAttstceGBQ3Iw
 7//m6qQfZfieXnNOmP7ZOWS+8Kgbc70Bm1czCCYPhKY06kkBfzX6gHdQkxRFKHEejCfOYXOIm
 uS7Kr7uVC3DunvGoOMsYdiBOFuOSrf23vkwTHOtcE3oY7j1A4Ev2yO7nGim1syAnRcVz0Xxm1
 ZKgiuX2dLpx/S7yqk5/nkxoaKsl6e75Jeu4fpyzJ/5o/OhARj0qxEJO/xB+QS6qRcOQhfKqf/
 ALCfrKwlZXCeQco2EkHl6+hZkL6EOXllJ45UPBA0BlwdAJJw1JLAdsia5nbkQd9c8SPOQYEcM
 to1AriCosUV1SJsjQKwDkJmqCWUqDTLxgtCDfAOzcl1P1q182PutaVzEqvttk4MrxpVOHcWID
 BypusfoAPQsqftAHELRoApPVzcyC6LbENxURFmpvB2HGx1wuKvAkDVCr3Jxy92pcBZ18hXS0E
 iNdpkgYOboDmiaKaA6CQb/3WjJobtf9Gv99tOo3NIepZ3GBaHNt5wqDm+sCdMl2yoRkYJl93g
 aLaEIGpv8T/FbM2lmunZuobKij7Zcrb7BFC070l6a+vkXFsdzN6VzNsJM+uIMW9T/rlqYO5yJ
 6sVV6LvXitRCYOrplEE/ORf4Fe5OtxN988V1Rcom/MbDmE074OBTPVNDQJo05TjNlMickcWbA
 ZbIgHQVN7bpXUfTE/OwkpdfsCijmJQJKblUqat1qoZwPR/Xg/fRwxBekbAPDuFIOfIQrJwGM0
 p2uhquCUo7ua1A9mQf/26CZ7kv5alAD1XJC7i2Xe/CNnArHJ47U3O5zzR8mZEcGqyXkD7WZ7e
 5m4r+2aegjM51CviuV9GNji+ogTQ8b5Hv6EuqvwEvsBrOfhT1cMn96HlrU5r5V6z9gtYqRXHw
 S88VR9ysG6JTh9eXKy55PT6BlKn6pAc915ezGcDfbvAq1LkwemuLay1Hrijo1BM7XB0RWtCql
 GXYxibKAqJn1eau5YHWiw6Rv+HA=
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

On 8/31/23 10:51, Daniel Vetter wrote:
> On Thu, Aug 31, 2023 at 08:44:59AM +0200, Jonathan Neusch=C3=A4fer wrote=
:
>> On Wed, Aug 30, 2023 at 09:10:26AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 29.08.23 um 22:02 schrieb Jonathan Neusch=C3=A4fer:
>>>> The files fbmem.c, fb_defio.c, fbsysfs.c, fbmon.c, modedb.c, and
>>>> fbcmap.c were moved to drivers/video/fbdev, and subsequently to
>>>> drivers/video/fbdev/core, in the commits listed below.
>>>>
>>>> Reported by kalekale in #kernel (Libera IRC).
>>>>
>>>> Fixes: f7018c213502 ("video: move fbdev to drivers/video/fbdev")
>>>> Fixes: 19757fc8432a ("fbdev: move fbdev core files to separate direct=
ory")
>>>> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
>>>
>>> IMHO these comments might just be removed.
>>
>> I think it's nice to have some sort of visual separation between groups
>> of functions in fb.h, which these comments provide at the moment.
>> Therefore I'm currently leaning towards my patch as it is, but I'm
>> willing to have my mind changed and do a v2 which just removes the
>> comments.
>
> Just the filename without the full path maybe?

Yes, I'd prefer that as well.

Helge

> That's enough to find the
> right file, and it's also better at highlighting the actual important pa=
rt
> of the comment since the path is very redundant.
> -Sima
>
>>
>>
>> Thanks
>>
>>>
>>> Best regards
>>> Thomas
>>>
>>>> ---
>>>>    include/linux/fb.h | 12 ++++++------
>>>>    1 file changed, 6 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/include/linux/fb.h b/include/linux/fb.h
>>>> index ce7d588edc3e6..3cda5b9f2469b 100644
>>>> --- a/include/linux/fb.h
>>>> +++ b/include/linux/fb.h
>>>> @@ -592,7 +592,7 @@ extern ssize_t fb_sys_write(struct fb_info *info,=
 const char __user *buf,
>>>>    	__FB_DEFAULT_SYS_OPS_DRAW, \
>>>>    	__FB_DEFAULT_SYS_OPS_MMAP
>>>>
>>>> -/* drivers/video/fbmem.c */
>>>> +/* drivers/video/fbdev/core/fbmem.c */
>>>>    extern int register_framebuffer(struct fb_info *fb_info);
>>>>    extern void unregister_framebuffer(struct fb_info *fb_info);
>>>>    extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
>
>
>

