Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCBA21B3DD
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 13:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F106EBD3;
	Fri, 10 Jul 2020 11:17:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60AB86EBD1;
 Fri, 10 Jul 2020 11:17:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06ABGvgX080122;
 Fri, 10 Jul 2020 06:16:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1594379817;
 bh=noeWvFkchYrfPNl0thRbJcPCr9ohgOakyewHajyzR9U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=qab6VSavbYu/t5lrVd2WT67f03Z30NdpsXXhyJwLaUEPB2lnibrpg/N2X5dN8uZsP
 of0xufhX4OcUtTmOXpcoZY/sSv4vjr2uBVZZNaFRYBt2i84w1Y1Osr1CnvfuMDT4LR
 5VixpviPqVUBrgM6nGs1Y30AvpNm0YZj4MCZoL8Q=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06ABGvLA046155
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 Jul 2020 06:16:57 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 10
 Jul 2020 06:16:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 10 Jul 2020 06:16:57 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06ABGoLq010175;
 Fri, 10 Jul 2020 06:16:55 -0500
Subject: Re: [PATCH] drm/tilcdc: Use standard drm_atomic_helper_commit
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20200707201229.472834-16-daniel.vetter@ffwll.ch>
 <20200708142050.530240-1-daniel.vetter@ffwll.ch>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <ae71125b-6496-a0e7-3424-9fe69cc3734f@ti.com>
Date: Fri, 10 Jul 2020 14:16:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200708142050.530240-1-daniel.vetter@ffwll.ch>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thank you Daniel,
Now this works perfectly, all while I was on vacation.

On 08/07/2020 17:20, Daniel Vetter wrote:
> Gives us proper nonblocking support for free, and a pile of other
> things. The tilcdc code is simply old enough that it was never
> converted over, but was stuck forever with the copypasta from when it
> was initially merged.
> 
> The riskiest thing with this conversion is maybe that there's an issue
> with the vblank handling or vblank event handling, which will upset
> the modern commit support in atomic helpers. But from a cursory review
> drm_crtc_vblank_on/off is called in the right places, and the event
> handling also seems to exist (albeit with much hand-rolling and
> probably some races, could perhaps be converted over to
> drm_crtc_arm_vblank_event without any real loss).
> 
> Motivated by me not having to hand-roll the dma-fence annotations for
> this.
> 
> v2: Clear out crtc_state->event when we're handling the event, to
> avoid upsetting the helpers (reported by Jyri).
> 
> v3: Also send out even whent the crtc is getting disabled. Tilcdc looks a
> bit like conversion to simple display helpers would work out really
> nice.
> 

Probably. Should take a closer looks some day when I have time.

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

Tested-by: Jyri Sarha <jsarha@ti.com>
Reviewed-by: Jyri Sarha <jsarha@ti.com>

> --
> From logs looks like we're not stuck when disabling the display, so I
> hacked in a bit of code for that too. Like mentioned above, tilcdc
> looks like a perfect candidate for simple display helpers, I think
> that would simplify a _lot_ of code here.
> -Daniel
> ---
>  drivers/gpu/drm/tilcdc/tilcdc_crtc.c  | 13 ++++++++
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c   | 47 +--------------------------
>  drivers/gpu/drm/tilcdc/tilcdc_plane.c |  8 +++--
>  3 files changed, 19 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> index e9dd5e5cb4e7..1856962411c7 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
> @@ -537,6 +537,18 @@ static void tilcdc_crtc_atomic_disable(struct drm_crtc *crtc,
>  	tilcdc_crtc_disable(crtc);
>  }
>  
> +static void tilcdc_crtc_atomic_flush(struct drm_crtc *crtc,
> +				     struct drm_crtc_state *old_state)
> +{
> +	if (!crtc->state->event)
> +		return;
> +
> +	spin_lock_irq(&crtc->dev->event_lock);
> +	drm_crtc_send_vblank_event(crtc, crtc->state->event);
> +	crtc->state->event = NULL;
> +	spin_unlock_irq(&crtc->dev->event_lock);
> +}
> +
>  void tilcdc_crtc_shutdown(struct drm_crtc *crtc)
>  {
>  	tilcdc_crtc_off(crtc, true);
> @@ -822,6 +834,7 @@ static const struct drm_crtc_helper_funcs tilcdc_crtc_helper_funcs = {
>  	.atomic_check	= tilcdc_crtc_atomic_check,
>  	.atomic_enable	= tilcdc_crtc_atomic_enable,
>  	.atomic_disable	= tilcdc_crtc_atomic_disable,
> +	.atomic_flush	= tilcdc_crtc_atomic_flush,
>  };
>  
>  void tilcdc_crtc_set_panel_info(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> index 0d74a6443263..4f5fc3e87383 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
> @@ -87,55 +87,10 @@ static int tilcdc_atomic_check(struct drm_device *dev,
>  	return ret;
>  }
>  
> -static int tilcdc_commit(struct drm_device *dev,
> -		  struct drm_atomic_state *state,
> -		  bool async)
> -{
> -	int ret;
> -
> -	ret = drm_atomic_helper_prepare_planes(dev, state);
> -	if (ret)
> -		return ret;
> -
> -	ret = drm_atomic_helper_swap_state(state, true);
> -	if (ret) {
> -		drm_atomic_helper_cleanup_planes(dev, state);
> -		return ret;
> -	}
> -
> -	/*
> -	 * Everything below can be run asynchronously without the need to grab
> -	 * any modeset locks at all under one condition: It must be guaranteed
> -	 * that the asynchronous work has either been cancelled (if the driver
> -	 * supports it, which at least requires that the framebuffers get
> -	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
> -	 * before the new state gets committed on the software side with
> -	 * drm_atomic_helper_swap_state().
> -	 *
> -	 * This scheme allows new atomic state updates to be prepared and
> -	 * checked in parallel to the asynchronous completion of the previous
> -	 * update. Which is important since compositors need to figure out the
> -	 * composition of the next frame right after having submitted the
> -	 * current layout.
> -	 */
> -
> -	drm_atomic_helper_commit_modeset_disables(dev, state);
> -
> -	drm_atomic_helper_commit_planes(dev, state, 0);
> -
> -	drm_atomic_helper_commit_modeset_enables(dev, state);
> -
> -	drm_atomic_helper_wait_for_vblanks(dev, state);
> -
> -	drm_atomic_helper_cleanup_planes(dev, state);
> -
> -	return 0;
> -}
> -
>  static const struct drm_mode_config_funcs mode_config_funcs = {
>  	.fb_create = drm_gem_fb_create,
>  	.atomic_check = tilcdc_atomic_check,
> -	.atomic_commit = tilcdc_commit,
> +	.atomic_commit = drm_atomic_helper_commit,
>  };
>  
>  static void modeset_init(struct drm_device *dev)
> diff --git a/drivers/gpu/drm/tilcdc/tilcdc_plane.c b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> index 0d09b31ae759..2f681a713815 100644
> --- a/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_plane.c
> @@ -83,9 +83,11 @@ static void tilcdc_plane_atomic_update(struct drm_plane *plane,
>  	if (WARN_ON(!state->fb || !state->crtc->state))
>  		return;
>  
> -	tilcdc_crtc_update_fb(state->crtc,
> -			      state->fb,
> -			      state->crtc->state->event);
> +	if (tilcdc_crtc_update_fb(state->crtc,
> +				  state->fb,
> +				  state->crtc->state->event) == 0) {
> +		state->crtc->state->event = NULL;
> +	}
>  }
>  
>  static const struct drm_plane_helper_funcs plane_helper_funcs = {
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
