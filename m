Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5CC953293
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D7510E42A;
	Thu, 15 Aug 2024 14:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DAfw62Z/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B0110E425
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RJ4T4U8nLMh+ZQ2Vs65FJCDqKIz6KxKL1v8cX4Zy8ss=; b=DAfw62Z/5NObi7T3b4KqBPmFDC
 yL2iKZp33FBa+AYH2012Lf4tYY16mRIh8k7zpcZ3zFL2KemjDyKUrgIt74BFzdhtx7iHqF6sN9fua
 FYOLJnfaAfmgNiB+MLSrZLRC0LYDapFiyVf6aOlo61eWMVr6Ntyanc6vTROugz0n9+SSHrQ0sB0EL
 SK0Y0aF5+NSi5NxQvlGJ6lZ4dQIFJ7H9Wjyf+TKTebG0DGdV5FCKFYda/az37qmVXshS65d/CZ64z
 MznFoaYBVrdmC7D9Tbr0bhmZxDX2nYdh+rC9yFSZwxwCFrcaZSnjJCKdxpZfhyMr4wRt0fCnevL5S
 hxCJGH4w==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1seb8Y-000dsP-FM; Thu, 15 Aug 2024 16:07:34 +0200
Message-ID: <1205c363-6635-4081-8155-5a8573481f3f@igalia.com>
Date: Thu, 15 Aug 2024 11:07:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/vkms: Rename index to possible_crtc
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com
References: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
 <20240814-google-clarifications-v1-2-3ee76d7d0c28@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240814-google-clarifications-v1-2-3ee76d7d0c28@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 8/14/24 05:46, Louis Chauvet wrote:
> The meaning of index was not clear. Replace them with crtc_index to
> clearly indicate its usage.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

IMHO no need for this patch, especially considering that you are going
to change those lines anyway in a future series.

I'd just drop it.

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_drv.h    |  4 ++--
>   drivers/gpu/drm/vkms/vkms_output.c | 13 +++++++------
>   drivers/gpu/drm/vkms/vkms_plane.c  |  4 ++--
>   3 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 526bf5207524..3028678e4f9b 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -222,10 +222,10 @@ struct vkms_device {
>   int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>   		   struct drm_plane *primary, struct drm_plane *cursor);
>   
> -int vkms_output_init(struct vkms_device *vkmsdev, int index);
> +int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index);
>   
>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index);
> +				   enum drm_plane_type type, int possible_crtc_index);
>   
>   /* CRC Support */
>   const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 5ce70dd946aa..d42ca7d10389 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -31,12 +31,12 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
>   	.get_modes    = vkms_conn_get_modes,
>   };
>   
> -static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
> +static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int possible_crtc_index,
>   				  struct drm_crtc *crtc)
>   {
>   	struct vkms_plane *overlay;
>   
> -	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, index);
> +	overlay = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_OVERLAY, possible_crtc_index);
>   	if (IS_ERR(overlay))
>   		return PTR_ERR(overlay);
>   
> @@ -46,7 +46,7 @@ static int vkms_add_overlay_plane(struct vkms_device *vkmsdev, int index,
>   	return 0;
>   }
>   
> -int vkms_output_init(struct vkms_device *vkmsdev, int index)
> +int vkms_output_init(struct vkms_device *vkmsdev, int possible_crtc_index)
>   {
>   	struct vkms_output *output = &vkmsdev->output;
>   	struct drm_device *dev = &vkmsdev->drm;
> @@ -58,20 +58,21 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>   	int writeback;
>   	unsigned int n;
>   
> -	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, index);
> +	primary = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_PRIMARY, possible_crtc_index);
> +
>   	if (IS_ERR(primary))
>   		return PTR_ERR(primary);
>   
>   	if (vkmsdev->config->overlay) {
>   		for (n = 0; n < NUM_OVERLAY_PLANES; n++) {
> -			ret = vkms_add_overlay_plane(vkmsdev, index, crtc);
> +			ret = vkms_add_overlay_plane(vkmsdev, possible_crtc_index, crtc);
>   			if (ret)
>   				return ret;
>   		}
>   	}
>   
>   	if (vkmsdev->config->cursor) {
> -		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> +		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, possible_crtc_index);
>   		if (IS_ERR(cursor))
>   			return PTR_ERR(cursor);
>   	}
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 03716616f819..9d85464ee0e9 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -219,12 +219,12 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>   };
>   
>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				   enum drm_plane_type type, int index)
> +				   enum drm_plane_type type, int possible_crtc_index)
>   {
>   	struct drm_device *dev = &vkmsdev->drm;
>   	struct vkms_plane *plane;
>   
> -	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << possible_crtc_index,
>   					   &vkms_plane_funcs,
>   					   vkms_formats, ARRAY_SIZE(vkms_formats),
>   					   NULL, type, NULL);
> 
