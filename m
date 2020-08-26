Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9612535ED
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 19:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E6436E5A5;
	Wed, 26 Aug 2020 17:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226806E5A5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 17:20:11 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8A7FF80640;
 Wed, 26 Aug 2020 19:20:05 +0200 (CEST)
Date: Wed, 26 Aug 2020 19:20:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 0/5] drm/bridge: ps8640: Make sure all needed is
 powered to get the EDID
Message-ID: <20200826172003.GC346855@ravnborg.org>
References: <20200826081526.674866-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200826081526.674866-1-enric.balletbo@collabora.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=D19gQVrFAAAA:8 a=mRsQ17UTts98cKi72SYA:9
 a=CjuIK1q_8ugA:10 a=W4TVW4IDbPiebHqcZpNg:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>, laurent.pinchart@ideasonboard.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric

On Wed, Aug 26, 2020 at 10:15:21AM +0200, Enric Balletbo i Serra wrote:
> The first patch was initially part of the series [1] but for some reason
> was not picked when the series were merged, so I included in this series
> because it is needed to make the others to work properly.
> 
> The same happened for the second patch, was part of series [1] but not
> merged.
> 
> The third patch and next are part of the original series and are to rework
> the power handling to get the EDID. Basically, we need to make sure all the
> needed is powered to be able to get the EDID. Before, we saw that getting
> the EDID failed as explained in the third patch.
> 
> [1] https://lkml.org/lkml/2020/6/15/1208
> 
> Changes in v2:
> - Included the patch `drm/bridge_connector: Set default status connected for eDP connectors`
> - Included the patch `drm/bridge: ps8640: Get the EDID from eDP control`
> - Use drm_bridge_chain_pre_enable/post_disable() helpers (Sam Ravnborg)
> 
> Enric Balletbo i Serra (5):
>   drm/bridge_connector: Set default status connected for eDP connectors
>   drm/bridge: ps8640: Get the EDID from eDP control
>   drm/bridge: ps8640: Return an error for incorrect attach flags
>   drm/bridge: ps8640: Print an error if VDO control fails
The first 4 patches are applied to drm-misc-next.

>   drm/bridge: ps8640: Rework power state handling
Let give this a copuple of days on the mailing list to see what we
conclude.

	Sam
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 89 ++++++++++++++++++++++----
>  drivers/gpu/drm/drm_bridge_connector.c |  1 +
>  2 files changed, 79 insertions(+), 11 deletions(-)
> 
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
