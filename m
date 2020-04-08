Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC41A1D0A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 10:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395556E9A5;
	Wed,  8 Apr 2020 08:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53D826E9A3;
 Wed,  8 Apr 2020 08:01:49 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 64F4620027;
 Wed,  8 Apr 2020 10:01:47 +0200 (CEST)
Date: Wed, 8 Apr 2020 10:01:46 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 40/44] drm/cirrus: Don't use drm_device->dev_private
Message-ID: <20200408080146.GS14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=SJz97ENfAAAA:8 a=7gkXJVJtAAAA:8 a=-VAfIpHNAAAA:8
 a=Z4Rwk6OoAAAA:8 a=e5mUnYsNAAAA:8 a=k3yETl1An53_cHGttpsA:9
 a=wPNLvfGTeEIA:10 a=vFet0B0WnEQeilDPIY6i:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=srlwD-8ojaedGGhPAyx8:22 a=HkZW87K1Qel5hWWM3VKY:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:58:24PM +0200, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: "Noralf Tr=F8nnes" <noralf@tronnes.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: virtualization@lists.linux-foundation.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/cirrus/cirrus.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/cirrus/cirrus.c b/drivers/gpu/drm/cirrus/cir=
rus.c
> index 4b65637147ba..744a8e337e41 100644
> --- a/drivers/gpu/drm/cirrus/cirrus.c
> +++ b/drivers/gpu/drm/cirrus/cirrus.c
> @@ -59,6 +59,8 @@ struct cirrus_device {
>  	void __iomem		       *mmio;
>  };
>  =

> +#define to_cirrus(_dev) container_of(_dev, struct cirrus_device, dev)
> +
>  /* ------------------------------------------------------------------ */
>  /*
>   * The meat of this driver. The core passes us a mode and we have to pro=
gram
> @@ -311,7 +313,7 @@ static int cirrus_mode_set(struct cirrus_device *cirr=
us,
>  static int cirrus_fb_blit_rect(struct drm_framebuffer *fb,
>  			       struct drm_rect *rect)
>  {
> -	struct cirrus_device *cirrus =3D fb->dev->dev_private;
> +	struct cirrus_device *cirrus =3D to_cirrus(fb->dev);
>  	void *vmap;
>  	int idx, ret;
>  =

> @@ -436,7 +438,7 @@ static void cirrus_pipe_enable(struct drm_simple_disp=
lay_pipe *pipe,
>  			       struct drm_crtc_state *crtc_state,
>  			       struct drm_plane_state *plane_state)
>  {
> -	struct cirrus_device *cirrus =3D pipe->crtc.dev->dev_private;
> +	struct cirrus_device *cirrus =3D to_cirrus(pipe->crtc.dev);
>  =

>  	cirrus_mode_set(cirrus, &crtc_state->mode, plane_state->fb);
>  	cirrus_fb_blit_fullscreen(plane_state->fb);
> @@ -445,7 +447,7 @@ static void cirrus_pipe_enable(struct drm_simple_disp=
lay_pipe *pipe,
>  static void cirrus_pipe_update(struct drm_simple_display_pipe *pipe,
>  			       struct drm_plane_state *old_state)
>  {
> -	struct cirrus_device *cirrus =3D pipe->crtc.dev->dev_private;
> +	struct cirrus_device *cirrus =3D to_cirrus(pipe->crtc.dev);
>  	struct drm_plane_state *state =3D pipe->plane.state;
>  	struct drm_crtc *crtc =3D &pipe->crtc;
>  	struct drm_rect rect;
> @@ -573,7 +575,6 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
>  		return PTR_ERR(cirrus);
>  =

>  	dev =3D &cirrus->dev;
> -	dev->dev_private =3D cirrus;
>  =

>  	cirrus->vram =3D devm_ioremap(&pdev->dev, pci_resource_start(pdev, 0),
>  				    pci_resource_len(pdev, 0));
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
