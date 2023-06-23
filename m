Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE49773B964
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 16:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D575810E118;
	Fri, 23 Jun 2023 14:08:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0A010E118
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 14:08:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20409BC;
 Fri, 23 Jun 2023 16:07:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687529267;
 bh=cpgwXM3+rydqPxFvhazM/zjynkiXWUsuj5v+zaCCGTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sVSr0tIsPU0V5Q0U8RG/jWcYnnWS6GISMv0B7y2OZG0AvZHzdci7MRmORYSWcRHm6
 0GjwBxAhRzvKlsQd0Eb4V6f2itP6bDuq9DHfHQUg3ifFPyI6Kpqrd6VKrcs1UI3cBR
 tmag2csb5pVvLwCjfs9fsbXRamfUJpwTVahIgjzo=
Date: Fri, 23 Jun 2023 17:08:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/4] drm/todo: Convert list of fbconv links to footnotes
Message-ID: <20230623140822.GC2112@pendragon.ideasonboard.com>
References: <cover.1686318012.git.geert+renesas@glider.be>
 <be8d2886f50485c86f74a3c1a117abb1b8718a07.1686318012.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <be8d2886f50485c86f74a3c1a117abb1b8718a07.1686318012.git.geert+renesas@glider.be>
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
 dri-devel@lists.freedesktop.org, Bagas Sanjaya <bagasdotme@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Fri, Jun 09, 2023 at 03:44:28PM +0200, Geert Uytterhoeven wrote:
> Convert the references to fbconv links to footnotes, so they can be
> navigated.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  Documentation/gpu/todo.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 6c328613c049fc1d..ce1d4e22c327063b 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -753,16 +753,16 @@ existing hardware. The new driver's call-back functions are filled from
>  existing fbdev code.
>  
>  More complex fbdev drivers can be refactored step-by-step into a DRM
> -driver with the help of the DRM fbconv helpers. [1] These helpers provide
> +driver with the help of the DRM fbconv helpers [4]_. These helpers provide
>  the transition layer between the DRM core infrastructure and the fbdev
>  driver interface. Create a new DRM driver on top of the fbconv helpers,
>  copy over the fbdev driver, and hook it up to the DRM code. Examples for
> -several fbdev drivers are available at [1] and a tutorial of this process
> -available at [2]. The result is a primitive DRM driver that can run X11
> +several fbdev drivers are available at [4]_ and a tutorial of this process
> +available at [5]_. The result is a primitive DRM driver that can run X11

When using footnotes, the main text must read correctly if you ignore
the notes. This isn't the case for the second and third footnotes here.

    Examples for several fbdev drivers are available in Thomas
    Zimmermann's fbconv tree [4]_, as well as a tutorial of this
    process [5]_.

I'm not making a call on whether that's better or not that's better than
the current situation.

An alternative is to use plain links:

    Examples for several fbdev drivers are available in 'Thomas
    Zimmermann's fbconv tree`_, as well as a `tutorial of this
    process`_.

    .. _Thomas Zimmermann's fbconv tree: https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
    .. _tutorial of this process: https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c

>  and Weston.
>  
> - - [1] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
> - - [2] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c
> + .. [4] https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv
> + .. [5] https://gitlab.freedesktop.org/tzimmermann/linux/blob/fbconv/drivers/gpu/drm/drm_fbconv_helper.c
>  
>  Contact: Thomas Zimmermann <tzimmermann@suse.de>
>  

-- 
Regards,

Laurent Pinchart
