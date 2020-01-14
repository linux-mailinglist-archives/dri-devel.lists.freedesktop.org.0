Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCD413BAE4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 452A46E883;
	Wed, 15 Jan 2020 08:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BE96E420
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 15:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=agTmXyueBYkA9H2Awwyt+HKJI31tyTizTQvXjJSFHFE=; b=R3pjPmdneP/mV6KnDe2m1kdhM
 0vRWowX+v10BPmgqia2egvwTJVGJEwoOwrQ2LP4y7RLAmb3WmtP9KW1w39RO9bbJ+EO8S29BaLr/Y
 P6ismHG8CYL3sgaGw/GG5+kCliRiLgI81bP5ZiOdbsYAkM6vh8k4GTJa+FTxwhLcetYbBXHBHe0i0
 lPJGHkbDiFCd2qRrul2snnw/5NfStyAFQpywBFYyjSRNtJHpMAb3DFITGRzbe+o0NxHKUaM8ahZf3
 cBwi5aX6TvTcwNHSdBzOAdRTKLFKdmi17gfoM+yfzbXlMaWaGcCOoAJOe62pw7acd9/zeswcZkmEl
 JK0CVmHEw==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irORP-0006QH-BX; Tue, 14 Jan 2020 15:49:15 +0000
Subject: Re: [PATCH] drm: fix parameters documentation style
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200114142012.14389-1-benjamin.gaignard@st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <af791496-8934-1d7b-909d-ed50df3db356@infradead.org>
Date: Tue, 14 Jan 2020 07:49:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200114142012.14389-1-benjamin.gaignard@st.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 Jan 2020 08:27:50 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This all looks good except one item: (see below)

On 1/14/20 6:20 AM, Benjamin Gaignard wrote:
> Remove old documentation style and use new one to avoid warnings when
> compiling with W=1
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/gpu/drm/drm_dma.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_dma.c b/drivers/gpu/drm/drm_dma.c
> index e45b07890c5a..f90bdd4ac69d 100644
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
> + * return zero on success or a negative value on failure.

    * Return: zero on success or a negative value on failure.


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
> 

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
