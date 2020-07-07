Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D23218075
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jul 2020 09:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E491E6E8A3;
	Wed,  8 Jul 2020 07:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EADB6E220
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 19:53:16 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z17so39639386edr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 12:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ObbJNs9KUrWdrNDKvQCnZHVyrExyZiGAmxBZVtMEK/o=;
 b=W8Tw7evO/GRugstcrF4insKGvg7LROMTPhYnjqO5+AwzSMHvU09Je6xvHuUTerFZDs
 0lqmENWuuesNlLFpAq9gKz5j3Sf4XWIW3gz69UUE/FRoiiiC7bc0uzllTeYBGnDWDrVr
 mhyrwilBEsa+6sCwX9Hbs5IAhaZCftwR/3lLNGuFkpNWnruziqIqL1CpOJbRPnzmE2XV
 Y8leCnndo7DbK8mjN8Y/5JNi9y7zMUe5GqJSv4wTy5MAFgoarpkhui5Q7/VaoKLUkg0D
 i/iuqENvyME1Mqh5UJGohV23FfC3Ko1mzyHkY7p1+PoRzZ4aUXiABfV/I59uRL0bc2FG
 GuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ObbJNs9KUrWdrNDKvQCnZHVyrExyZiGAmxBZVtMEK/o=;
 b=oBlnXlujReeoxr1i/baXfBcSRVjmWyh36yVBUUryyUPePoZEJBa3E4kiSxzAoY6Qzc
 h9LvdgPucrfTE6JdMeWEjSBbepm06pNw9B6U9Q19Ut02QfBg8nXmuUdDhtG00Oq6DovV
 RhWWiYFH5OgXD+ipZim7JtE6hh91+T4Qyn5iSXeXRsnjONDwynyx1oURrwAPn9ymtiMN
 ZtaNA0LuKCk9E8yLOGXwyJRSTqHR3sBU9ulUhu8ccBBYBL+LpW3epw35oxRp5af2H5as
 JR1ueciOflsnr7NpQfcvFv5vX4XJXDbUwNv5zcjnPgtcp3dMqwdGYKChaA2pV2L86fAx
 bzSg==
X-Gm-Message-State: AOAM530NwgUIXgkS/NWNbtJPbV15BxkUbNWmrHuHl+BNJdN+i2fZqG18
 YZRWC7vF0Yvgk64TNqWbOdCoEDbaaqM=
X-Google-Smtp-Source: ABdhPJwcXSbonWI7wAIDy6RrZU9Di2od5ocH7Ihwqfei4R8hHgucdU0j+P1Ep3rr72mzUmp3GSGhtA==
X-Received: by 2002:a50:b941:: with SMTP id m59mr15162842ede.321.1594151594650; 
 Tue, 07 Jul 2020 12:53:14 -0700 (PDT)
Received: from [192.168.2.1] (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id p9sm804256ejd.50.2020.07.07.12.53.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2020 12:53:14 -0700 (PDT)
Subject: Re: [PATCH v2 14/14] phy/rockchip: inno-hdmi: Support more pre-pll
 configuration
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>
References: <20200108210740.28769-1-jonas@kwiboo.se>
 <20200108210740.28769-15-jonas@kwiboo.se>
From: Johan Jonker <jbx6244@gmail.com>
Message-ID: <425e10c2-ed03-be64-8153-9bc3657da10e@gmail.com>
Date: Tue, 7 Jul 2020 21:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200108210740.28769-15-jonas@kwiboo.se>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 08 Jul 2020 07:06:31 +0000
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
Cc: Algea Cao <algea.cao@rock-chips.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi,

What's the status for this patch?
This is just what I needed for A95X Z2 to get the vop+hdmi and monitor
working. ;)

Could this become applied to mainline already?
The ack is already there.

Thanks,

Johan Jonker

https://lore.kernel.org/lkml/20200620134659.4592-1-jbx6244@gmail.com/

On 1/8/20 10:07 PM, Jonas Karlman wrote:
> From: Algea Cao <algea.cao@rock-chips.com>
> 
> Adding the following freq cfg in 8-bit and 10-bit color depth:
> 
> {
>   40000000,  65000000,  71000000,  83500000, 85750000,
>   88750000, 108000000, 119000000, 162000000
> }
> 
> New freq has been validated by quantumdata 980.
> 
> For some freq which can't be got by only using integer freq div,
> frac freq div is needed, Such as 88.75Mhz 10-bit. But The actual
> freq is different from the target freq, We must try to narrow
> the gap between them. RK322X only support integer freq div.
> 
> The VCO of pre-PLL must be more than 2Ghz, otherwise PLL may be
> unlocked.
> 
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 74 ++++++++++++-------
>  1 file changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> index 3719309ad0d0..bb8bdf5e3301 100644
> --- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> +++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
> @@ -291,32 +291,56 @@ struct inno_hdmi_phy_drv_data {
>  	const struct phy_config		*phy_cfg_table;
>  };
>  
> +/*
> + * If only using integer freq div can't get frequency we want, frac
> + * freq div is needed. For example, pclk 88.75 Mhz and tmdsclk
> + * 110.9375 Mhz must use frac div 0xF00000. The actual frequency is different
> + * from the target frequency. Such as the tmds clock 110.9375 Mhz,
> + * the actual tmds clock we get is 110.93719 Mhz. It is important
> + * to note that RK322X platforms do not support frac div.
> + */
>  static const struct pre_pll_config pre_pll_cfg_table[] = {
> -	{ 27000000,  27000000, 1,  90, 3, 2, 2, 10, 3, 3, 4, 0, 0},
> -	{ 27000000,  33750000, 1,  90, 1, 3, 3, 10, 3, 3, 4, 0, 0},
> -	{ 40000000,  40000000, 1,  80, 2, 2, 2, 12, 2, 2, 2, 0, 0},
> -	{ 59341000,  59341000, 1,  98, 3, 1, 2,  1, 3, 3, 4, 0, 0xE6AE6B},
> -	{ 59400000,  59400000, 1,  99, 3, 1, 1,  1, 3, 3, 4, 0, 0},
> -	{ 59341000,  74176250, 1,  98, 0, 3, 3,  1, 3, 3, 4, 0, 0xE6AE6B},
> -	{ 59400000,  74250000, 1,  99, 1, 2, 2,  1, 3, 3, 4, 0, 0},
> -	{ 74176000,  74176000, 1,  98, 1, 2, 2,  1, 2, 3, 4, 0, 0xE6AE6B},
> -	{ 74250000,  74250000, 1,  99, 1, 2, 2,  1, 2, 3, 4, 0, 0},
> -	{ 74176000,  92720000, 4, 494, 1, 2, 2,  1, 3, 3, 4, 0, 0x816817},
> -	{ 74250000,  92812500, 4, 495, 1, 2, 2,  1, 3, 3, 4, 0, 0},
> -	{148352000, 148352000, 1,  98, 1, 1, 1,  1, 2, 2, 2, 0, 0xE6AE6B},
> -	{148500000, 148500000, 1,  99, 1, 1, 1,  1, 2, 2, 2, 0, 0},
> -	{148352000, 185440000, 4, 494, 0, 2, 2,  1, 3, 2, 2, 0, 0x816817},
> -	{148500000, 185625000, 4, 495, 0, 2, 2,  1, 3, 2, 2, 0, 0},
> -	{296703000, 296703000, 1,  98, 0, 1, 1,  1, 0, 2, 2, 0, 0xE6AE6B},
> -	{297000000, 297000000, 1,  99, 0, 1, 1,  1, 0, 2, 2, 0, 0},
> -	{296703000, 370878750, 4, 494, 1, 2, 0,  1, 3, 1, 1, 0, 0x816817},
> -	{297000000, 371250000, 4, 495, 1, 2, 0,  1, 3, 1, 1, 0, 0},
> -	{593407000, 296703500, 1,  98, 0, 1, 1,  1, 0, 2, 1, 0, 0xE6AE6B},
> -	{594000000, 297000000, 1,  99, 0, 1, 1,  1, 0, 2, 1, 0, 0},
> -	{593407000, 370879375, 4, 494, 1, 2, 0,  1, 3, 1, 1, 1, 0x816817},
> -	{594000000, 371250000, 4, 495, 1, 2, 0,  1, 3, 1, 1, 1, 0},
> -	{593407000, 593407000, 1,  98, 0, 2, 0,  1, 0, 1, 1, 0, 0xE6AE6B},
> -	{594000000, 594000000, 1,  99, 0, 2, 0,  1, 0, 1, 1, 0, 0},
> +	{ 27000000,  27000000, 1,  90, 3, 2, 2, 10, 3, 3,  4, 0, 0},
> +	{ 27000000,  33750000, 1,  90, 1, 3, 3, 10, 3, 3,  4, 0, 0},
> +	{ 40000000,  40000000, 1,  80, 2, 2, 2, 12, 2, 2,  2, 0, 0},
> +	{ 40000000,  50000000, 1, 100, 2, 2, 2,  1, 0, 0, 15, 0, 0},
> +	{ 59341000,  59341000, 1,  98, 3, 1, 2,  1, 3, 3,  4, 0, 0xE6AE6B},
> +	{ 59400000,  59400000, 1,  99, 3, 1, 1,  1, 3, 3,  4, 0, 0},
> +	{ 59341000,  74176250, 1,  98, 0, 3, 3,  1, 3, 3,  4, 0, 0xE6AE6B},
> +	{ 59400000,  74250000, 1,  99, 1, 2, 2,  1, 3, 3,  4, 0, 0},
> +	{ 65000000,  65000000, 1, 130, 2, 2, 2,  1, 0, 0, 12, 0, 0},
> +	{ 65000000,  81250000, 3, 325, 0, 3, 3,  1, 0, 0, 10, 0, 0},
> +	{ 71000000,  71000000, 3, 284, 0, 3, 3,  1, 0, 0,  8, 0, 0},
> +	{ 71000000,  88750000, 3, 355, 0, 3, 3,  1, 0, 0, 10, 0, 0},
> +	{ 74176000,  74176000, 1,  98, 1, 2, 2,  1, 2, 3,  4, 0, 0xE6AE6B},
> +	{ 74250000,  74250000, 1,  99, 1, 2, 2,  1, 2, 3,  4, 0, 0},
> +	{ 74176000,  92720000, 4, 494, 1, 2, 2,  1, 3, 3,  4, 0, 0x816817},
> +	{ 74250000,  92812500, 4, 495, 1, 2, 2,  1, 3, 3,  4, 0, 0},
> +	{ 83500000,  83500000, 2, 167, 2, 1, 1,  1, 0, 0,  6, 0, 0},
> +	{ 83500000, 104375000, 1, 104, 2, 1, 1,  1, 1, 0,  5, 0, 0x600000},
> +	{ 85750000,  85750000, 3, 343, 0, 3, 3,  1, 0, 0,  8, 0, 0},
> +	{ 88750000,  88750000, 3, 355, 0, 3, 3,  1, 0, 0,  8, 0, 0},
> +	{ 88750000, 110937500, 1, 110, 2, 1, 1,  1, 1, 0,  5, 0, 0xF00000},
> +	{108000000, 108000000, 1,  90, 3, 0, 0,  1, 0, 0,  5, 0, 0},
> +	{108000000, 135000000, 1,  90, 0, 2, 2,  1, 0, 0,  5, 0, 0},
> +	{119000000, 119000000, 1, 119, 2, 1, 1,  1, 0, 0,  6, 0, 0},
> +	{119000000, 148750000, 1,  99, 0, 2, 2,  1, 0, 0,  5, 0, 0x2AAAAA},
> +	{148352000, 148352000, 1,  98, 1, 1, 1,  1, 2, 2,  2, 0, 0xE6AE6B},
> +	{148500000, 148500000, 1,  99, 1, 1, 1,  1, 2, 2,  2, 0, 0},
> +	{148352000, 185440000, 4, 494, 0, 2, 2,  1, 3, 2,  2, 0, 0x816817},
> +	{148500000, 185625000, 4, 495, 0, 2, 2,  1, 3, 2,  2, 0, 0},
> +	{162000000, 162000000, 1, 108, 0, 2, 2,  1, 0, 0,  4, 0, 0},
> +	{162000000, 202500000, 1, 135, 0, 2, 2,  1, 0, 0,  5, 0, 0},
> +	{296703000, 296703000, 1,  98, 0, 1, 1,  1, 0, 2,  2, 0, 0xE6AE6B},
> +	{297000000, 297000000, 1,  99, 0, 1, 1,  1, 0, 2,  2, 0, 0},
> +	{296703000, 370878750, 4, 494, 1, 2, 0,  1, 3, 1,  1, 0, 0x816817},
> +	{297000000, 371250000, 4, 495, 1, 2, 0,  1, 3, 1,  1, 0, 0},
> +	{593407000, 296703500, 1,  98, 0, 1, 1,  1, 0, 2,  1, 0, 0xE6AE6B},
> +	{594000000, 297000000, 1,  99, 0, 1, 1,  1, 0, 2,  1, 0, 0},
> +	{593407000, 370879375, 4, 494, 1, 2, 0,  1, 3, 1,  1, 1, 0x816817},
> +	{594000000, 371250000, 4, 495, 1, 2, 0,  1, 3, 1,  1, 1, 0},
> +	{593407000, 593407000, 1,  98, 0, 2, 0,  1, 0, 1,  1, 0, 0xE6AE6B},
> +	{594000000, 594000000, 1,  99, 0, 2, 0,  1, 0, 1,  1, 0, 0},
>  	{ /* sentinel */ }
>  };
>  
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
