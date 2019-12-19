Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55EDF12676B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 17:53:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285A06E075;
	Thu, 19 Dec 2019 16:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B163D6E075
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 16:53:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 1CA0D20026;
 Thu, 19 Dec 2019 17:53:02 +0100 (CET)
Date: Thu, 19 Dec 2019 17:53:01 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/todo: Updating logging todo
Message-ID: <20191219165301.GA17514@ravnborg.org>
References: <20191219161722.2779994-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219161722.2779994-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=PueDHSs-hDy7qKLiRj4A:9
 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel.

On Thu, Dec 19, 2019 at 05:17:22PM +0100, Daniel Vetter wrote:
> Jani has merged a new set of logging functions, which we hope to be
> the One True solution now, pinky promises:
> 
> commit fb6c7ab8718eb2543695d77ad8302ff81e8e1e32
> Author: Jani Nikula <jani.nikula@intel.com>
> Date:   Tue Dec 10 14:30:43 2019 +0200
> 
>     drm/print: introduce new struct drm_device based logging macros
> 
> Update the todo entry to match the new preference.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 2d85f37284a1..017f3090f8a1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -142,13 +142,13 @@ Contact: Daniel Vetter, respective driver maintainers
>  
>  Level: Advanced
>  
> -Convert instances of dev_info/dev_err/dev_warn to their DRM_DEV_* equivalent
> -----------------------------------------------------------------------------
> +Convert logging to drm_* functions with drm_device paramater
> +------------------------------------------------------------
>  
>  For drivers which could have multiple instances, it is necessary to
>  differentiate between which is which in the logs. Since DRM_INFO/WARN/ERROR
>  don't do this, drivers used dev_info/warn/err to make this differentiation. We
> -now have DRM_DEV_* variants of the drm print macros, so we can start to convert
> +now have drm_* variants of the drm print functions, so we can start to convert
>  those drivers back to using drm-formwatted specific log messages.
s/drm-formwatted/drm-formatted/?

Acked-by: Sam Ravnborg <sam@ravnborg.org>

drm_print.h could use a rework so it is obvious what is legacy and what
is the right way to do things.
I will add that to my personal todo list for now.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
