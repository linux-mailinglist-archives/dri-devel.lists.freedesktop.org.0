Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1129756D2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 17:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E7210E8C8;
	Wed, 11 Sep 2024 15:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="juRBtldq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1374510E8C8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 15:19:42 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X3kl12syTzDr7Z;
 Wed, 11 Sep 2024 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1726067981; bh=eQVX/HvNAdH7ieNGqoe48A/iLANp6NUz/OVkfqmJaG0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=juRBtldqFJKpicpKyNTwaBFOH9eZeUVcwlumYmL0KVl0XOoTKIXDU+RYNQiJF1qrI
 VTcrdWt0opM+6ekd1l4/dkTMzRod6NjoYxRkr0QwLheVXu312VYknuQYv1yN3dOtwD
 YVv/4HuJE4ouhcZDO+12ZowgirEv8lssisxP8tpY=
X-Riseup-User-ID: C6F5CEFAD191BE4B1604FD126C732D41621C173EFC061F1032B4AE7545711846
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4X3kkx37K5zJrdB;
 Wed, 11 Sep 2024 15:19:37 +0000 (UTC)
Message-ID: <cf699ab0-8daf-4a1c-b195-0ebe01efa7d7@riseup.net>
Date: Wed, 11 Sep 2024 12:19:34 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: remove myself as a VKMS maintainer
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240911135051.44579-1-rodrigosiqueiramelo@gmail.com>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20240911135051.44579-1-rodrigosiqueiramelo@gmail.com>
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

On 9/11/24 10:50, Rodrigo Siqueira wrote:
> I haven't been able to follow or review the work on the driver for a
> long time and I don't see the situation improving anytime soon. Hence,
> this commit removes me from the maintainers list.
> 
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>

Acked-by: Maíra Canal <mairacanal@riseup.net>

Thanks for all your work on VKMS, Rodrigo! Would you mind applying this
patch on drm-misc? I'm a bit on a hurry this week.

Best Regards,
- Maíra

> ---
>   MAINTAINERS | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 333ed0718175..1e6356a1b6c7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7346,7 +7346,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>   F:	drivers/gpu/drm/udl/
>   
>   DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
> -M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>   M:	Maíra Canal <mairacanal@riseup.net>
>   R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>   R:	Simona Vetter <simona@ffwll.ch>
