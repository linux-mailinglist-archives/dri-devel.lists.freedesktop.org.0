Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 270964ED96D
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 14:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B86110E368;
	Thu, 31 Mar 2022 12:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m176237.qiye.163.com (mail-m176237.qiye.163.com
 [59.111.176.237])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB7B10E368
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 12:13:16 +0000 (UTC)
Received: from [192.168.60.102] (unknown [103.29.142.67])
 by mail-m176237.qiye.163.com (Hmail) with ESMTPA id CB9D1C40311;
 Thu, 31 Mar 2022 20:13:11 +0800 (CST)
Message-ID: <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
Date: Thu, 31 Mar 2022 20:13:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220330192054.GA4012@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUMaGkhWSk1LSU9NQh8fSE
 4aVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjI6Qxw*HD4BSg05SjpMOBwS
 DkoaCjpVSlVKTU9DTElDTEJPS0lOVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZSktIVUlCVUpPSVVNTFlXWQgBWUFNS0NCNwY+
X-HM-Tid: 0a7fdfe4e207d9afkuwscb9d1c40311
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Piotr:

On 3/31/22 03:20, Sascha Hauer wrote:
> On Wed, Mar 30, 2022 at 04:52:22PM +0200, Piotr Oniszczuk wrote:
>>
>>> Wiadomość napisana przez Sascha Hauer <s.hauer@pengutronix.de> w dniu 30.03.2022, o godz. 12:20:
>>>
>>> Does it change anything if you do a "modetest -s 69@67:1920x1080" before
>>> starting the app? Or if you run "modetest -P 43@67:1920x1080@NV12"
>>> before starting the app? Or other combinations thereof?
>> So i tried following combinations
>>
>> -boot
>> -modetest -s 69@67:1920x1080 -> ok
>> -modetest -P 43@67:1920x1080@NV12 -> green screen
> I have no idea what is going on here. There same commands work for me.
> You could provide me your kernel config and upstream commitish you are
> working on, maybe that gets me closer to your setup.


It's a little strange, I can't reproduce this issue neither.

But I have problem with this two step command sequence.

step 1:  modetest -s 69@67:1920x1080 -> ok

step 2:  modetest -P 43@67:1920x1080@NV12,

I got the failed message:  "failed to enable plane: Permission denied"

Because the drm core will stop step2 by drm_ioctrl_permit as 
DRM_IOCTL_SETPLANE need a master,

but the current master is the modetest run by step1.

static int drm_ioctl_permit(u32 flags, struct drm_file *file_priv)
{

         /* ROOT_ONLY is only for CAP_SYS_ADMIN */
         if (unlikely((flags & DRM_ROOT_ONLY) && !capable(CAP_SYS_ADMIN))) {
                 printk("DRM_ROOT_ONLY\n");
                 return -EACCES;
         }

         /* AUTH is only for authenticated or render client */
         if (unlikely((flags & DRM_AUTH) && 
!drm_is_render_client(file_priv) &&
                      !file_priv->authenticated)) {
                 printk("DRM_AUTH\n");
                 return -EACCES;
         }

         /* MASTER is only for master or control clients */
         if (unlikely((flags & DRM_MASTER) &&
                      !drm_is_current_master(file_priv))) {
                 printk("DRM_MASTER\n");
                 return -EACCES;
         }

         /* Render clients must be explicitly allowed */
         if (unlikely(!(flags & DRM_RENDER_ALLOW) &&
                      drm_is_render_client(file_priv))) {
                 printk("DRM_RENDER_NOT_ALLOW\n");
                 return -EACCES;
         }

         return 0;
}


After bypass the permission check, I can run step 2 , but the display on 
the screen will have a shift as the wrong dly configuration.

So how you two got step two run success?

Piotr:

What soc is on you board? rk3566 or rk3568?

I have a scripts[0]  use io[1] command to dump the VOP2 register you can 
use it dump the register configuration when you meet a display failure,

then send the dump to me, maybe I can figure out something.

[0]https://github.com/andyshrk/buildroot/blob/2022/board/andyshrk/rootfs_overlay/usr/bin/vop2_dump.sh

[1] https://github.com/andyshrk/io

>
> Sascha
>
