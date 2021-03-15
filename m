Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E3433C258
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 17:42:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7280889C82;
	Mon, 15 Mar 2021 16:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F9689C82
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 16:42:09 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03A2F316;
 Mon, 15 Mar 2021 17:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615826527;
 bh=meXW2nUOk1RhrSoua6G9ceJqPGOfpSiHqaAKI/AhfkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oicu7Ws0tGr32dBM25amrfw3RQnN4L1Un074PDc4TwcfPIytxaUZYATbMN8/+borr
 UlDf9fDDiLQhM7K0RDO+YoG6jU5/f83kqULjHX1dziNEsBLJ4H3nZbbVi6lRModJs5
 DfGB9WgmcW/PxEXRS5YiQ0Wnkx9NwXUIMsWnVU9k=
Date: Mon, 15 Mar 2021 18:41:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 2/3] drm/bridge: ti-sn65dsi86: Move code in prep for EDID
 read fix
Message-ID: <YE+OO0m8iW8oS3cq@pendragon.ideasonboard.com>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.2.Id492ddb6e2cdd05eb94474b93654b04b270c9bbe@changeid>
 <YE0qyYedS0NilsCy@pendragon.ideasonboard.com>
 <CAD=FV=X_HAdNkvZ7NGKDH9KapRRLgOfN23OZyy3VyaX+ywjRkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X_HAdNkvZ7NGKDH9KapRRLgOfN23OZyy3VyaX+ywjRkQ@mail.gmail.com>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Mon, Mar 15, 2021 at 09:31:41AM -0700, Doug Anderson wrote:
> On Sat, Mar 13, 2021 at 1:13 PM Laurent Pinchart wrote:
> > On Thu, Mar 04, 2021 at 03:52:00PM -0800, Douglas Anderson wrote:
> > > This patch is _only_ code motion to prepare for the patch
> > > ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only if
> > > refclk") and make it easier to understand.
> >
> > s/make/makes/
> 
> I was never an expert at grammar, but I think either "make" or "makes"
> are fine. Simple version with parenthesis:
> 
> Mine:
> 
> This patch is <blah> to (prepare for the patch <blah>) and (make it
> easier to understand).
> 
> Yours:
> 
> This patch is <blah> (to prepare for the patch <blah>) and (makes it
> easier to understand).
> 
> I suppose also valid would be:
> 
> This patch is <blah> (to prepare for the patch <blah>) and (to make it
> easier to understand).

Your absolutely right. Both versions are fine, and your preferred
version is best :-)

> In any case if/when I spin this patch I'm fine changing it to your
> version just because (as I understand) it's equally valid and maybe
> looks slightly better?
> 
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for the reviews!

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
