Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF286751B67
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBF7410E171;
	Thu, 13 Jul 2023 08:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A87810E171
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:23:09 +0000 (UTC)
Received: from eldfell (unknown [194.136.85.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested) (Authenticated sender: pq)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 87AE36607044;
 Thu, 13 Jul 2023 09:23:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689236587;
 bh=e51I9tKEEgnLq1idN6LKZn85wZU/KdvFqtw7LfwYbYU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VDNM9zYoZJPBLUB3nQJX/Gu90Lh8J2pX19seIbcUjEqcCUMrBRomkRuk8owDTahJ/
 DZcvdWCPw0WeP/lLjw4lkXd1NBA1azdRfry9phT81tAhSJnc74j29iowgCHfGL9yDE
 3hwqdl6HsHObrBDCEzD9MIlEnpplsdQ1iyxZ1ofjWmFXC/9OvUFfbip/cz+wHcpmGY
 YzL/zpcUn1QN0myVQZGJKrmM0/GD3RDx1oUCYv54FAOm5v3lShOb21pxaqBS4EReWR
 alqRFohQIVkpNsYfGrvtNxAnXwY70r/m4woUHwQZDVccFHo8ePtCtbSJ5Zi0P0ItlR
 K8uEtfYBnWgkA==
Date: Thu, 13 Jul 2023 11:23:04 +0300
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/4] drm/doc: use cross-references for macros
Message-ID: <20230713112304.5ecac194.pekka.paalanen@collabora.com>
In-Reply-To: <20230712135723.173506-1-contact@emersion.fr>
References: <20230712135723.173506-1-contact@emersion.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 12 Jul 2023 13:57:26 +0000
Simon Ser <contact@emersion.fr> wrote:

> These will show up as monospace, and will get linkified as soon as
> we document the macro they point to.
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  Documentation/gpu/drm-uapi.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 65fb3036a580..f2fe6e8bd018 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -450,12 +450,12 @@ VBlank event handling
>  
>  The DRM core exposes two vertical blank related ioctls:
>  
> -DRM_IOCTL_WAIT_VBLANK
> +:c:macro:`DRM_IOCTL_WAIT_VBLANK`
>      This takes a struct drm_wait_vblank structure as its argument, and
>      it is used to block or request a signal when a specified vblank
>      event occurs.
>  
> -DRM_IOCTL_MODESET_CTL
> +:c:macro:`DRM_IOCTL_MODESET_CTL`
>      This was only used for user-mode-settind drivers around modesetting
>      changes to allow the kernel to update the vblank interrupt after
>      mode setting, since on many devices the vertical blank counter is
> @@ -478,8 +478,8 @@ The index is used in cases where a densely packed identifier for a CRTC is
>  needed, for instance a bitmask of CRTC's. The member possible_crtcs of struct
>  drm_mode_get_plane is an example.
>  
> -DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC ID's,
> -and the CRTC index is its position in this array.
> +:c:macro:`DRM_IOCTL_MODE_GETRESOURCES` populates a structure with an array of
> +CRTC ID's, and the CRTC index is its position in this array.
>  
>  .. kernel-doc:: include/uapi/drm/drm.h
>     :internal:

An excellent idea, and the syntax doesn't look obviously incorrect to
me, so

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks
pq
