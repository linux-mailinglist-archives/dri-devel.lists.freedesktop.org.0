Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983A77714B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9004810E4CC;
	Thu, 10 Aug 2023 07:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73B410E083
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 14:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691590724; x=1723126724;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=egJcWHJBDvwzfC17N46JLtCEDljGhvGBo354SWU8O+0=;
 b=fdnkb2IVIyYuDRbvd9qOPTif48wSJkxKQKq227scPXsdPoFHeUyM8dyX
 mct6YbvdpMgAtMQgD2QjyaRh0BGIHNuG4i3mSiX25QtliTKS2jY0RReS4
 Ll49t0wyApV8cYbGdsreZaa92Kk5x8i4ahTr86o/nQY35DSyW5YhxDSzN
 HaandpKynWKXsAiK/O3kD7h8dedLzt6qys5BI0XfbJhjwSj3p25ht4Gxo
 4tgazMZulcZ4lnNVAVMsNzqDcwEJC2WNEZBYPIJTKMTYfI/yNRV/YHOyY
 6Qc9r5k5FeqCtrcrjZQMWgz1N4sTqvQAGRuw1r8WMpNRyEiHe5xIFoyrm g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="370035455"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="370035455"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062494286"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="1062494286"
Received: from cvogler-mobl1.ger.corp.intel.com ([10.252.40.229])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 07:18:41 -0700
Date: Wed, 9 Aug 2023 17:18:39 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v2 10/11] PCI/VGA: Tidy up the code and comment format
In-Reply-To: <20230808223412.1743176-11-sui.jingfeng@linux.dev>
Message-ID: <6617a813-d840-3c39-5c4a-7288fd2f7295@linux.intel.com>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-11-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1484049110-1691590724=:1846"
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>,
 Andi Shyti <andi.shyti@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1484049110-1691590724=:1846
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 9 Aug 2023, Sui Jingfeng wrote:

> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> This patch replaces the leading space with a tab and removes the double
> blank line and fix various typos, no functional change.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c   | 90 ++++++++++++++++++++++++------------------
>  include/linux/vgaarb.h |  4 +-
>  2 files changed, 53 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 9f5cf6a6e3a2..a2f6e0e6b634 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -30,14 +30,13 @@
>  #include <linux/vt.h>
>  #include <linux/console.h>
>  #include <linux/acpi.h>
> -
>  #include <linux/uaccess.h>
> -
>  #include <linux/vgaarb.h>
>  
>  static void vga_arbiter_notify_clients(void);
> +
>  /*
> - * We keep a list of all vga devices in the system to speed
> + * We keep a list of all VGA devices in the system to speed
>   * up the various operations of the arbiter
>   */
>  struct vga_device {
> @@ -61,7 +60,6 @@ static bool vga_arbiter_used;
>  static DEFINE_SPINLOCK(vga_lock);
>  static DECLARE_WAIT_QUEUE_HEAD(vga_wait_queue);
>  
> -
>  static const char *vga_iostate_to_str(unsigned int iostate)
>  {
>  	/* Ignore VGA_RSRC_IO and VGA_RSRC_MEM */
> @@ -195,14 +193,16 @@ int vga_remove_vgacon(struct pci_dev *pdev)
>  #endif
>  EXPORT_SYMBOL(vga_remove_vgacon);
>  
> -/* If we don't ever use VGA arb we should avoid
> -   turning off anything anywhere due to old X servers getting
> -   confused about the boot device not being VGA */
> +/*
> + * If we don't ever use vgaarb, we should avoid turning off anything anywhere.
> + * Due to old X servers getting confused about the boot device not being VGA.
> + */
>  static void vga_check_first_use(void)
>  {
> -	/* we should inform all GPUs in the system that
> -	 * VGA arb has occurred and to try and disable resources
> -	 * if they can */
> +	/*
> +	 * We should inform all GPUs in the system that
> +	 * vgaarb has occurred and to try and disable resources if they can
> +	 */
>  	if (!vga_arbiter_used) {
>  		vga_arbiter_used = true;
>  		vga_arbiter_notify_clients();
> @@ -218,7 +218,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>  	unsigned int pci_bits;
>  	u32 flags = 0;
>  
> -	/* Account for "normal" resources to lock. If we decode the legacy,
> +	/*
> +	 * Account for "normal" resources to lock. If we decode the legacy,
>  	 * counterpart, we need to request it as well
>  	 */
>  	if ((rsrc & VGA_RSRC_NORMAL_IO) &&
> @@ -238,7 +239,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>  	if (wants == 0)
>  		goto lock_them;
>  
> -	/* We don't need to request a legacy resource, we just enable
> +	/*
> +	 * We don't need to request a legacy resource, we just enable
>  	 * appropriate decoding and go
>  	 */
>  	legacy_wants = wants & VGA_RSRC_LEGACY_MASK;
> @@ -254,7 +256,8 @@ static struct vga_device *__vga_tryget(struct vga_device *vgadev,
>  		if (vgadev == conflict)
>  			continue;
>  
> -		/* We have a possible conflict. before we go further, we must
> +		/*
> +		 * We have a possible conflict. before we go further, we must

Before

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-1484049110-1691590724=:1846--
