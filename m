Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B75F56860E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9A4113642;
	Wed,  6 Jul 2022 10:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF19C113642
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 10:47:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7121D30A;
 Wed,  6 Jul 2022 12:47:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1657104433;
 bh=9JaP2fGIpmtkusdcte62H9gcOzDrXSqF6Hq1SEPJFHM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=olJhy+TU7+GEMlctggH2Zsa9QxQKtwZ8SPYz9LVyk0BXJAhcsOaXctk/mkjE3UN8V
 yvFtv+Jj1qEgeKIL1wuRuf9IEWCUXx5FCKL5yUHAUCkn1XbIJQ+JWdBMT+CfZROZuz
 jOxY5JeDtTJlcOhnZRg3fbc0XmM/jCyQ8nnpZR8s=
Date: Wed, 6 Jul 2022 13:46:48 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH 3/3] drm/todo: remove task to rename CMA helpers
Message-ID: <YsVoGKaoVvqijqOe@pendragon.ideasonboard.com>
References: <20220705212613.732039-1-dakr@redhat.com>
 <20220705212613.732039-4-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220705212613.732039-4-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Danilo,

Thank you for the patch.

On Tue, Jul 05, 2022 at 11:26:13PM +0200, Danilo Krummrich wrote:
> Both, GEM and FB, CMA helpers were renamed to "GEM DMA" and "FB DMA",
> hence the task can be removed.
> 
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  Documentation/gpu/todo.rst | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 10bfb50908d1..fd5b3f2fb19e 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -343,19 +343,6 @@ converted, except for struct drm_driver.gem_prime_mmap.
>  
>  Level: Intermediate
>  
> -Rename CMA helpers to DMA helpers
> ----------------------------------
> -
> -CMA (standing for contiguous memory allocator) is really a bit an accident of
> -what these were used for first, a much better name would be DMA helpers. In the
> -text these should even be called coherent DMA memory helpers (so maybe CDM, but
> -no one knows what that means) since underneath they just use dma_alloc_coherent.
> -
> -Contact: Laurent Pinchart, Daniel Vetter
> -
> -Level: Intermediate (mostly because it is a huge tasks without good partial
> -milestones, not technically itself that challenging)
> -
>  connector register/unregister fixes
>  -----------------------------------
>  

-- 
Regards,

Laurent Pinchart
