Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4CD1E9A53
	for <lists+dri-devel@lfdr.de>; Sun, 31 May 2020 22:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE9D589F03;
	Sun, 31 May 2020 20:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C96589F03
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 20:24:51 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 223CD8050B;
 Sun, 31 May 2020 22:24:44 +0200 (CEST)
Date: Sun, 31 May 2020 22:24:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sidong Yang <realwakka@gmail.com>
Subject: Re: [PATCH] Documentation: Fix typo error in todo.rst
Message-ID: <20200531202442.GA138722@ravnborg.org>
References: <20200528172159.24641-1-realwakka@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528172159.24641-1-realwakka@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=G88y7es5 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=VYX68jFDfHIqEWenzyAA:9 a=CjuIK1q_8ugA:10 a=-RoEEKskQ1sA:10
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sidong
On Fri, May 29, 2020 at 02:21:59AM +0900, Sidong Yang wrote:
> Change wrong function name drm_modest_lock_all() to drm_modeset_lock_all()
> 
> Signed-off-by: Sidong Yang <realwakka@gmail.com>

Thanks, applied to drm-misc-next.

	Sam

> ---
>  Documentation/gpu/todo.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 658b52f7ffc6..436489b53fea 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -305,7 +305,7 @@ acquire context. Replace the boilerplate code surrounding
>  drm_modeset_lock_all_ctx() with DRM_MODESET_LOCK_ALL_BEGIN() and
>  DRM_MODESET_LOCK_ALL_END() instead.
>  
> -This should also be done for all places where drm_modest_lock_all() is still
> +This should also be done for all places where drm_modeset_lock_all() is still
>  used.
>  
>  As a reference, take a look at the conversions already completed in drm core.
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
