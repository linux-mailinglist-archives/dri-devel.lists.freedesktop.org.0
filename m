Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7F515703A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC3F6E906;
	Mon, 10 Feb 2020 08:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA46D6E906
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 08:08:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01A88veJ087137;
 Mon, 10 Feb 2020 02:08:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581322137;
 bh=lj6nBrgQ4/pj/Kiz28tZWi5wbQWwsZBYYgs52K/2KTs=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=bNiHWROX5nQBQ9efmHUnNUI5Bb2oJqO7txDkepnRF93x19CjMrZuk3ShFnUV3eK85
 K/8TSu85rbjKQ558kW7lHWH1PmJcOg2l0R9p542mrwmDIqkeAFbo853mAr/v7zi+jQ
 O5/dQmVDzGpZlIhXoTbCfm1F7qzrKyO2pErHg+ik=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01A88vfw095429
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Feb 2020 02:08:57 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 02:08:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 02:08:56 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01A88sMp093425;
 Mon, 10 Feb 2020 02:08:55 -0600
Subject: Re: [PATCH] drm/bridge: sii902x: Select SND_SOC_HDMI_CODEC if SND_SOC
 is configured
To: Jyri Sarha <jsarha@ti.com>, <dri-devel@lists.freedesktop.org>, Andrzej
 Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>
References: <20191129152342.29145-1-jsarha@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <844180be-bb5d-40bd-3c90-ee349361fbc2@ti.com>
Date: Mon, 10 Feb 2020 10:08:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20191129152342.29145-1-jsarha@ti.com>
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
Cc: peter.ujfalusi@ti.com, thierry.reding@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2019 17:23, Jyri Sarha wrote:
> To enable HDMI audio the SND_SOC_HDMI_CODEC needs to be
> configured. Enable HDMI audio by selecting SND_SOC_HDMI_CODEC if
> SND_SOC is configured. SND_SOC_HDMI_CODEC has no config menu entry and
> should be selected atomatically by the drivers using it.
> 
> Signed-off-by: Jyri Sarha <jsarha@ti.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 26ff07ad287b..0a60a56ce6dc 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -118,6 +118,7 @@ config DRM_SII902X
>   	select DRM_KMS_HELPER
>   	select REGMAP_I2C
>   	select I2C_MUX
> +	select SND_SOC_HDMI_CODEC if SND_SOC
>   	---help---
>   	  Silicon Image sii902x bridge chip driver.
>   
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
