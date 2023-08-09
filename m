Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDF777714D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 09:25:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1896710E4CE;
	Thu, 10 Aug 2023 07:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6270010E43E
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 13:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1691589141; x=1723125141;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=uaOJFHcQEX0cJiQto5OxAtbnVtlxJM0Xoo7ZPgoGdk8=;
 b=evgr7JJe1Zu+bDcS74YOQP1T/PWk7VscJT08Ez46CzZ3uaUL98uW9ibI
 67DcEfHxR3Ne/nho94SbsI+oXL/1QLIOCRc/hR97w9xImj2WyWRnBOOWf
 NnuKqh9OkzOdeHf5guLFTcMK57fSGmv/lSpBPrGZ8XWClu3+l2Q17JmiI
 QhgeCkVKJNRsfeEF/7311HuOmZwXv321MJpKnr67v+IPaPgTRv9d0HxZ+
 Lr6PuRao4lmvAwhJr57bu9BFY8mbfm7u0c8vmNe+HVIoiY2X/l6mFior/
 PrLOpYZqNP68+710Gx8a/HUkzIs4rx16ZncxUc1f01hXzFb0utTSClihH w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="437489680"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="437489680"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:52:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="855545569"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; d="scan'208";a="855545569"
Received: from cvogler-mobl1.ger.corp.intel.com ([10.252.40.229])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2023 06:52:11 -0700
Date: Wed, 9 Aug 2023 16:52:09 +0300 (EEST)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Subject: Re: [PATCH v2 07/11] PCI/VGA: vga_client_register() return -ENODEV
 on failure, not -1
In-Reply-To: <20230808223412.1743176-8-sui.jingfeng@linux.dev>
Message-ID: <b1a964e-a94b-2316-eeaf-fec2b2fa833b@linux.intel.com>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
 <20230808223412.1743176-8-sui.jingfeng@linux.dev>
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

Changelog body is missing.

> Fixes: 934f992c763a ("drm/i915: Recognise non-VGA display devices")
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>  drivers/pci/vgaarb.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
> index 811510253553..a6b8c0def35d 100644
> --- a/drivers/pci/vgaarb.c
> +++ b/drivers/pci/vgaarb.c
> @@ -964,7 +964,7 @@ EXPORT_SYMBOL(vga_set_legacy_decoding);
>   *
>   * To unregister just call vga_client_unregister().
>   *
> - * Returns: 0 on success, -1 on failure
> + * Returns: 0 on success, -ENODEV on failure

So this is the true substance of this change??

It doesn't warrant Fixes tag which requires a real problem to fix. An 
incorrect comment is not enough.

I think the shortlog is a bit misleading as is because it doesn't in any 
way indicate the problem is only in a comment.

>   */
>  int vga_client_register(struct pci_dev *pdev,
>  		unsigned int (*set_decode)(struct pci_dev *pdev, bool decode))
> @@ -975,16 +975,13 @@ int vga_client_register(struct pci_dev *pdev,
>  
>  	spin_lock_irqsave(&vga_lock, flags);
>  	vgadev = vgadev_find(pdev);
> -	if (!vgadev)
> -		goto bail;
> -
> -	vgadev->set_decode = set_decode;
> -	ret = 0;
> -
> -bail:
> +	if (vgadev) {
> +		vgadev->set_decode = set_decode;
> +		ret = 0;
> +	}
>  	spin_unlock_irqrestore(&vga_lock, flags);
> -	return ret;
>  
> +	return ret;

No logic changes in this at all? I don't think it belongs to the same 
patch. I'm not sure if the new logic is improvement anyway. I'd prefer to 
initialize ret = 0 instead:

	int ret = 0;
	...
	if (!vgadev) {
		err = -ENODEV;
		goto unlock;
	}
	...
unlock:
	...

-- 
 i.
