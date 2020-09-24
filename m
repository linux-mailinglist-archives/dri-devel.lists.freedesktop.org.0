Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74197277AD6
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 22:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C626E4A2;
	Thu, 24 Sep 2020 20:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03E996E4A2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 20:57:15 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 016AC20079;
 Thu, 24 Sep 2020 22:57:12 +0200 (CEST)
Date: Thu, 24 Sep 2020 22:57:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Thomas as reviewer for ast, mgag200 and
 udl
Message-ID: <20200924205711.GQ1223313@ravnborg.org>
References: <20200915071708.4743-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915071708.4743-1-tzimmermann@suse.de>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=CaYmGojl c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8 a=e5mUnYsNAAAA:8
 a=JYSPM9DmALZyaIZxwIMA:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@redhat.com, sean@poorly.run, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Tue, Sep 15, 2020 at 09:17:08AM +0200, Thomas Zimmermann wrote:
> I'm adding myself as reviewer for ast, mgag200 and udl. I've already
> been keeping these drivers in shape for a while.

In my mind you are maintainer of these and not just reviewer.
I had expected you to take the lead maintainer role and then
Dave Airlie could be the second/fallback - no?

	Sam

> 
> While at it I'm also setting the list and tree for ast and mgag200,
> and update each driver's status to Supported. Working on these drivers
> is part of my job.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  MAINTAINERS | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 58ea37042d22..2baaec07cde3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5419,7 +5419,10 @@ F:	drivers/gpu/drm/aspeed/
>  
>  DRM DRIVER FOR AST SERVER GRAPHICS CHIPS
>  M:	Dave Airlie <airlied@redhat.com>
> -S:	Odd Fixes
> +R:	Thomas Zimmermann <tzimmermann@suse.de>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/ast/
>  
>  DRM DRIVER FOR BOCHS VIRTUAL GPU
> @@ -5507,7 +5510,10 @@ F:	include/uapi/drm/mga_drm.h
>  
>  DRM DRIVER FOR MGA G200 GRAPHICS CHIPS
>  M:	Dave Airlie <airlied@redhat.com>
> -S:	Odd Fixes
> +R:	Thomas Zimmermann <tzimmermann@suse.de>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/mgag200/
>  
>  DRM DRIVER FOR MI0283QT
> @@ -5652,8 +5658,9 @@ F:	drivers/gpu/drm/panel/panel-tpo-tpg110.c
>  DRM DRIVER FOR USB DISPLAYLINK VIDEO ADAPTERS
>  M:	Dave Airlie <airlied@redhat.com>
>  R:	Sean Paul <sean@poorly.run>
> +R:	Thomas Zimmermann <tzimmermann@suse.de>
>  L:	dri-devel@lists.freedesktop.org
> -S:	Odd Fixes
> +S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/udl/
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
