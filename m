Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326F5A15F9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D40D10E724;
	Thu, 25 Aug 2022 15:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC10B10E724
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 15:44:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69804B829E4;
 Thu, 25 Aug 2022 15:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A528C433D6;
 Thu, 25 Aug 2022 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661442249;
 bh=NI6bEWYxT3wUsy1ctPQSrY15pyDD3bTfE83vKL08zDI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=gDW9NnyYKg6fq6+foprxelMsgqSx8RSZKHJ9O45rfWPGFJaaUZkUyIHgZry6sgo41
 zBXF87faDMn1a2lm5Lt85WwsybbFpHwPKhhpjr8JD+73269vAmeVB/yqtGXCd3/nCa
 qd9vc6NKxAF1avhIcHwX6VnkwEcWyFUFackn1jaayMNI5WRxt7FW8ldNCHCpQIRdlW
 8tirQsknuDKdJPdcLRj9H5p+AGNPdQfdCOKomT4I2p7Hnz4/KT+RvhhXPQSRDv+pIn
 m2TjjrGcDu0qh44nKRKt6qHIcj5+iM0jEhWRZI9WGg7iGp9yslgoWBcbIjlQfQW1bs
 4o1+ozVqmBuoA==
Date: Thu, 25 Aug 2022 10:43:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: Re: [PATCH v2 1/3] PCI: Move
 PCI_VENDOR_ID_MICROSOFT/PCI_DEVICE_ID_HYPERV_VIDEO definitions to pci_ids.h
Message-ID: <20220825154345.GA2853885@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220825090024.1007883-2-vkuznets@redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, linux-pci@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Dexuan Cui <decui@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Deepak Rawat <drawat.floss@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 25, 2022 at 11:00:22AM +0200, Vitaly Kuznetsov wrote:
> There are already three places in kernel which define PCI_VENDOR_ID_MICROSOFT
> and two for PCI_DEVICE_ID_HYPERV_VIDEO and there's a need to use these
> from core Vmbus code. Move the defines where they belong.
> 
> No functional change.
> 
> Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# pci_ids.h

> ---
>  drivers/gpu/drm/hyperv/hyperv_drm_drv.c         | 3 ---
>  drivers/net/ethernet/microsoft/mana/gdma_main.c | 4 ----
>  drivers/video/fbdev/hyperv_fb.c                 | 4 ----
>  include/linux/pci_ids.h                         | 3 +++
>  4 files changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 6d11e7938c83..40888e36f91a 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -23,9 +23,6 @@
>  #define DRIVER_MAJOR 1
>  #define DRIVER_MINOR 0
>  
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
> -
>  DEFINE_DRM_GEM_FOPS(hv_fops);
>  
>  static struct drm_driver hyperv_driver = {
> diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> index 5f9240182351..00d8198072ae 100644
> --- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
> +++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> @@ -1465,10 +1465,6 @@ static void mana_gd_shutdown(struct pci_dev *pdev)
>  	pci_disable_device(pdev);
>  }
>  
> -#ifndef PCI_VENDOR_ID_MICROSOFT
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#endif
> -
>  static const struct pci_device_id mana_id_table[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_PF_DEVICE_ID) },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_MICROSOFT, MANA_VF_DEVICE_ID) },
> diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
> index 886c564787f1..b58b445bb529 100644
> --- a/drivers/video/fbdev/hyperv_fb.c
> +++ b/drivers/video/fbdev/hyperv_fb.c
> @@ -74,10 +74,6 @@
>  #define SYNTHVID_DEPTH_WIN8 32
>  #define SYNTHVID_FB_SIZE_WIN8 (8 * 1024 * 1024)
>  
> -#define PCI_VENDOR_ID_MICROSOFT 0x1414
> -#define PCI_DEVICE_ID_HYPERV_VIDEO 0x5353
> -
> -
>  enum pipe_msg_type {
>  	PIPE_MSG_INVALID,
>  	PIPE_MSG_DATA,
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 6feade66efdb..15b49e655ce3 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2079,6 +2079,9 @@
>  #define PCI_DEVICE_ID_ICE_1712		0x1712
>  #define PCI_DEVICE_ID_VT1724		0x1724
>  
> +#define PCI_VENDOR_ID_MICROSOFT		0x1414
> +#define PCI_DEVICE_ID_HYPERV_VIDEO	0x5353
> +
>  #define PCI_VENDOR_ID_OXSEMI		0x1415
>  #define PCI_DEVICE_ID_OXSEMI_12PCI840	0x8403
>  #define PCI_DEVICE_ID_OXSEMI_PCIe840		0xC000
> -- 
> 2.37.1
> 
