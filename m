Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2147C120394
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 12:18:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993C26E4C9;
	Mon, 16 Dec 2019 11:18:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9556E4C9
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:18:12 +0000 (UTC)
Received: from wf0651.dip.tu-dresden.de ([141.76.182.139] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <heiko@sntech.de>)
 id 1igoNu-0007np-RY; Mon, 16 Dec 2019 12:17:54 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v5 0/6] drm/rockchip: px30 dsi support
Date: Mon, 16 Dec 2019 12:17:53 +0100
Message-ID: <4524104.zPHHQK04YB@phil>
In-Reply-To: <8a071340-6452-4de3-10c9-393bce815ad7@baylibre.com>
References: <20191209143130.4553-1-heiko@sntech.de>
 <8a071340-6452-4de3-10c9-393bce815ad7@baylibre.com>
MIME-Version: 1.0
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
Cc: bivvy.bi@rock-chips.com, jernej.skrabec@siol.net,
 kuninori.morimoto.gx@renesas.com, jonas@kwiboo.se, sean@poorly.run,
 xzy.xu@rock-chips.com, philippe.cornu@st.com, dri-devel@lists.freedesktop.org,
 hjc@rock-chips.com, yannick.fertre@st.com, nickey.yang@rock-chips.com,
 eddie.cai@rock-chips.com, Laurent.pinchart@ideasonboard.com,
 linux-rockchip@lists.infradead.org, sam@ravnborg.org,
 christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil,

Am Montag, 16. Dezember 2019, 11:40:00 CET schrieb Neil Armstrong:
> On 09/12/2019 15:31, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> > 
> > This series addes support for the px30 Rockchip soc to the dsi driver.
> > This includes support for external dsi-phys like used on the px30.
> > 
> > What happened between v1 and v5? The then separate dsi hs2lp timing
> > patch happened ;-) . As both it and this series touch similar areas
> > in the dsi driver ordering becomes an issue and so combining them to
> > make ordering explicit is helpful. v2-v4 where then iterations of the
> > timing patch.
> > 
> > So this v5 is mainly rebased on 5.5-rc1 and rechecked against drm-misc.
> > 
> > Heiko Stuebner (6):
> >   drm/bridge/synopsys: dsi: driver-specific configuration of phy timings
> >   drm/bridge/synopsys: dsi: move phy_ops callbacks around panel
> >     enablement
> >   dt-bindings: display: rockchip-dsi: document external phys
> >   drm/rockchip: add ability to handle external dphys in mipi-dsi
> >   dt-bindings: display: rockchip-dsi: add px30 compatible
> >   drm/rockchip: dsi: add px30 support
> > 
> >  .../display/rockchip/dw_mipi_dsi_rockchip.txt |  13 +-
> >  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c |  40 ++--
> >  drivers/gpu/drm/rockchip/Kconfig              |   1 +
> >  .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 173 +++++++++++++++++-
> >  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  13 ++
> >  include/drm/bridge/dw_mipi_dsi.h              |   9 +
> >  6 files changed, 227 insertions(+), 22 deletions(-)
> > 
> 
> You can go ahead and merge the whole serie with bridge stuff into drm-misc-next if you want,
> or I can do it.

I've applied the patches to drm-misc-next now (after double checking again).

Thanks a lot for doing the reviews
Heiko


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
