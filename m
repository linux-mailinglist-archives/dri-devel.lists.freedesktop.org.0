Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EE53E178B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 17:07:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F476EABD;
	Thu,  5 Aug 2021 15:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foo.stuge.se (foo.stuge.se [212.116.89.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204026EABD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 15:07:11 +0000 (UTC)
Received: (qmail 14088 invoked by uid 1000); 5 Aug 2021 15:07:08 -0000
Message-ID: <20210805150708.14087.qmail@stuge.se>
Date: Thu, 5 Aug 2021 15:07:08 +0000
From: Peter Stuge <peter@stuge.se>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomba@kernel.org>
Subject: Re: [PATCH] drm/omap: Depend on CONFIG_OF
References: <20210805105254.11834-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210805105254.11834-1-laurent.pinchart+renesas@ideasonboard.com>
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

Laurent Pinchart wrote:
> +++ b/drivers/gpu/drm/omapdrm/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  config DRM_OMAP
>  	tristate "OMAP DRM"
> -	depends on DRM
> +	depends on DRM && OF
>  	depends on ARCH_OMAP2PLUS || ARCH_MULTIPLATFORM
>  	select OMAP2_DSS
>  	select DRM_KMS_HELPER

Would it make sense to select OF instead?


//Peter
