Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C794EE8CE
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 09:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C2D10FDE1;
	Fri,  1 Apr 2022 07:06:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E364A10FDE1
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 07:06:51 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1naBMr-0003Ic-Rk; Fri, 01 Apr 2022 09:06:45 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1naBMn-0006zI-VN; Fri, 01 Apr 2022 09:06:41 +0200
Date: Fri, 1 Apr 2022 09:06:41 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v9 00/23] drm/rockchip: RK356x VOP2 support
Message-ID: <20220401070641.GJ4012@pengutronix.de>
References: <20220330072822.GX12181@pengutronix.de>
 <0D8F5951-5375-46B5-BFF0-7ED410371EB7@gmail.com>
 <20220330094556.GZ12181@pengutronix.de>
 <D3DA14F9-C9C6-4927-B015-5B7D25689DAA@gmail.com>
 <20220330102046.GA12181@pengutronix.de>
 <60601619-EF07-457B-91F2-64FEB598FEBE@gmail.com>
 <20220330192054.GA4012@pengutronix.de>
 <af8445e0-f4af-721b-709e-2eb7c488a8a4@rock-chips.com>
 <B7CD9D55-9F2D-42F4-9D04-17C6A5FEBB08@gmail.com>
 <622c8786-2c3f-13ff-66b7-ad9c8cb9425e@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <622c8786-2c3f-13ff-66b7-ad9c8cb9425e@rock-chips.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:02:52 up 1 day, 19:32, 45 users,  load average: 0.80, 0.40, 0.20
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
 Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Peter Geis <pgwipeout@gmail.com>, kernel@pengutronix.de,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 01, 2022 at 09:52:01AM +0800, Andy Yan wrote:
>    Hi Piotr:
> 
>    On 3/31/22 22:53, Piotr Oniszczuk wrote:
> 
> 
> 
>  Wiadomość napisana przez Andy Yan [1]<andy.yan@rock-chips.com> w dniu 31.03.2022, o godz. 14:13:
> 
> 
>  Piotr:
> 
>  What soc is on you board? rk3566 or rk3568?
> 
>  it is rk3566 in x96-x6 tvbox
> 
>    RK3566?  Maybe that is the problem.

Likely, yes.

> 
>    plane[43]: Esmart1-win0
>    crtc=(null)
>    fb=0
>    crtc-pos=0x0+0+0
>    src-pos=0.000000x0.000000+0.000000+0.000000
>    rotation=1
>    normalized-zpos=1
>    color-encoding=ITU-R BT.601 YCbCr
>    color-range=YCbCr limited range
> 
>    From your dri/state dump, Plane 43 is Esmart1.
> 
>    Cluster1, Esmart1, Smart1 are special on rk3566, they are
> 
>    mirror window of Cluster0, Esmart0, Esmart0. That means
> 
>    the software can't program  a independent framebuffer for
> 
>    these three windows. They can only share the fb address set
> 
>    in Cluster0, Esmart0, Smart0.

Downstream Kernel has this:

static bool vop2_is_mirror_win(struct vop2_win *win)
{
        return soc_is_rk3566() && (win->feature & WIN_FEATURE_MIRROR);
}

static int vop2_create_crtc(struct vop2 *vop2)
{
	...

        for (j = 0; j < vop2->registered_num_wins; j++) {
                win = &vop2->win[j];

                if (win->type != DRM_PLANE_TYPE_OVERLAY)
                        continue;
                /*
                 * Only dual display on rk3568(which need two crtcs) need mirror win
                 */
                if (registered_num_crtcs < 2 && vop2_is_mirror_win(win))
                        continue;

		...

                ret = vop2_plane_init(vop2, win, possible_crtcs);
	}

	...
}

"Smart1-win0" and "Esmart1-win0" have this WIN_FEATURE_MIRROR bit set. It
seems we just should just don't register these windows for rk3566.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
