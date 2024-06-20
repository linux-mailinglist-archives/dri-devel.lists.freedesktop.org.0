Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB4E9107B2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 16:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283A410E1C4;
	Thu, 20 Jun 2024 14:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SosjpOJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730B610E1C4
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 14:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718892799;
 bh=olSiu3J+EtvKE9a90Hz+Sv8Z0VuG5pOr75ws0mWvlSk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SosjpOJVY4lojik3GdezMYF6eS5mJbcN1xlua2+2zcVM9P9Bt1BFg1/C7ZOL7qzJn
 fhMrLnHvJkQULepPXbu1yO/iEek+7L/4hDo4bMyglCQ6OoG1gDrYXrj5vztxJ21hEM
 PZe2CdTMXNdOPccljc8Br22686dw8xQMuzQQVneRRA3JFG6NvPDAqzjGjvlYmfFV7p
 QnsEbTqSyM0oWbfD8/exWc8/3NvFNcbwh6xUxTMIygL0zbrT4Ldk7E84oyWni9WfjF
 bjKGCKAThtMyl7lNtzaPAAWsM2plaulqcuU0G5ugBzaJdubCLYUgldLxvp7pVRhzgi
 oDzH1GNXa1XWA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 07D2437821D3;
 Thu, 20 Jun 2024 14:13:18 +0000 (UTC)
Date: Thu, 20 Jun 2024 16:13:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Hari.PrasathGE@microchip.com>, <Dharma.B@microchip.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>, <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
Message-ID: <20240620161317.063833a9@collabora.com>
In-Reply-To: <20240620095856.777390-1-manikandan.m@microchip.com>
References: <20240620095856.777390-1-manikandan.m@microchip.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jun 2024 15:28:56 +0530
Manikandan Muralidharan <manikandan.m@microchip.com> wrote:

> Drop Sam Ravnborg and Boris Brezillon as they are no longer interested in
> maintaining the drivers. Add myself and Dharma Balasubiramani as the
> Maintainer and co-maintainer for Microchip's Atmel-HLCDC driver.
> Thanks for their work.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1566c647a50..8f2a40285544 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7290,8 +7290,8 @@ F:	drivers/gpu/drm/ci/xfails/meson*
>  F:	drivers/gpu/drm/meson/
>  
>  DRM DRIVERS FOR ATMEL HLCDC
> -M:	Sam Ravnborg <sam@ravnborg.org>
> -M:	Boris Brezillon <bbrezillon@kernel.org>
> +M:	Manikandan Muralidharan <manikandan.m@microchip.com>
> +M:	Dharma Balasubiramani <dharma.b@microchip.com>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Supported
>  T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

