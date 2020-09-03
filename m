Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8525CD18
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 00:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B333F6E0B9;
	Thu,  3 Sep 2020 22:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACF76E0A2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 22:04:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8420956E;
 Fri,  4 Sep 2020 00:04:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599170683;
 bh=E+/+FDToOL0NC3Mv9iT7KrVDJcatY/zLPusRkN1x/r8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCVEl1OTlGDO9u5fWYD0fDbsmhJs5Pzy61Zt5DUI0dJDIkWocpRySwxGk3j/iLO4M
 HKB/iu3ywtUqYm/lQRP3B2Y0Yz3y+YhQiFx1nexnXHRUbFUCUlbAeg8rcX6S8jamTw
 Z8h3UCH3pIRj4gBoPLNLz5xcKQIvcbcKTmUXgX5Y=
Date: Fri, 4 Sep 2020 01:04:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michael Tretter <m.tretter@pengutronix.de>
Subject: Re: [PATCH 01/16] drm/encoder: remove obsolete documentation of bridge
Message-ID: <20200903220419.GI6492@pendragon.ideasonboard.com>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
 <20200903165717.1272492-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903165717.1272492-2-m.tretter@pengutronix.de>
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
Cc: krzk@kernel.org, linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

Thank you for the patch.

On Thu, Sep 03, 2020 at 06:57:02PM +0200, Michael Tretter wrote:
> In commit 05193dc38197 ("drm/bridge: Make the bridge chain a
> double-linked list") the bridge has been removed and replaced by a
> private field. Remove the leftover documentation of the removed field.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_encoder.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/drm/drm_encoder.h b/include/drm/drm_encoder.h
> index a60f5f1555ac..5dfa5f7a80a7 100644
> --- a/include/drm/drm_encoder.h
> +++ b/include/drm/drm_encoder.h
> @@ -89,7 +89,6 @@ struct drm_encoder_funcs {
>   * @head: list management
>   * @base: base KMS object
>   * @name: human readable name, can be overwritten by the driver
> - * @bridge: bridge associated to the encoder
>   * @funcs: control functions
>   * @helper_private: mid-layer private data
>   *

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
