Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B248D1EFF
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 16:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98EFD10E3A4;
	Tue, 28 May 2024 14:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XDMbvyWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F9A010E1FF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 14:39:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B7B71BF206;
 Tue, 28 May 2024 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1716907139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLq5Uw1TEjcVWqK5vDujFKNffwzE1pT42/zxaT6ILOc=;
 b=XDMbvyWiXi8LAEY/lliz2lyTsgwwYTupAw8dULqM3TIIJoCT478dRDYbSTvvtUjaZU2B8k
 PxeQUPGinSHdhjLx4hoOkOt4+Jm91y6KgjwBOH7IF/RA3j5EfMmYvmHMY2xtIJSErn3WAI
 a65uuPp1/e77JzdFdvHZugeJX5aWSJVICvbfhDBVw3dkqSXECIox93ehqpgrT/+EtqjXh3
 OCJoBSl6l1ZM+ocY3ekjItUTGgNVboB/RoXY+6Bt46ygoeXwlAygFmGrDGUzGdh0/hZ2jM
 a0Vrx3CWSZFbDecB/gNPbYCqtjomfBz4cXS4CPApOCc+4LmNrHUH5967gZIpWw==
Date: Tue, 28 May 2024 16:38:56 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Bruno Rocha Levi <brunolevilevi@usp.br>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, Bruno Rocha Levi <brunolevilevi@gmail.com>,
 Lucas Antonio <lucasantonio.santos@usp.br>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/vkms: Fix misalignment in comment block
Message-ID: <ZlXsf_c1TYbhslJJ@localhost.localdomain>
References: <20240528131026.214773-1-brunolevilevi@usp.br>
 <20240528131026.214773-2-brunolevilevi@usp.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240528131026.214773-2-brunolevilevi@usp.br>
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

Le 28/05/24 - 10:08, Bruno Rocha Levi a écrit :
> From: Bruno Rocha Levi <brunolevilevi@gmail.com>
> 
> This change fixes a warning from checkpatch, it improves readability of a
> comment that was previously misaligned, by ensuring the trailing */ is on
> the same line as the opening /*.

Hi,

Do you mean same column?

Maybe in the same patch, also add the missing first empty line in the 
comment [1]:

	/*
	 * FIXME: [...]
	 */

https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting

Thanks,
Louis Chauvet
 
> Co-developed-by: Lucas Antonio <lucasantonio.santos@usp.br>
> Signed-off-by: Lucas Antonio <lucasantonio.santos@usp.br>
> Signed-off-by: Bruno Rocha Levi <brunolevilevi@usp.br>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index dd0af086e..e8612759a 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -166,7 +166,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
>  	dev->mode_config.cursor_height = 512;
>  	/* FIXME: There's a confusion between bpp and depth between this and
>  	 * fbdev helpers. We have to go with 0, meaning "pick the default",
> -	 * which ix XRGB8888 in all cases. */
> +	 * which ix XRGB8888 in all cases.
> +	 */
>  	dev->mode_config.preferred_depth = 0;
>  	dev->mode_config.helper_private = &vkms_mode_config_helpers;
>  
> -- 
> 2.45.1
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
