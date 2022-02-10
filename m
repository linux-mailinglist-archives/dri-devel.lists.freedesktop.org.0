Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E63734B1F92
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30C4510E9F9;
	Fri, 11 Feb 2022 07:48:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C83010E7B1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:34:34 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21A71V2x029118;
 Thu, 10 Feb 2022 10:34:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=nD/zDKvWWjR2P8DHGOszGUrnfpKYbadEIwFBlTFs2fs=;
 b=yHJOsWaNmu7yD5SQCsRfPZ6j0OCe/qOQiXD7OdpHc8msJqM614B2pMu4s9jF81zXJFDr
 1rEfSrhfA2+0ULi85eautRgpZeT0OQr1mzfbFjzWfBaQuiwD0E1VI8DrZwWrtPfc5+U/
 4yffchlkIWF1xjQGyZTCD/AMks9i+b05Y6eF1++Zc08qhpjpLU/Ji1OduzIP6nWT+5Hn
 7llrQ6lkDCmufWmFsHBiKXVHU0+mSIne2Y8oiTVpgU4DGoyXcsZo4zAiSuEnz+SVjESN
 O5OovsT7vh6ZejlmTvFZIDsEtPEy4KVnP3rthKDgP5jKWmt3b5rLOQSDSTtiIVvIKon4 eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e4wy1gye1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 10:34:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1418210002A;
 Thu, 10 Feb 2022 10:34:22 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2FE1D2171C6;
 Thu, 10 Feb 2022 10:34:22 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 10 Feb
 2022 10:34:21 +0100
Date: Thu, 10 Feb 2022 10:34:20 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 17/23] drm/sti: plane: Remove redundant zpos initialisation
Message-ID: <20220210093420.GB1631108@gnbcxd0016.gnb.st.com>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-18-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220207163515.1038648-18-maxime@cerno.tech>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_03,2022-02-09_01,2021-12-02_01
X-Mailman-Approved-At: Fri, 11 Feb 2022 07:47:51 +0000
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

thanks for the patch.

Reviewed-by: Alain Volmat <alain.volmat@foss.st.com>

Alain

On Mon, Feb 07, 2022 at 05:35:09PM +0100, Maxime Ripard wrote:
> The sti KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in sti_plane_reset() and rcar_du_vsp_plane_reset().
> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/gpu/drm/sti/sti_cursor.c | 2 +-
>  drivers/gpu/drm/sti/sti_gdp.c    | 2 +-
>  drivers/gpu/drm/sti/sti_hqvdp.c  | 2 +-
>  drivers/gpu/drm/sti/sti_plane.c  | 6 ------
>  drivers/gpu/drm/sti/sti_plane.h  | 1 -
>  5 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
> index 1d6051b4f6fe..414c9973aa6d 100644
> --- a/drivers/gpu/drm/sti/sti_cursor.c
> +++ b/drivers/gpu/drm/sti/sti_cursor.c
> @@ -351,7 +351,7 @@ static const struct drm_plane_funcs sti_cursor_plane_helpers_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
>  	.destroy = drm_plane_cleanup,
> -	.reset = sti_plane_reset,
> +	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>  	.late_register = sti_cursor_late_register,
> diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
> index d1a35d97bc45..3db3768a3241 100644
> --- a/drivers/gpu/drm/sti/sti_gdp.c
> +++ b/drivers/gpu/drm/sti/sti_gdp.c
> @@ -905,7 +905,7 @@ static const struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
>  	.destroy = drm_plane_cleanup,
> -	.reset = sti_plane_reset,
> +	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>  	.late_register = sti_gdp_late_register,
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
> index 3c61ba8b43e0..2201a50353eb 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -1283,7 +1283,7 @@ static const struct drm_plane_funcs sti_hqvdp_plane_helpers_funcs = {
>  	.update_plane = drm_atomic_helper_update_plane,
>  	.disable_plane = drm_atomic_helper_disable_plane,
>  	.destroy = drm_plane_cleanup,
> -	.reset = sti_plane_reset,
> +	.reset = drm_atomic_helper_plane_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>  	.late_register = sti_hqvdp_late_register,
> diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
> index 3da4a46df2f2..173409cdb99e 100644
> --- a/drivers/gpu/drm/sti/sti_plane.c
> +++ b/drivers/gpu/drm/sti/sti_plane.c
> @@ -112,12 +112,6 @@ static int sti_plane_get_default_zpos(enum drm_plane_type type)
>  	return 0;
>  }
>  
> -void sti_plane_reset(struct drm_plane *plane)
> -{
> -	drm_atomic_helper_plane_reset(plane);
> -	plane->state->zpos = sti_plane_get_default_zpos(plane->type);
> -}
> -
>  static void sti_plane_attach_zorder_property(struct drm_plane *drm_plane,
>  					     enum drm_plane_type type)
>  {
> diff --git a/drivers/gpu/drm/sti/sti_plane.h b/drivers/gpu/drm/sti/sti_plane.h
> index 065ffffbfb4a..8e33e629d9b0 100644
> --- a/drivers/gpu/drm/sti/sti_plane.h
> +++ b/drivers/gpu/drm/sti/sti_plane.h
> @@ -81,5 +81,4 @@ void sti_plane_update_fps(struct sti_plane *plane,
>  
>  void sti_plane_init_property(struct sti_plane *plane,
>  			     enum drm_plane_type type);
> -void sti_plane_reset(struct drm_plane *plane);
>  #endif
> -- 
> 2.34.1
> 
