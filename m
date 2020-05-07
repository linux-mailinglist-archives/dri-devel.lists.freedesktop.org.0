Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760691C9894
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 20:01:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7FB6E17B;
	Thu,  7 May 2020 18:01:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68E666E17B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 18:01:44 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A77C1804DF;
 Thu,  7 May 2020 20:01:42 +0200 (CEST)
Date: Thu, 7 May 2020 20:01:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 04/36] drm/doc: drop struct_mutex references
Message-ID: <20200507180141.GB13247@ravnborg.org>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-5-emil.l.velikov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507150822.114464-5-emil.l.velikov@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8 a=e5mUnYsNAAAA:8
 a=pkP2hhrgDqPTEaAHJyQA:9 a=CjuIK1q_8ugA:10 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

On Thu, May 07, 2020 at 04:07:50PM +0100, Emil Velikov wrote:
> From: Emil Velikov <emil.velikov@collabora.com>
> 
> There's little point in providing partial and ancient information about
> the struct_mutex. Some drivers are using it, new ones should not.
> 
> As-it this only provides for confusion.
> 
> Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> ---
>  Documentation/gpu/drm-mm.rst | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
> index 1839762044be..5ba2ead8f317 100644
> --- a/Documentation/gpu/drm-mm.rst
> +++ b/Documentation/gpu/drm-mm.rst
> @@ -178,11 +178,8 @@ GEM Objects Lifetime
>  --------------------
>  
>  All GEM objects are reference-counted by the GEM core. References can be
> -acquired and release by calling drm_gem_object_get() and drm_gem_object_put()
> -respectively. The caller must hold the :c:type:`struct drm_device <drm_device>`
> -struct_mutex lock when calling drm_gem_object_get(). As a convenience, GEM
> -provides drm_gem_object_put_unlocked() functions that can be called without
> -holding the lock.
> +acquired and release by calling drm_gem_object_get() and drm_gem_object_put_unlocked()
> +respectively.

Nice to get rid of struct_mutex lock stuff.
But no need to s/drm_gem_object_put/drm_gem_object_put_unlocked()/ as this will
be renamed a bit later.

	Sam

>  
>  When the last reference to a GEM object is released the GEM core calls
>  the :c:type:`struct drm_driver <drm_driver>` gem_free_object_unlocked
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
