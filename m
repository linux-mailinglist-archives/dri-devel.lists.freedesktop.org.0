Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AF3D9DF1
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 09:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5AEC6EC8E;
	Thu, 29 Jul 2021 07:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFF26EC8E;
 Thu, 29 Jul 2021 07:02:17 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D3322DD;
 Thu, 29 Jul 2021 09:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627542136;
 bh=NeD/gFoTV3UpfZZqxBN8JwajDJ1W1NGVYXQtORd3Abc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=fV0sQoBdeNox9CNVHA6twcDqxkhG3X6n7sE/B8de5v0KZ6ix8NQ4T0WU1P0/3UYZN
 5EO988nOGYDTMnRBYr6LWOtBD6ujsNQMZvb1xuJ03zx1BjNjpUyqsCOSbTj1qbrXO+
 EY3uMfl4kLWH1OKTjClu/n20aidtVanHbJq9lJkc=
Subject: Re: [PATCH 10/14] drm/tidss: Convert to Linux IRQ interfaces
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, alexander.deucher@amd.com, christian.koenig@amd.com,
 liviu.dudau@arm.com, brian.starkey@arm.com, sam@ravnborg.org,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi
References: <20210727182721.17981-1-tzimmermann@suse.de>
 <20210727182721.17981-11-tzimmermann@suse.de>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <8b4895f2-b4db-4ce7-440f-3408af56cc0d@ideasonboard.com>
Date: Thu, 29 Jul 2021 10:02:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727182721.17981-11-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/07/2021 21:27, Thomas Zimmermann wrote:
> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
> don't benefit from using it.
> 
> DRM IRQ callbacks are now being called directly or inlined.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/tidss/tidss_drv.c | 15 +++++----------
>   drivers/gpu/drm/tidss/tidss_drv.h |  2 ++
>   drivers/gpu/drm/tidss/tidss_irq.c | 27 ++++++++++++++++++++++++---
>   drivers/gpu/drm/tidss/tidss_irq.h |  4 +---
>   4 files changed, 32 insertions(+), 16 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Works fine on AM6 EVM. Some cleanups can be done in tidss_irq_install(), 
but those can be done later.

  Tomi
