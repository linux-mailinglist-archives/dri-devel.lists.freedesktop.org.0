Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8785953267
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2024 16:05:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2A810E41C;
	Thu, 15 Aug 2024 14:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U6Sj2ZbX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8555D10E41C
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2024 14:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WUfv7OJc/PU4NaEESy5pBsrSe8xHadm8pC7Og5dgBmo=; b=U6Sj2ZbXAH4RrhmNigHv+tLjxU
 ReYKQDr7bYwPIilHf4jPXPSRQl6QKQrgyzRi2MXawuJDLTXL4WOwyDu6SqnrQ4rORrWl56n5IeiIo
 uu/e1xwp68nMxgsxIxDGjHkSXtqrkRs9zYsX3K0zyx0q8ppJmQYaXPH0VeYQd0q0mu3B8c7wTFkVq
 6FD4KFbZhRw3czpSAVFLq6UpoEca+Gw2MO+pNBoKKwYY1icZMqdSOnVjgs79E6UEpitIuE2LLmfMQ
 UgU0EylDGRsEaXtiDvN6xNTevDbFIWwBa9m0mFWci1ZXO85YSH1clHWvz6Oh8Wse56LpB5wP7u+rx
 d6NfyMTg==;
Received: from [187.36.213.55] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1seb6e-000dqO-Ql; Thu, 15 Aug 2024 16:05:36 +0200
Message-ID: <24a660e1-0f59-4214-96c1-aab29b266be4@igalia.com>
Date: Thu, 15 Aug 2024 11:05:27 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/vkms: Formatting and typo fix
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
 <20240814-google-clarifications-v1-1-3ee76d7d0c28@bootlin.com>
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
In-Reply-To: <20240814-google-clarifications-v1-1-3ee76d7d0c28@bootlin.com>
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
> Some newlines were missing around comments.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Applied to drm/misc/drm-misc-next!

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_drv.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 6860bee8e981..5aeb43592960 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -163,9 +163,11 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>   	dev->mode_config.max_height = YRES_MAX;
>   	dev->mode_config.cursor_width = 512;
>   	dev->mode_config.cursor_height = 512;
> -	/* FIXME: There's a confusion between bpp and depth between this and
> +	/*
> +	 * FIXME: There's a confusion between bpp and depth between this and
>   	 * fbdev helpers. We have to go with 0, meaning "pick the default",
> -	 * which ix XRGB8888 in all cases. */
> +	 * which is XRGB8888 in all cases.
> +	 */
>   	dev->mode_config.preferred_depth = 0;
>   	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>   
> 
