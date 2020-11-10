Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFFE2AD673
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 13:37:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F8689930;
	Tue, 10 Nov 2020 12:37:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D8289930
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 12:37:26 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AACbCYO042137;
 Tue, 10 Nov 2020 06:37:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605011832;
 bh=YyC7AJs9swvTu1L01i7GaDxYMv9jH9QguR3BzjeW8iQ=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Tdsx1Aq4P1ek6nAv83miz/x+FdR0R5rALN0dZEJ8QVQUCcwhY2O/xxhQujOBOTYoU
 U6cJiAEPRCQYz9B9TR+ZrlVuHXIk72A0bnzbnPg7kz1pSrWG8Dvs6xl5H3oNrOJLPS
 rWhCx81wQYYY/DJcplToU6edgoQsXb14M0MXw52k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AACbCQo034734
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 10 Nov 2020 06:37:12 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 10
 Nov 2020 06:37:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 10 Nov 2020 06:37:12 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AACbAKA089337;
 Tue, 10 Nov 2020 06:37:11 -0600
Subject: Re: [PATCH -next] drm/tidss: use devm_platform_ioremap_resource_byname
To: Wang Xiaojun <wangxiaojun11@huawei.com>, <jsarha@ti.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
References: <20200917062958.2183496-1-wangxiaojun11@huawei.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <ed86891d-9831-5411-dd64-609b645da0eb@ti.com>
Date: Tue, 10 Nov 2020 14:37:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200917062958.2183496-1-wangxiaojun11@huawei.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/09/2020 09:29, Wang Xiaojun wrote:
> Use the devm_platform_ioremap_resource_byname() helper instead of
> calling platform_get_resource_byname() and devm_ioremap_resource()
> separately.
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index c3ece2c9d1c8..78f94a51a811 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2605,16 +2605,9 @@ void dispc_remove(struct tidss_device *tidss)
>  static int dispc_iomap_resource(struct platform_device *pdev, const char *name,
>  				void __iomem **base)
>  {
> -	struct resource *res;
>  	void __iomem *b;
>  
> -	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> -	if (!res) {
> -		dev_err(&pdev->dev, "cannot get mem resource '%s'\n", name);
> -		return -EINVAL;
> -	}
> -
> -	b = devm_ioremap_resource(&pdev->dev, res);
> +	b = devm_platform_ioremap_resource_byname(pdev, name);
>  	if (IS_ERR(b)) {
>  		dev_err(&pdev->dev, "cannot ioremap resource '%s'\n", name);
>  		return PTR_ERR(b);
> 

Thanks, I have picked this up to drm-misc-next.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
