Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F0F2AA486
	for <lists+dri-devel@lfdr.de>; Sat,  7 Nov 2020 12:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F81789F19;
	Sat,  7 Nov 2020 11:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF5489F19
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Nov 2020 11:09:29 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 22CB620023;
 Sat,  7 Nov 2020 12:09:27 +0100 (CET)
Date: Sat, 7 Nov 2020 12:09:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v3 0/4] drm/bridge: ti-sn65dsi86: Support EDID reading
Message-ID: <20201107110925.GB912360@ravnborg.org>
References: <20201102181144.3469197-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201102181144.3469197-1-swboyd@chromium.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=c6rWFHShf1NgvZlil7gA:9 a=CjuIK1q_8ugA:10
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
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On Mon, Nov 02, 2020 at 10:11:40AM -0800, Stephen Boyd wrote:
> This patch series cleans up the DDC code a little bit so that
> it is more efficient time wise and supports grabbing the EDID
> of the eDP panel over the aux channel. I timed this on a board
> I have on my desk and it takes about 20ms to grab the EDID out
> of the panel and make sure it is valid.
> 
> The first two patches seem less controversial so I stuck them at
> the beginning. The third patch does the EDID reading and caches
> it so we don't have to keep grabbing it over and over again. And
> finally the last patch updates the reply field so that short
> reads and nacks over the channel are reflected properly instead of
> treating them as some sort of error that can't be discerned.
> 
> Stephen Boyd (4):
>   drm/bridge: ti-sn65dsi86: Combine register accesses in
>     ti_sn_aux_transfer()
>   drm/bridge: ti-sn65dsi86: Make polling a busy loop
>   drm/bridge: ti-sn65dsi86: Read EDID blob over DDC
>   drm/bridge: ti-sn65dsi86: Update reply on aux failures

All applied to drm-misc-next, thanks,

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
