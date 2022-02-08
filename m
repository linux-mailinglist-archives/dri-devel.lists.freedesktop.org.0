Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD94AE1F2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 20:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2187710E4FC;
	Tue,  8 Feb 2022 19:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6DD610E4FC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 19:12:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 2ed631d7-8913-11ec-ac19-0050568cd888;
 Tue, 08 Feb 2022 19:13:22 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E63AD194BDF;
 Tue,  8 Feb 2022 20:12:18 +0100 (CET)
Date: Tue, 8 Feb 2022 20:12:16 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 6/9] drm/bridge: ti-sn65dsi86: Add NO_CONNECTOR support
Message-ID: <YgLAkHy3A10/hj+r@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-7-sam@ravnborg.org>
 <CAD=FV=Xhy__pDFM=t2bWAGkVthksXHSjfo9Oei3regqPdty12A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=Xhy__pDFM=t2bWAGkVthksXHSjfo9Oei3regqPdty12A@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Douglas,

On Mon, Feb 07, 2022 at 02:34:34PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Slightly awkward to fish out the display_info when we aren't creating
> > own connector.  But I don't see an obvious better way.
> >
> > v3:
> >  - Rebased and dropped the ti_sn_bridge_get_bpp() patch
> >    as this was solved in a different way (Sam)
> >
> > v2:
> >  - Remove error return with NO_CONNECTOR flag (Rob)
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 20 +++++++++-----------
> >  1 file changed, 9 insertions(+), 11 deletions(-)
> 
> This is fine by me assuming we can fix the previous patches.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> NOTE: to me, this isn't something to do _instead_ of my patch [1] but
> _in addition_ to it. ${SUBJECT} patch transitions us to a more modern
> approach of having the connector created elsewhere but doesn't remove
> the old fallback code. Might as well clean the fallback code up unless
> you think it's going to simply be deleted right away or something?

Until we know all users have NO_CONNECTOR support we need the connector
creation code.
Please just go ahead with your patches as you already got r-b from
Laurent. For the debugfs patch I will look at it soonish unless someone
beats me.

	Sam


> 
> [1] https://lore.kernel.org/r/20220204161245.v2.1.I3ab26b7f197cc56c874246a43e57913e9c2c1028@changeid
