Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B22F94EBE95
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 12:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E116210E1D1;
	Wed, 30 Mar 2022 10:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93CC810E1D1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:20:50 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nZVRY-0007qA-T7; Wed, 30 Mar 2022 12:20:48 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nZVRW-0004Wn-5Y; Wed, 30 Mar 2022 12:20:46 +0200
Date: Wed, 30 Mar 2022 12:20:46 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: "piotro.oniszczuk@google.com" <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Message-ID: <20220330102046.GA12181@pengutronix.de>
References: <20220328151116.2034635-1-s.hauer@pengutronix.de>
 <FB201567-AE5A-4242-82F1-7C55D8F111EA@gmail.com>
 <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:17:21 up 109 days, 19:02, 75 users,  load average: 0.10, 0.15,
 0.19
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

On Wed, Mar 30, 2022 at 12:01:05PM +0200, piotro.oniszczuk@google.com wrote:
> 
> 
> > Wiadomość napisana przez Sascha Hauer <s.hauer@pengutronix.de> w dniu 30.03.2022, o godz. 11:45:
> > 
> > On Wed, Mar 30, 2022 at 10:41:56AM +0200, piotro.oniszczuk@google.com wrote:
> > 
> > Let me rephrase this: The above sets a plane, but it doesn't set a mode
> > on the crtc. When my system boots up then the output of modetest looks
> > like this:
> > 
> > Encoders:
> > id      crtc    type    possible crtcs  possible clones
> > 68      0       TMDS    0x00000001      0x00000001
> > Connectors:
> > id      encoder status          name            size (mm)       modes  encoders
> > 69      0       connected       HDMI-A-1        530x300         9      68
> > CRTCs:
> > id      fb      pos     size
> > 67      0       (0,0)   (0x0)
> >  #0  nan 0 0 0 0 0 0 0 0 0 flags: ; type: 
> > 
> > No mode is set on the CRTC and the encoder/connector/crtc are not bound
> > to each other, consequently the screen is in standby. "modetest -P
> > 43@67:1920x1080@NV12" doesn't change this, still no mode set. Hence my
> > question: How did you set a mode initially?
> 
> Ah ok. I see your point.
> mode is set by app (player). 
> 
> Sequence was like this:
> -boot board
> -start app
> -on UI select playback
> -playback has green screen
> -exit app
> -run modetest -P 43@67:1920x1080@NV12 (the same green screen like in playback)
> -run modetest -P 49@67:1920x1080@NV12 (works ok)
> -run modetest -P 43@67:1920x1080@NV12 (now works ok)
> 
> > 
> >>> 
> >> 
> >> I'm not sure that above command only sets plane.
> >> On other SoCs i’m testing it gives expected results: diagonal colored stripes.
> >> There is single exception: rk356x with vop2 - where screen is green unless i „fix/enable” by playing with plane #69   
> >> 
> >>> I did with "modetest -s 69@67:1920x1080 -d" and with this it works as
> >>> expected, I can't reproduce any green screen issue here.
> >> 
> >> I see you are using plane #69.
> >> Why not #43?
> > 
> > I used "modetest -s 69@67:1920x1080 -d" to set a mode. The '69' is the
> > connector id, not a plane.
> 
> ack.
> typo from my side.
> 
> it was
> modetest -P 49@67:1920x1080@NV12
> 
> 
> > 
> >> Is plane #43 working ok for you?
> > 
> > Yes.
> 
> So it looks your testing method of #43 is not meaningful for verifying issue we are discussing here.
> 
> In my case:
> 12 SOC (except rk356x VOP2) gives me:
> -boot board
> -start app
> -on UI select playback
> -playback is ok
> -exit app
> -run modetest -P XX@YY:1920x1080@NV12 (diagonal stripes)
> 
> (XX/YY are plane/connector elected by app: plane@conector with format matching provider format) 
> 
> rk356x with vop2 v9:
> -boot board
> -start app
> -on UI select playback
> -playback has green screen
> -exit app
> -run modetest -P 43@67:1920x1080@NV12 (the same green screen like in playback)
> -run modetest -P 49@67:1920x1080@NV12 (works ok)
> -run modetest -P 43@67:1920x1080@NV12 (now works ok)

Does it change anything if you do a "modetest -s 69@67:1920x1080" before
starting the app? Or if you run "modetest -P 43@67:1920x1080@NV12"
before starting the app? Or other combinations thereof?

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
