Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7514FD335
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 11:11:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441E910FBD3;
	Tue, 12 Apr 2022 09:11:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CB010FBEF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 09:11:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23C9B19H123978;
 Tue, 12 Apr 2022 04:11:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1649754661;
 bh=8hO/8Dci2SJSEgmGxnVfMhUAImO5GUV+8DRYO0LqYl0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=hzj5nh8sw4F030IO93nlWpVt/0e8wVuRUUfAVHZAUwmiQcBxUq2a0f45pMGBSumKb
 p5/eXNfWDUrqqyBd9JJg6k5Rk+6T9dYO4MczWTDsHOdybPmCzCHybEwZNOLH/GXuBl
 E6jG+aeEul4tTXJBrYIQqO4nZ0dEDi29Km00SDAw=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23C9B1tY001312
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Apr 2022 04:11:01 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Apr 2022 04:11:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Apr 2022 04:11:01 -0500
Received: from [172.24.221.43] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23C9AufX068426;
 Tue, 12 Apr 2022 04:10:57 -0500
Message-ID: <c0b9825d-a066-1a26-f428-854ddf6d9186@ti.com>
Date: Tue, 12 Apr 2022 14:40:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/tidss: Soft Reset DISPC on startup
Content-Language: en-US
To: <linux-kernel@vger.kernel.org>, <jyri.sarha@iki.fi>, <tomba@kernel.org>,
 <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <laurent.pinchart@ideasonboard.com>,
 <tomi.valkeinen@ideasonboard.com>
References: <20220314113739.18000-1-devarsht@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20220314113739.18000-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
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
Cc: nm@ti.com, vigneshr@ti.com, a-bhatia1@ti.com, nikhil.nd@ti.com,
 linux-arm-kernel@lists.infradead.org, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent, Tomi,

On 14/03/22 17:07, Devarsh Thakkar wrote:
> Soft reset the display subsystem controller on startup and wait for
> the reset to complete. This helps the scenario where display was
> already in use by some other core before the linux was booted.

Could you please help review this patch ?

Regards,

Devarsh

> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 60b92df615aa..dae47853b728 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2650,6 +2650,20 @@ static void dispc_init_errata(struct dispc_device *dispc)
>  	}
>  }
>  
> +static void dispc_softreset(struct dispc_device *dispc)
> +{
> +	u32 val;
> +	int ret = 0;
> +
> +	/* Soft reset */
> +	REG_FLD_MOD(dispc, DSS_SYSCONFIG, 1, 1, 1);
> +	/* Wait for reset to complete */
> +	ret = readl_poll_timeout(dispc->base_common + DSS_SYSSTATUS,
> +				 val, val & 1, 100, 5000);
> +	if (ret)
> +		dev_warn(dispc->dev, "failed to reset dispc\n");
> +}
> +
>  int dispc_init(struct tidss_device *tidss)
>  {
>  	struct device *dev = tidss->dev;
> @@ -2709,6 +2723,10 @@ int dispc_init(struct tidss_device *tidss)
>  			return r;
>  	}
>  
> +	/* K2G display controller does not support soft reset */
> +	if (feat->subrev != DISPC_K2G)
> +		dispc_softreset(dispc);
> +
>  	for (i = 0; i < dispc->feat->num_vps; i++) {
>  		u32 gamma_size = dispc->feat->vp_feat.color.gamma_size;
>  		u32 *gamma_table;
