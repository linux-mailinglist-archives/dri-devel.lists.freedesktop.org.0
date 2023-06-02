Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D5871FFCB
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 12:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8011A10E65B;
	Fri,  2 Jun 2023 10:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5346B10E65B
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 10:53:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126156168104.26.openmobile.ne.jp
 [126.156.168.104])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5E7A6E0;
 Fri,  2 Jun 2023 12:53:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1685703209;
 bh=9jlD2s2+YeYZiXb3wAMmYVy0IQj66RhORVNfswvBJYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I4I14Myq5dpuM5ld866LX/RiU/3KbhLZVmQ4IGYZklC0V6Lk1wPfbkolTcZk3S+pj
 2y+lptg97WW63b0FYwMPgRP6H0xTRF9jPGlaez0Mg3kQgJIyiClMpUXSIiGuLbrEWg
 989cbTDTeJbRSwFCnDOv1aAjyD5UjSqnbq6fHcLg=
Date: Fri, 2 Jun 2023 13:53:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 1/3] drm/todo: Add atomic modesetting references
Message-ID: <20230602105350.GB26944@pendragon.ideasonboard.com>
References: <cover.1685696114.git.geert+renesas@glider.be>
 <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jyri Sarha <jyri.sarha@iki.fi>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das.jz@bp.renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Jun 02, 2023 at 11:11:34AM +0200, Geert Uytterhoeven wrote:
> The section about converting existing KMS drivers to atomic modesetting
> mentions the existence of a conversion guide, but does not reference it.
> While the guide is old and rusty, it still contains useful information,
> so add a link to it.  Also link to the LWN.net articles that give an
> overview about the atomic mode setting design.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/gpu/todo.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 68bdafa0284f55f6..51eb67f5268c5ec1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -49,14 +49,19 @@ converted over. Modern compositors like Wayland or Surfaceflinger on Android
>  really want an atomic modeset interface, so this is all about the bright
>  future.
>  
> -There is a conversion guide for atomic and all you need is a GPU for a
> +There is a conversion guide for atomic[1] and all you need is a GPU for a
>  non-converted driver (again virtual HW drivers for KVM are still all
> -suitable).
> +suitable).  The "Atomic mode setting design overview" series [2][3] at

s/  / /

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +LWN.net can also be helpful.
>  
>  As part of this drivers also need to convert to universal plane (which means
>  exposing primary & cursor as proper plane objects). But that's much easier to
>  do by directly using the new atomic helper driver callbacks.
>  
> +  - [1] https://blog.ffwll.ch/2014/11/atomic-modeset-support-for-kms-drivers.html
> +  - [2] https://lwn.net/Articles/653071/
> +  - [3] https://lwn.net/Articles/653466/
> +
>  Contact: Daniel Vetter, respective driver maintainers
>  
>  Level: Advanced

-- 
Regards,

Laurent Pinchart
