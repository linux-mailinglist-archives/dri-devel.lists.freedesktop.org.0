Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8AD8C74C5
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB5E10EC53;
	Thu, 16 May 2024 10:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EIG5CWO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6773710EC53
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WsXuer6vlmF2frs6M0mRkWJUMiqFR4wogoKodqEE79Y=; b=EIG5CWO8wgD7/+bOl3BMH8D2LX
 jO9nWRjwkP+C5b2iszk5UomkWkA5PoAGZDt7TAHq7bs098DJPX+60JC9mlRZ029AfSNXgsooNw7ME
 /21Kw7T+gj2yAzzAgoeU7HanLtKHb61VeXEen3i1E1Fr6YPjq6Lq3wyAdcOVbKXxgIakvuze/tmgk
 QaKhxYfauSL/YJBEU62jbuUo/pfvMYxJMhgNrsMMGikV7pLioj2DFBJcp1/uaCeN27UiyBUJnTjTQ
 K1vcigcvoEx+yfcnvoCHWkxLy4PM1CSJHU16rgC/PWsXMlE8hRjlNJTtDkCkF3p7yt8DR9YWP68Kp
 sN/vloFg==;
Received: from [179.234.232.152] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1s7YaC-008mbj-VF; Thu, 16 May 2024 12:43:33 +0200
Message-ID: <c83255f4-745e-43e6-98e0-2e89c31d569a@igalia.com>
Date: Thu, 16 May 2024 07:43:21 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/17] drm/vkms: Remove useless drm_rotation_simplify
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 pekka.paalanen@haloniitty.fi
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <20240513-yuv-v7-0-380e9ffec502@bootlin.com>
 <20240513-yuv-v7-11-380e9ffec502@bootlin.com>
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
In-Reply-To: <20240513-yuv-v7-11-380e9ffec502@bootlin.com>
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

Hi Louis,

On 5/13/24 04:50, Louis Chauvet wrote:
> As all the rotation are now supported by VKMS, this simplification does
> not make sense anymore, so remove it.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

I'd like to push all commits up to this point to drm-misc-next. Do you
see a problem with it? Reason: I'd like Melissa to take a look at the
YUV patches and patches 1 to 11 fix several composition errors.

Let me know your thoughts about it.

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 8875bed76410..5a028ee96c91 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>   	frame_info->fb = fb;
>   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>   	drm_framebuffer_get(frame_info->fb);
> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
> -									  DRM_MODE_ROTATE_90 |
> -									  DRM_MODE_ROTATE_270 |
> -									  DRM_MODE_REFLECT_X |
> -									  DRM_MODE_REFLECT_Y);
> -
> +	frame_info->rotation = new_state->rotation;
>   
>   	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
>   }
> 
