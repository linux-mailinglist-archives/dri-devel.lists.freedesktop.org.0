Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7317DA62
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401096E2D6;
	Mon,  9 Mar 2020 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E8DA6E07D
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 21:47:52 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id t14so3165586plr.8
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jJDC8Nnm4L4CGbPKhZAhNhjZs4K9A5jkhmw2WKtbXvE=;
 b=Xc45nRq6+6S+BPEEpPP+4qYsrd/yLeFpPUjzp8hif0jnk5SK49WpGYuBAmRbn5IrpE
 a3APlX9HUnDyjhdWOR+9dneLxP3Kw+sXYF8aBmBpjElev2SHOMCC3XtbyyT6epEwQ9/e
 +KPJHUHbaUWnoMg/a6cRtamWF4U0Y+p59eKVoyPKUmAdn3FEo/8WoIrWt3WUb1ih6+UN
 Wl2LScuXMfAtXgDDG2kZQVo6qVyGEHkxHOb/nV/XnBLlhD2KWTEcGSZX8CjaY3JnunZf
 XZfO4xWhHNWiTbygLclPt5EP4sd6NgnCtl5WUY5/sbBr0YT+VEJGD0t8asF5od1cLT03
 iOhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jJDC8Nnm4L4CGbPKhZAhNhjZs4K9A5jkhmw2WKtbXvE=;
 b=ZmEyVsAfstuufXG/CZfiuKb5MBzVudnXBnHvP5iv3MByXZJsM2kvCFazAE7CuyPV1r
 OTc+dIgbeq32wBSbUxgGMCW86DNl19unxh057FALv75UIWFEgx6zDkXHrynIHNCNsnMh
 dnxzmmWQg1zMOpZkKVwtx9G34CBqj/mBHaTvevwwqDwAtQDW7rYU5COAr5z9nJk1QZu5
 VgJHqu89csYgkHaBpjP5H/k/R32n/9GjUg0fEwlMZiianMOSDHMQnzxc/5TofiAak8Kp
 WhWc6AwzZUrg4iW1zfj8MxmCj/YaA5gpovBPHf1AABVtuMv6wcz9w49YCxRknvB82hSc
 wqiw==
X-Gm-Message-State: ANhLgQ1aAyR5xcLnNELAo6F9jnRHOZxd1BGUqyAxafc56NEDbPQcHAyx
 z6qa1hh0T/v4JmLYIU4ZQssg/w==
X-Google-Smtp-Source: ADFU+vssZQKZgUsi3zvBuFMQX3Exk1+IvjMjEEbarnjChBfU1sfwU0TO1HyH9F9S3DHVljCer4MCDw==
X-Received: by 2002:a17:90a:8983:: with SMTP id
 v3mr15069544pjn.65.1583704071686; 
 Sun, 08 Mar 2020 14:47:51 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id d186sm24369069pfc.8.2020.03.08.14.47.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2020 14:47:50 -0700 (PDT)
Date: Sun, 8 Mar 2020 14:47:48 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kiran Gunda <kgunda@codeaurora.org>
Subject: Re: [PATCH V1 2/2] backlight: qcom-wled: Add support for WLED5
 peripheral in PM8150L
Message-ID: <20200308214748.GL1094083@builder>
References: <1583153739-19170-1-git-send-email-kgunda@codeaurora.org>
 <1583153739-19170-3-git-send-email-kgunda@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583153739-19170-3-git-send-email-kgunda@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
 daniel.thompson@linaro.org, b.zolnierkie@samsung.com, jingoohan1@gmail.com,
 Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 robh+dt@kernel.org, jacek.anaszewski@gmail.com, pavel@ucw.cz,
 linux-arm-msm@vger.kernel.org, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon 02 Mar 04:55 PST 2020, Kiran Gunda wrote:
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
[..]
> @@ -147,14 +187,39 @@ struct wled {
>  	u32 max_brightness;
>  	u32 short_count;
>  	u32 auto_detect_count;
> +	u32 version;
>  	bool disabled_by_short;
>  	bool has_short_detect;
> +	bool cabc_disabled;
>  	int short_irq;
>  	int ovp_irq;
>  
>  	struct wled_config cfg;
>  	struct delayed_work ovp_work;
>  	int (*wled_set_brightness)(struct wled *wled, u16 brightness);
> +	int (*cabc_config)(struct wled *wled, bool enable);
> +	int (*wled_sync_toggle)(struct wled *wled);

Please split this patch in one that adds these and breaks out the wled3
support, and then a second patch that adds wled5.

> +};
> +
[..]
> +static int wled5_set_brightness(struct wled *wled, u16 brightness)
> +{
> +	int rc, offset;
> +	u16 low_limit = wled->max_brightness * 1 / 1000;
> +	u8 v[2], brightness_msb_mask;
> +
> +	/* WLED5's lower limit is 0.1% */
> +	if (brightness > 0 && brightness < low_limit)
> +		brightness = low_limit;
> +
> +	brightness_msb_mask = 0xf;
> +	if (wled->max_brightness == WLED5_SINK_REG_BRIGHT_MAX_15B)
> +		brightness_msb_mask = 0x7f;

Why not just brightness &= wled->max_brightness? But given that it seems
like the framework ensures that brightness <= max_brightness, why not
skip this altogether?

> +
> +	v[0] = brightness & 0xff;
> +	v[1] = (brightness >> 8) & brightness_msb_mask;
> +
> +	offset = wled5_brightness_reg[wled->cfg.mod_sel];
> +	rc = regmap_bulk_write(wled->regmap, wled->sink_addr + offset,
> +			v, 2);
> +	return rc;
> +}
> +
>  static int wled4_set_brightness(struct wled *wled, u16 brightness)
>  {
>  	int rc, i;
> @@ -237,7 +325,28 @@ static int wled_module_enable(struct wled *wled, int val)
>  	return 0;
>  }
>  
> -static int wled_sync_toggle(struct wled *wled)
> +static int wled5_sync_toggle(struct wled *wled)
> +{
> +	int rc;
> +	u8 val;
> +
> +	val = (wled->cfg.mod_sel == MOD_A) ? WLED5_SINK_REG_SYNC_MOD_A_BIT :
> +					     WLED5_SINK_REG_SYNC_MOD_B_BIT;
> +	rc = regmap_update_bits(wled->regmap,
> +				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
> +				WLED5_SINK_REG_SYNC_MASK, val);
> +	if (rc < 0)
> +		return rc;
> +
> +	val = 0;

Just plug 0 in the function call.

> +	rc = regmap_update_bits(wled->regmap,
> +				wled->sink_addr + WLED5_SINK_REG_MOD_SYNC_BIT,
> +				WLED5_SINK_REG_SYNC_MASK, val);
> +
> +	return rc;

And return regmap_update_bits(...);

> +}
> +

Regards,
Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
