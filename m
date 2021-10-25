Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2B8439C20
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 18:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40CF889C84;
	Mon, 25 Oct 2021 16:54:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A716E175
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 16:54:42 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 471d6b19-35b4-11ec-ac3c-0050568cd888;
 Mon, 25 Oct 2021 16:54:54 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 26E0E194B00;
 Mon, 25 Oct 2021 18:54:36 +0200 (CEST)
Date: Mon, 25 Oct 2021 18:54:34 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Thierry Reding <thierry.reding@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tian Tao <tiantao6@hisilicon.com>, freedreno@lists.freedesktop.org,
 Chen Feng <puck.chen@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 John Stultz <john.stultz@linaro.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 00/21] drm/bridge: Make panel and bridge probe order
 consistent
Message-ID: <YXbhSjsPXk944TlF@ravnborg.org>
References: <20211021073947.499373-1-maxime@cerno.tech>
 <YXGFz4o5fWrfGnGk@ravnborg.org>
 <20211025151636.dsc3akojm7ywoecm@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211025151636.dsc3akojm7ywoecm@gilmour>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Mon, Oct 25, 2021 at 05:16:36PM +0200, Maxime Ripard wrote:
> Hi Sam,
> 
> On Thu, Oct 21, 2021 at 05:22:55PM +0200, Sam Ravnborg wrote:
> > Hi Maxime,
> > 
> > > Let me know what you think,
> > 
> > apply the lot to drm-misc-next. Maybe wait for an r-b or a-b on the kirin
> > patch but the rest is IMO good to go.
> 
> I had a compilation error since the rebase of the v4, so I sent a new
> version. John Stultz has tested this series and given his tested-by, and
> is the kirin maintainer.
> 
> I guess it's enough?

Yeah, go ahead and get it applied.

	Sam


