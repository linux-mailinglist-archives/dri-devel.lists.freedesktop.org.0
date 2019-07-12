Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED4D6650D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 05:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3BD66E2B1;
	Fri, 12 Jul 2019 03:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164726E2B1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jul 2019 03:37:29 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id x22so1839939qtp.12
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 20:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZFvfLJnkuQpWbDRLDQ6lwTi1Ao3rx6w+Ypi5LBUbmco=;
 b=LE8k/ax7X8+5LAEeKrEZ04WXhZmACDeDytxsuMvT84henw3jJ8qYE40dtyIIfogYIw
 1RGRMZIvCGm6jwefZIraDjuGdF1vtoMMA0XXxCrKGdcPuBrus6CD/kNBYhy0HYxqH6CU
 uhoTWhYcjm/uZ2fn7ZUiobtVKJbSwFYe6LQIrsof3Q2MGj/CynMatfZl59O/4w67RmBV
 OsSr6CpcO/ComS4x1klMR/apTg4YHFcw1nVg89JGVXDdHMRq2ecA1krtjk9o0ra15n5d
 jO9I5+2mwbp2ioI3F7GKwKZrCPwedqPM1D3l+mpxe6dmtK+b50Vbm8zwWFv6LInthFeU
 ebCw==
X-Gm-Message-State: APjAAAXwje2NE6jmAE+cCua+2lU7mj+cGGcB1lRwla2A6BhJVMPhmKe5
 +Phv4d+muI04KUQv7Dpr62M=
X-Google-Smtp-Source: APXvYqxxavZqfFD329vbGa1uOPpTO6k0brobBb5heA8KXGCog7x3Hl3o1lnwHBPppgErXiAHKvreCg==
X-Received: by 2002:a0c:ad6f:: with SMTP id v44mr4852749qvc.40.1562902647971; 
 Thu, 11 Jul 2019 20:37:27 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.22])
 by smtp.gmail.com with ESMTPSA id q12sm2826887qkm.126.2019.07.11.20.37.24
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 20:37:26 -0700 (PDT)
Date: Fri, 12 Jul 2019 00:37:22 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Brian Starkey <brian.starkey@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 5/5] drm/vkms: Add support for writeback
Message-ID: <20190712033722.w3r7lvrajnrr4jzh@smtp.gmail.com>
References: <cover.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <917fda9b620cd84a0826d2d5a59bff9ea07bfde2.1561491964.git.rodrigosiqueiramelo@gmail.com>
 <20190711083441.GJ15868@phenom.ffwll.local>
MIME-Version: 1.0
In-Reply-To: <20190711083441.GJ15868@phenom.ffwll.local>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZFvfLJnkuQpWbDRLDQ6lwTi1Ao3rx6w+Ypi5LBUbmco=;
 b=iksy31Q2XTmbDJv9LC2LorAG3khqwPKIWpvzXyJe8rq0piuh4wJkSFaOOYbU1xgI3L
 1JpEDcdwZzZjjzkafAWpRdAZqt65JQQUe8H9HhV+oB1hFlVuYCK4lcxwPsrgFkyEdT6x
 x920rpOY92biiVvuQl3BQ6bHgH7FeTJdlqbgglgUxFMLAYMzKF2MfBrZfh9QaHwgbJQB
 /5lAJTt3hboRwbBauvsxZw2glrK8pDQuho57DyTz+yECm4bVdXtPQ0CoQFIRyZmPZZkJ
 ugUVreX50NDXBi+IXQu7qGhkiShHwvHogkAq3iRNfS2f7PruuIBXTPRIIvImG6nYsWgd
 6VTA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0932139493=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0932139493==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hyxgnm2zmqtcvrze"
Content-Disposition: inline


--hyxgnm2zmqtcvrze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/11, Daniel Vetter wrote:
> On Tue, Jun 25, 2019 at 10:39:03PM -0300, Rodrigo Siqueira wrote:
> > This patch implements the necessary functions to add writeback support
> > for vkms. This feature is useful for testing compositors if you don't
> > have hardware with writeback support.
> >=20
> > Change in V3 (Daniel):
> > - If writeback is enabled, compose everything into the writeback buffer
> > instead of CRC private buffer.
> > - Guarantees that the CRC will match exactly what we have in the
> > writeback buffer.
> >=20
> > Change in V2:
> > - Rework signal completion (Brian)
> > - Integrates writeback with active_planes (Daniel)
> > - Compose cursor (Daniel)
> >=20
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > ---
> >  drivers/gpu/drm/vkms/Makefile         |   9 +-
> >  drivers/gpu/drm/vkms/vkms_composer.c  |  16 ++-
> >  drivers/gpu/drm/vkms/vkms_drv.c       |   4 +
> >  drivers/gpu/drm/vkms/vkms_drv.h       |   8 ++
> >  drivers/gpu/drm/vkms/vkms_output.c    |  10 ++
> >  drivers/gpu/drm/vkms/vkms_writeback.c | 141 ++++++++++++++++++++++++++
> >  6 files changed, 185 insertions(+), 3 deletions(-)
> >  create mode 100644 drivers/gpu/drm/vkms/vkms_writeback.c
> >=20
> > diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makef=
ile
> > index 0b767d7efa24..333d3cead0e3 100644
> > --- a/drivers/gpu/drm/vkms/Makefile
> > +++ b/drivers/gpu/drm/vkms/Makefile
> > @@ -1,4 +1,11 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > -vkms-y :=3D vkms_drv.o vkms_plane.o vkms_output.o vkms_crtc.o vkms_gem=
=2Eo vkms_composer.o
> > +vkms-y :=3D \
> > +	vkms_drv.o \
> > +	vkms_plane.o \
> > +	vkms_output.o \
> > +	vkms_crtc.o \
> > +	vkms_gem.o \
> > +	vkms_composer.o \
> > +	vkms_writeback.o
> > =20
> >  obj-$(CONFIG_DRM_VKMS) +=3D vkms.o
> > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkm=
s/vkms_composer.c
> > index 8126aa0f968f..2317803e7320 100644
> > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > @@ -157,16 +157,17 @@ void vkms_composer_worker(struct work_struct *wor=
k)
> >  	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> >  	struct vkms_composer *primary_composer =3D NULL;
> >  	struct vkms_composer *cursor_composer =3D NULL;
> > +	bool crc_pending, wb_pending;
>=20
> I'm not seeing how you schedule this work for writeback if there's no crc
> enabled. Does that work?

If we enable writeback, we set true for the flag composer_enabled (see
vkms_output.c in this patch) which also make vkms_vblank_simulate able
to handle crc. Since writeback is oneshot, we only enable it on
vkms_wb_atomic_commit (crtc_state->wb_pending =3D true); in its turn
vkms_composer_worker() use writeback buffer instead of creating a new
one for computing crc. Finally, at the end of vkms_composer_worker() we
disable the writeback.

> >  	void *vaddr_out =3D NULL;
> >  	u32 crc32 =3D 0;
> >  	u64 frame_start, frame_end;
> > -	bool crc_pending;
> >  	int ret;
> > =20
> >  	spin_lock_irq(&out->composer_lock);
> >  	frame_start =3D crtc_state->frame_start;
> >  	frame_end =3D crtc_state->frame_end;
> >  	crc_pending =3D crtc_state->crc_pending;
> > +	wb_pending =3D crtc_state->wb_pending;
> >  	crtc_state->frame_start =3D 0;
> >  	crtc_state->frame_end =3D 0;
> >  	crtc_state->crc_pending =3D false;
> > @@ -188,9 +189,12 @@ void vkms_composer_worker(struct work_struct *work)
> >  	if (!primary_composer)
> >  		return;
> > =20
> > +	if (wb_pending)
> > +		vaddr_out =3D crtc_state->active_writeback;
> > +
> >  	ret =3D compose_planes(&vaddr_out, primary_composer, cursor_composer);
> >  	if (ret) {
> > -		if (ret =3D=3D -EINVAL)
> > +		if (ret =3D=3D -EINVAL && !wb_pending)
> >  			kfree(vaddr_out);
> >  		return;
> >  	}
> > @@ -203,6 +207,14 @@ void vkms_composer_worker(struct work_struct *work)
> >  	while (frame_start <=3D frame_end)
> >  		drm_crtc_add_crc_entry(crtc, true, frame_start++, &crc32);
> > =20
> > +	if (wb_pending) {
> > +		drm_writeback_signal_completion(&out->wb_connector, 0);
> > +		spin_lock_irq(&out->composer_lock);
> > +		crtc_state->wb_pending =3D false;
> > +		spin_unlock_irq(&out->composer_lock);
> > +		return;
> > +	}
> > +
> >  	kfree(vaddr_out);
> >  }
> > =20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkm=
s_drv.c
> > index ac790b6527e4..152d7de24a76 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -30,6 +30,10 @@ bool enable_cursor;
> >  module_param_named(enable_cursor, enable_cursor, bool, 0444);
> >  MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
> > =20
> > +bool enable_writeback;
> > +module_param_named(enable_writeback, enable_writeback, bool, 0444);
> > +MODULE_PARM_DESC(enable_writeback, "Enable/Disable writeback connector=
");
> > +
> >  static const struct file_operations vkms_driver_fops =3D {
> >  	.owner		=3D THIS_MODULE,
> >  	.open		=3D drm_open,
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkm=
s_drv.h
> > index fc6cda164336..9ff2cd4ebf81 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -7,6 +7,7 @@
> >  #include <drm/drm.h>
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_encoder.h>
> > +#include <drm/drm_writeback.h>
> >  #include <linux/hrtimer.h>
> > =20
> >  #define XRES_MIN    20
> > @@ -19,6 +20,7 @@
> >  #define YRES_MAX  8192
> > =20
> >  extern bool enable_cursor;
> > +extern bool enable_writeback;
> > =20
> >  struct vkms_composer {
> >  	struct drm_framebuffer fb;
> > @@ -52,9 +54,11 @@ struct vkms_crtc_state {
> >  	int num_active_planes;
> >  	/* stack of active planes for crc computation, should be in z order */
> >  	struct vkms_plane_state **active_planes;
> > +	void *active_writeback;
> > =20
> >  	/* below three are protected by vkms_output.composer_lock */
> >  	bool crc_pending;
> > +	bool wb_pending;
> >  	u64 frame_start;
> >  	u64 frame_end;
> >  };
> > @@ -63,6 +67,7 @@ struct vkms_output {
> >  	struct drm_crtc crtc;
> >  	struct drm_encoder encoder;
> >  	struct drm_connector connector;
> > +	struct drm_writeback_connector wb_connector;
> >  	struct hrtimer vblank_hrtimer;
> >  	ktime_t period_ns;
> >  	struct drm_pending_vblank_event *event;
> > @@ -147,4 +152,7 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, c=
onst char *source_name,
> >  /* Composer Support */
> >  void vkms_composer_worker(struct work_struct *work);
> > =20
> > +/* Writeback */
> > +int enable_writeback_connector(struct vkms_device *vkmsdev);
> > +
> >  #endif /* _VKMS_DRV_H_ */
> > diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/=
vkms_output.c
> > index fb1941a6522c..aea1d4410864 100644
> > --- a/drivers/gpu/drm/vkms/vkms_output.c
> > +++ b/drivers/gpu/drm/vkms/vkms_output.c
> > @@ -84,6 +84,16 @@ int vkms_output_init(struct vkms_device *vkmsdev, in=
t index)
> >  		goto err_attach;
> >  	}
> > =20
> > +	if (enable_writeback) {
> > +		ret =3D enable_writeback_connector(vkmsdev);
> > +		if (!ret) {
> > +			output->composer_enabled =3D true;
> > +			DRM_INFO("Writeback connector enabled");
> > +		} else {
> > +			DRM_ERROR("Failed to init writeback connector\n");
> > +		}
> > +	}
> > +
> >  	drm_mode_config_reset(dev);
> > =20
> >  	return 0;
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vk=
ms/vkms_writeback.c
> > new file mode 100644
> > index 000000000000..34dad37a0236
> > --- /dev/null
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -0,0 +1,141 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +#include "vkms_drv.h"
> > +#include <drm/drm_writeback.h>
> > +#include <drm/drm_probe_helper.h>
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_gem_framebuffer_helper.h>
> > +
> > +static const u32 vkms_wb_formats[] =3D {
> > +	DRM_FORMAT_XRGB8888,
> > +};
> > +
> > +static const struct drm_connector_funcs vkms_wb_connector_funcs =3D {
> > +	.fill_modes =3D drm_helper_probe_single_connector_modes,
> > +	.destroy =3D drm_connector_cleanup,
> > +	.reset =3D drm_atomic_helper_connector_reset,
> > +	.atomic_duplicate_state =3D drm_atomic_helper_connector_duplicate_sta=
te,
> > +	.atomic_destroy_state =3D drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int vkms_wb_encoder_atomic_check(struct drm_encoder *encoder,
> > +					struct drm_crtc_state *crtc_state,
> > +					struct drm_connector_state *conn_state)
> > +{
> > +	struct drm_framebuffer *fb;
> > +	const struct drm_display_mode *mode =3D &crtc_state->mode;
> > +
> > +	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
> > +		return 0;
> > +
> > +	fb =3D conn_state->writeback_job->fb;
> > +	if (fb->width !=3D mode->hdisplay || fb->height !=3D mode->vdisplay) {
> > +		DRM_DEBUG_KMS("Invalid framebuffer size %ux%u\n",
> > +			      fb->width, fb->height);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (fb->format->format !=3D DRM_FORMAT_XRGB8888) {
> > +		struct drm_format_name_buf format_name;
> > +
> > +		DRM_DEBUG_KMS("Invalid pixel format %s\n",
> > +			      drm_get_format_name(fb->format->format,
> > +						  &format_name));
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct drm_encoder_helper_funcs vkms_wb_encoder_helper_fu=
ncs =3D {
> > +	.atomic_check =3D vkms_wb_encoder_atomic_check,
> > +};
> > +
> > +static int vkms_wb_connector_get_modes(struct drm_connector *connector)
> > +{
> > +	struct drm_device *dev =3D connector->dev;
> > +
> > +	return drm_add_modes_noedid(connector, dev->mode_config.max_width,
> > +				    dev->mode_config.max_height);
> > +}
>=20
> Do we need a mode for writeb connector? Is that used by userspace to
> figure out the max size for writeback?

Yes, we need it. You're right about the userspace utilizing it to figure
out the max size writeback, kms_writeback strongly rely on this.

> > +
> > +static int vkms_wb_prepare_job(struct drm_writeback_connector *wb_conn=
ector,
> > +			       struct drm_writeback_job *job)
> > +{
> > +	struct vkms_gem_object *vkms_obj;
> > +	struct drm_gem_object *gem_obj;
> > +	int ret;
> > +
> > +	if (!job->fb)
> > +		return 0;
>=20
> Can this happen?

Yes, here is the path until this function is invoked:

  drm_atomic_helper_prepare_planes()

Inside the above function we have:

  for_each_new_connector_in_state(state, connector, new_conn_state, i)

which in turn invoke:

  drm_writeback_prepare_job(new_conn_state->writeback_job);

FWIU, new_conn_state->writeback_job could be NULL. Anyway, I also tested
it, and I notice this condition can be reached.
=20
> > +
> > +	gem_obj =3D drm_gem_fb_get_obj(job->fb, 0);
> > +	ret =3D vkms_gem_vmap(gem_obj);
> > +	if (ret) {
> > +		DRM_ERROR("vmap failed: %d\n", ret);
> > +		return ret;
> > +	}
> > +
> > +	vkms_obj =3D drm_gem_to_vkms_gem(gem_obj);
> > +	job->priv =3D vkms_obj->vaddr;
> > +
> > +	return 0;
> > +}
> > +
> > +static void vkms_wb_cleanup_job(struct drm_writeback_connector *connec=
tor,
> > +				struct drm_writeback_job *job)
> > +{
> > +	struct drm_gem_object *gem_obj;
> > +
> > +	if (!job->fb)
> > +		return;
>=20
> Same here?
>=20
> > +
> > +	gem_obj =3D drm_gem_fb_get_obj(job->fb, 0);
> > +	vkms_gem_vunmap(gem_obj);
> > +}
> > +
> > +static void vkms_wb_atomic_commit(struct drm_connector *conn,
> > +				  struct drm_connector_state *state)
> > +{
> > +	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(conn->dev);
> > +	struct vkms_output *output =3D &vkmsdev->output;
> > +	struct drm_writeback_connector *wb_conn =3D &output->wb_connector;
> > +	struct drm_connector_state *conn_state =3D wb_conn->base.state;
> > +	struct vkms_crtc_state *crtc_state =3D output->composer_state;
> > +
> > +	if (!conn_state)
> > +		return;
> > +
> > +	if (!conn_state->writeback_job || !conn_state->writeback_job->fb) {
> > +		DRM_DEBUG_DRIVER("Disable writeback\n");
> > +		return;
> > +	}
>=20
> All three checks above sound like helpers should take care of this?

Maybe I missed something, but I did not find such helper. I also noticed
that vc4, rcar-du, and mali does the same check.
=20
Thanks

> > +
> > +	spin_lock_irq(&output->composer_lock);
> > +	crtc_state->active_writeback =3D conn_state->writeback_job->priv;
> > +	crtc_state->wb_pending =3D true;
> > +	spin_unlock_irq(&output->composer_lock);
> > +	drm_writeback_queue_job(wb_conn, state);
> > +}
> > +
> > +static const struct drm_connector_helper_funcs vkms_wb_conn_helper_fun=
cs =3D {
> > +	.get_modes =3D vkms_wb_connector_get_modes,
> > +	.prepare_writeback_job =3D vkms_wb_prepare_job,
> > +	.cleanup_writeback_job =3D vkms_wb_cleanup_job,
> > +	.atomic_commit =3D vkms_wb_atomic_commit,
> > +};
> > +
> > +int enable_writeback_connector(struct vkms_device *vkmsdev)
> > +{
> > +	struct drm_writeback_connector *wb =3D &vkmsdev->output.wb_connector;
> > +
> > +	vkmsdev->output.wb_connector.encoder.possible_crtcs =3D 1;
> > +	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
> > +
> > +	return drm_writeback_connector_init(&vkmsdev->drm, wb,
> > +					    &vkms_wb_connector_funcs,
> > +					    &vkms_wb_encoder_helper_funcs,
> > +					    vkms_wb_formats,
> > +					    ARRAY_SIZE(vkms_wb_formats));
> > +}
>=20
> Overall looks like good approach.
> -Daniel
> --=20
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

--=20
Rodrigo Siqueira
https://siqueira.tech

--hyxgnm2zmqtcvrze
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0oAHIACgkQWJzP/com
vP8Pag/+MSW6MtwRkqDYKo09Jj9gGqM6McPZr4KkU25bX1sNsE+D5nAP0UfMtFUW
XhgoD2azmABQFTZk3KU4cYJVMh8VxkA2iY1I5gUcHm9YclN1c7ddpxbq/QeU9noW
fZg0MXQt80Czzumz5MQnTcfTgrMYYTf39Kzzc/KD6inE/q7SSilGMbACf/+0ab+E
4ptLlaRTi8Rs6jiWOh7MDTsO+rt0HL7jfn9YY5q4w+EFce18zvYi5hQT70HQ3XLN
G2V8Ac0aoKDqysVcQKh1kEoP4uZAr8wFMbn+3vAmKKnFn7fwfS/xsYgAABfPN7sp
EcuNQicoh8xiKiPCyy6ivowArMqINKTqM2cilkKg4Q5xRteY0XgILcrna1W4fzsm
janmvepcCXW/hDO5qHJrLagkfog02cCM2ZxKv7cL4Pv7f85UqKOVewx4nb948Wfa
sOYn/W4xxbwel5ILG+Tno5tJPwvyuB5VkJ8hMEsuvRoHK6cUYMORlzbx2KLiekx3
cuW110fVF4NL3W9e38HLayiaAr967QJiZ8x+XahKZ72cKgwh42Jvjra3KvmkLaHI
IgS+RY9Pm4Ge0K7OOgwSaQQyI8nmU2M/fqle4lPoIPp5AVRc3+HxzNsZ26fi3rfM
nJ9GjhSYXjXzosjxHVaog0ke/A0fpEjafexinehlQqCQXt+EHQQ=
=x7DL
-----END PGP SIGNATURE-----

--hyxgnm2zmqtcvrze--

--===============0932139493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0932139493==--
