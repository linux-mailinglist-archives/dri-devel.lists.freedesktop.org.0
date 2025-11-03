Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F083AC2D219
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 17:30:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9258110E43B;
	Mon,  3 Nov 2025 16:30:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="McZb/VDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C328C10E43B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 16:30:09 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-475dab5a5acso21294585e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 08:30:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762187408; x=1762792208;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=84F0QgR4+jds+lqPjKDSBSqClUiU/2oz/AngUspSNH8=;
 b=McZb/VDfRwx23KsxCq/lfdYR/w8PxmPrpbgf3yX8tPL9cR8XBIAfSvW8SgqxqK6H/8
 Ub+GWLlRnOB4mwcmj5O6oW68mjQhFSovyMFJRLv6N/zsUuZt9YUGPF+cbXhx8jgnzVMX
 XTS+HOW2IzylB9ZqahqDC++qyLUY74+vNedHoDg+4z7csJYq4cG1XZLEgCXZb/Q/gIdh
 8pKf5YSIylRsY1WbTi9wXRHVafs4erEc/XSzrDI3q17gli8P+vrwst5Pg8RYYE7pC3ng
 XbfCo0YQfnBXyPF05mX4r16WLoA4T+108St0YrqsPULmIY8NPqKYMUhexRSq5fXC0T4X
 SQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762187408; x=1762792208;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=84F0QgR4+jds+lqPjKDSBSqClUiU/2oz/AngUspSNH8=;
 b=dyrWBZAPl16/Tqopgwe2MqAdieg+B4lC+h6eo2phwm2N+Z7x5NK1OuYBccQOIsu2hX
 7bcnbdbt8F9rrgOP4H0UVUkckqrQHs6zCOnPu21CLLOks49SauFdUYgcvr4ZRMQow6WH
 dplEs1w73ieLisppeKN082+WLJGb3AkX1ZUcldmzInIZYBBuX79DvJd540y9+cBVIieJ
 ktQWGZ6g+sSamr3R8cZKL0Wc+aS40tme2WTPO4TOu9gnAuxwtVBR5+/Vam875aPywTJF
 9f1D2Sh9ieBp6goLA/l0xCbCUb/KzUQA6s8jIa68NxiPd+MvdWiKLBSQrqE7/V3WKeD2
 TH6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnqDWY+3ZZzjweL7rmYelYAVAIxe7X4V4OA/qZ+tx3cHKq3ZVctTDjWqE2zvn46ie5AWiRNbYUCKU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXi7qPj72zjXPDFpmjIAB40KKEa6Vz6o0aKz4Sk4m2q2FWwGV1
 0jTLj68mAbgD11xGLFLf7p5Gg5jUoQJ3P++pr4/cgngtVVSkgKasxUV3oO213glCrQE=
X-Gm-Gg: ASbGncvMzByphMGnnikd4q34klMDF4NEWPjYfObRoufkhypNONErx2NdpEcs6eoJqeV
 JAN+HwJnEQ2917aiVMIxG0TLSm5woMHlXphLSv878cerkCp7DS57acYw/AnkNLT1zgkjGBneSSk
 lvRvdAZSAa3XyOeMg9qTMbeG+maeYcwxg9mCDc2mch90cEM/4ikcLIJZJuNgQe5+gBWa+kG8FCx
 PK6FhGEqNzPyctr8m7VRHOVWXaJM3JTthiQT5CWoeGJnPFWE2RfUG9byN207/btWwxaTDumgSWP
 Illo7Ut2QEeaf/N7Fng01xcIK5uKjJFIbIY51SL5uoaCA4B2jav4gIsFLE2/Uslk+d1szV2KMN7
 rS4iJ6pWX1ZS+sR69cmBfZVMSGubNju4M2K6Wvh7hqPX33WJLsBvPGbdl75nbnEdQQyyoME20wF
 gSdAYktADlCAgtu91+l2YJXxEvxfFwjw06iimzPymq11A1IAWbB1TwZK8cOEQfYvSBwkBS/A==
X-Google-Smtp-Source: AGHT+IF/kGs5jea5FahI1rZFZGhV1Eh4Fy1sLd4uiFaXvIWVe3vieePJLCoPtu7DkEqIeKjkJL2wCg==
X-Received: by 2002:a05:600c:83ce:b0:471:989:9d85 with SMTP id
 5b1f17b1804b1-47730871fa6mr144953305e9.19.1762187406607; 
 Mon, 03 Nov 2025 08:30:06 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429d1061efasm9781324f8f.24.2025.11.03.08.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 08:30:05 -0800 (PST)
Date: Mon, 3 Nov 2025 16:31:35 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH v2 2/2] backlight: aw99706: Add support for Awinic
 AW99706 backlight
Message-ID: <aQjY5_uEaTv4_L2s@aspen.lan>
References: <20251103110648.878325-1-caojunjie650@gmail.com>
 <20251103110648.878325-3-caojunjie650@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103110648.878325-3-caojunjie650@gmail.com>
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

On Mon, Nov 03, 2025 at 07:06:48PM +0800, Junjie Cao wrote:
> From: Pengyu Luo <mitltlatltl@gmail.com>
>
> Add support for Awinic AW99706 backlight, which can be found in
> tablet and notebook backlight, one case is the Lenovo Legion Y700
> Gen4. This driver refers to the official datasheets and android
> driver, they can be found in [1].
>
> [1] https://www.awinic.com/en/productDetail/AW99706QNR
>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> ---
> Changes in v2:
> - add handler for max-brightness and default-brightness
> - use proper units for properties (Krzysztof)
> - drop non-fixed properties (Krzysztof)
> - include default values in the aw99706_dt_props table (Daniel)
> - warn when a property value from DT is invalid (Daniel)
> - drop warning when optional properties are missing (Daniel)
> - add a function pointer into the aw99706_dt_props table to handle lookup (Daniel)
> - use a lookup function instead of hardcoding the formula for the iLED max (Daniel)
> - move BL enalbe handler into aw99706_update_brightness (Daniel)
> - Link to v1: https://lore.kernel.org/linux-leds/20251026123923.1531727-3-caojunjie650@gmail.com

Thanks for the changes.

I'm afraid I don't like encoding the `shift` in the DT properties table.
Caching something that is so easy to recalculate makes no sense to me.
See below:


> +struct aw99706_dt_prop {
> +	const char * const name;
> +	int (*lookup)(const struct aw99706_dt_prop *prop, u32 dt_val, u8 *val);
> +	const u32 * const lookup_tbl;
> +	u8 tbl_size;
> +	u8 reg;
> +	u8 mask;
> +	u8 shift;

There should bee no need to record `shift` here. It's just a
duplicating information already held in `mask`.


> +	u32 def_val;
> +};
> +
> +static int aw99706_dt_property_lookup(const struct aw99706_dt_prop *prop,
> +				      u32 dt_val, u8 *val)
> +{
> +	int i;
> +
> +	if (!prop->lookup_tbl) {
> +		*val = dt_val;
> +		return 0;
> +	}
> +
> +	for (i = 0; i < prop->tbl_size; i++)
> +		if (prop->lookup_tbl[i] == dt_val)
> +			break;
> +
> +	*val = i;
> +
> +	return i == prop->tbl_size ? -1 : 0;
> +}
> +
> +#define MIN_ILED_MAX	5000
> +#define MAX_ILED_MAX	50000
> +#define STEP_ILED_MAX	500
> +
> +static int
> +aw99706_dt_property_iled_max_convert(const struct aw99706_dt_prop *prop,
> +				     u32 dt_val, u8 *val)
> +{
> +	if (dt_val > MAX_ILED_MAX || dt_val < MIN_ILED_MAX)
> +		return -1;
> +
> +	*val = (dt_val - MIN_ILED_MAX) / STEP_ILED_MAX;
> +
> +	return (dt_val - MIN_ILED_MAX) % STEP_ILED_MAX;
> +}
> +
> +static const struct aw99706_dt_prop aw99706_dt_props[] = {
> +	{
> +		"awinic,dim-mode", aw99706_dt_property_lookup,
> +		NULL, 0,
> +		AW99706_CFG0_REG,
> +		AW99706_DIM_MODE_MASK, __builtin_ctz(AW99706_DIM_MODE_MASK),

These __builtin_ctz() calls shouldn't be in the lookup table (if they
are not in the lookup table then can never be inconsistant with the
mask).


> +		1,
> +	},
<snip>
> +	{
> +		"awinic,ramp-ctl", aw99706_dt_property_lookup,
> +		NULL, 0,
> +		AW99706_CFG6_REG,
> +		AW99706_RAMP_CTL_MASK, __builtin_ctz(AW99706_RAMP_CTL_MASK),
> +		2,
> +	},
> +};
> +
> +struct reg_init_data {
> +	u8 reg;
> +	u8 mask;
> +	u8 val;
> +};
> +
> +static struct reg_init_data reg_init_tbl[ARRAY_SIZE(aw99706_dt_props)];
> +
> +static void aw99706_dt_parse(struct aw99706_device *aw,
> +			     struct backlight_properties *bl_props)
> +{
> +	const struct aw99706_dt_prop *prop;
> +	u32 dt_val;
> +	int ret, i;
> +	u8 val;
> +
> +	for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> +		prop = &aw99706_dt_props[i];
> +		ret = device_property_read_u32(aw->dev, prop->name, &dt_val);
> +		if (ret < 0)
> +			dt_val = prop->def_val;
> +
> +		if (prop->lookup(prop, dt_val, &val)) {
> +			dev_warn(aw->dev, "invalid value %d for property %s, using default value %d\n",
> +				 dt_val, prop->name, prop->def_val);
> +
> +			prop->lookup(prop, prop->def_val, &val);
> +		}
> +
> +		reg_init_tbl[i].reg = prop->reg;
> +		reg_init_tbl[i].mask = prop->mask;
> +		reg_init_tbl[i].val = val << prop->shift;

Can't you just use FIELD_PREP() to set val (either here or at the point
the init table is consumed)? That why there's no ffs() or clz() at all.


> +	}
> +
> +	aw->init_tbl = reg_init_tbl;
> +	aw->init_tbl_size = ARRAY_SIZE(reg_init_tbl);

Copying a pointer to a single instance static data buffer into a
dynamically allocated data structure isn't right.

You should include the init table as part of `struct aw99706_device`.


> +
> +	bl_props->brightness = AW99706_MAX_BRT_LVL >> 1;
> +	bl_props->max_brightness = AW99706_MAX_BRT_LVL;
> +	device_property_read_u32(aw->dev, "default-brightness",
> +				 &bl_props->brightness);
> +	device_property_read_u32(aw->dev, "max-brightness",
> +				 &bl_props->max_brightness);
> +
> +	if (bl_props->max_brightness > AW99706_MAX_BRT_LVL)
> +		bl_props->max_brightness = AW99706_MAX_BRT_LVL;
> +
> +	if (bl_props->brightness > bl_props->max_brightness)
> +		bl_props->brightness = bl_props->max_brightness;
> +}
> +
> +static int aw99706_hw_init(struct aw99706_device *aw)
> +{
> +	int ret, i;
> +
> +	gpiod_set_value_cansleep(aw->hwen_gpio, 1);
> +
> +	for (i = 0; i < aw->init_tbl_size; i++) {
> +		ret = aw99706_i2c_update_bits(aw, aw->init_tbl[i].reg,
> +					      aw->init_tbl[i].mask,
> +					      aw->init_tbl[i].val);
> +		if (ret < 0) {
> +			dev_err(aw->dev, "Failed to write init data %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
> +{
> +	int ret;
> +	u8 val;
> +
> +	FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);

This should use FIELD_PREP() not FIELD_MODIFY();


> +	ret = aw99706_i2c_update_bits(aw, AW99706_CFGD_REG,
> +				      AW99706_BACKLIGHT_EN_MASK, val);
> +	if (ret)
> +		dev_err(aw->dev, "Failed to enable backlight!\n");
> +
> +	return ret;
> +}


Daniel.
