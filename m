Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B918E6FC757
	for <lists+dri-devel@lfdr.de>; Tue,  9 May 2023 15:01:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BC3B10E100;
	Tue,  9 May 2023 13:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B7F10E13F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 13:01:32 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4QFywC5NhWzDqQf
 for <dri-devel@lists.freedesktop.org>; Tue,  9 May 2023 13:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1683637291; bh=LBtNFLE4rSHTDT4vGpk1meBnyAlvr1A80tjp6koEN4Y=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PwnXGZfchTXL2dGb3iuzmphWLHjLYdNw4RC0pv83DrVFbBsa2jpu4A4Dzl/aWxYIr
 BEd8/r3nEAM8VsIA4p4vcU9lWPhkC7SVFAvlZ7ulS+FBT7ALDpPucriVgKeoxmRX0G
 9jvHE+zjGPCvnDYRARWgeGRlDYP/m/4p2tiVW4u4=
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4QFywB5Kdmz9tDM;
 Tue,  9 May 2023 13:01:30 +0000 (UTC)
X-Riseup-User-ID: F81916BD69713E85127CE74A03FB33058067503EA1E777353FBDA435BC5A0F2D
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4QFyw82mKhzFqgl;
 Tue,  9 May 2023 13:01:28 +0000 (UTC)
Message-ID: <6bf288c7-e903-4a92-1453-65471b3e564d@riseup.net>
Date: Tue, 9 May 2023 10:01:24 -0300
MIME-Version: 1.0
Subject: Re: [PATCH] MAINTAINERS: Add Maira to VKMS maintainers
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>
References: <20230508141038.327160-1-mairacanal@riseup.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <20230508141038.327160-1-mairacanal@riseup.net>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/8/23 11:10, Maíra Canal wrote:
> I've been contributing to VKMS with improvements, reviews, testing and
> debugging. Therefore, add myself as a co-maintainer of the VKMS driver.
> 
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>

Applied to drm/drm-misc (drm-misc-next).

Best Regards,
- Maíra Canal

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 276298cfc7ee..63e9b1e8c113 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6721,6 +6721,7 @@ F:	drivers/gpu/drm/udl/
>   DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>   M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>   M:	Melissa Wen <melissa.srw@gmail.com>
> +M:	Maíra Canal <mairacanal@riseup.net>
>   R:	Haneen Mohammed <hamohammed.sa@gmail.com>
>   R:	Daniel Vetter <daniel@ffwll.ch>
>   L:	dri-devel@lists.freedesktop.org
