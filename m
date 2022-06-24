Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AEF559450
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 09:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C272F10FAA4;
	Fri, 24 Jun 2022 07:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1248 seconds by postgrey-1.36 at gabe;
 Fri, 24 Jun 2022 07:44:18 UTC
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A856910F592
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 07:44:18 +0000 (UTC)
Received: from p508fdadf.dip0.t-ipconnect.de ([80.143.218.223]
 helo=phil.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1o4df4-00074z-Ip; Fri, 24 Jun 2022 09:23:26 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>,
 Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] drm/rockchip: vop: Don't crash for invalid
 duplicate_state()
Date: Fri, 24 Jun 2022 09:23:24 +0200
Message-ID: <4196825.8hzESeGDPO@phil>
In-Reply-To: <CAD=FV=Wsp6GA=L4GsEVjMqazgtw4qG40gtLq1HT++5e9eRrvTw@mail.gmail.com>
References: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
 <CAD=FV=Wsp6GA=L4GsEVjMqazgtw4qG40gtLq1HT++5e9eRrvTw@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 24. Juni 2022, 01:44:52 CEST schrieb Doug Anderson:
> Hi,
> 
> On Fri, Jun 17, 2022 at 5:27 PM Brian Norris <briannorris@chromium.org> wrote:
> >
> > It's possible for users to try to duplicate the CRTC state even when the
> > state doesn't exist. drm_atomic_helper_crtc_duplicate_state() (and other
> > users of __drm_atomic_helper_crtc_duplicate_state()) already guard this
> > with a WARN_ON() instead of crashing, so let's do that here too.
> >
> > Signed-off-by: Brian Norris <briannorris@chromium.org>
> > ---
> >
> >  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 3 +++
> >  1 file changed, 3 insertions(+)
> 
> I'm not an expert in this area, but it makes sense to me to match
> drm_atomic_helper_crtc_duplicate_state() in this way. Thus:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> I would tend to assume that this would be landed in drm-misc by Heiko
> if he's good with it. After several weeks of silence, however, I'll
> commit it myself.

I do tend to batch up drm-misc patches, as that is always a different
workflow but I'll pick that up :-)

The interesting question would be, do we want some fixes tag for it?


Heiko


