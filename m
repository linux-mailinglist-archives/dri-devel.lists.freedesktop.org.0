Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E0155A2D8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D488110F4CE;
	Fri, 24 Jun 2022 20:37:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F41A410F4CE
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:37:55 +0000 (UTC)
Received: from p57b77c73.dip0.t-ipconnect.de ([87.183.124.115]
 helo=phil.localnet) by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1o4q3s-0003j9-0C; Fri, 24 Jun 2022 22:37:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] drm/rockchip: vop: Don't crash for invalid
 duplicate_state()
Date: Fri, 24 Jun 2022 22:37:50 +0200
Message-ID: <4134988.X513TT2pbd@phil>
In-Reply-To: <CA+ASDXOzhoooDDJUWV7rKpz-7GkMR5v=3gKQt4XazTSgnY51WQ@mail.gmail.com>
References: <20220617172623.1.I62db228170b1559ada60b8d3e1637e1688424926@changeid>
 <4196825.8hzESeGDPO@phil>
 <CA+ASDXOzhoooDDJUWV7rKpz-7GkMR5v=3gKQt4XazTSgnY51WQ@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Sandy Huang <hjc@rock-chips.com>, Sean Paul <seanpaul@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, 24. Juni 2022, 19:57:53 CEST schrieb Brian Norris:
> On Fri, Jun 24, 2022 at 12:23 AM Heiko Stuebner <heiko@sntech.de> wrote:
> > The interesting question would be, do we want some fixes tag for it?
> 
> I'm not aware of any currently-upstream code that will hit this [1].
> I've hit it in out-of-tree code (or, code that I submitted to
> dri-devel, but wasn't accepted as-is), and this is the "belt and
> braces" part -- the primary fix is that we should avoid calling things
> like drm_atomic_get_crtc_state() at inappropriate times.
> 
> So, is the "extra safety" check really something that should go to
> -stable? (Because let's be honest, everything with a Fixes tag goes
> there.) Maybe?
> 
> Anyway, if you want to "blame" anything, this commit actually dropped
> the safety check:
> 
> 4e257d9eee23 drm/rockchip: get rid of rockchip_drm_crtc_mode_config

I tend to think, if we know that connection we should also include it :-) .
I wouldn't include a cc-stable for the reason you mentioned, but to me
it makes sense if someone reading the git history in the future can easily
know that information - so it doesn't hurt :-) .

So I'll add that when applying.

Thanks for supplying the origin commit
Heiko

> 
> Brian
> 
> [1] But I'm not omniscient. So maybe it's good to have anyway.
> 




