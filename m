Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A501A1CA0
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 09:29:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D7946E97C;
	Wed,  8 Apr 2020 07:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39066E97C;
 Wed,  8 Apr 2020 07:29:35 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 894BC80532;
 Wed,  8 Apr 2020 09:29:31 +0200 (CEST)
Date: Wed, 8 Apr 2020 09:29:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 16/44] drm/udl: don't set drm_device->dev_private
Message-ID: <20200408072930.GJ14965@ravnborg.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-17-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403135828.2542770-17-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=QyXUC8HyAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8
 a=3jHMjg6xAAAA:8 a=e5mUnYsNAAAA:8 a=nON1a4OElbGGd1pocUAA:9
 a=wPNLvfGTeEIA:10 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=_Ilv_KrDiT527o6t6YB_:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 03, 2020 at 03:58:00PM +0200, Daniel Vetter wrote:
> We're mostly there already, just a handful of places that didn't use
> the to_udl container_of cast. To make sure no new appear, don't set
> ->dev_private.
> =

> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Emil Velikov <emil.l.velikov@gmail.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Alexios Zavras <alexios.zavras@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: "Jos=E9 Roberto de Souza" <jose.souza@intel.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Allison Randal <allison@lohutok.net>
Acked-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  drivers/gpu/drm/udl/udl_connector.c | 4 ++--
>  drivers/gpu/drm/udl/udl_drv.c       | 1 -
>  drivers/gpu/drm/udl/udl_modeset.c   | 6 +++---
>  3 files changed, 5 insertions(+), 6 deletions(-)
> =

> diff --git a/drivers/gpu/drm/udl/udl_connector.c b/drivers/gpu/drm/udl/ud=
l_connector.c
> index 0afdfb0d1fe1..cdc1c42e1669 100644
> --- a/drivers/gpu/drm/udl/udl_connector.c
> +++ b/drivers/gpu/drm/udl/udl_connector.c
> @@ -59,7 +59,7 @@ static int udl_get_modes(struct drm_connector *connecto=
r)
>  static enum drm_mode_status udl_mode_valid(struct drm_connector *connect=
or,
>  			  struct drm_display_mode *mode)
>  {
> -	struct udl_device *udl =3D connector->dev->dev_private;
> +	struct udl_device *udl =3D to_udl(connector->dev);
>  	if (!udl->sku_pixel_limit)
>  		return 0;
>  =

> @@ -72,7 +72,7 @@ static enum drm_mode_status udl_mode_valid(struct drm_c=
onnector *connector,
>  static enum drm_connector_status
>  udl_detect(struct drm_connector *connector, bool force)
>  {
> -	struct udl_device *udl =3D connector->dev->dev_private;
> +	struct udl_device *udl =3D to_udl(connector->dev);
>  	struct udl_drm_connector *udl_connector =3D
>  					container_of(connector,
>  					struct udl_drm_connector,
> diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
> index 4ba5149fdd57..126545428895 100644
> --- a/drivers/gpu/drm/udl/udl_drv.c
> +++ b/drivers/gpu/drm/udl/udl_drv.c
> @@ -63,7 +63,6 @@ static struct udl_device *udl_driver_create(struct usb_=
interface *interface)
>  		return udl;
>  =

>  	udl->udev =3D udev;
> -	udl->drm.dev_private =3D udl;
>  =

>  	r =3D udl_init(udl);
>  	if (r)
> diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_=
modeset.c
> index 8cad01f3d163..99518a826435 100644
> --- a/drivers/gpu/drm/udl/udl_modeset.c
> +++ b/drivers/gpu/drm/udl/udl_modeset.c
> @@ -215,7 +215,7 @@ static char *udl_dummy_render(char *wrptr)
>  static int udl_crtc_write_mode_to_hw(struct drm_crtc *crtc)
>  {
>  	struct drm_device *dev =3D crtc->dev;
> -	struct udl_device *udl =3D dev->dev_private;
> +	struct udl_device *udl =3D to_udl(dev);
>  	struct urb *urb;
>  	char *buf;
>  	int retval;
> @@ -369,7 +369,7 @@ udl_simple_display_pipe_enable(struct drm_simple_disp=
lay_pipe *pipe,
>  	struct drm_crtc *crtc =3D &pipe->crtc;
>  	struct drm_device *dev =3D crtc->dev;
>  	struct drm_framebuffer *fb =3D plane_state->fb;
> -	struct udl_device *udl =3D dev->dev_private;
> +	struct udl_device *udl =3D to_udl(dev);
>  	struct drm_display_mode *mode =3D &crtc_state->mode;
>  	char *buf;
>  	char *wrptr;
> @@ -464,7 +464,7 @@ static const struct drm_mode_config_funcs udl_mode_fu=
ncs =3D {
>  int udl_modeset_init(struct drm_device *dev)
>  {
>  	size_t format_count =3D ARRAY_SIZE(udl_simple_display_pipe_formats);
> -	struct udl_device *udl =3D dev->dev_private;
> +	struct udl_device *udl =3D to_udl(dev);
>  	struct drm_connector *connector;
>  	int ret;
>  =

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
