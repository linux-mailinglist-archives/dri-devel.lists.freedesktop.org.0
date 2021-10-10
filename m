Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3082F428270
	for <lists+dri-devel@lfdr.de>; Sun, 10 Oct 2021 18:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B936E3A0;
	Sun, 10 Oct 2021 16:02:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9310D6E342
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Oct 2021 16:02:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 7a45a6d0-29e3-11ec-ac3c-0050568cd888;
 Sun, 10 Oct 2021 16:02:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 0DEAB194B9C;
 Sun, 10 Oct 2021 18:02:34 +0200 (CEST)
Date: Sun, 10 Oct 2021 18:02:44 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 2/2] drm/bridge: lvds-codec: Add support for LVDS data
 mapping select
Message-ID: <YWMOpG91v/KxluVj@ravnborg.org>
References: <20211010144919.38392-1-marex@denx.de>
 <20211010144919.38392-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211010144919.38392-2-marex@denx.de>
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

Hi Marek,
On Sun, Oct 10, 2021 at 04:49:19PM +0200, Marek Vasut wrote:
> Decoder input LVDS format is a property of the decoder chip or even
> its strapping. Handle data-mapping the same way lvds-panel does. In
> case data-mapping is not present, do nothing, since there are still
> legacy bindings which do not specify this property.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
> ---
> V2: - Move the data-mapping to endpoint
> V3: - Rebase on V2 submitted a while ago, reinstate changelog
>     - Use .atomic_get_input_bus_fmts for the decoder, separate funcs for encoder
> V4: - No change
> V5: - Move the data-mapping property to port@0 , decoder LVDS input
>     - Add RB from Laurent
> V6: - Turn missing data-mapping into warning, since the driver does
>       continue in legacy probing mode without it.

I assume you will apply the patches.

	Sam
