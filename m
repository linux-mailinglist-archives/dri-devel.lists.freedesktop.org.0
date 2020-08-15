Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4DB245114
	for <lists+dri-devel@lfdr.de>; Sat, 15 Aug 2020 16:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CDE6E0D5;
	Sat, 15 Aug 2020 14:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A776E0D5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Aug 2020 14:09:44 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2ED4520027;
 Sat, 15 Aug 2020 16:09:41 +0200 (CEST)
Date: Sat, 15 Aug 2020 16:09:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 0/5] drm/panel: A few cleanups and improvements
Message-ID: <20200815140939.GA1196814@ravnborg.org>
References: <20200811002240.55194-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200811002240.55194-1-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=2LY2f65kBtWg6R36iiwA:9 a=CjuIK1q_8ugA:10
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
Cc: od@zcrc.me, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Tue, Aug 11, 2020 at 02:22:35AM +0200, Paul Cercueil wrote:
> Hi list,
> 
> Here's a list of 5 patches that bring some cleanups and improvements.
> 
> Patches 1-2 clean up the novatek,nt39016 code to remove custom handling
> of the backlight and to add the missing carriage returns on error
> messages.
> 
> Patches 3-5 updates the modes list of the sharp,ls020b1dd01d panel, to
> make it use 'struct drm_display_mode' instead of 'struct
> display_timing', modify the timings to get a perfect 60.00 Hz rate, and
> add a 50 Hz mode.

While touching logging stuff in panle/ I made the same fix adding
newlines. Glad to see you did it so I can drop one of my patches.

All patches applied to drm-misc-next.

	Sam

> 
> Cheers,
> -Paul
> 
> Paul Cercueil (5):
>   drm/panel: novatek,nt39016: Handle backlight the standard way
>   drm/panel: novatek,nt39016: Add missing CR to error messages
>   drm/panel: simple: Convert sharp,ls020b1dd01d from timings to
>     videomode
>   drm/panel: simple: Tweak timings of sharp,ls020b1dd01d for perfect
>     60Hz
>   drm/panel: simple: Add 50Hz mode for sharp,ls020b1dd01d
> 
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c | 34 ++++++----------
>  drivers/gpu/drm/panel/panel-simple.c          | 40 +++++++++++++------
>  2 files changed, 40 insertions(+), 34 deletions(-)
> 
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
