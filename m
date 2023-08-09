Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AFB777148
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 109E110E4C8;
	Thu, 10 Aug 2023 07:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A834F10E445
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691589476; x=1723125476;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=CwDGqwd88thCoGdpEJAkv19uKXNI4W3xi+umzrTKwhQ=;
 b=DEO3aC09uiyK08Y+8JAClHNkzBSEvz8aflRxdfJ2oCZhrQovQNmdH1Kp
 hobjUymjzOYX99joPNXFwWcGgvXxvWhDf+y1JqU6DMp1IWskynOJUrILI
 luj6pW3TAEV5IwtTlLFRsOjIIRC56DIG51QpzB2QAYu9YqvFlfda+wBSI
 HNjv+Qo8ZYvmSgLTTmIlBrxlbPi6UPWAvshZQJaNuS28ymrKu+C2YT++X
 vpDLXDYjC3hdPUJuhsyPtYil1ro1Xt7MymBkJSWjxPsHqX0IzfDFTv3lV
 dbiKhzLGIy+w5MC58FKxZ8iKjfsSUasXmZj4AtCZgehI9cpA0KUxkwh4Y A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373908215"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="373908215"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="761389587"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="761389587"
Received: from cvogler-mobl1.ger.corp.intel.com ([10.252.40.229])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:57:53 -0700
Date: Wed, 9 Aug 2023 16:57:50 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v2 01/11] PCI/VGA: Use unsigned type for the io_state
 variable
In-Reply-To: <20230808223412.1743176-2-sui.jingfeng@linux.dev>
Message-ID: <216235c1-d578-8f35-1f2-7f8ce59d2d7a@linux.intel.com>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-2-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-939066835-1691589475=:1846"
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
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-939066835-1691589475=:1846
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Wed, 9 Aug 2023, Sui Jingfeng wrote:

> From: Sui Jingfeng <suijingfeng@loongson.cn>
> 
> The io_state variable in the vga_arb_write() function is declared with
> unsigned int type, while the vga_str_to_iostate() function takes 'int *'
> type. To keep them consistent, this patch replaceis the third argument of
> vga_str_to_iostate() function with 'unsigned int *' type.
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
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

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-939066835-1691589475=:1846--
