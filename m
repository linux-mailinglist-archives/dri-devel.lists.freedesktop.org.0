Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BA3210745
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 11:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 465B66E868;
	Wed,  1 Jul 2020 09:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E3746E868
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 09:02:44 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 82B8680503;
 Wed,  1 Jul 2020 11:02:41 +0200 (CEST)
Date: Wed, 1 Jul 2020 11:02:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v10 0/2] Silence missing-graph error for DRM bridges
Message-ID: <20200701090240.GA22218@ravnborg.org>
References: <20200701074232.13632-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701074232.13632-1-digetx@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=voM4FWlXAAAA:8 a=laVpB__SBT07bHWVBRQA:9
 a=CjuIK1q_8ugA:10 a=IC2XNlieTeVoXbcui8wp:22
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry
On Wed, Jul 01, 2020 at 10:42:30AM +0300, Dmitry Osipenko wrote:
> Hi!
> 
> This small series improves DRM bridges code by silencing a noisy error
> coming from of-graph code for the device-trees that are missing a
> display bridge graph.
> 
>   graph: no port node found in ...
> 
> One example where this error happens is an older bridge-less DTB used
> in conjunction with a newer kernel which has a display controller driver
> that supports DRM bridges.
> 
> Changelog:
> 
> v10:- Corrected doc-comment, unbroke the of_graph_get_next_endpoint() and
>       improved commit's message in the "add of_graph_is_present()" patch.
>       Thanks to Laurent Pinchart for spotting the problems!
> 
> v9: - These two patches are factored out from [1] in order to ease applying
>       of the patches.
> 
>     - The of_graph_presents() is renamed to of_graph_is_present() like it
>       was requested by Rob Herring in the review comment to [1].
> 
>     - Added Rob's r-b.
> 
>     [1] https://patchwork.ozlabs.org/project/linux-tegra/list/?series=184102
> 
> Dmitry Osipenko (2):
>   of_graph: add of_graph_is_present()
>   drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

Thanks for your patience with these - applied to drm-misc-next now.

	Sam

> 
>  drivers/gpu/drm/drm_of.c |  9 +++++++++
>  drivers/of/property.c    | 23 +++++++++++++++++++++++
>  include/linux/of_graph.h |  6 ++++++
>  3 files changed, 38 insertions(+)
> 
> -- 
> 2.26.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
