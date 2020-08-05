Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA4223CA59
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 13:45:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C0589D73;
	Wed,  5 Aug 2020 11:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B25689D73
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Aug 2020 11:45:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 075BjXds061534;
 Wed, 5 Aug 2020 06:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1596627933;
 bh=oLXOtVGM0XldeErZ7lnDxDWT67udBtkfwHx5aUoMNbM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=O90REE9dvBBeRL3oeN+FvYeFbekVdTViw1Uo2UfwrOrorIcFFqlRZPLtTde2wOXII
 ZG//xv3T3axRuyxgvSPsXQHvK0+1uZv++K1ep+BN+8AUbHUxcaRyRHZcC1IvaLw2Ul
 eDD25IQdOFw2pbsu+nO3H+XdWzY8FVkdcrMEpHW4=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 075BjXW3063923
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 5 Aug 2020 06:45:33 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 5 Aug
 2020 06:45:33 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 5 Aug 2020 06:45:33 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 075BjViD085971;
 Wed, 5 Aug 2020 06:45:31 -0500
Subject: Re: [PATCH] drm/omap: fix spelling mistake "propert" -> "property"
To: Colin King <colin.king@canonical.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, <dri-devel@lists.freedesktop.org>
References: <20200805102015.14891-1-colin.king@canonical.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ad33a2ea-3596-0b4c-35ae-ca8eb76d1a3f@ti.com>
Date: Wed, 5 Aug 2020 14:45:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805102015.14891-1-colin.king@canonical.com>
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/08/2020 13:20, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a pr_err message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/omapdrm/dss/venc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/venc.c b/drivers/gpu/drm/omapdrm/dss/venc.c
> index e0817934ee16..0fa8f677b647 100644
> --- a/drivers/gpu/drm/omapdrm/dss/venc.c
> +++ b/drivers/gpu/drm/omapdrm/dss/venc.c
> @@ -781,7 +781,7 @@ static int venc_probe_of(struct venc_device *venc)
>  		venc->type = OMAP_DSS_VENC_TYPE_SVIDEO;
>  		break;
>  	default:
> -		dev_err(&venc->pdev->dev, "bad channel propert '%d'\n",
> +		dev_err(&venc->pdev->dev, "bad channel property '%d'\n",
>  			channels);
>  		r = -EINVAL;
>  		goto err;
> 

Thanks, I'll pick this up.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
