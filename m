Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED97B20F673
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 15:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0A16E27C;
	Tue, 30 Jun 2020 13:58:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1855B6E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jun 2020 13:58:07 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id D0ED180549;
 Tue, 30 Jun 2020 15:58:03 +0200 (CEST)
Date: Tue, 30 Jun 2020 15:58:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/4] drm: panel: simple: Fix mistakes in panel
 descriptions
Message-ID: <20200630135802.GA581802@ravnborg.org>
References: <20200629233320.8774-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629233320.8774-1-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=QTE4IMrFOOVBbIEkz5gA:9 a=CjuIK1q_8ugA:10
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
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Pascal Roeleven <dev@pascalroeleven.nl>,
 Thierry Reding <thierry.reding@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent.

On Tue, Jun 30, 2020 at 02:33:16AM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This small patch series is the second version of what has been
> previously submitted as "[PATCH] drm: panel: simple: Drop drive/sample
> bus flags for LVDS panels". It fixes incorrect bus format and connector
> type in the description of two panels (patches 1/4 and 2/4), drop
> invalid bus flags for LVDS panels (patch 3/4), and add a warning to
> catch invalid bus formats for future LVDS panels.
> 
> Laurent Pinchart (4):
>   drm: panel: simple: Correct connector type for Starry KR070PE2T
>   drm: panel: simple: Correct bus format for Satoz SAT050AT40H12R2
>   drm: panel: simple: Drop drive/sample bus flags for LVDS panels
>   drm: panel: simple: Warn in case of incorrect bus format for LVDS
>     panels

Thanks!
With the quick feedback from Miquel and Pascal I have now applied
all four patches to drm-misc-next.

	Sam

> 
>  drivers/gpu/drm/panel/panel-simple.c | 41 +++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 13 deletions(-)
> 
> -- 
> Regards,
> 
> Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
