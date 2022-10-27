Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B1760F87C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 15:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38C110E629;
	Thu, 27 Oct 2022 13:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD0B10E62E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Oct 2022 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1666876052; x=1698412052;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kcrYBLq2u4Bk6HUdtkJcGeTUMI97UKSe/1opGfzM3XY=;
 b=k5ji7UrsM1TnQFmO7m6rt2MgQ5ZciwlTiwB8A/eDsyZ66XWrWKCUTSVe
 k7vix34O2pn3nlMp5sXaXI4nCQUgYcEhSci6/JXMrUlE3O8vpaeo1I+zP
 a9u2iPAQ441sPj/0Mbp8msM9tuSjRXNx3XP75WCLYBZ1MbQEaaopP4FtZ
 6PzJ3AgccgEeU9hmIahD9rAcZsVGn5pDu3UIWOeZeYl6vKR7XKv1Edlfg
 OYKcRgI4zgRxPHC5LV1/4olCSdrX5eJmM4gykM63LpUGMRfpU0CFAqao4
 hgIZselOxEvxQYsbjP8gi/ZsMOUPxpEkAb3aiE2CtVmcGVZob2N+s5kv8 w==;
X-IronPort-AV: E=Sophos;i="5.95,217,1661810400"; d="scan'208";a="27015232"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 27 Oct 2022 15:07:30 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 27 Oct 2022 15:07:30 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 27 Oct 2022 15:07:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1666876050; x=1698412050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kcrYBLq2u4Bk6HUdtkJcGeTUMI97UKSe/1opGfzM3XY=;
 b=prPuhHa6ayuuxfqTNJ7m2XVMn5Uvo76Ftr4bHB7S5JQLTtF/1VvHFyMU
 0crF34/8yLRgx6BJbt+XpOqmmCObweBevHVtno5nW0OAIXtRRLY+d07oI
 vKSEWBx75oxAb8NO/t5odEW077GMh8Wd6VTg3BFApjvs3ZdQR3id4vkr/
 TnpyJKSwY5UihmmiFFbu9ojyUbe9u055cZeZ9pS06/5487QggbU/MN8bu
 /sSY4/RkRbTEUE5ZBQjlpJ5Tlg4++yFjJpYSGOumjrxoTlDJ14C2oKwQL
 TNWF6Q4Eu7JMt7nGyupPpSyLcNL9TbAk+KyJb43UyBRTryklQZbOZreNb w==;
X-IronPort-AV: E=Sophos;i="5.95,217,1661810400"; d="scan'208";a="27015231"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 27 Oct 2022 15:07:30 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CFF60280056;
 Thu, 27 Oct 2022 15:07:29 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 1/2] drm/ofdrm: Cast PCI IDs to u32 for comparing
Date: Thu, 27 Oct 2022 15:07:25 +0200
Message-ID: <5987066.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221027115707.17980-2-tzimmermann@suse.de>
References: <20221027115707.17980-1-tzimmermann@suse.de>
 <20221027115707.17980-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Am Donnerstag, 27. Oktober 2022, 13:57:06 CEST schrieb Thomas Zimmermann:
> Properties of 32-bit integers are returned from the OF device tree
> as type __be32. Cast PCI vendor and device IDs from __be32 to u32
> before comparing them to constants. Fixes sparse warnings shown below.
> 
>   drivers/gpu/drm/tiny/ofdrm.c:237:17: warning: restricted __be32 degrades
> to integer drivers/gpu/drm/tiny/ofdrm.c:238:18: warning: restricted __be32
> degrades to integer drivers/gpu/drm/tiny/ofdrm.c:238:54: warning:
> restricted __be32 degrades to integer
> 
> See [1] for the bug report.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/202210192208.D888I6X7-lkp@intel.com/
> # [1] ---
>  drivers/gpu/drm/tiny/ofdrm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
> index 0e1cc2369afcc..0da8b248ccc6e 100644
> --- a/drivers/gpu/drm/tiny/ofdrm.c
> +++ b/drivers/gpu/drm/tiny/ofdrm.c
> @@ -231,8 +231,11 @@ static u64 display_get_address_of(struct drm_device
> *dev, struct device_node *of return address;
>  }
> 
> -static bool is_avivo(__be32 vendor, __be32 device)
> +static bool is_avivo(__be32 vendor_id, __be32 device_id)
>  {
> +	u32 vendor = (__force u32)vendor_id;
> +	u32 device = (__force u32)device_id;

I don't have much context, but just from reading this, shouldn't this be 
be32_to_cpu() instead?

Best regards,
Alexander

> +
>  	/* This will match most R5xx */
>  	return (vendor == PCI_VENDOR_ID_ATI) &&
>  	       ((device >= PCI_VENDOR_ID_ATI_R520 && device < 0x7800) ||




