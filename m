Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061094FB6F0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4010610F290;
	Mon, 11 Apr 2022 09:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A5F10F290
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 09:08:04 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ndq1j-0001v6-0U; Mon, 11 Apr 2022 11:08:03 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ndq1g-0005KI-Mn; Mon, 11 Apr 2022 11:08:00 +0200
Date: Mon, 11 Apr 2022 11:08:00 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Message-ID: <20220411090800.GR4012@pengutronix.de>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220408080748.GA2387@pengutronix.de>
 <20220408120021.GO4012@pengutronix.de>
 <B3E76A7A-9B62-4E6F-9472-00B6298689C5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B3E76A7A-9B62-4E6F-9472-00B6298689C5@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:49:33 up 11 days, 21:19, 65 users,  load average: 0.27, 0.21, 0.19
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
 Peter Geis <pgwipeout@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 08, 2022 at 05:54:24PM +0200, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Sascha Hauer <s.hauer@pengutronix.de> w dniu 08.04.2022, o godz. 14:00:
> > 
> >> That turned out to be simpler than I thought it would be. The zpos
> >> values were never actually written to the hardware. Please try the
> >> following fixup, it should fix this issue.
> > 
> > Or better try v10 which I have just sent.
> > 
> 
> Sascha,
> 
> I applied v10 on 5.17.2 and...can't see difference.
> I still need to play with zpos to get ui screen.
> if i have playback - no OSD.
> If I have OSD - no playback.
> 
> Maybe fix needs some adjustments for 3566?

I don't think so.

> player launch:
> .......
> 2022-04-08 17:47:57.035668 I /dev/dri/card0 Qt EGLFS/KMS Fd:5 Crtc id:49 Connector id:51 Atomic: 1
> 2022-04-08 17:47:57.035806 I /dev/dri/card0: Authenticated
> 2022-04-08 17:47:57.145447 I /dev/dri/card0: Found 3 planes; 3 for this CRTC
> 2022-04-08 17:47:57.145469 I /dev/dri/card0: Selected Plane #37 Overlay for video
> 2022-04-08 17:47:57.145515 I /dev/dri/card0: Supported DRM video formats: NV12,NV16,NV24,YVYU,VYUY
> 2022-04-08 17:47:57.145523 I /dev/dri/card0: Selected Plane #43 Overlay for GUI
> 2022-04-08 17:47:57.145567 I /dev/dri/card0: DRM device retrieved from Qt
> 2022-04-08 17:47:57.145574 I /dev/dri/card0: Multi-plane setup: Requested: 1 Setup: 1

Ok, so #37 for video, #43 for GUI.

Where is the OSD rendered? Is it rendered on the GUI layer?

> .......
> 
> 
> playback:
> .....
> 2022-04-08 17:48:55.457823 I DRMVideo: Using Plane #37 for video
> .....
> 
> DRI state with zpos=0, kms_id=0 and ongoing playback:
> 
> root@Myth-Frontend-06c7e973c2f1:~ # cat /sys/kernel/debug/dri/0/state
> plane[31]: Smart0-win0
>         crtc=video_port0
>         fb=58
>                 allocated by = mythfrontend
>                 refcount=2
>                 format=XR24 little-endian (0x34325258)
>                 modifier=0x0
>                 size=1920x1080
>                 layers:
>                         size[0]=1920x1080
>                         pitch[0]=7680
>                         offset[0]=0
>                         obj[0]:
>                                 name=0
>                                 refcount=4
>                                 start=00000000
>                                 size=8294400
>                                 imported=no
>         crtc-pos=1920x1080+0+0
>         src-pos=1920.000000x1080.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=0
>         color-encoding=ITU-R BT.601 YCbCr
>         color-range=YCbCr limited range

Base plane.

> plane[37]: Esmart0-win0
>         crtc=video_port0
>         fb=65
>                 allocated by = mythfrontend
>                 refcount=2
>                 format=NV12 little-endian (0x3231564e)
>                 modifier=0x0
>                 size=1920x1080
>                 layers:
>                         size[0]=1920x1080
>                         pitch[0]=1920
>                         offset[0]=0
>                         obj[0]:
>                                 name=0
>                                 refcount=3
>                                 start=00000000
>                                 size=3657728
>                                 imported=yes
>                         size[1]=960x540
>                         pitch[1]=1920
>                         offset[1]=2088960
>                         obj[1]:
>                                 name=0
>                                 refcount=3
>                                 start=00000000
>                                 size=3657728
>                                 imported=yes
>         crtc-pos=1920x1080+0+0
>         src-pos=1920.000000x1080.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=1
>         color-encoding=ITU-R BT.601 YCbCr
>         color-range=YCbCr limited range

Video plane, rendered full screen above the base plane without alpha.

> plane[43]: Cluster0-win0
>         crtc=(null)
>         fb=0
>         crtc-pos=0x0+0+0
>         src-pos=0.000000x0.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=0
>         color-encoding=ITU-R BT.601 YCbCr
>         color-range=YCbCr limited range

Here should be the GUI, but this plane is not active.

With this state I would expect to see a full screen video without
anything on it. Is that the case? If yes, then fine.

Could you post a state where you expect something else than is actually
seen?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
