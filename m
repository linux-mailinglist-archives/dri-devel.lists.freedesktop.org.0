Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 001179E5AA0
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 17:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559D010EEE0;
	Thu,  5 Dec 2024 16:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UnJpm9IT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B107010EEE0;
 Thu,  5 Dec 2024 16:02:47 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA247E2;
 Thu,  5 Dec 2024 17:02:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733414537;
 bh=5CNDk+8jD3acxfGjsxHYw4KsUodGWUopn2X+ZsSUETw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UnJpm9ITpRTSM0y98S7jkN2lS/yQFuyIiOEa/5WmdslxYBw+VM32lxkmYpNGX1cvX
 JOkuhIeNpubE2ig5tJfzPL0Hnfli9EnWYoY9pdGZ2OYfPjbrWKEORLm6hg+Qspoyo3
 LqaocJLk+pR6Hf8hGHb7kHdVwBXP08TFUmsJBioc=
Date: Thu, 5 Dec 2024 18:02:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 linux-renesas-soc@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 2/3] drm: renesas: rcar-du: annotate rcar_cmm_read()
 with __maybe_unused
Message-ID: <20241205160234.GN10736@pendragon.ideasonboard.com>
References: <cover.1733410889.git.jani.nikula@intel.com>
 <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b0df175e8b86e5d8746ee32e63bb633bc2765b1.1733410889.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 05, 2024 at 05:03:00PM +0200, Jani Nikula wrote:
> Building with clang and and W=1 leads to warning about unused
> rcar_cmm_read(). Fix by annotating it with __maybe_unused.
> 
> See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
> inline functions for W=1 build").
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

https://lore.kernel.org/r/20240911095113.GB4470@pendragon.ideasonboard.com

I wonder if Dave and Sima are starting to ignore my pull request in the
hope I'll switch to using drm-misc :-S I'll send another one.

> ---
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> index 26a2f5ad8ee5..ea52b0af9226 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_cmm.c
> @@ -32,7 +32,7 @@ struct rcar_cmm {
>  	} lut;
>  };
>  
> -static inline int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
> +static inline __maybe_unused int rcar_cmm_read(struct rcar_cmm *rcmm, u32 reg)
>  {
>  	return ioread32(rcmm->base + reg);
>  }

-- 
Regards,

Laurent Pinchart
