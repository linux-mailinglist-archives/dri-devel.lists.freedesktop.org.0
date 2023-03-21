Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1726C3B0B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 20:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B87410E80A;
	Tue, 21 Mar 2023 19:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02B6310E80A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 19:54:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 0492F5C00FE;
 Tue, 21 Mar 2023 15:54:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 21 Mar 2023 15:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1679428459; x=1679514859; bh=jTPq0Kd/2WaBwq+bJkUb+nWQqpN+ilYaZPA
 W/SU4DYQ=; b=jyWVCxM6GV72laMwsawzCfC5aQI87+0NtX7VpAx5SBxFH7FwYm7
 kxaMgtJhbu4GqrT/Y82SWrFf6hAveGdlLlkYU9r/VSomg3VpNyjvS2x7yFE23/ek
 LBWlHZIJL8oM+OCGikIP6W4LROz4SDehP/yQ0Qo7DjR1yetajK4WLekpLfWyThEs
 Rz8DlIsApRmV6GB+E9ZnXoYcj5Vw3ZzSiPBMpRN4Rps42IbXcySpva0ZiDF+Mj/1
 bRQ/7slDCNP53Qn63m+L9oNOY4bxOk5Gkj4VUWE6uUfB/nwteXzHkCBmdIjl1qek
 /UpY7znMXIb77Lkhx4jtJM07OvELOxixE0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
 1679428459; x=1679514859; bh=jTPq0Kd/2WaBwq+bJkUb+nWQqpN+ilYaZPA
 W/SU4DYQ=; b=RG3/0xURcYxS7xzklwlJjrG5w9GFsQ//wD1jdPiO5Reiz2uMLyt
 5UVZjOW7vxugxwhrC8NYCfMT3yu3DIEE6VcCRu7BREPMVSpMaJZbwA7PS4sQeaXk
 RVAdacWVzSiFnKkhKkrIBGCLeJTppv2u2k6c0IXZeu9GNGyRzivONybqEUYG6Y2Q
 FhmZ0r1mfE8H1e+DmKEubDu5T0nvgYIajzFFwtUH4HZw65tk359fdcjsuJseNSPa
 OoQO/TeAXeFI6sbBoM7pWAhbHMceuG29kRtnpVCry33t6zvY9JAq1bB9wlXN7p/I
 ajq373L04HbsnF7ZpW4hSvI+E8WkBzaLcFw==
X-ME-Sender: <xms:agsaZDtCJ7dDaiQngI0jNh1ssO1vIOH8-jrgJZD4Zko0Z_5s7rMP2g>
 <xme:agsaZEdRksHMclOdoyEDFRLeiiLn16wjSO2bOjoyzzL71Mua1_0eYlVKip1tftGrS
 5Nw7o3srGZl889FHPg>
X-ME-Received: <xmr:agsaZGy9JlcpIV9R0GtF8-b4nckG4efAD8wGQjpvizotjKOemWr2CvlNYU8oKw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegtddguddvlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttdefjeenucfhrhhomhepfdgm
 fdforggriicuofhomhgsrghsrgifrghlrgculdggofifrghrvgdmfdcuoehmrggriihmse
 hfrghsthhmrghilhdrtghomheqnecuggftrfgrthhtvghrnhepteffhfegvddvgfeutdet
 heffjeelhffgudefudeujedvveehveeuhfethfdtjeffnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrgiimhesfhgrshhtmhgrihhlrdgt
 ohhm
X-ME-Proxy: <xmx:agsaZCMbIXYwBBqCU8yBJ7mio4JI2LcucrrIvhvRaCH_5wHFUg5v2g>
 <xmx:agsaZD_EAaVBZJqxXe6g3Enf6MwYG6zrl6vLah1XxyxI-YDZbb-FGg>
 <xmx:agsaZCXFC-V8LA5145AbjjGM5fOrBsn8INWMnl1tbQnN8iDjoCRXOQ>
 <xmx:awsaZPZw9A8f7TnGl9d3JlME_ValjoywUZBBNvsSuSZjmCYGVGaHEA>
Feedback-ID: i1b1946fb:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Mar 2023 15:54:18 -0400 (EDT)
Message-ID: <5ae49181-7be3-5c74-2d48-32bf79a5420f@fastmail.com>
Date: Tue, 21 Mar 2023 12:54:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/3] drm/vmwgfx: Print errors when running on
 broken/unsupported configs
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230321020949.335012-1-zack@kde.org>
 <20230321020949.335012-2-zack@kde.org>
Content-Language: en-US
From: "\"Maaz Mombasawala (VMware)" <maazm@fastmail.com>
In-Reply-To: <20230321020949.335012-2-zack@kde.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: krastevm@vmware.com, iforbes@vmware.com, mombasawalam@vmware.com,
 banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/20/23 19:09, Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
> 
> virtualbox implemented an incomplete version of the svga device which
> they decided to drop soon after the initial release. The device was
> always broken in various ways and never supported by vmwgfx.
> 
> vmwgfx should refuse to load on those configurations but currently
> drm has no way of reloading fbdev when the specific pci driver refuses
> to load, which would leave users without a usable fb. Instead of
> refusing to load print an error and disable a bunch of functionality
> that virtualbox never implemented to at least get fb to work on their
> setup.
> 
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 29 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h |  2 ++
>  drivers/gpu/drm/vmwgfx/vmwgfx_msg.c |  9 +++++++++
>  3 files changed, 40 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 2588615a2a38..8b24ecf60e3e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -45,6 +45,9 @@
>  #include <drm/ttm/ttm_placement.h>
>  #include <generated/utsrelease.h>
>  
> +#ifdef CONFIG_X86
> +#include <asm/hypervisor.h>
> +#endif
>  #include <linux/cc_platform.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/module.h>
> @@ -897,6 +900,16 @@ static int vmw_driver_load(struct vmw_private *dev_priv, u32 pci_id)
>  				 cap2_names, ARRAY_SIZE(cap2_names));
>  	}
>  
> +	if (!vmwgfx_supported(dev_priv)) {
> +		vmw_disable_backdoor();
> +		drm_err_once(&dev_priv->drm,
> +			     "vmwgfx seems to be running on an unsupported hypervisor.");
> +		drm_err_once(&dev_priv->drm,
> +			     "This configuration is likely broken.");
> +		drm_err_once(&dev_priv->drm,
> +			     "Please switch to a supported graphics device to avoid problems.");
> +	}
> +
>  	ret = vmw_dma_select_mode(dev_priv);
>  	if (unlikely(ret != 0)) {
>  		drm_info(&dev_priv->drm,
> @@ -1320,6 +1333,22 @@ static void vmw_master_drop(struct drm_device *dev,
>  	vmw_kms_legacy_hotspot_clear(dev_priv);
>  }
>  
> +bool vmwgfx_supported(struct vmw_private *vmw)
> +{
> +#if defined(CONFIG_X86)
> +	return hypervisor_is_type(X86_HYPER_VMWARE);
> +#elif defined(CONFIG_ARM64)
> +	/*
> +	 * On aarch64 only svga3 is supported
> +	 */
> +	return vmw->pci_id == VMWGFX_PCI_ID_SVGA3;
> +#else
> +	drm_warn_once(&vmw->drm,
> +		      "vmwgfx is running on an unknown architecture.");
> +	return false;
> +#endif
> +}
> +
>  /**
>   * __vmw_svga_enable - Enable SVGA mode, FIFO and use of VRAM.
>   *
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index fb8f0c0642c0..3810a9984a7f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -773,6 +773,7 @@ static inline u32 vmw_max_num_uavs(struct vmw_private *dev_priv)
>  
>  extern void vmw_svga_enable(struct vmw_private *dev_priv);
>  extern void vmw_svga_disable(struct vmw_private *dev_priv);
> +bool vmwgfx_supported(struct vmw_private *vmw);
>  
>  
>  /**
> @@ -1358,6 +1359,7 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>  		    struct vmw_diff_cpy *diff);
>  
>  /* Host messaging -vmwgfx_msg.c: */
> +void vmw_disable_backdoor(void);
>  int vmw_host_get_guestinfo(const char *guest_info_param,
>  			   char *buffer, size_t *length);
>  __printf(1, 2) int vmw_host_printf(const char *fmt, ...);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> index ca1a3fe44fa5..2651fe0ef518 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_msg.c
> @@ -1179,3 +1179,12 @@ int vmw_mksstat_remove_ioctl(struct drm_device *dev, void *data,
>  
>  	return -EAGAIN;
>  }
> +
> +/**
> + * vmw_disable_backdoor: Disables all backdoor communication
> + * with the hypervisor.
> + */
> +void vmw_disable_backdoor(void)
> +{
> +	vmw_msg_enabled = 0;
> +}


LGTM

Reviewed-by: Maaz Mombasawala <mombasawalam@vmware.com>

-- 
Maaz Mombasawala (VMware) <maazm@fastmail.com>

