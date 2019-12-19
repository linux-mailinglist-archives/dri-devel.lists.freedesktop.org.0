Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE611266CC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 17:26:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1596E375;
	Thu, 19 Dec 2019 16:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB316E375
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2019 16:26:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 08:26:46 -0800
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; d="scan'208";a="206253659"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 08:26:44 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/todo: Updating logging todo
In-Reply-To: <20191219161722.2779994-1-daniel.vetter@ffwll.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191219161722.2779994-1-daniel.vetter@ffwll.ch>
Date: Thu, 19 Dec 2019 18:26:41 +0200
Message-ID: <87r210wabi.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Dec 2019, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
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

Might mention converting everything to the One True solution, but
*shrug*.

Acked-by: Jani Nikula <jani.nikula@intel.com>

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
>  
>  Before you start this conversion please contact the relevant maintainers to make

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
