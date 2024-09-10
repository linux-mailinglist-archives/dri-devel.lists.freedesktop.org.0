Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C889742E5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2024 21:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047A410E8FB;
	Tue, 10 Sep 2024 19:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="RidbVF29";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 411 seconds by postgrey-1.36 at gabe;
 Tue, 10 Sep 2024 19:04:12 UTC
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F5B110E8FB
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2024 19:04:12 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4X3Ccc3Cd2zDqQb;
 Tue, 10 Sep 2024 18:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1725994640; bh=bZeq4Z0ebYhUDCoVLKa5FdvS8mzxM7LPMAKj+72Khq8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RidbVF29rcddgvB1cUw8jtrfsKRJiSaaNnJf2ZwdwcaGShZfJUlSOpLs2OYkdHBSS
 Y83L/a3wzynlNa1STRtO9KjLDRK8WNgdMEzhN4+ANvnC2RS1rEmiW7h0q/djNva5iX
 7RG/yMG6DLH85BDbta5GLVPmEDbPSdPQqYt73V0g=
X-Riseup-User-ID: 16F9D23D34EC5F58F723AA569FAF8A047F08E4FE3B91D97D89884668576CD256
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4X3CcX1n6HzJtyM;
 Tue, 10 Sep 2024 18:57:16 +0000 (UTC)
Message-ID: <68da3932-10ab-4001-a978-f0f54034a64d@riseup.net>
Date: Tue, 10 Sep 2024 15:57:13 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as VKMS Maintainer
To: Louis Chauvet <louis.chauvet@bootlin.com>, rodrigosiqueiramelo@gmail.com, 
 melissa.srw@gmail.com, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, sean@poorly.run
Cc: thomas.petazzoni@bootlin.com, linux-kernel@vger.kernel.org,
 seanpaul@google.com
References: <20240910-vkms-maintainer-v1-1-e7a6c7a4ae71@bootlin.com>
Content-Language: en-US
From: Maira Canal <mairacanal@riseup.net>
In-Reply-To: <20240910-vkms-maintainer-v1-1-e7a6c7a4ae71@bootlin.com>
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

On 9/10/24 12:10, Louis Chauvet wrote:
> I've been actively working on VKMS to provide new features and
> participated in reviews and testing. To help Maìra with her work, add
> myself as co-maintainer of VKMS.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Acked-by: Maíra Canal <mairacanal@riseup.net>

Please, check the procedures to apply for commit rights in drm-misc and
apply it. This way you will be able to commit your patches.

Thanks for volunteering!

Best Regards,
- Maíra

> ---
> Hi everyone,
> 
> This series [1] has been waiting for a while now, it was proposed first in
> February. The first iterations had few reactions (thanks to Arthur, Pekka,
> Maìra, ...), but since v8 (in May) no major issues were reported, Maìra
> seemed satisfied, and only minor cosmetic changes were reported. Two other
> series ([2] and [3]), that I submitted first in May, did not have receive
> any reactions.
> 
> In addition, there is also some significant addition to VKMS being
> proposed, such as ConfigFS support, and without a clear maintainer having
> the time to review and approve these changes, these changes have very
> little changes to get in.
> 
> VKMS is not a fundamental driver for "normal" Linux users, but I had some
> feedback from userspace developpers that VKMS could be a very good testing
> tool if only it had more features (I think P0xx formats were asked to
> test HDR for example). This could also help to detect issues in DRM core
> by emulating a wide range of configurations.
> 
> I believe the only active maintainer is Maìra, but as she's mentioned before,
> she doesn't have much time to work on VKMS. So, I'd like to volunteer as a
> maintainer. I have plenty of time to dedicate to VKMS.
> 
> I hope I've gained enough understanding of VKMS to be helful with this role.
> I am eager to move forward and improve this subsystem. I've also talked to Sean
> about this, and he agrees that it would be good if I could commit code to
> drm-misc.
> 
> [1]: https://lore.kernel.org/all/20240809-yuv-v10-0-1a7c764166f7@bootlin.com/
> [2]: https://lore.kernel.org/all/20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com/
> [3]: https://lore.kernel.org/all/20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com/
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 10430778c998b57944c1a6c5f07d676127e47faa..62f10356e11ab7fa9c8f79ba63b335eb6580d0a8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7340,6 +7340,7 @@ DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>   M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>   M:	Melissa Wen <melissa.srw@gmail.com>
>   M:	Maíra Canal <mairacanal@riseup.net>
> +M:	Louis Chauvet <louis.chauvet@bootlin.com>
>   R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>   R:	Daniel Vetter <daniel@ffwll.ch>
>   L:	dri-devel@lists.freedesktop.org
> 
> ---
> base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
> change-id: 20240910-vkms-maintainer-7b3d2210cc1b
> 
> Best regards,
