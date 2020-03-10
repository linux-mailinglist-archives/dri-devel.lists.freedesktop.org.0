Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309818022F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Mar 2020 16:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D37C6E33E;
	Tue, 10 Mar 2020 15:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F1EE6E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 15:45:16 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t11so16523997wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Mar 2020 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/l4bB0RTZCr+TXNjwcIbwFmUPU0HxSL2j4UaMs7FnHA=;
 b=qFnoSJsimN+32h59UqQoLTAUa69LqgJO+/AKyFBvdHbfpZIJZIlupebSpU+03Kr6hL
 EptAalZMAygFLN18r5kWaQ+nsSb06AXoBKmZeiq+GV90MKxkeXbnlHNLBESK3VQ+GOnP
 KUvCcju7M/bPPCFRELDwF275+RVW4i7qXEkzLfNEDgwwl3xINoieJKtLHYq9qV4kdLQo
 IlVUO4R0Qtc6x/VY8JkQZ41ce6GyE3Z29oa9CpmMbJom/YqCipjEpXWQhFQ515Ihca4z
 Gcf+gKWjkEV5eJQIEL59JCdkkDWsDJod0WVrpeCLCssER3il6Lk3ucT9ABYOn0kPkEHy
 rKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/l4bB0RTZCr+TXNjwcIbwFmUPU0HxSL2j4UaMs7FnHA=;
 b=sLhOXxh52Zd9hZM/EifD9ekoMkGCTMQgzXxECRQ2prFUtuDcFmDONC4O9sFoBftCHD
 1Fx+RhSqM8f+Zmm05af940vnnOkZQZzbMYy4ybk8xP2cw/wF2FxtBmQqAtIUVt+Ju/3U
 dugiHZwmQYJhMn8LmPfkNek6+xIT0/7FpbXwdvRTS/nlv7RClPzEYu/TyFTH1tnV1T1X
 yF+TmS/O7K8R0oJkRMbqNA7mAj6JgWmKFDp7DR1utcHNi/RuqI5f1KwdTU9S76dBTdP6
 q7ezIQOgIfwquLrAQTiJXq05AUh2AtxD/1G6b8sW2oYmefB8YGAGpgg9qAjCbTdCvNUD
 k2Uw==
X-Gm-Message-State: ANhLgQ3G3oPnPQfKcM62/t8IG4t96wfZXX3S/Bp+Bb6tAMZgUHa3ueTS
 cEh2uYoY7Ht5wxxS5Cbk0ifpUA==
X-Google-Smtp-Source: ADFU+vtGcKU9YWbVhURUwYv7mI3XOgzF4ULZ4NXNF2mbyMGMWren6xgeqafExXiK6k2qGVrMzE47gg==
X-Received: by 2002:a5d:4c92:: with SMTP id z18mr27938252wrs.294.1583855115039; 
 Tue, 10 Mar 2020 08:45:15 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 9sm4677542wmx.32.2020.03.10.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 08:45:14 -0700 (PDT)
Date: Tue, 10 Mar 2020 15:45:12 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V3 3/4] backlight: qcom-wled: Add support for WLED5
 peripheral in PM8150L
Message-ID: <20200310154512.wvnx5k44mhrsxifv@holly.lan>
References: <1583760362-26978-1-git-send-email-kgunda@codeaurora.org>
 <1583760362-26978-4-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583760362-26978-4-git-send-email-kgunda@codeaurora.org>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 09, 2020 at 06:56:01PM +0530, Kiran Gunda wrote:
> Add support for WLED5 peripheral that is present on PM8150L PMICs.
> 
> PM8150L WLED supports the following:
>     - Two modulators and each sink can use any of the modulator
>     - Multiple CABC selection options
>     - Multiple brightness width selection (12 bits to 15 bits)
> 
> Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>

Mostly just style comments below...


> ---
>  .../bindings/leds/backlight/qcom-wled.yaml         |  39 +++
>  drivers/video/backlight/qcom-wled.c                | 336 ++++++++++++++++++++-

Shouldn't the bindings and driver be separate?


>  2 files changed, 374 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index d334f81..e0dadc4 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -20,6 +20,7 @@ properties:
>         - qcom,pm8941-wled
>         - qcom,pmi8998-wled
>         - qcom,pm660l-wled
> +       - qcom,pm8150l-wled
>  
>    reg:
>      maxItems: 1
> @@ -28,10 +29,23 @@ properties:
>      maxItems: 1
>      description:
>        brightness value on boot, value from 0-4095.
> +      For pm8150l this value vary from 0-4095 or 0-32767
> +      depending on the brightness control mode. If CABC is
> +      enabled 0-4095 range is used.

Is this a pm8150l restriction or a WLED5 restriction (will other WLED5
have different ranges)?


>      allOf:
>        - $ref: /schemas/types.yaml#/definitions/uint32
>          default: 2048
>  
> +  max-brightness:
> +    maxItems: 1
> +    description:
> +      Maximum brightness level. Allowed values are,
> +      for pmi8998 it is  0-4095.
> +      For pm8150l, this can be either 4095 or 32767.

Ditto.


> +      If CABC is enabled, this is capped to 4095.
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +
>    label:
>      maxItems: 1
>      description:
> @@ -124,6 +138,31 @@ properties:
>        value for PM8941 from 1 to 3. Default 2
>        For PMI8998 from 1 to 4.
>  
> +  qcom,modulator-sel:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selects the modulator used for brightness modulation.
> +      Allowed values are,
> +               0 - Modulator A
> +               1 - Modulator B
> +      If not specified, then modulator A will be used by default.
> +      This property is applicable only to WLED5 peripheral.
> +
> +  qcom,cabc-sel:
> +    maxItems: 1
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Selects the CABC pin signal used for brightness modulation.
> +      Allowed values are,
> +              0 - CABC disabled
> +              1 - CABC 1
> +              2 - CABC 2
> +              3 - External signal (e.g. LPG) is used for dimming
> +      This property is applicable only to WLED5 peripheral.
> +
>    interrupts:
>      maxItems: 2
>      description:
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index b73f273..edbbcb2 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -19,6 +19,8 @@
>  #define WLED_DEFAULT_BRIGHTNESS				2048
>  #define WLED_SOFT_START_DLY_US				10000
>  #define WLED3_SINK_REG_BRIGHT_MAX			0xFFF
> +#define WLED5_SINK_REG_BRIGHT_MAX_12B			0xFFF
> +#define WLED5_SINK_REG_BRIGHT_MAX_15B			0x7FFF
>  
>  /* WLED3/WLED4 control registers */
>  #define WLED3_CTRL_REG_FAULT_STATUS			0x08
> @@ -40,6 +42,7 @@
>  
>  #define WLED3_CTRL_REG_OVP				0x4d
>  #define  WLED3_CTRL_REG_OVP_MASK			GENMASK(1, 0)
> +#define  WLED5_CTRL_REG_OVP_MASK			GENMASK(3, 0)
>  
>  #define WLED3_CTRL_REG_ILIMIT				0x4e
>  #define  WLED3_CTRL_REG_ILIMIT_MASK			GENMASK(2, 0)
> @@ -101,6 +104,40 @@
>  
>  #define WLED4_SINK_REG_BRIGHT(n)			(0x57 + (n * 0x10))
>  
> +/* WLED5 specific sink registers */
> +#define WLED5_SINK_REG_MOD_A_EN				0x50
> +#define WLED5_SINK_REG_MOD_B_EN				0x60
> +#define  WLED5_SINK_REG_MOD_EN_MASK			BIT(7)
> +
> +#define WLED5_SINK_REG_MOD_A_SRC_SEL			0x51
> +#define WLED5_SINK_REG_MOD_B_SRC_SEL			0x61
> +#define  WLED5_SINK_REG_MOD_SRC_SEL_HIGH		0
> +#define  WLED5_SINK_REG_MOD_SRC_SEL_EXT			0x03
> +#define  WLED5_SINK_REG_MOD_SRC_SEL_MASK		GENMASK(1, 0)
> +
> +#define WLED5_SINK_REG_MOD_A_BRIGHTNESS_WIDTH_SEL	0x52
> +#define WLED5_SINK_REG_MOD_B_BRIGHTNESS_WIDTH_SEL	0x62
> +#define  WLED5_SINK_REG_BRIGHTNESS_WIDTH_12B		0
> +#define  WLED5_SINK_REG_BRIGHTNESS_WIDTH_15B		1
> +
> +#define WLED5_SINK_REG_MOD_A_BRIGHTNESS_LSB		0x53
> +#define WLED5_SINK_REG_MOD_A_BRIGHTNESS_MSB		0x54
> +#define WLED5_SINK_REG_MOD_B_BRIGHTNESS_LSB		0x63
> +#define WLED5_SINK_REG_MOD_B_BRIGHTNESS_MSB		0x64
> +
> +#define WLED5_SINK_REG_MOD_SYNC_BIT			0x65
> +#define  WLED5_SINK_REG_SYNC_MOD_A_BIT			BIT(0)
> +#define  WLED5_SINK_REG_SYNC_MOD_B_BIT			BIT(1)
> +#define  WLED5_SINK_REG_SYNC_MASK			GENMASK(1, 0)
> +
> +/* WLED5 specific per-'string' registers below */
> +#define WLED5_SINK_REG_STR_FULL_SCALE_CURR(n)		(0x72 + (n * 0x10))
> +
> +#define WLED5_SINK_REG_STR_SRC_SEL(n)			(0x73 + (n * 0x10))
> +#define  WLED5_SINK_REG_SRC_SEL_MOD_A			0
> +#define  WLED5_SINK_REG_SRC_SEL_MOD_B			1
> +#define  WLED5_SINK_REG_SRC_SEL_MASK			GENMASK(1, 0)
> +
>  struct wled_var_cfg {
>  	const u32 *values;
>  	u32 (*fn)(u32);
> @@ -125,6 +162,8 @@ struct wled_config {
>  	u32 num_strings;
>  	u32 string_i_limit;
>  	u32 enabled_strings[WLED_MAX_STRINGS];

> +	u32 mod_sel;
> +	u32 cabc_sel;

Please explain cabc_sel (wled5) versus cabc_en (wled4).

>  	bool cs_out_en;
>  	bool ext_gen;
>  	bool cabc;
> @@ -164,6 +203,27 @@ struct wled {
>  	int (*wled_ovp_delay)(struct wled *wled);
>  };
>  
> +enum wled5_mod_sel {
> +	MOD_A,
> +	MOD_B,
> +	MOD_MAX,
> +};
> +
> +static const u8 wled5_brightness_reg[MOD_MAX] = {
> +	[MOD_A] = WLED5_SINK_REG_MOD_A_BRIGHTNESS_LSB,
> +	[MOD_B] = WLED5_SINK_REG_MOD_B_BRIGHTNESS_LSB,
> +};
> +
> +static const u8 wled5_src_sel_reg[MOD_MAX] = {
> +	[MOD_A] = WLED5_SINK_REG_MOD_A_SRC_SEL,
> +	[MOD_B] = WLED5_SINK_REG_MOD_B_SRC_SEL,
> +};
> +
> +static const u8 wled5_brt_wid_sel_reg[MOD_MAX] = {
> +	[MOD_A] = WLED5_SINK_REG_MOD_A_BRIGHTNESS_WIDTH_SEL,
> +	[MOD_B] = WLED5_SINK_REG_MOD_B_BRIGHTNESS_WIDTH_SEL,
> +};
> +
>  static int wled3_set_brightness(struct wled *wled, u16 brightness)
>  {
>  	int rc, i;
> @@ -182,6 +242,25 @@ static int wled3_set_brightness(struct wled *wled, u16 brightness)
>  	return 0;
>  }
>  
> +static int wled5_set_brightness(struct wled *wled, u16 brightness)
> +{
> +	int rc, offset;
> +	u16 low_limit = wled->max_brightness * 1 / 1000;
> +	u8 v[2];
> +
> +	/* WLED5's lower limit is 0.1% */
> +	if (brightness < low_limit)
> +		brightness = low_limit;
> +
> +	v[0] = brightness & 0xff;
> +	v[1] = (brightness >> 8) & 0x7f;
> +
> +	offset = wled5_brightness_reg[wled->cfg.mod_sel];
> +	rc = regmap_bulk_write(wled->regmap, wled->sink_addr + offset,
> +			       v, 2);
> +	return rc;
> +}
> +

Can we keep the same ordering throughout the file (wled3, wled4, wled5)?
Most of the wled5 callbacks seem to have been inserted above wled4.


Daniel.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
