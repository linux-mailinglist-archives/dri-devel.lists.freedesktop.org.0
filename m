Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D9573BD2D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 18:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678F910E67D;
	Fri, 23 Jun 2023 16:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CE810E67D
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 16:51:35 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E087C440;
 Fri, 23 Jun 2023 18:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687539058;
 bh=cy1SsBzf3mccOKLcSG9wuUM0q5OifyPGImdA6vK6G8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j2wEIwxt1wAan0OXHxPaf6v5HUaZEyR7aSHgKG5RSw4aE8WsK6RdA7YkJOtnvbM8T
 s7X3hZwhq3oC1GkRXB3g5kS+gR3vds4vMzl96RBQcCXmqK0lan0KYCJRYtCuvy+5dk
 4nM3BoNhbKinbaCXxs1tlhIN3fCdutpunx9MoFiY=
Date: Fri, 23 Jun 2023 19:51:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH 25/39] drm: renesas: shmobile: Rename shmob_drm_crtc.crtc
Message-ID: <20230623165133.GC2112@pendragon.ideasonboard.com>
References: <cover.1687423204.git.geert+renesas@glider.be>
 <b3daca80f82625ba14e3aeaf2fca6dcefa056e47.1687423204.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b3daca80f82625ba14e3aeaf2fca6dcefa056e47.1687423204.git.geert+renesas@glider.be>
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
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

Thank you for the patch.

On Thu, Jun 22, 2023 at 11:21:37AM +0200, Geert Uytterhoeven wrote:
> Rename the "crtc" member of the shmob_drm_crtc subclass structure to
> "base", to improve readability.

I'm not sure that's more readable to me, but I don't mind :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 26 +++++++++----------
>  .../gpu/drm/renesas/shmobile/shmob_drm_crtc.h |  2 +-
>  2 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> index 3f6af12f45988124..3f0b71253ed929c9 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
> @@ -64,7 +64,7 @@ static void shmob_drm_clk_off(struct shmob_drm_device *sdev)
>  
>  static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>  {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  	const struct drm_display_info *info = &sdev->connector->display_info;
>  	const struct drm_display_mode *mode = &crtc->mode;
> @@ -152,7 +152,7 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
>  
>  static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>  {
> -	struct shmob_drm_device *sdev = to_shmob_device(scrtc->crtc.dev);
> +	struct shmob_drm_device *sdev = to_shmob_device(scrtc->base.dev);
>  	u32 value;
>  
>  	value = lcdc_read(sdev, LDCNT2R);
> @@ -185,7 +185,7 @@ static void shmob_drm_crtc_start_stop(struct shmob_drm_crtc *scrtc, bool start)
>   */
>  static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  	const struct shmob_drm_interface_data *idata = &sdev->pdata->iface;
>  	const struct shmob_drm_format_info *format;
> @@ -272,7 +272,7 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
>  
>  static void shmob_drm_crtc_stop(struct shmob_drm_crtc *scrtc)
>  {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  
>  	if (!scrtc->started)
> @@ -308,7 +308,7 @@ void shmob_drm_crtc_resume(struct shmob_drm_crtc *scrtc)
>  static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
>  					int x, int y)
>  {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>  	struct drm_framebuffer *fb = crtc->primary->fb;
>  	struct drm_gem_dma_object *gem;
>  	unsigned int bpp;
> @@ -329,7 +329,7 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
>  
>  static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
>  {
> -	struct drm_crtc *crtc = &scrtc->crtc;
> +	struct drm_crtc *crtc = &scrtc->base;
>  	struct shmob_drm_device *sdev = to_shmob_device(crtc->dev);
>  
>  	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
> @@ -343,7 +343,7 @@ static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
>  
>  static inline struct shmob_drm_crtc *to_shmob_crtc(struct drm_crtc *crtc)
>  {
> -	return container_of(crtc, struct shmob_drm_crtc, crtc);
> +	return container_of(crtc, struct shmob_drm_crtc, base);
>  }
>  
>  static void shmob_drm_crtc_dpms(struct drm_crtc *crtc, int mode)
> @@ -415,15 +415,15 @@ static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
>  void shmob_drm_crtc_finish_page_flip(struct shmob_drm_crtc *scrtc)
>  {
>  	struct drm_pending_vblank_event *event;
> -	struct drm_device *dev = scrtc->crtc.dev;
> +	struct drm_device *dev = scrtc->base.dev;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&dev->event_lock, flags);
>  	event = scrtc->event;
>  	scrtc->event = NULL;
>  	if (event) {
> -		drm_crtc_send_vblank_event(&scrtc->crtc, event);
> -		drm_crtc_vblank_put(&scrtc->crtc);
> +		drm_crtc_send_vblank_event(&scrtc->base, event);
> +		drm_crtc_vblank_put(&scrtc->base);
>  	}
>  	spin_unlock_irqrestore(&dev->event_lock, flags);
>  }
> @@ -435,7 +435,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
>  				    struct drm_modeset_acquire_ctx *ctx)
>  {
>  	struct shmob_drm_crtc *scrtc = to_shmob_crtc(crtc);
> -	struct drm_device *dev = scrtc->crtc.dev;
> +	struct drm_device *dev = scrtc->base.dev;
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&dev->event_lock, flags);
> @@ -450,7 +450,7 @@ static int shmob_drm_crtc_page_flip(struct drm_crtc *crtc,
>  
>  	if (event) {
>  		event->pipe = 0;
> -		drm_crtc_vblank_get(&scrtc->crtc);
> +		drm_crtc_vblank_get(&scrtc->base);
>  		spin_lock_irqsave(&dev->event_lock, flags);
>  		scrtc->event = event;
>  		spin_unlock_irqrestore(&dev->event_lock, flags);
> @@ -502,7 +502,7 @@ static const struct drm_crtc_funcs crtc_funcs = {
>  
>  int shmob_drm_crtc_create(struct shmob_drm_device *sdev)
>  {
> -	struct drm_crtc *crtc = &sdev->crtc.crtc;
> +	struct drm_crtc *crtc = &sdev->crtc.base;
>  	struct drm_plane *primary, *plane;
>  	unsigned int i;
>  	int ret;
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> index f507eaf912e16a22..79cce0a0ada4cfce 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.h
> @@ -21,7 +21,7 @@ struct shmob_drm_device;
>  struct shmob_drm_format_info;
>  
>  struct shmob_drm_crtc {
> -	struct drm_crtc crtc;
> +	struct drm_crtc base;
>  
>  	struct drm_pending_vblank_event *event;
>  	int dpms;

-- 
Regards,

Laurent Pinchart
