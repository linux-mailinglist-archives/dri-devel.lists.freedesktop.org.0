Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F08A77C6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 00:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BFA10E424;
	Tue, 16 Apr 2024 22:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bFYCvk0O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 792DA10E424
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 22:31:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 725851BF203;
 Tue, 16 Apr 2024 22:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713306664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tnFPGdAOdp8HdbbWeNxT8EznTGCleMyJgn9HOk9JBD4=;
 b=bFYCvk0ObGGOqG8OJAvERGIYG1gNqOaoVA1jG2lcVDgJnLy3SpINdm7NECgRPUM7bWRPOY
 c4HxTPUKZceCD4aYff6RAWbBzeRDjgHmJxr7CUzj+U8FcZQ7wBXCVmfZZXwEXjuczBl2Ig
 nEI87S50aIrbPSbnvgocJ/80Qn1m46drftniPeGRbnvSg9HDQKl1u0a+neY08C9Hyb7KGX
 r/QuIXRuB5yYZnIt7C4R6+RkLKV/ZwvPEfbmSNY1+HMqjsCXf83KnBcWYjrVLeuGlrVMWE
 e/M54NHbEbudOtdy5qJdp49l1eyLVu0F3rksXEGykrotaSKTiwrH5EjCXJQs1A==
Date: Wed, 17 Apr 2024 00:30:58 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/3] drm: drm_blend.c: Improve
 drm_plane_create_rotation_property kernel doc
Message-ID: <Zh78IolP2rwpk1Ti@localhost.localdomain>
Mail-Followup-To: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 thomas.petazzoni@bootlin.com
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
 <20240415143622.7e600508.pekka.paalanen@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240415143622.7e600508.pekka.paalanen@collabora.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 15/04/24 - 14:36, Pekka Paalanen a écrit :
> On Tue, 09 Apr 2024 12:04:06 +0200
> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> 
> > The expected behavior of the rotation property was not very clear. Add
> > more examples to explain what is the expected result.
> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> >  drivers/gpu/drm/drm_blend.c | 52 +++++++++++++++++++++++++++++++++------------
> >  1 file changed, 38 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> > index 8d4b317eb9d7..6fbb8730d8b0 100644
> > --- a/drivers/gpu/drm/drm_blend.c
> > +++ b/drivers/gpu/drm/drm_blend.c
> > @@ -104,6 +104,9 @@
> >   *	Without this property the rectangle is only scaled, but not rotated or
> >   *	reflected.
> >   *
> > + *	See drm_plane_create_rotation_property() for details about the expected rotation and
> > + *	reflection behavior.
> 
> I think internal function docs should be referring to UAPI docs, and
> not vice versa. Internal functions can change, but UAPI cannot.
> 
> > + *
> >   *	Possbile values:
> >   *
> >   *	"rotate-<degrees>":
> > @@ -114,18 +117,6 @@
> >   *		Signals that the contents of a drm plane is reflected along the
> >   *		<axis> axis, in the same way as mirroring.
> >   *
> > - *	reflect-x::
> > - *
> > - *			|o |    | o|
> > - *			|  | -> |  |
> > - *			| v|    |v |
> > - *
> > - *	reflect-y::
> > - *
> > - *			|o |    | ^|
> > - *			|  | -> |  |
> > - *			| v|    |o |
> > - *
> >   * zpos:
> >   *	Z position is set up with drm_plane_create_zpos_immutable_property() and
> >   *	drm_plane_create_zpos_property(). It controls the visibility of overlapping
> > @@ -266,8 +257,41 @@ EXPORT_SYMBOL(drm_plane_create_alpha_property);
> >   *
> >   * Rotation is the specified amount in degrees in counter clockwise direction,
> >   * the X and Y axis are within the source rectangle, i.e.  the X/Y axis before
> > - * rotation. After reflection, the rotation is applied to the image sampled from
> > - * the source rectangle, before scaling it to fit the destination rectangle.
> > + * rotation.
> > + *
> > + * Here are some examples of rotation and reflections:
> > + *
> > + * |o  +|  REFLECT_X  |+  o|
> > + * |    |  ========>  |    |
> > + * |    |             |    |
> > + *
> > + * |o   |  REFLECT_Y  |+   |
> > + * |    |  ========>  |    |
> > + * |+   |             |o   |
> > + *
> > + * |o  +|  ROTATE_90  |+   |
> > + * |    |  ========>  |    |
> > + * |    |             |o   |
> > + *
> > + * |o   |  ROTATE_180 |   +|
> > + * |    |  ========>  |    |
> > + * |+   |             |   o|
> > + *
> > + * |o   |  ROTATE_270 |+  o|
> > + * |    |  ========>  |    |
> > + * |+   |             |    |
> > + *
> > + * Rotation and reflection can be combined to handle more situations. In this condition, the
> > + * reflection is applied first and the rotation in second.
> 
> When going in which direction? Is the first image the FB source
> rectangle contents, and the second image what the plane looks like in
> CRTC frame of reference?

The first is the FB source, the second is the expected result on the CRTC 
output.

I will add a sentence before the schemas:

 * Here are some examples of rotation and reflections, on the left it is 
 * the content of the source frame buffer, on the right is the expected 
 * result on the CRTC output.

> 
> > + *
> > + * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X is:
> > + *
> > + * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
> > + * |    |  ========>  |    |  ========>  |    |
> > + * |    |             |    |             |+   |
> > + *
> > + * It is not possible to pass multiple rotation at the same time. (i.e ROTATE_90 | ROTATE_180 is
> > + * not the same as ROTATE_270 and is not accepted).
> >   */
> >  int drm_plane_create_rotation_property(struct drm_plane *plane,
> >  				       unsigned int rotation,
> > 
> 
> These are definitely improvements. I think they should just be in the
> UAPI section rather than implementation details.

So, somewhere in [1]? It feel strange because this is in the `GPU Driver 
Developer’s Guide` section, not a `UAPI interfaces`.

[1]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html

Thanks,
Louis Chauvet

> Disclaimer again to everyone else: I cannot tell if this is the correct
> documentation or its inverse.
> 
> 
> Thanks,
> pq



-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
