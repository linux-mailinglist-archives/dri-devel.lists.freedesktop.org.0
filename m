Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D877714A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F7010E4CB;
	Thu, 10 Aug 2023 07:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71A810E087
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 14:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691590212; x=1723126212;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=Nn3twXiN8qvEZrC0KbH/uEh931DqwD4kXNP0CV/tOOQ=;
 b=imIp+bqQ22NDsfImlMO7fTbv1M/REQRyWpDjhjS4bZuBxuaLaHPRnssh
 NDVoJMiNGC5+1p4HPzoee4XepVHDptDhE94S6nk66obDSHg9qMDtuRxX3
 drEbKQXhb2MiFAfT4pVt95Oug/X4kIhOC1jKz9URmNaqv1IVyLC0I1kOc
 oP44cBh+z/tm6zTjq0fBauqJghbXZkHJ5yXwqmfoIN7DepjMsWy4o98/p
 crDhmGPofZI0HJei7AY0wfcj1c9IDB/fgAykVsmBeRpvUXWpCtod1TLbG
 gQEx14cF+o8oguVP7lHVL4vSaoqh0gvgZdoO9N3LGXRopXWXx77cbmEmq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370033252"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="370033252"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:10:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="821868063"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="821868063"
Received: from cvogler-mobl1.ger.corp.intel.com ([10.252.40.229])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:10:09 -0700
Date: Wed, 9 Aug 2023 17:10:07 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v2 04/11] PCI/VGA: Drop the inline in the
 vga_update_device_decodes() function.
In-Reply-To: <20230808223412.1743176-5-sui.jingfeng@linux.dev>
Message-ID: <28d94a7-ca19-6646-ce61-f0fec06e8bf2@linux.intel.com>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-5-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Mailman-Approved-At: Thu, 10 Aug 2023 07:25:03 +0000
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Aug 2023, Sui Jingfeng wrote:

> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> The vga_update_device_decodes() function is not performance-critical.
> So drop the inline. This patch also makes the parameter consistent with
> the argument, using the 'unsigned int' type instead of the 'signed' type
> to store the decode.

Use imperative form, Don't start with "This patch" but directly what 
follows after those words.
 
> Change the second argument of the vga_update_device_decodes() function
> to 'unsigned int' type.

Somehow it feels all these 3 changes should be in separate patches, I 
don't see how they're related at all with each other other than they touch 
roughly the same area.

-- 
 i.

> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 8742a51d450f..dc10a262fb5e 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -860,24 +860,24 @@ static bool vga_arbiter_del_pci_device(struct pci_dev *pdev)
>  	return ret;
>  }
>  
> -/* this is called with the lock */
> -static inline void vga_update_device_decodes(struct vga_device *vgadev,
> -					     int new_decodes)
> +/* This is called with the lock */
> +static void vga_update_device_decodes(struct vga_device *vgadev,
> +				      unsigned int new_decodes)
>  {
>  	struct device *dev = &vgadev->pdev->dev;
> -	int old_decodes, decodes_removed, decodes_unlocked;
> +	unsigned int old_decodes = vgadev->decodes;
> +	unsigned int decodes_removed = ~new_decodes & old_decodes;
> +	unsigned int decodes_unlocked = vgadev->locks & decodes_removed;
>  
> -	old_decodes = vgadev->decodes;
> -	decodes_removed = ~new_decodes & old_decodes;
> -	decodes_unlocked = vgadev->locks & decodes_removed;
>  	vgadev->decodes = new_decodes;
>  
> -	vgaarb_info(dev, "changed VGA decodes: olddecodes=%s,decodes=%s:owns=%s\n",
> -		vga_iostate_to_str(old_decodes),
> -		vga_iostate_to_str(vgadev->decodes),
> -		vga_iostate_to_str(vgadev->owns));
> +	vgaarb_info(dev,
> +		    "VGA decodes changed: olddecodes=%s,decodes=%s:owns=%s\n",
> +		    vga_iostate_to_str(old_decodes),
> +		    vga_iostate_to_str(vgadev->decodes),
> +		    vga_iostate_to_str(vgadev->owns));
>  
> -	/* if we removed locked decodes, lock count goes to zero, and release */
> +	/* If we removed locked decodes, lock count goes to zero, and release */
>  	if (decodes_unlocked) {
>  		if (decodes_unlocked & VGA_RSRC_LEGACY_IO)
>  			vgadev->io_lock_cnt = 0;
> 
