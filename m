Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8549A198469
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 21:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21846E1B6;
	Mon, 30 Mar 2020 19:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C24A6E19C;
 Mon, 30 Mar 2020 19:27:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F32EB20039;
 Mon, 30 Mar 2020 21:27:24 +0200 (CEST)
Date: Mon, 30 Mar 2020 21:27:23 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH] drm/todo: Add todo to make i915 WARN* calls drm device
 specific
Message-ID: <20200330192723.GA22772@ravnborg.org>
References: <20200330191524.14676-1-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330191524.14676-1-pankaj.laxminarayan.bharadiya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=ER0SRv8zIwZ_RQaTBbMA:9 a=CjuIK1q_8ugA:10
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pankaj.

On Tue, Mar 31, 2020 at 12:45:24AM +0530, Pankaj Bharadiya wrote:
> With below commit, we have new struct drm_device based WARN* macros,
> which include device specific information in the backtrace.
> 
> commit dc1a73e50f9c63d4dd928df538082200467dc4b1
> Author: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> Date:   Wed Jan 15 09:14:45 2020 +0530
> 
>     drm/print: introduce new struct drm_device based WARN* macros
> 
> Majority of the i915 WARN* are already converted to use struct
> drm_device specific drm_WARN* calls.Add new todo entry for
Add space after '.'

> pending conversions.
> 
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  Documentation/gpu/todo.rst | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 37a3a023c114..0cb32df89784 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -575,6 +575,18 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
>  
>  Contact: Harry Wentland, Alex Deucher
>  
> +Make i915 WARN* Calls struct drm_device Specific
> +------------------------------------------------
> +
> +struct drm_device specific drm_WARN* macros include device information in the
> +backtrace, so we know what device the warnings originate from. Convert all the
> +calls of WARN* with drm_WARN* calls in i915. While at it, remove WARN* which
> +are not truly valid.
> +
> +Contact: Jani Nikula
> +
> +Level: Starter
> +
>  Bootsplash
>  ==========
>  
> @@ -595,7 +607,7 @@ Level: Advanced
>  Outside DRM
>  ===========
>  
> -Convert fbdev drivers to DRM
> +Convert fbdev drivers to 
Unrelated change?

Please fix and re-submit.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
