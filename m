Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A149B24E6BB
	for <lists+dri-devel@lfdr.de>; Sat, 22 Aug 2020 11:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 921D96E079;
	Sat, 22 Aug 2020 09:40:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E9C6E079
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Aug 2020 09:40:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D0C6C80516;
 Sat, 22 Aug 2020 11:40:00 +0200 (CEST)
Date: Sat, 22 Aug 2020 11:39:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 3/3] drm/bridge: ps8640: Rework power state handling
Message-ID: <20200822093959.GD430436@ravnborg.org>
References: <20200615205320.790334-1-enric.balletbo@collabora.com>
 <20200615205320.790334-4-enric.balletbo@collabora.com>
 <20200620214225.GD74146@ravnborg.org>
 <0220cfe5-2ac9-2d8b-529d-bb1a61478395@collabora.com>
 <20200624070738.GA1807736@ravnborg.org>
 <20b2f097-d789-3f5a-cd7e-3701669f43cb@collabora.com>
 <5af757da-87ec-c0d1-374d-0a69401e09a3@collabora.com>
 <20200821113809.GA283294@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200821113809.GA283294@ravnborg.org>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=aBBcIbYZM5gs4jnWP7QA:9 a=CjuIK1q_8ugA:10
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
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric.

On Fri, Aug 21, 2020 at 01:38:09PM +0200, Sam Ravnborg wrote:
> Hi Enric.
> 
> > 
> > Let me reformulate the question for if it was not clear.
> > 
> > What I did is be able to read the EDID every time userspace asks for it (so
> > kernel enables all the required) and Sam is proposing to just fail if all is not
> > setup. I can obviously do this but my question is, at which point I should leave
> > all the logic enabled to be able to read the EDID (after probe?, after
> > pre_enable, after enable?) It is not clear for me from the API.
> 
> I am not clear if my suggestion is a good suggestion.
> 
> I recall I saw something similar in another bridge driver.

I have noew checked - and there is several bridge drivers that
do a power_on to read get_edid - so I was mistaken. Sorry!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
