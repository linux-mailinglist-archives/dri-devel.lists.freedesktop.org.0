Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 576846231A2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:40:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4010E0F6;
	Wed,  9 Nov 2022 17:40:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35AA10E037
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 17:40:23 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2A9He6jD036624;
 Wed, 9 Nov 2022 11:40:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1668015606;
 bh=PX+y5+hzE+MnbIPxGXPJlmXtjxlBXP/JYTgpYfsQGj4=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=oPXLewKcbU12CiPINL2sGYCE+wDnTKPb6cOnsBUU4f1qbNOFLnQZwEGexsNlPpePv
 kZ+oAL+i5sR+W5FxvKqGSDjZ9ho2Vr8Z5tvvhFI5/m/N9p5ZzfLPsiCM2Tt2K9JtIB
 Bm5GoEWRNOpUn1UPu33u/HDDQExfumVgc1d2ouDI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2A9He6hK001621
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Nov 2022 11:40:06 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Wed, 9 Nov
 2022 11:40:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Wed, 9 Nov 2022 11:40:06 -0600
Received: from [128.247.81.39] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2A9He615003645;
 Wed, 9 Nov 2022 11:40:06 -0600
Message-ID: <1f530fa4-e8ee-f7b8-f232-9cb267294ab9@ti.com>
Date: Wed, 9 Nov 2022 11:40:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/tidss: Set max DMA segment size
Content-Language: en-US
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Tomi
 Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20220823001634.11461-1-afd@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220823001634.11461-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/22/22 7:16 PM, Andrew Davis wrote:
> We have no segment size limitations. Set to unlimited.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---

Ping, still valid.

Andrew

>   drivers/gpu/drm/tidss/tidss_dispc.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index dd3c6a606ae2..624545e4636c 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2685,6 +2685,7 @@ int dispc_init(struct tidss_device *tidss)
>   		if (r)
>   			dev_warn(dev, "cannot set DMA masks to 48-bit\n");
>   	}
> +	dma_set_max_seg_size(dev, UINT_MAX);
>   
>   	dispc = devm_kzalloc(dev, sizeof(*dispc), GFP_KERNEL);
>   	if (!dispc)
