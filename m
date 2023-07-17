Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 872A8755EC2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA4F10E0CA;
	Mon, 17 Jul 2023 08:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39DDC10E0F4
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:50:39 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8805B6607008;
 Mon, 17 Jul 2023 09:50:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689583836;
 bh=FA0WJ/4w/kSzok3YACKCV67AqsSFqdugv/Hgl8UwAzY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PcSduDWtb1r5ca/n7wrdp7xyWfHgTXKEhzmpEusqlt6iuTc5Yp0DTaMI0gchYMUU6
 d09xC3daHVNl4eYpKXdCtTULqDgLYvJaqu/CisyjR9EfMb9m/48VwtqrtXQvAn2ajk
 604rpQLlvC8ANUeCmYBG9gqepAqN8meE8uhKFE3luHoxPQCVIqVRwDlzVOcj2pmgWP
 LhewRDKOao5MtmsyS8iUNT3n0Hrl2ulX1nLnSB1GGwgzyQDz+iYT9NXkYlp0+2hyXc
 wq3h5TLvSupI3PTtBQdS55ZVxVF3dEkUNlnOp/gJOp6ho0n+xHbr2WyB+o2FAk3h3f
 9dMLmQBg5lw8w==
Date: Mon, 17 Jul 2023 10:50:33 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add Boris Brezillon as Panfrost driver
 maintainer
Message-ID: <20230717105033.4805a864@collabora.com>
In-Reply-To: <20230717081544.1068254-1-dmitry.osipenko@collabora.com>
References: <20230717081544.1068254-1-dmitry.osipenko@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 17 Jul 2023 11:15:44 +0300
Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:

> Add Boris Brezillon as Panfrost driver maintainer. Boris is a new lead
> developer of the Panfrost Mesa driver and main developer behind the
> upcoming Panthor kernel driver that will serve next-gen Mali GPUs.
> 
> Remove Tomeu and Alyssa, who left Collabora and stepped down from working
> on Panfrost.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5d6536fef2fc..08dc75916148 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1615,9 +1615,8 @@ F:	drivers/gpu/drm/arm/display/komeda/
>  
>  ARM MALI PANFROST DRM DRIVER
>  M:	Rob Herring <robh@kernel.org>
> -M:	Tomeu Vizoso <tomeu.vizoso@collabora.com>
> +M:	Boris Brezillon <boris.brezillon@collabora.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

>  R:	Steven Price <steven.price@arm.com>
> -R:	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc

