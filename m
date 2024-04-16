Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA908A77C9
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 00:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5BAE112EC6;
	Tue, 16 Apr 2024 22:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mVbQBm30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990F6112EC5
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 22:31:06 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5ED29E0006;
 Tue, 16 Apr 2024 22:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1713306664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g9gPcWpJ1Hy7nug5A+nc0koarB8z3e1g969eocaINfc=;
 b=mVbQBm30oTDEzmV3SVfWmWVeXPGNs2dkzqvitONACdGQ8ejt2ELmTefSoZYx/LKfCj4mgj
 pCNAJgX8/u9WbGjCgBChe5lrsqeZr2LZV79YpCuMX6Jm1mwkDnfCZQab3S5AjrLdWkHqER
 fJ5r6h+EITOLvcsioIj/53CJAOXaiZhIZHohjIBjuqDjyt6M5wlGEgyTZ4vsS4VFiZcWxj
 sazJrDrucf964dGfDwgaaFAoTNYUHsrT7TAL/hielCAeKnc40qSNj2ZbLhF7PJiSXSk0Xc
 4GGrP42ZIzeIkFQfA6PfK577Yy31QcKfr2p/qQv6NYs86EXULUspLr5xbaQC8w==
Date: Wed, 17 Apr 2024 00:30:58 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH 2/3] drm: drm_blend.c: Improve
 drm_plane_create_rotation_property kernel doc
Message-ID: <Zh78InZWwvkEqul6@localhost.localdomain>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com,
 pekka.paalanen@collabora.com, thomas.petazzoni@bootlin.com
References: <20240409-google-drm-doc-v1-0-033d55cc8250@bootlin.com>
 <20240409-google-drm-doc-v1-2-033d55cc8250@bootlin.com>
 <Zh05hqtB9owzjjez@archie.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zh05hqtB9owzjjez@archie.me>
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

Le 15/04/24 - 21:28, Bagas Sanjaya a écrit :
> On Tue, Apr 09, 2024 at 12:04:06PM +0200, Louis Chauvet wrote:
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
> > + *
> > + * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X is:
> > + *
> > + * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
> > + * |    |  ========>  |    |  ========>  |    |
> > + * |    |             |    |             |+   |
> > + *
> > + * It is not possible to pass multiple rotation at the same time. (i.e ROTATE_90 | ROTATE_180 is
> > + * not the same as ROTATE_270 and is not accepted).
> 
> Sphinx reports htmldocs warnings on these transformation diagrams:
> 
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:265: ERROR: Undefined substitution referenced: "o +".
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:265: ERROR: Undefined substitution referenced: "+ o".
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:273: ERROR: Undefined substitution referenced: "o +".
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:277: ERROR: Undefined substitution referenced: "o | ROTATE_180 | +".
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:277: ERROR: Undefined substitution referenced: "+ | | o".
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:281: ERROR: Undefined substitution referenced: "o | ROTATE_270 |+ o".
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:290: ERROR: Undefined substitution referenced: "o +".
> Documentation/gpu/drm-kms:389: ./drivers/gpu/drm/drm_blend.c:290: ERROR: Undefined substitution referenced: "+ o".
> 
> I have to wrap them in literal blocks:
> 
> ---- >8 ----
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index 6fbb8730d8b022..f2cbf8d8efbbbc 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -259,36 +259,36 @@ EXPORT_SYMBOL(drm_plane_create_alpha_property);
>   * the X and Y axis are within the source rectangle, i.e.  the X/Y axis before
>   * rotation.
>   *
> - * Here are some examples of rotation and reflections:
> + * Here are some examples of rotation and reflections::
>   *
> - * |o  +|  REFLECT_X  |+  o|
> - * |    |  ========>  |    |
> - * |    |             |    |
> + *	|o  +|  REFLECT_X  |+  o|
> + *	|    |  ========>  |    |
> + *	|    |             |    |
>   *
> - * |o   |  REFLECT_Y  |+   |
> - * |    |  ========>  |    |
> - * |+   |             |o   |
> + *	|o   |  REFLECT_Y  |+   |
> + *	|    |  ========>  |    |
> + *	|+   |             |o   |
>   *
> - * |o  +|  ROTATE_90  |+   |
> - * |    |  ========>  |    |
> - * |    |             |o   |
> + *	|o  +|  ROTATE_90  |+   |
> + *	|    |  ========>  |    |
> + *	|    |             |o   |
>   *
> - * |o   |  ROTATE_180 |   +|
> - * |    |  ========>  |    |
> - * |+   |             |   o|
> + *	|o   |  ROTATE_180 |   +|
> + *	|    |  ========>  |    |
> + *	|+   |             |   o|
>   *
> - * |o   |  ROTATE_270 |+  o|
> - * |    |  ========>  |    |
> - * |+   |             |    |
> + *	|o   |  ROTATE_270 |+  o|
> + *	|    |  ========>  |    |
> + *	|+   |             |    |
>   *
>   * Rotation and reflection can be combined to handle more situations. In this condition, the
>   * reflection is applied first and the rotation in second.
>   *
> - * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X is:
> + * For example the expected result for DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X is::
>   *
> - * |o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
> - * |    |  ========>  |    |  ========>  |    |
> - * |    |             |    |             |+   |
> + *	|o  +|  REFLECT_X  |+  o|  ROTATE_90  |o   |
> + *	|    |  ========>  |    |  ========>  |    |
> + *	|    |             |    |             |+   |
>   *
>   * It is not possible to pass multiple rotation at the same time. (i.e ROTATE_90 | ROTATE_180 is
>   * not the same as ROTATE_270 and is not accepted).
> 
> Thanks.
> 
> -- 
> An old man doll... just what I always wanted! - Clara

It will be fixed in the next version, thanks!

Louis Chauvet

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
