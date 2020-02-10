Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3585F1570BF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:22:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680126E923;
	Mon, 10 Feb 2020 08:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E27436E923
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 08:21:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01A8LsiN090377;
 Mon, 10 Feb 2020 02:21:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581322914;
 bh=MM89QeNcgYphj4HSQjO0+V8pv9K9WVi4I0cPicqGfXc=;
 h=Subject:To:References:From:Date:In-Reply-To;
 b=fdAI0w4lXpRRxaM4wBKLqhFOeGpAydW3KL1vyGzPmWCS87lt0m3rj6vrvBRrXWIIX
 XQd09TPBmLQK+hM6KGe9p3ov2P3UqgJX6NMpM2zF8+YUrbMk6NSxAtq/pEC1u5Y4jW
 aPdEQJD9wIghK9KORy6H3gLHIGuWfa6vSwDw0YcI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01A8LsoG113172
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Feb 2020 02:21:54 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 02:21:53 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 02:21:53 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01A8LpKp113869;
 Mon, 10 Feb 2020 02:21:52 -0600
Subject: Re: [PATCH v2] drm/bridge: tfp410: add pclk limits
To: <dri-devel@lists.freedesktop.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
References: <20200113134528.9851-1-tomi.valkeinen@ti.com>
 <20200121094655.9092-1-tomi.valkeinen@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <123befc8-8c57-4718-c23d-1bec9cf55ef4@ti.com>
Date: Mon, 10 Feb 2020 10:21:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200121094655.9092-1-tomi.valkeinen@ti.com>
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

Hi Andrzej,

On 21/01/2020 11:46, Tomi Valkeinen wrote:
> Add pixel clock limits to the driver as per TFP410 datasheet: min 25MHz,
> max 165MHz.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>   drivers/gpu/drm/bridge/ti-tfp410.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index 6f6d6d1e60ae..108e8cd7ab68 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -167,10 +167,23 @@ static void tfp410_disable(struct drm_bridge *bridge)
>   	gpiod_set_value_cansleep(dvi->powerdown, 1);
>   }
>   
> +static enum drm_mode_status tfp410_mode_valid(struct drm_bridge *bridge,
> +					      const struct drm_display_mode *mode)
> +{
> +	if (mode->clock < 25000)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > 165000)
> +		return MODE_CLOCK_HIGH;
> +
> +	return MODE_OK;
> +}
> +
>   static const struct drm_bridge_funcs tfp410_bridge_funcs = {
>   	.attach		= tfp410_attach,
>   	.enable		= tfp410_enable,
>   	.disable	= tfp410_disable,
> +	.mode_valid	= tfp410_mode_valid,
>   };
>   
>   static void tfp410_hpd_work_func(struct work_struct *work)
> 

Is this ok to merge?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
