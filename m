Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD3715BB84
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 10:20:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65586F581;
	Thu, 13 Feb 2020 09:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D2246F581
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 09:20:15 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n10so3757099wrm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 01:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kmEh2ZeXuoeD311wo9OTCISp8p+vr9ch7bvMr3lavL8=;
 b=A5y8hKrkwqiH0O3sVjb3FgKSTb6CV71oz4vg+glW1yxGlHAXpTqXDhrqwqhhU0RbJy
 jgV11cOu9t4gWPqRYLEPRHr4YpGoAx4SEuPdND+GSV1onEGFV3xz+LLHn6vPBFAt2HP6
 tBZ7Z7yGFV4TYQHT4VtLEKqnY/MsGKXTviAnMX96OnLi6NOOAwTjvG7V4JoaX0yBHlMt
 sxw4IzbhqUM9tx0y0nRmYy1c8o18QF+m/k7ys/E/xyNJtHBgE690vL5K5wrCWTetzBsB
 LkhIw4clVYt3cR706t5ktFX73x1nqKXiKZsrA2glnLnimnGHLfRU030kTrr3EcBMFY01
 wgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=kmEh2ZeXuoeD311wo9OTCISp8p+vr9ch7bvMr3lavL8=;
 b=ayWMLht354y02yD381EZv47C0ga/Ipy56s0t/WVVJ6WPvMrBBa+9jcxWiJMLUgw4cZ
 jrUIEUehg0rVj/Aq5/rtq+ho7jPeJB0Tbc3MHLAgl0VMCv2/4sR//rZOTW6ltz08SdIs
 VeSWq8Q8S0ZYkpMCeXjeQVVYnPrnBOdur0VrL3AOe0t6eIwSC//fMQed0RNTchu15DEy
 wBhxowVjeS/IfoVKlKF5JXdHXhF/otLnV/YfyWMQjeEWJgeDCHlUdydmIu+CNMK8Irq7
 9j/cSKdjTejb2t9s5qAAFbYhm7A0RN29HvbVXiXIonhh6ury6HsfAUMyFA8XzpiM2oBU
 d8Mw==
X-Gm-Message-State: APjAAAUkRjAZwXQTh3TRU3j5tGlLRCc43HUtc+lD2MKKTGgn4WGiHa8t
 VRf7J5kppIRwu710wHlTB/fmtluqO75e5w==
X-Google-Smtp-Source: APXvYqzRjZZnDaoAi/wsKuQyAgDWhX8gVz0q1GPbrJReU9li+FfebICzQPbkJ+jK+HfEqhcwgOF/5g==
X-Received: by 2002:a5d:484f:: with SMTP id n15mr20483184wrs.365.1581585613374; 
 Thu, 13 Feb 2020 01:20:13 -0800 (PST)
Received: from [10.1.3.173]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id q3sm2017755wmj.38.2020.02.13.01.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2020 01:20:12 -0800 (PST)
Subject: Re: [PATCH] drm/bridge: adv7511: Replace hardcoded number
To: Fabio Estevam <festevam@gmail.com>, a.hajda@samsung.com
References: <20200212134255.544-1-festevam@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <6448d9cb-7d0b-51ac-dc37-52bcc21b33c4@baylibre.com>
Date: Thu, 13 Feb 2020 10:20:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200212134255.544-1-festevam@gmail.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/02/2020 14:42, Fabio Estevam wrote:
> The hardcoded '12' means the number of elements in the
> adv7511_csc_ycbcr_to_rgb[] array, so use the ARRAY_SIZE() macro
> to let the code less error prone.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 9e13e466e72c..568c6d52cdda 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -132,6 +132,13 @@ static const struct regmap_config adv7511_regmap_config = {
>   * Hardware configuration
>   */
>  
> +/* Coefficients for adv7511 color space conversion */
> +static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
> +	0x0734, 0x04ad, 0x0000, 0x1c1b,
> +	0x1ddc, 0x04ad, 0x1f24, 0x0135,
> +	0x0000, 0x04ad, 0x087c, 0x1b77,
> +};
> +
>  static void adv7511_set_colormap(struct adv7511 *adv7511, bool enable,
>  				 const uint16_t *coeff,
>  				 unsigned int scaling_factor)
> @@ -142,7 +149,7 @@ static void adv7511_set_colormap(struct adv7511 *adv7511, bool enable,
>  			   ADV7511_CSC_UPDATE_MODE, ADV7511_CSC_UPDATE_MODE);
>  
>  	if (enable) {
> -		for (i = 0; i < 12; ++i) {
> +		for (i = 0; i < ARRAY_SIZE(adv7511_csc_ycbcr_to_rgb); ++i) {
>  			regmap_update_bits(adv7511->regmap,
>  					   ADV7511_REG_CSC_UPPER(i),
>  					   0x1f, coeff[i] >> 8);
> @@ -193,13 +200,6 @@ static int adv7511_packet_disable(struct adv7511 *adv7511, unsigned int packet)
>  	return 0;
>  }
>  
> -/* Coefficients for adv7511 color space conversion */
> -static const uint16_t adv7511_csc_ycbcr_to_rgb[] = {
> -	0x0734, 0x04ad, 0x0000, 0x1c1b,
> -	0x1ddc, 0x04ad, 0x1f24, 0x0135,
> -	0x0000, 0x04ad, 0x087c, 0x1b77,
> -};
> -
>  static void adv7511_set_config_csc(struct adv7511 *adv7511,
>  				   struct drm_connector *connector,
>  				   bool rgb, bool hdmi_mode)
> 

Hmm, you replace an hardcoded number by an ARRAY_SIZE() of a maybe unrelated array,
maybe the size should be passed to adv7511_set_colormap() instead,

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
