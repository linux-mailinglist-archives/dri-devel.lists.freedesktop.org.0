Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E31A7E44
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 15:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18C46E1EC;
	Tue, 14 Apr 2020 13:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCC36E1EC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 13:36:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 61D8620033;
 Tue, 14 Apr 2020 15:36:28 +0200 (CEST)
Date: Tue, 14 Apr 2020 15:36:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 4/4] drm/bridge: tc358764: make connector creation
 optional
Message-ID: <20200414133626.GA14282@ravnborg.org>
References: <20200414084727.8326-1-sam@ravnborg.org>
 <20200414084727.8326-5-sam@ravnborg.org>
 <20200414093816.GD19819@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414093816.GD19819@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=hD80L64hAAAA:8 a=IpJZQVW2AAAA:8 a=P1BnusSwAAAA:8 a=RwHePtW7AAAA:8
 a=TWEMfCem_vsuCYETDDUA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=D0XLA9XvdZm18NrgonBM:22
 a=FqraQwd7dyEg5dwJgZJs:22
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

On Tue, Apr 14, 2020 at 12:38:16PM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Tue, Apr 14, 2020 at 10:47:27AM +0200, Sam Ravnborg wrote:
> > Make the connector creation optional to enable usage of the
> > tc358764 bridge with the DRM bridge connector helper.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks. I will wait a few days for more feedback before applying.
 
> Thank you for the conversion. "Just a few" more bridge drivers to go,
> and then there will be no more excuse not to use the DRM bridge
> connector helper :-)

A quick grep for ATTACH and drm_bridge_attach_flags gave me following list:

adv7511				ongoing, Laurent
analogix/analogix-anx6345	todo
analogix/analogix-anx78xx	todo
analogix/analogix_dp_core	todo
cdns-dsi			done?
display-connector.c		done
lvds-codec			done?
megachips-stdpxxxx-ge-b850v3-fw	todo
nwl-dsi				(ongoing), Guido
nxp-ptn3460			todo
panel.c				done
parade-ps8622			todo
parade-ps8640			done?
sii902x				todo
sil-sii8620			done?
simple-bridge			ongoing, Laurent
synopsys/dw-hdmi		todo
synopsys/dw-mipi-dsi		done?
tc358764			ongoing, Sam
tc358767			todo
tc358768			done?
thc63lvd1024			done?
ti-sn65dsi86			todo
ti-tfp410			done
ti-tpd12s015			todo

3	done
7	done?
4	ongoing
11	todo

Maybe a little simplistic - but gives some kind of overview.

Drivers marked with "Done?" do not have any hits for ATTACH,
dunno if they need more attantion.

I will try to take a look at a few of the trivial conversions
later this week.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
