Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F65F495DCB
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 11:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A66810E9EE;
	Fri, 21 Jan 2022 10:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B63910E9EE
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 10:32:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nArDt-0004FI-65; Fri, 21 Jan 2022 11:32:49 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nArDp-0006wy-SX; Fri, 21 Jan 2022 11:32:45 +0100
Date: Fri, 21 Jan 2022 11:32:45 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v3 00/22] drm/rockchip: RK356x VOP2 support
Message-ID: <20220121103245.GT23490@pengutronix.de>
References: <20211220110630.3521121-1-s.hauer@pengutronix.de>
 <AA3A26CB-6282-4A6B-99DC-8042DC8926BB@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AA3A26CB-6282-4A6B-99DC-8042DC8926BB@gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:28:39 up 40 days, 23:14, 76 users,  load average: 0.12, 0.12, 0.15
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
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Andy Yan <andy.yan@rock-chips.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Piotr,

On Wed, Jan 19, 2022 at 12:29:49PM +0100, Piotr Oniszczuk wrote:
> 
> 
> > Wiadomość napisana przez Sascha Hauer <s.hauer@pengutronix.de> w dniu 20.12.2021, o godz. 12:06:
> > 
> > 
> > Third round of patches and last one for this year. I hopefully integrated
> > all review feedback. Additionally the driver is now fully converted to
> > regmap, so no struct vop_reg necessary anymore.
> > 
> > Sascha
> > 
> > Changes since v2:
> > - Add pin names to HDMI supply pin description
> > - Add hclk support to HDMI driver
> > - Dual license rockchip-vop2 binding, update binding
> > - Add HDMI connector to board dts files
> > - drop unnecessary gamma_lut registers from vop2
> > - Update dclk_vop[012] clock handling, no longer hacks needed
> > - Complete regmap conversion
> > 
> 
> Sascha
> 
> I'm using you VOP2 code on rk3566 tvbox (x96-x6) with very good results.
> 
> I have just few questions:
> 
> 1. how support for CEC looks/prospects (plans for future, not in this code, expecting others should implement, etc)?

I had to google what CEC actually is. We don't have plans supporting it.
It looks like this is a matter of the HDMI driver supporting this and
not bound to the rockchip driver.

> 
> 2. VOP2 code works nice for me for x11/glamour and for EGLFS with EGL DMAbuf rendering by Mesa EGL_LINUX_DMA_BUF_EXT.
> I have issue however with app. rendering to DRM planes (GUI is DRM plane1, video is DRM pane2). 
> My ppp starts/works without any errors in log - but screen stays with kernel messages content.
> (it looks to me like i.e. app renders to DRM plane but DRM display driver not pass it to CRTC. just wild guess here...).

You enabled the panfrost driver with other patches, right?

> 
> 3. in kernel dmesg I have many:
> 
> "rockchip-drm display-subsystem: [drm] *ERROR* Unsupported format modifier 0x810000000000001".

This message is correct. This corresponds to
DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED and the VOP2 driver doesn't
support this. I have a similar problem here with
weston-simple-dmabuf-egl.  By default this uses DRM_FORMAT_XRGB8888
which ends up being PIPE_FORMAT_B8G8R8_UNORM in MESA. In
panfrost_afbc_format() we have:

        /* Don't allow swizzled formats on v7 */
        switch (format) {
        case PIPE_FORMAT_B8G8R8A8_UNORM:
        case PIPE_FORMAT_B8G8R8X8_UNORM:
        case PIPE_FORMAT_A8R8G8B8_UNORM:
        case PIPE_FORMAT_X8R8G8B8_UNORM:
        case PIPE_FORMAT_X8B8G8R8_UNORM:
        case PIPE_FORMAT_A8B8G8R8_UNORM:
        case PIPE_FORMAT_B8G8R8_UNORM:
        case PIPE_FORMAT_B5G6R5_UNORM:
                if (dev->arch >= 7)
                        return PIPE_FORMAT_NONE;

                break;
        default:
                break;
        }

This means the driver won't do AFBC with that format and picks
DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED instead. Now weston is
clever enough to not pass that into the VOP2 driver, apparently your
application is not and as a result you see that message.

In weston-simple-dmabuf-egl I can pass a suitable format on the command
line, in my case I use DRM_FORMAT_ABGR8888 (which becomes
PIPE_FORMAT_R8G8B8A8_UNORM). With this the panfrost driver does AFBC
which then can be rendered in the VOP2 cluster window overlay.

> 
> It comes from MESA i think - but i suspect because VOP2 provides
> unknown/wrong DRM modifier to mesa?

Nope, the modifiers the VOP2 driver propagates are correct. It doesn't
claim to support DRM_FORMAT_MOD_ARM_16X16_BLOCK_U_INTERLEAVED.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
