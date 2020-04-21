Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF681B2B4E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 17:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D90C6E167;
	Tue, 21 Apr 2020 15:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F84A6E167
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 15:38:20 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 188so4068233wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 08:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MJ5jhXrxr+NhqLVkrYs++Rpgw24ASsSxj3JTFuDcro8=;
 b=ngbuvYd9ML6vDpb61FbvLfoPqnSlU8GQZJHOvOJZlniM3xksjM/MOTQ6IQh8/sEiMb
 m8+rMqxNNummnxVriYOhb55zSQMzd9pbhGMJ7KsCYoHcNrechX0JbtjdS8YHJ2872Sca
 zQ9tw3JQEAUvZ3A4LPpQJbemMTmBwI1ZzzCKU2+I6EnBZKPb98B9u2GEsJwDPswCYtY2
 lF8/0EBJXwP49Mos2mpKjd5IehRXLK6bRB4sEQAVPdZ6Eb/Hzkk/ijeZ25Vf2eGciia4
 B/byS5zhV/9RBvI3yuFgnP/FOPcrIRuPU6YBRi+2j6PzDBiKmLM8b3JcfWHeEAyKsf2v
 r34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MJ5jhXrxr+NhqLVkrYs++Rpgw24ASsSxj3JTFuDcro8=;
 b=q3IrQ1Pzu624dSJqiqg/E4/wv2A/piols5ZjC1NpCu1gD2RW6EHOUMYFdoreLd59l4
 Mw4ab+YskDNNJhwRUgeqS0k2YHQL+l3mrZAM+6nou19160inHE0WULJynVp8stlFzqxZ
 8tGiOqbiSh2qdLdE2+ZrSrapVbkFOfbGSVg2Qa2/tjRbRr67Zjf6zJtZfK7YMwJdiKgI
 ZsT+Mn/65c+uoG1aN7qq8F1yy9szqWZ/xqkFA1gkykwhdynMLOKcI5ZPKAOPkWiLvgXY
 YyOygnCKD00FrBSaN+7JppxrR0vfmVx7rm8waahbzD3he+UoinCTkFm4ljxzTNwaIeBA
 Y0sQ==
X-Gm-Message-State: AGi0PuZ8Ww6XILmSIIzej81hmp7JnQFay7oN8mktBfWTmWKkmfsI8eMb
 rv3qi21SNzGrrgTCtF7tt63kmQ==
X-Google-Smtp-Source: APiQypKk2bgFZ68dpoIWt4QnX/NyPuiLk5mgJ1fZbVjf46KA7ScSs2QGl4aTCgnYGoSBEOCFvym2rA==
X-Received: by 2002:a1c:7905:: with SMTP id l5mr5806207wme.5.1587483498593;
 Tue, 21 Apr 2020 08:38:18 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56?
 ([2a01:e35:2ec0:82b0:39cc:a07:8b48:cc56])
 by smtp.gmail.com with ESMTPSA id m8sm4272294wrx.54.2020.04.21.08.38.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 08:38:17 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: add mode selection limits against specific SoC
 revisions
To: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20200421134410.30603-1-narmstrong@baylibre.com>
 <20200421135907.GC3456981@phenom.ffwll.local>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <00cd289f-c37c-4007-dbb2-eb6dd2b0893e@baylibre.com>
Date: Tue, 21 Apr 2020 17:38:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200421135907.GC3456981@phenom.ffwll.local>
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2020 15:59, Daniel Vetter wrote:
> On Tue, Apr 21, 2020 at 03:44:10PM +0200, Neil Armstrong wrote:
>> The Amlogic S805X/Y uses the same die as the S905X, but with more
>> limited graphics capabilities.
>>
>> This adds a soc version detection adding specific limitations on the HDMI
>> mode selections.
>>
>> Here, we limit to HDMI 1.3a max HDMI PHY clock frequency.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> Just a drive-by, but the code organization between the dw-hdmi bridge and
> the driver looks pretty terribly and really leaky. Can't we do better?
> Either by fixing the dw-hdmi bridge abstraction to actually abstract
> something, or by givin up the dw-hdmi is a bridge and convert it to some
> helper to implement a drm_encoder. Current status just doesn't make too
> much sense to me.


Yep, the encoder part should be moved out of the dw-hdmi glue driver for sure.
I'll a draft something, but it won't really affect this patch.

Neil

> -Daniel
> 
>> ---
>>  drivers/gpu/drm/meson/meson_drv.c     | 29 ++++++++++++++++++++++++++-
>>  drivers/gpu/drm/meson/meson_drv.h     |  6 ++++++
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c |  7 +++++++
>>  3 files changed, 41 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>> index 6f29fab79952..621f6de0f076 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -11,6 +11,7 @@
>>  #include <linux/component.h>
>>  #include <linux/module.h>
>>  #include <linux/of_graph.h>
>> +#include <linux/sys_soc.h>
>>  #include <linux/platform_device.h>
>>  #include <linux/soc/amlogic/meson-canvas.h>
>>  
>> @@ -183,6 +184,24 @@ static void meson_remove_framebuffers(void)
>>  	kfree(ap);
>>  }
>>  
>> +struct meson_drm_soc_attr {
>> +	struct meson_drm_soc_limits limits;
>> +	const struct soc_device_attribute *attrs;
>> +};
>> +
>> +static const struct meson_drm_soc_attr meson_drm_soc_attrs[] = {
>> +	/* S805X/S805Y HDMI PLL won't lock for HDMI PHY freq > 1,65GHz */
>> +	{
>> +		.limits = {
>> +			.max_hdmi_phy_freq = 1650000,
>> +		},
>> +		.attrs = (const struct soc_device_attribute []) {
>> +			{ .soc_id = "GXL (S805*)", },
>> +			{ /* sentinel */ },
>> +		}
>> +	},
>> +};
>> +
>>  static int meson_drv_bind_master(struct device *dev, bool has_components)
>>  {
>>  	struct platform_device *pdev = to_platform_device(dev);
>> @@ -191,7 +210,7 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>  	struct drm_device *drm;
>>  	struct resource *res;
>>  	void __iomem *regs;
>> -	int ret;
>> +	int ret, i;
>>  
>>  	/* Checks if an output connector is available */
>>  	if (!meson_vpu_has_available_connectors(dev)) {
>> @@ -281,6 +300,14 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
>>  	if (ret)
>>  		goto free_drm;
>>  
>> +	/* Assign limits per soc revision/package */
>> +	for (i = 0 ; i < ARRAY_SIZE(meson_drm_soc_attrs) ; ++i) {
>> +		if (soc_device_match(meson_drm_soc_attrs[i].attrs)) {
>> +			priv->limits = &meson_drm_soc_attrs[i].limits;
>> +			break;
>> +		}
>> +	}
>> +
>>  	/* Remove early framebuffers (ie. simplefb) */
>>  	meson_remove_framebuffers();
>>  
>> diff --git a/drivers/gpu/drm/meson/meson_drv.h b/drivers/gpu/drm/meson/meson_drv.h
>> index 04fdf3826643..5b23704a80d6 100644
>> --- a/drivers/gpu/drm/meson/meson_drv.h
>> +++ b/drivers/gpu/drm/meson/meson_drv.h
>> @@ -30,6 +30,10 @@ struct meson_drm_match_data {
>>  	struct meson_afbcd_ops *afbcd_ops;
>>  };
>>  
>> +struct meson_drm_soc_limits {
>> +	unsigned int max_hdmi_phy_freq;
>> +};
>> +
>>  struct meson_drm {
>>  	struct device *dev;
>>  	enum vpu_compatible compat;
>> @@ -48,6 +52,8 @@ struct meson_drm {
>>  	struct drm_plane *primary_plane;
>>  	struct drm_plane *overlay_plane;
>>  
>> +	const struct meson_drm_soc_limits *limits;
>> +
>>  	/* Components Data */
>>  	struct {
>>  		bool osd1_enabled;
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index e8c94915a4fc..dc3d5122475a 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -695,6 +695,13 @@ dw_hdmi_mode_valid(struct drm_connector *connector,
>>  	dev_dbg(connector->dev->dev, "%s: vclk:%d phy=%d venc=%d hdmi=%d\n",
>>  		__func__, phy_freq, vclk_freq, venc_freq, hdmi_freq);
>>  
>> +	/* Check against soc revision/package limits */
>> +	if (priv->limits) {
>> +		if (priv->limits->max_hdmi_phy_freq &&
>> +		    phy_freq > priv->limits->max_hdmi_phy_freq)
>> +			return MODE_CLOCK_HIGH;
>> +	}
>> +
>>  	return meson_vclk_vic_supported_freq(phy_freq, vclk_freq);
>>  }
>>  
>> -- 
>> 2.22.0
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
