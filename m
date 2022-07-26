Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BE95818B8
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 19:42:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1041E14B5EA;
	Tue, 26 Jul 2022 17:41:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E6318A54B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=j5bWJgzBVEE+PhPKODlNa4Pi48hYbS+iK5aozgFL7v0=;
 b=niHq7qImHKtDbDMQHxtyenjqlI/79cQPZoJSJDulvroHANfuhcFxrb2ddJDYETb4gmGkldOuuGFTs
 tsrtZCq4XwUyaRW+ihb2GBObq89EKCZcAw0TpEZb/3royR07sWk5TnN2U3p7zUxTPFXl/MlANYAi8u
 rohh5/aSMzb6ooSnEnifMVdUeXSeX6rpFtwwXWOxIrEcwfDBJfVG0g6FsPvPFAXl9hos8d44RL5i4a
 e7BiJHnkPUyLaK+e7aSWtcpEyJM8TyaE8NAw5NrkG0ICcP9BfMPLNY0b7TzYdc1kFJ+b6gdXTImcMJ
 COd1Itbp8crF1u2gsVkJwbXC+pViidQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=j5bWJgzBVEE+PhPKODlNa4Pi48hYbS+iK5aozgFL7v0=;
 b=+fKx1SZb/BVNam2oqoPdIHXDlb9V7tFv1gsnApkDQe32x/6/Jt61Fcs/jeUSnxBAishJ8wWl8zBeQ
 y7eeKQtDg==
X-HalOne-Cookie: fc807437b5c2b1c804144334132ec133da98242b
X-HalOne-ID: 3adcb99a-0d0a-11ed-a918-d0431ea8a290
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3adcb99a-0d0a-11ed-a918-d0431ea8a290;
 Tue, 26 Jul 2022 17:41:50 +0000 (UTC)
Date: Tue, 26 Jul 2022 19:41:49 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: [PATCH v3 26/32] drm/via: Add via_drm.h
Message-ID: <YuAnXcz0ImO+cAHu@ravnborg.org>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-7-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220725235359.20516-7-kevinbrace@gmx.com>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

On Mon, Jul 25, 2022 at 04:53:53PM -0700, Kevin Brace wrote:
> From: Kevin Brace <kevinbrace@bracecomputerlab.com>
> 
> Changed the uAPI.
> 
> Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>

It would be great to have the new extensions to the UAPI documented
using kernel-doc.
As an example see: vc4_drm.h

There are a lot of UAPI that is missing documentation, but if we do not
add it for new UAPI then this situation never improves.

Please use __u32, __u64 like you see in other drm UAPI files.

PS. If you reply to this mail, then please keep the full mail as
usually my mails to Kevin bounces (something with STARTTLS).

	Sam

> ---
>  include/uapi/drm/via_drm.h | 35 +++++++++++++++++++++++++++++++----
>  1 file changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/include/uapi/drm/via_drm.h b/include/uapi/drm/via_drm.h
> index a1e125d42208..e9da45ce130a 100644
> --- a/include/uapi/drm/via_drm.h
> +++ b/include/uapi/drm/via_drm.h
> @@ -1,4 +1,5 @@
>  /*
> + * Copyright © 2020 Kevin Brace
>   * Copyright 1998-2003 VIA Technologies, Inc. All Rights Reserved.
>   * Copyright 2001-2003 S3 Graphics, Inc. All Rights Reserved.
>   *
> @@ -16,10 +17,10 @@
>   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>   * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> - * VIA, S3 GRAPHICS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
> - * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> - * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> - * DEALINGS IN THE SOFTWARE.
> + * THE AUTHORS, COPYRIGHT HOLDERS, AND/OR ITS SUPPLIERS BE LIABLE FOR ANY
> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT
> + * OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR
> + * THE USE OR OTHER DEALINGS IN THE SOFTWARE.
>   */
Do not mix license changes with other changes - and use SPDX tag if
possible for the updated license.
See other drm UAPI files for examples.


>  #ifndef _VIA_DRM_H_
>  #define _VIA_DRM_H_
> @@ -81,6 +82,11 @@ extern "C" {
>  #define DRM_VIA_DMA_BLIT        0x0e
>  #define DRM_VIA_BLIT_SYNC       0x0f
> 
> +#define	DRM_VIA_GEM_CREATE	0x10
> +#define	DRM_VIA_GEM_MAP		0x11
> +#define	DRM_VIA_GEM_UNMAP	0x12
> +
Use the same alignment as the previous lines.
> +
Drop extra empty line.

>  #define DRM_IOCTL_VIA_ALLOCMEM	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_ALLOCMEM, drm_via_mem_t)
>  #define DRM_IOCTL_VIA_FREEMEM	  DRM_IOW( DRM_COMMAND_BASE + DRM_VIA_FREEMEM, drm_via_mem_t)
>  #define DRM_IOCTL_VIA_AGP_INIT	  DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_AGP_INIT, drm_via_agp_t)
> @@ -97,6 +103,10 @@ extern "C" {
>  #define DRM_IOCTL_VIA_DMA_BLIT    DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_DMA_BLIT, drm_via_dmablit_t)
>  #define DRM_IOCTL_VIA_BLIT_SYNC   DRM_IOW(DRM_COMMAND_BASE + DRM_VIA_BLIT_SYNC, drm_via_blitsync_t)
> 
> +#define	DRM_IOCTL_VIA_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_CREATE, struct drm_via_gem_create)
> +#define	DRM_IOCTL_VIA_GEM_MAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_VIA_GEM_MAP, struct drm_via_gem_map)
> +#define	DRM_IOCTL_VIA_GEM_UNMAP		DRM_IOR(DRM_COMMAND_BASE + DRM_VIA_GEM_UNMAP, struct drm_via_gem_unmap)
> +
Use same alignment as previous lines.

>  /* Indices into buf.Setup where various bits of state are mirrored per
>   * context and per buffer.  These can be fired at the card as a unit,
>   * or in a piecewise fashion as required.
> @@ -275,6 +285,23 @@ typedef struct drm_via_dmablit {
>  	drm_via_blitsync_t sync;
>  } drm_via_dmablit_t;
> 
> +struct drm_via_gem_create {
> +	uint64_t size;
> +	uint32_t alignment;
> +	uint32_t domain;
> +	uint32_t handle;
> +	uint64_t offset;
> +};
I do not know if this is relevant, but adding a 64 bit parameter
(offset) that is only 32 bit aligned looks like trouble to me.
I hope others that knows this better can comment here.

> +
> +struct drm_via_gem_map {
> +	uint32_t handle;
> +	uint64_t map_offset;
> +};
Same here with the alignment.

If drm_via_gem_create.offset and drm_via_gem_map.map_offset is the same
the field should have the same name - to make the API easier to use.


> +
> +struct drm_via_gem_unmap {
> +	uint32_t handle;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> --
> 2.35.1
