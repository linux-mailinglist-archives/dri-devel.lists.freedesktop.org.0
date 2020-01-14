Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7713BADC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 09:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA2A6E884;
	Wed, 15 Jan 2020 08:27:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D9C36E42C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2020 16:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EPdu6jKH9BabwJsppVguAQvshp7YDZguu0XuuX/c/D0=; b=mCHM91S0Qv9zp86Kbx4y8JE68
 Kg8FbWf5yglas5NifZ79OcRR6hudTGLqO2Azjuh8RsXzK4Ri4CQ/52NBA/YbhWTSqX6iluamOF7Rb
 PrHTtApg/QHlY1LQsHo+WncQkZO6TNs2ScASaisBxvb8NNCXyepqpmK7183akLUxbO7EQUDkr3+/k
 Z85AtMFI245VDmYGVuFgz2Nw5kY6gTZROEP4GTnRtzMS1LCWzggujWIV9OYiSHs+JhsGZXk0arPlJ
 jGrTxOpEakFxwwDqAiif/d5CXV8PULF3BmPhm5eattqD9ou8M2Tu3MIVS7IFtGyhEWz+xXoU18lMi
 EqqaIWaVg==;
Received: from [2601:1c0:6280:3f0::ed68]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irOfy-0003b4-NI; Tue, 14 Jan 2020 16:04:18 +0000
Subject: Re: [PATCH v2] drm: fix parameters documentation style
To: Benjamin Gaignard <benjamin.gaignard@st.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
References: <20200114160135.14990-1-benjamin.gaignard@st.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <df036eb5-6e08-3aec-f7c0-ce7db0486391@infradead.org>
Date: Tue, 14 Jan 2020 08:04:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200114160135.14990-1-benjamin.gaignard@st.com>
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

On 1/14/20 8:01 AM, Benjamin Gaignard wrote:
> Remove old documentation style and use new one to avoid warnings when
> compiling with W=1
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>

Looks good.  Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>


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
> 


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
