Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBDE4B0BA2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 12:00:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2D410E7FE;
	Thu, 10 Feb 2022 11:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAFB10E7EE
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 11:00:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21A71aUJ029156;
 Thu, 10 Feb 2022 12:00:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/Q3SruRHMblZXsjsJN/A+imrZxvyXbW6Zyd1f5PD5XI=;
 b=BXkujKW5W3cbsmt8tbvFRM2v7vlK20oPGWunuWM1g+MEDzmgGN62Rlydo6SR9wEQbdMH
 dMhRV02xrlLGzsEAfzhgvMGVfHKcueqevDGrFmLGV16EVbQVriQ4u4kE0f4upejYcngf
 LFC1dslRBoyr/svQmDscokKM4EVt4wEYTIKNnGrWSOab7LgOtkEp5YNrQuFpv9/h5G1S
 PXot/L2Ey6veYf7uCGPWbv+MDHUeXsn2shGXaHRVG6luusnzqjcFhonmvw79lHRyoSGO
 Mq9KGuT/BSckA+FGJW1YYXVFqk4X+LqGgUFupSmcbnWVTIh+swcujCdXI92WFChEeVhO 3A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e4wy1hgg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 12:00:18 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DD88710003D;
 Thu, 10 Feb 2022 12:00:15 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 05C3021BF7C;
 Thu, 10 Feb 2022 12:00:15 +0100 (CET)
Received: from lmecxl0993.lme.st.com (10.75.127.46) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 10 Feb
 2022 12:00:13 +0100
Subject: Re: [PATCH 17/23] drm/sti: plane: Remove redundant zpos initialisation
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
References: <20220207163515.1038648-1-maxime@cerno.tech>
 <20220207163515.1038648-18-maxime@cerno.tech>
From: Philippe CORNU <philippe.cornu@foss.st.com>
Message-ID: <6ad77dcb-7821-95ac-094b-822938e5dabc@foss.st.com>
Date: Thu, 10 Feb 2022 12:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220207163515.1038648-18-maxime@cerno.tech>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_03,2022-02-09_01,2021-12-02_01
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alain Volmat <alain.volmat@foss.st.com>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/7/22 5:35 PM, Maxime Ripard wrote:
> The sti KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane type.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in sti_plane_reset() and rcar_du_vsp_plane_reset().

Hi Maxime,
and many thanks for your patches.

Great you added Alain as he is now the drm/sti maintainer (Maintainers 
file should be updated soon)

Minor typo in the commit message as rcar_du_vsp_plane_reset() is not 
part of drm/sti

Reviewed-by: Philippe Cornu <philippe.cornu@foss.st.com>

Philippe :-)


> However, the helpers have been adjusted to set it properly at reset, so
> this is not needed anymore.
> 
> Cc: Alain Volmat <alain.volmat@foss.st.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/gpu/drm/sti/sti_cursor.c | 2 +-
>   drivers/gpu/drm/sti/sti_gdp.c    | 2 +-
>   drivers/gpu/drm/sti/sti_hqvdp.c  | 2 +-
>   drivers/gpu/drm/sti/sti_plane.c  | 6 ------
>   drivers/gpu/drm/sti/sti_plane.h  | 1 -
>   5 files changed, 3 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
> index 1d6051b4f6fe..414c9973aa6d 100644
> --- a/drivers/gpu/drm/sti/sti_cursor.c
> +++ b/drivers/gpu/drm/sti/sti_cursor.c
> @@ -351,7 +351,7 @@ static const struct drm_plane_funcs sti_cursor_plane_helpers_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
>   	.destroy = drm_plane_cleanup,
> -	.reset = sti_plane_reset,
> +	.reset = drm_atomic_helper_plane_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>   	.late_register = sti_cursor_late_register,
> diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
> index d1a35d97bc45..3db3768a3241 100644
> --- a/drivers/gpu/drm/sti/sti_gdp.c
> +++ b/drivers/gpu/drm/sti/sti_gdp.c
> @@ -905,7 +905,7 @@ static const struct drm_plane_funcs sti_gdp_plane_helpers_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
>   	.destroy = drm_plane_cleanup,
> -	.reset = sti_plane_reset,
> +	.reset = drm_atomic_helper_plane_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>   	.late_register = sti_gdp_late_register,
> diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
> index 3c61ba8b43e0..2201a50353eb 100644
> --- a/drivers/gpu/drm/sti/sti_hqvdp.c
> +++ b/drivers/gpu/drm/sti/sti_hqvdp.c
> @@ -1283,7 +1283,7 @@ static const struct drm_plane_funcs sti_hqvdp_plane_helpers_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
>   	.destroy = drm_plane_cleanup,
> -	.reset = sti_plane_reset,
> +	.reset = drm_atomic_helper_plane_reset,
>   	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
>   	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
>   	.late_register = sti_hqvdp_late_register,
> diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
> index 3da4a46df2f2..173409cdb99e 100644
> --- a/drivers/gpu/drm/sti/sti_plane.c
> +++ b/drivers/gpu/drm/sti/sti_plane.c
> @@ -112,12 +112,6 @@ static int sti_plane_get_default_zpos(enum drm_plane_type type)
>   	return 0;
>   }
>   
> -void sti_plane_reset(struct drm_plane *plane)
> -{
> -	drm_atomic_helper_plane_reset(plane);
> -	plane->state->zpos = sti_plane_get_default_zpos(plane->type);
> -}
> -
>   static void sti_plane_attach_zorder_property(struct drm_plane *drm_plane,
>   					     enum drm_plane_type type)
>   {
> diff --git a/drivers/gpu/drm/sti/sti_plane.h b/drivers/gpu/drm/sti/sti_plane.h
> index 065ffffbfb4a..8e33e629d9b0 100644
> --- a/drivers/gpu/drm/sti/sti_plane.h
> +++ b/drivers/gpu/drm/sti/sti_plane.h
> @@ -81,5 +81,4 @@ void sti_plane_update_fps(struct sti_plane *plane,
>   
>   void sti_plane_init_property(struct sti_plane *plane,
>   			     enum drm_plane_type type);
> -void sti_plane_reset(struct drm_plane *plane);
>   #endif
> 
