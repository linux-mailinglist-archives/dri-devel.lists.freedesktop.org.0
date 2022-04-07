Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 317634F7C86
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 12:16:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F77C10E708;
	Thu,  7 Apr 2022 10:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFFEC10E708
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 10:16:46 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncPC1-0003YL-0L; Thu, 07 Apr 2022 12:16:45 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncPBy-0007PN-7B; Thu, 07 Apr 2022 12:16:42 +0200
Date: Thu, 7 Apr 2022 12:16:42 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Message-ID: <20220407101642.GE4012@pengutronix.de>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220401125205.GL4012@pengutronix.de>
 <5420D26D-34FD-4637-B602-F6271E38BB8D@gmail.com>
 <BA4C591F-D115-43D2-BF59-A75B29889E50@gmail.com>
 <20220406145847.GX4012@pengutronix.de>
 <1A6985CC-CBEB-44B2-AA61-3005D204C023@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1A6985CC-CBEB-44B2-AA61-3005D204C023@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:03:24 up 7 days, 22:33, 69 users, load average: 0.45, 0.37, 0.25
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

On Wed, Apr 06, 2022 at 06:00:00PM +0200, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Sascha Hauer <s.hauer@pengutronix.de> w dniu 06.04.2022, o godz. 16:58:
> > 
> > On Wed, Apr 06, 2022 at 11:47:22AM +0200, Piotr Oniszczuk wrote:
> >> 
> >> 
> >> Sascha,
> >> 
> >> Having vop2 finally working with drm planes rendering i discovered another issue: overlay osd is invisible at playback. 
> >> 
> >> context: player draws video on plane #X and osd on overlay plane #Y
> >> When user do i.e. seek at playback - app uses overlay OSD plane to display OSD to user. This approach is used by majority of players (KODI, etc.)
> >> 
> >> This works well on all platforms i have  - except rk3566 
> >> 
> >> For me it looks like z-order vop2 issue or alpha blending issue.
> >> As this is only on rk3566 and only on drm-planes mode - issue is vop2 related imho.
> > 
> > During my testing I haven't seen any z-order issues, but that doesn't
> > mean much. With Weston I can currently only use the AFBC enabled cluster
> > windows and with modetest I can only use the non-cluster windows. Are
> > you able to find out which window is used for the OSD?
> > 
> > Sascha
> > 
> > -- 
> > Pengutronix e.K.                           |                             |
> > Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> 
> WiIl this answer to your Q?

Yes, and it raises a few more ;)

> 
> player:
> 
> 2022-04-06 17:52:26.424487 I Display: Geometry: 1920x1080+0+0 Size(Qt): 930mmx530mm
> 2022-04-06 17:52:26.424922 I /dev/dri/card0 Qt EGLFS/KMS Fd:5 Crtc id:49 Connector id:51 Atomic: 1
> 2022-04-06 17:52:26.425061 I /dev/dri/card0: Authenticated
> 2022-04-06 17:52:26.534362 I /dev/dri/card0: Found 3 planes; 3 for this CRTC
> 2022-04-06 17:52:26.534384 I /dev/dri/card0: Selected Plane #37 Overlay for video
> 2022-04-06 17:52:26.534430 I /dev/dri/card0: Supported DRM video formats: NV12,NV16,NV24,YVYU,VYUY
> 2022-04-06 17:52:26.534437 I /dev/dri/card0: Selected Plane #43 Overlay for GUI
> 2022-04-06 17:52:26.534480 I /dev/dri/card0: DRM device retrieved from Qt
> 2022-04-06 17:52:26.534489 I /dev/dri/card0: Multi-plane setup: Requested: 1 Setup: 1
> 
> so:
> plane #37 is where video is drawing
> plane #43 is GUI/OSD
> 
> 
> dri state:
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

Ok, this seems to be the base plane.

> plane[37]: Esmart0-win0
>         crtc=(null)

crtc=null? Did you capture the state without a video playing? Otherwise
I would expect a crtc associated here.

>         fb=0
>         crtc-pos=1920x1080+0+0
>         src-pos=1920.000000x1080.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=0
>         color-encoding=ITU-R BT.601 YCbCr
>         color-range=YCbCr limited range
> plane[43]: Cluster0-win0
>         crtc=(null)

This plane is selected for OSD by your application. The cluster windows
can't show a regular linear framebuffer, they can only do AFBC. You'll
see that in modetest:

	in_formats blob decoded:
                 XR24:  ARM_BLOCK_SIZE=16x16,
			 ARM_BLOCK_SIZE=16x16,MODE=SPARSE
			 ARM_BLOCK_SIZE=16x16,MODE=YTR
			 ARM_BLOCK_SIZE=16x16,MODE=CBR
			 ARM_BLOCK_SIZE=16x16,MODE=YTR|SPARSE
			 ARM_BLOCK_SIZE=16x16,MODE=SPARSE|CBR
			 ARM_BLOCK_SIZE=16x16,MODE=YTR|CBR
			 ARM_BLOCK_SIZE=16x16,MODE=YTR|SPARSE|CBR
			 ARM_BLOCK_SIZE=16x16,MODE=YTR|SPLIT|SPARSE
		...

The other windows show "XR24: LINEAR" here. Does your application use
the GPU to render the OSD? Otherwise I doubt your application can
handle this format, so it should not use this layer.

>         fb=0
>         crtc-pos=0x0+0+0
>         src-pos=0.000000x0.000000+0.000000+0.000000
>         rotation=1
>         normalized-zpos=0

I would be interested in this output when the player is actually playing
something. This normalized-zpos puzzles me a bit. Normally it should be
unique over all enabled planes for a CRTC. Maybe 0 is ok here because
it's currently not associated to any CRTC.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
