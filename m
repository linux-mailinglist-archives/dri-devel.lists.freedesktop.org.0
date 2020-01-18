Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898E1416DE
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jan 2020 10:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D4D89350;
	Sat, 18 Jan 2020 09:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D52A089350
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jan 2020 09:42:01 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C98AB803EF;
 Sat, 18 Jan 2020 10:41:57 +0100 (CET)
Date: Sat, 18 Jan 2020 10:41:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [PATCH v2] drm: fix parameters documentation style
Message-ID: <20200118094156.GB12245@ravnborg.org>
References: <20200114160135.14990-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114160135.14990-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=8b9GpE9nAAAA:8
 a=JfrnYn6hAAAA:8 a=e5mUnYsNAAAA:8 a=njsOEbNGQvRvgwHo9rwA:9
 a=CjuIK1q_8ugA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Benjamin

On Tue, Jan 14, 2020 at 05:01:35PM +0100, Benjamin Gaignard wrote:
> Remove old documentation style and use new one to avoid warnings when
> compiling with W=1
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Thanks for the warning fixes.
This is legacy stuff that is not even wired into the kernel-doc stuff.
But that is no excuse for old-style comments.

Applied to drm-misc-next.

	Sam

> ---
> CC: Randy Dunlap <rdunlap@infradead.org>
> version 2:
> - fix return documentation
> 
>  drivers/gpu/drm/drm_dma.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
> index e45b07890c5a..a7add55a85b4 100644
> --- a/drivers/gpu/drm/drm_dma.c
> +++ b/drivers/gpu/drm/drm_dma.c
> @@ -42,10 +42,10 @@
>  #include "drm_legacy.h"
>  
>  /**
> - * Initialize the DMA data.
> + * drm_legacy_dma_setup() - Initialize the DMA data.
>   *
> - * \param dev DRM device.
> - * \return zero on success or a negative value on failure.
> + * @dev: DRM device.
> + * Return: zero on success or a negative value on failure.
>   *
>   * Allocate and initialize a drm_device_dma structure.
>   */
> @@ -71,9 +71,9 @@ int drm_legacy_dma_setup(struct drm_device *dev)
>  }
>  
>  /**
> - * Cleanup the DMA resources.
> + * drm_legacy_dma_takedown() - Cleanup the DMA resources.
>   *
> - * \param dev DRM device.
> + * @dev: DRM device.
>   *
>   * Free all pages associated with DMA buffers, the buffers and pages lists, and
>   * finally the drm_device::dma structure itself.
> @@ -120,10 +120,10 @@ void drm_legacy_dma_takedown(struct drm_device *dev)
>  }
>  
>  /**
> - * Free a buffer.
> + * drm_legacy_free_buffer() - Free a buffer.
>   *
> - * \param dev DRM device.
> - * \param buf buffer to free.
> + * @dev: DRM device.
> + * @buf: buffer to free.
>   *
>   * Resets the fields of \p buf.
>   */
> @@ -139,9 +139,10 @@ void drm_legacy_free_buffer(struct drm_device *dev, struct drm_buf * buf)
>  }
>  
>  /**
> - * Reclaim the buffers.
> + * drm_legacy_reclaim_buffers() - Reclaim the buffers.
>   *
> - * \param file_priv DRM file private.
> + * @dev: DRM device.
> + * @file_priv: DRM file private.
>   *
>   * Frees each buffer associated with \p file_priv not already on the hardware.
>   */
> -- 
> 2.15.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
