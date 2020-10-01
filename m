Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8772327FCB7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 11:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 945CF6E183;
	Thu,  1 Oct 2020 09:58:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2FA6E16F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Oct 2020 09:58:01 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0919vnaN046565;
 Thu, 1 Oct 2020 04:57:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1601546269;
 bh=ocLes7Q6GrLIKYLM3Cr5mOXbo2kYCJeDXbZdaIMVWRc=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=D5SBE5pX8Pi9gpbfl/oB8WH52xgpevDTqHZvPQUn4i46eRiUAkBZYAlTAwZ9AvxLS
 O13xAxbdC7azjog11Cx+2uTNTQVLpAF2EwHBJ1dPovK4PRnkRjbikrh9un1sqARFTN
 WjubkDA/oGRw8/70Xc68hGLNq2fbNr9jH3NbSS74=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0919vmTK099182
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 1 Oct 2020 04:57:48 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 1 Oct
 2020 04:57:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 1 Oct 2020 04:57:48 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0919vk4u034844;
 Thu, 1 Oct 2020 04:57:47 -0500
Subject: Re: [PATCH v2] drm: bridge: cdns-mhdp8546: fix compile warning
To: Dave Airlie <airlied@linux.ie>
References: <20200929091918.24813-1-tomi.valkeinen@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <5e683867-b148-a9fb-f8ea-f763d567030b@ti.com>
Date: Thu, 1 Oct 2020 12:57:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929091918.24813-1-tomi.valkeinen@ti.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yuti Amonkar <yamonkar@cadence.com>, dri-devel@lists.freedesktop.org,
 Swapnil Jakhade <sjakhade@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Can you pick this up to drm-next? Fixes the x64 build warnings for the recent cdns-mhdp-5.10 pull.

 Tomi

On 29/09/2020 12:19, Tomi Valkeinen wrote:
> On x64 we get:
> 
> drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c:751:10: warning: conversion from 'long unsigned int' to 'unsigned int' changes value from '18446744073709551613' to '4294967293' [-Woverflow]
> 
> The registers are 32 bit, so fix by casting to u32.
> 
> Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Reviewed-by: Swapnil Jakhade <sjakhade@cadence.com>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> v2:
> 
> No changes to code, added tags.
> 
> 
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> index 621ebdbff8a3..d0c65610ebb5 100644
> --- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> +++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
> @@ -748,7 +748,7 @@ static int cdns_mhdp_fw_activate(const struct firmware *fw,
>  	 * bridge should already be detached.
>  	 */
>  	if (mhdp->bridge_attached)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  
>  	spin_unlock(&mhdp->start_lock);
> @@ -1689,7 +1689,7 @@ static int cdns_mhdp_attach(struct drm_bridge *bridge,
>  
>  	/* Enable SW event interrupts */
>  	if (hw_ready)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  
>  	return 0;
> @@ -2122,7 +2122,7 @@ static void cdns_mhdp_bridge_hpd_enable(struct drm_bridge *bridge)
>  
>  	/* Enable SW event interrupts */
>  	if (mhdp->bridge_attached)
> -		writel(~CDNS_APB_INT_MASK_SW_EVENT_INT,
> +		writel(~(u32)CDNS_APB_INT_MASK_SW_EVENT_INT,
>  		       mhdp->regs + CDNS_APB_INT_MASK);
>  }
>  
> 

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
