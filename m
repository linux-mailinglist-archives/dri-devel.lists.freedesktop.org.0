Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8293E1A7E8A
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AE8589690;
	Tue, 14 Apr 2020 13:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3171F6E4F1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:41:19 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EA9D521;
 Tue, 14 Apr 2020 15:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586871677;
 bh=CylzRSDEFpQ87EobffNc94UBZpl5KyW4m0wcsiNSYIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GOZKujrGL+ZB9QG9WQB+O1SNLANe4fhFqqsJUh3gagi0/oFwXEk56zGEsmsCgyxQK
 zzKBm89cGJU5aI9lgRGE73xD82PnBp68uRvnTysZw+s+FoDfdPzrbPR99VcI3dXTbW
 BMxh0dyCaTgX1hRMruP4vp3SVo0HWAXAIZ/4wOLE=
Date: Tue, 14 Apr 2020 16:41:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 4/4] drm/bridge: tc358764: make connector creation
 optional
Message-ID: <20200414134105.GF19819@pendragon.ideasonboard.com>
References: <20200414084727.8326-1-sam@ravnborg.org>
 <20200414084727.8326-5-sam@ravnborg.org>
 <20200414093816.GD19819@pendragon.ideasonboard.com>
 <20200414133626.GA14282@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414133626.GA14282@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

On Tue, Apr 14, 2020 at 03:36:26PM +0200, Sam Ravnborg wrote:
> On Tue, Apr 14, 2020 at 12:38:16PM +0300, Laurent Pinchart wrote:
> > On Tue, Apr 14, 2020 at 10:47:27AM +0200, Sam Ravnborg wrote:
> > > Make the connector creation optional to enable usage of the
> > > tc358764 bridge with the DRM bridge connector helper.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Jonas Karlman <jonas@kwiboo.se>
> > > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks. I will wait a few days for more feedback before applying.
>  
> > Thank you for the conversion. "Just a few" more bridge drivers to go,
> > and then there will be no more excuse not to use the DRM bridge
> > connector helper :-)
> 
> A quick grep for ATTACH and drm_bridge_attach_flags gave me following list:
> 
> adv7511				ongoing, Laurent
> analogix/analogix-anx6345	todo
> analogix/analogix-anx78xx	todo
> analogix/analogix_dp_core	todo
> cdns-dsi			done?
> display-connector.c		done
> lvds-codec			done?
> megachips-stdpxxxx-ge-b850v3-fw	todo
> nwl-dsi				(ongoing), Guido
> nxp-ptn3460			todo
> panel.c				done
> parade-ps8622			todo
> parade-ps8640			done?
> sii902x				todo
> sil-sii8620			done?
> simple-bridge			ongoing, Laurent
> synopsys/dw-hdmi		todo
> synopsys/dw-mipi-dsi		done?
> tc358764			ongoing, Sam
> tc358767			todo
> tc358768			done?
> thc63lvd1024			done?
> ti-sn65dsi86			todo
> ti-tfp410			done
> ti-tpd12s015			todo
> 
> 3	done
> 7	done?
> 4	ongoing
> 11	todo
> 
> Maybe a little simplistic - but gives some kind of overview.

Please note there are also bridge drivers in individual drivers
directories. For instance I'll convert rcar-du/rcar-lvds.

> Drivers marked with "Done?" do not have any hits for ATTACH,
> dunno if they need more attantion.

No, those drivers never had connector support in the first place, so as
far as I can tell they're good. I haven't checked if some of them need
to move to the DRM bridge panel helper, but if they don't create a
connector in the first place, they should already be using it.

> I will try to take a look at a few of the trivial conversions
> later this week.

Thanks a lot for that !

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
