Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B2948B8B5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 21:35:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 853F610F363;
	Tue, 11 Jan 2022 20:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E950F10F37B
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 20:35:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA80F340;
 Tue, 11 Jan 2022 21:35:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1641933332;
 bh=KycRdeSuDuA7xBVs6ft5r3car935tpoCIMLiHmPukWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CZvGn5sIaX3VE3fdvJ8qYY4+5jnmx06IT04H55hi8wlVBMIdJcSsAd6NOOgL/uYcP
 qGrmhxTPZXqriTOZF+52sFQ/KqV0/o6lSNON3JBOSES6otHinO7plUAW2DL5hi2Nle
 lZMd8mYcSqJC1gzW7pfa6PvEbjxTDx2DlBiPO2zU=
Date: Tue, 11 Jan 2022 22:35:22 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/doc: overview before functions for drm_writeback.c
Message-ID: <Yd3qCiGixOwlHl0q@pendragon.ideasonboard.com>
References: <20220111202714.1128406-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220111202714.1128406-1-daniel.vetter@ffwll.ch>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

Thank you for the patch.

On Tue, Jan 11, 2022 at 09:27:14PM +0100, Daniel Vetter wrote:
> Otherwise it's really hard to link to that, which I realized when I
> wanted to link to the property definitions for a question on irc.
> 
> Fix it.
> 
> Fixes: e2d7fc20b3e2 ("drm/writeback: wire drm_writeback.h to kernel-doc")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/gpu/drm-kms.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index d14bf1c35d7e..6f9c064fd323 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -423,12 +423,12 @@ Connector Functions Reference
>  Writeback Connectors
>  --------------------
>  
> -.. kernel-doc:: include/drm/drm_writeback.h
> -  :internal:
> -
>  .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
>    :doc: overview
>  
> +.. kernel-doc:: include/drm/drm_writeback.h
> +  :internal:
> +
>  .. kernel-doc:: drivers/gpu/drm/drm_writeback.c
>    :export:
>  

-- 
Regards,

Laurent Pinchart
