Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15288158A48
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B9D86E2B6;
	Tue, 11 Feb 2020 07:21:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4C26E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 07:21:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01B7KnOT034530;
 Tue, 11 Feb 2020 01:20:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581405649;
 bh=04WX11WH5P1T8P9DbgC70isD0QEtyx9/hnBL0So9ksA=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=UTIrMhP28OzoV36VTl7mHAxCJ1NI1NtRR/zOLVN4BfZE7hnGWtpX/zumkcwytlXPY
 vja6LRyqqIJwuAtA/SxVX4Vp6fRxhZqW+Poo0p3WjnUkK68KzdPB6Nx5zvZmaw3hNm
 2PvQftImP6xX0WsQK4PcGPUakzTMBIAup3jHrWMw=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01B7KneZ103533
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 11 Feb 2020 01:20:49 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 11
 Feb 2020 01:20:49 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 11 Feb 2020 01:20:49 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01B7Klpx112520;
 Tue, 11 Feb 2020 01:20:48 -0600
Subject: Re: [PATCH] drm/omap: use true,false for bool variable
To: Zheng Bin <zhengbin13@huawei.com>, <airlied@linux.ie>, <daniel@ffwll.ch>, 
 <dri-devel@lists.freedesktop.org>
References: <1579763123-62749-1-git-send-email-zhengbin13@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <a32c4a0f-bd80-962b-c76c-59fd3133d75c@ti.com>
Date: Tue, 11 Feb 2020 09:20:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1579763123-62749-1-git-send-email-zhengbin13@huawei.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/01/2020 09:05, Zheng Bin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c:681:1-15: WARNING: Assignment of 0/1 to bool variable
> drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c:732:1-15: WARNING: Assignment of 0/1 to bool variable
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---
>   drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> index 564e3e1..3ec6a55 100644
> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
> @@ -678,7 +678,7 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>   	if (r)
>   		goto err;
> 
> -	ddata->enabled = 1;
> +	ddata->enabled = true;
> 
>   	if (!ddata->intro_printed) {
>   		dev_info(&ddata->pdev->dev, "panel revision %02x.%02x.%02x\n",
> @@ -729,7 +729,7 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>   	if (ddata->vpnl)
>   		regulator_disable(ddata->vpnl);
> 
> -	ddata->enabled = 0;
> +	ddata->enabled = false;
>   }
> 
>   static int dsicm_panel_reset(struct panel_drv_data *ddata)
> --
> 2.7.4
> 

Thanks, applied.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
