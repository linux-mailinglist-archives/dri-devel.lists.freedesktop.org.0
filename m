Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A90922E18C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 19:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C02B89DEC;
	Sun, 26 Jul 2020 17:03:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D3089DEC
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 17:03:46 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B9D20804BA;
 Sun, 26 Jul 2020 19:03:43 +0200 (CEST)
Date: Sun, 26 Jul 2020 19:03:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v1 0/1] drm/bridge: nwl-dsi: Drop
 DRM_BRIDGE_ATTACH_NO_CONNECTOR check.
Message-ID: <20200726170342.GC3275923@ravnborg.org>
References: <cover.1595096667.git.agx@sigxcpu.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1595096667.git.agx@sigxcpu.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8 a=ze386MxoAAAA:8
 a=e5mUnYsNAAAA:8 a=_gW6sBtITI9CJUwKZVwA:9 a=wPNLvfGTeEIA:10
 a=AjGcO6oz07-iQ99wixmX:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=iBZjaW-pnkserzjvUTHh:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Guido.

On Sat, Jul 18, 2020 at 08:26:36PM +0200, Guido G=FCnther wrote:
> =

> We don't create a connector but let panel_bridge handle that so there's
> no point in rejecting DRM_BRIDGE_ATTACH_NO_CONNECTOR.
> =

> This was prompted by Sam in
> https://lore.kernel.org/dri-devel/20200718115734.GA2989793@ravnborg.org/
> =

> Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>

Now applied to drm-misc-fixes.

	Sam

> =

> Guido G=FCnther (1):
>   drm/bridge: nwl-dsi: Drop DRM_BRIDGE_ATTACH_NO_CONNECTOR check.
> =

>  drivers/gpu/drm/bridge/nwl-dsi.c | 5 -----
>  1 file changed, 5 deletions(-)
> =

> -- =

> 2.26.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
