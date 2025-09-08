Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E86AB489A9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 12:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C9310E128;
	Mon,  8 Sep 2025 10:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="Qo2IWQpw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A3910E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 10:10:53 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 588AATRX031975;
 Mon, 8 Sep 2025 05:10:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757326229;
 bh=Zzqan7/hrV9pxQRcmGcS9VOI5S+Zdlj/18cEC7NglsQ=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=Qo2IWQpw92UNJMCJcBkfsHoyPkY4FmemKH8GOeVUFVk6DKdDXXriYj0JIPwwaFp7y
 TmtUK/iv1Po/nIqfPi6CYp0ERHHCcM9Q+/sQg36DvgIdnSThY1Y06RB30Z7CInJQp+
 wSLTcoA2J0SLsHelCUNYnHDa1cpZd2oqEO5E8dIU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 588AASCe2889558
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Mon, 8 Sep 2025 05:10:28 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 05:10:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 05:10:27 -0500
Received: from [172.24.233.20] (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 588AANkb431727;
 Mon, 8 Sep 2025 05:10:24 -0500
Message-ID: <aa7c2ae8-fc04-4917-9c8b-9c5dd6680580@ti.com>
Date: Mon, 8 Sep 2025 15:40:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tidss: Update Videoport SYNC LOST IRQ bit
To: Harikrishna Shenoy <h-shenoy@ti.com>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <bparrot@ti.com>, <sam@ravnborg.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20250903100929.2598626-1-h-shenoy@ti.com>
Content-Language: en-US
From: Swamil Jain <s-jain1@ti.com>
In-Reply-To: <20250903100929.2598626-1-h-shenoy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Harikrishna,
Thanks for the patch.

On 9/3/25 15:39, Harikrishna Shenoy wrote:
> Update VP SYNC LOST Bit as per register description for
> DSS0_COMMON_VP_IRQENABLE_0 give in TRM.
> 
> Link:https://www.ti.com/lit/zip/spruil1/SPRUIL_DRA829_TDA4VM

Broken link, please add a working link.
Please add link to TI's Sitara Devices Technical Reference Manual as well.

Regards,
Swamil

> Table 12-597. DSS0_COMMON_VP_IRQENABLE_0
> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> 
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>   drivers/gpu/drm/tidss/tidss_irq.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
> index dd61f645f662..0194010a7fff 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.h
> +++ b/drivers/gpu/drm/tidss/tidss_irq.h
> @@ -53,7 +53,7 @@ static inline dispc_irq_t DSS_IRQ_PLANE_MASK(u32 plane)
>   #define DSS_IRQ_VP_FRAME_DONE(ch)	DSS_IRQ_VP_BIT((ch), 0)
>   #define DSS_IRQ_VP_VSYNC_EVEN(ch)	DSS_IRQ_VP_BIT((ch), 1)
>   #define DSS_IRQ_VP_VSYNC_ODD(ch)	DSS_IRQ_VP_BIT((ch), 2)
> -#define DSS_IRQ_VP_SYNC_LOST(ch)	DSS_IRQ_VP_BIT((ch), 3)
> +#define DSS_IRQ_VP_SYNC_LOST(ch)	DSS_IRQ_VP_BIT((ch), 4)
>   
>   #define DSS_IRQ_PLANE_FIFO_UNDERFLOW(plane)	DSS_IRQ_PLANE_BIT((plane), 0)
>   
