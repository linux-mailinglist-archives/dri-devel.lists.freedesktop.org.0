Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88019729872
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 13:49:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE30D10E68C;
	Fri,  9 Jun 2023 11:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B14C410E68C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686311346; x=1717847346;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/70ZyUQoDKt1Vqap5Dv3N/zlV9MR5BTiq0qKtGBfq6s=;
 b=booTEdKXSxBLTAstEmumVZL6Epj5BdDiRrvzPTfdou5CPQewEDFTQzlT
 vbrU+a2xrq1MToVXbB37di58mV7nCjd1GnKYBj1TwwZZyEaZksD5+TJPX
 Qe6nxao+DI2POLZNaeYEHNjk9BWpN+6eb3G9X+SrLKHVMXOmwxlVAde+d
 8zB11YH6N9jEvQb5uN1r2HxjPCMC+8iWLcESJgiw2ALXeoXTWT6WbL5re
 iwVQNIHj47BTx2S0HrDy+Y0UeoLB8NSQmOwIEp1mo0ploshFou/1wBNp+
 oMZc7t5T0AI+70VT5rkCU/2zRx7vQ1YTIMZlPeZdx2g4KO+ijWL+BHvxm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="360064199"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="360064199"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 04:49:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="800193527"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="800193527"
Received: from lmirabel-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.211.108])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 04:49:01 -0700
Date: Fri, 9 Jun 2023 13:48:53 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH v5 1/4] PCI/VGA: Use unsigned type for the io_state
 variable
Message-ID: <ZIMRpbUHcW5qGFBU@ashyti-mobl2.lan>
References: <20230609112417.632313-1-suijingfeng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609112417.632313-1-suijingfeng@loongson.cn>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Andi Shyti <andi.shyti@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sui,

On Fri, Jun 09, 2023 at 07:24:14PM +0800, Sui Jingfeng wrote:
> The io_state variable in the vga_arb_write() function is declared with
> unsigned int type, while the vga_str_to_iostate() function takes int *
> type. To keep them consistent, replace the third argument of
> vga_str_to_iostate() function with the unsigned int * type.
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

> ---
>  drivers/pci/vgaarb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 5a696078b382..c1bc6c983932 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -77,7 +77,7 @@ static const char *vga_iostate_to_str(unsigned int iostate)
>  	return "none";
>  }
>  
> -static int vga_str_to_iostate(char *buf, int str_size, int *io_state)
> +static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
>  {
>  	/* we could in theory hand out locks on IO and mem
>  	 * separately to userspace but it can cause deadlocks */
> -- 
> 2.25.1
