Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7829798A28B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:33:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D562710E429;
	Mon, 30 Sep 2024 12:33:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="kHSYaaeu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F369C10E429
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 12:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=bsjyQJc6rlUDtp6Ad1gt+O9AIpQT/zdHP7sLmtwCgpU=; b=kHSYaaeuva5nyyvn
 +yCz0THwMO7NK/fB7hVCdEe3bgxrKKLYQ9lEAfve2q2AHPhPqR4UizKaMQlqy9Q8A1Y5YtOlrc0i0
 Xp6+2m4FzoQ+Ljktg22Dif53UwoUHV/QCXhIuNmkO73X92kyYhxQkzZgDdEbB08VneHyXahe2WqzZ
 JvOgM9M9e1Twxioe/v77e8LDKfLmlj4hb2Ga0sJBBCI/wHj2U0xucDRvRUkSHnt6mDQccajXmyzPl
 1e0tR5G64wp8OongOAW+zSiZflKfWhWQ6Nsxa9FCdfQ10Pz1ICARHKO9LBF8XxQMZBlMD8pYWOBek
 MepbaiAZVIa14yHBSg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1svFaX-007xkK-23;
 Mon, 30 Sep 2024 12:33:17 +0000
Date: Mon, 30 Sep 2024 12:33:17 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Aradhya Bhatia <aradhya.bhatia@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Intel XE List <intel-xe@lists.freedesktop.org>,
 DRI Devel List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>
Subject: Re: [PATCH] drm/xe/xe2lpg: Add WA 15016589081
Message-ID: <ZvqajY_bLH_eULv5@gallifrey>
References: <20240930120602.1720218-1-aradhya.bhatia@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240930120602.1720218-1-aradhya.bhatia@intel.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:31:20 up 144 days, 23:45,  1 user,  load average: 0.01, 0.04, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* Aradhya Bhatia (aradhya.bhatia@intel.com) wrote:
> Add workaround (wa) 15016589081 which applies to Xe2_v3_LPG_MD.

It would be great in this type of patch if you could
briefly say what symptom it fixes;  Some people might not know what
WA 15016589081  does.

Dave

> Xe2_v3_LPG_MD is a Lunar Lake platform with GFX version: 20.04.
> This wa is type: permanent, and hence is applicable on all steppings.
> 
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 22c148b1e996..2f9cde4b7d45 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -710,6 +710,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  			     DIS_PARTIAL_AUTOSTRIP |
>  			     DIS_AUTOSTRIP))
>  	},
> +	{ XE_RTP_NAME("15016589081"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> +	},
>  
>  	/* Xe2_HPG */
>  	{ XE_RTP_NAME("15010599737"),
> 
> base-commit: 0c8650b09a365f4a31fca1d1d1e9d99c56071128
> -- 
> 2.34.1
> 
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
