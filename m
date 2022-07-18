Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C417577CD6
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 09:50:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7030211308F;
	Mon, 18 Jul 2022 07:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A4818BD36
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 07:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=MF54uPWA39WdpyvzNFa3Nwi+5BZJW0Zr5m+afzfs5+s=;
 b=KseBwiwl1nyGn/con7VBKsCD57S8MYsdF0ahRI8T4YrQ/icoQCix1MM+5/b+KZ2y036jbC5IRVRTf
 hCOvBBwjXdX7GaRY4M2CBQvmGW7megJOsEUvqaDNPuW7r3zuCcO9Tx636QOJgFOnjuG1Hou9D5AUUU
 N4hEVk+qK9LzS1jT5nx3/RADHHy7+KflqYEAZuSVuqk/2wSuvFNRiEFQt6vegY5hljAuUSUup5qGvF
 vIRjXh1xDXE7NNL/wPCZLoBRhzOFVEssIlVebDGDyc2oODRxtTNcr9vqANcGmK120WzYkQcm9S/STs
 EaJr0BXQjECpidI30E5DPUJl0s/gUmA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=MF54uPWA39WdpyvzNFa3Nwi+5BZJW0Zr5m+afzfs5+s=;
 b=RYRB344uh38jPKx8ts68t8UsdBqZ8sVClMgO6jAUR9lPVscmj4gHr9GVdzkpnGjl9KhqTOSKCB6bl
 CQbPLqLAg==
X-HalOne-Cookie: bdf5b569cb8c8400bfaa19b4830f59a711c05a20
X-HalOne-ID: 4cba18fe-066e-11ed-a918-d0431ea8a290
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 4cba18fe-066e-11ed-a918-d0431ea8a290;
 Mon, 18 Jul 2022 07:50:32 +0000 (UTC)
Date: Mon, 18 Jul 2022 09:50:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v1 02/11] drm: Rename CONFIG_DRM_LEGACY to CONFIG_DRM_DRI1
Message-ID: <YtUQxlqHQEEfXziA@ravnborg.org>
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <20220716181750.3874838-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220716181750.3874838-3-sam@ravnborg.org>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 16, 2022 at 08:17:41PM +0200, Sam Ravnborg wrote:
> The rename is done to make it more obvious what is DRI1 drivers
> and what is other type of legacy.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  arch/powerpc/configs/pmac32_defconfig |  2 +-
>  arch/powerpc/configs/ppc6xx_defconfig |  2 +-
>  drivers/char/agp/Makefile             |  2 +-
>  drivers/char/agp/agp.h                |  2 +-
>  drivers/gpu/drm/Kconfig               | 10 ++++-----
>  drivers/gpu/drm/Makefile              |  6 ++---
>  drivers/gpu/drm/drm_file.c            |  4 ++--
>  drivers/gpu/drm/drm_internal.h        |  2 +-
>  drivers/gpu/drm/drm_ioc32.c           | 12 +++++-----
>  drivers/gpu/drm/drm_ioctl.c           |  2 +-
>  drivers/gpu/drm/drm_legacy.h          | 32 +++++++++++++--------------
>  drivers/gpu/drm/drm_pci.c             |  4 ++--
>  drivers/gpu/drm/drm_vblank.c          |  8 +++----
>  drivers/gpu/drm/drm_vm.c              |  2 +-
>  include/drm/drm_auth.h                |  2 +-
>  include/drm/drm_device.h              |  2 +-
>  include/drm/drm_drv.h                 |  4 ++--
>  include/drm/drm_file.h                |  2 +-
>  include/drm/drm_legacy.h              |  2 +-
>  19 files changed, 51 insertions(+), 51 deletions(-)

I missed two hits in Documentation/ will add them in v2.

	Sam
