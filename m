Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5A319BC6F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01CF96E9E6;
	Thu,  2 Apr 2020 07:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8201A6E90F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 10:59:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s13so8883842lfb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 03:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lebedev-lt.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Kz/wvvEw8riqfKsZFfaKvWpn4ePkjlhRkXHpb0+VV70=;
 b=ejfPSZulqW6tvHwp6O4/dUlM1nKpSZnaSH3gKz3lf/dZFBlKJTgeOxGPwCrbLlOp5x
 sjDvP0MNzNkWS1cmTGAw2bUyaoM4GyZINostLPnrriP2E5Le6XjvyFdo8cTnJWJLUFsf
 NNdTsdv/zRM7lI439J0JVL64Duxzrg0wGx3L7+65cWU4+UI5a5u8G8W/ZjOcKpXXQQMX
 cny7dzHBYyLYidmycoljgSzUG0AwqJq+iUOJH638eKjvzJp/LnB9gjzWrM8EJqBx9b66
 YWD9C9gfcr0zB+8BMDaRU73I7HNWAnk2YtNgyfcCbsXpRSAiS6a9GIeK4x7fOiknpV0s
 HRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Kz/wvvEw8riqfKsZFfaKvWpn4ePkjlhRkXHpb0+VV70=;
 b=BFNpPSV01K6X9zlmBg8nsUQPe62uT2PvF+Ip/EgNGG7IOg0V/n3obIiDmIhiH/j3sp
 X4SQao89mJo3C9i3x7oLXWPkUONqlHM9qLJpaa1GyAODEkpkRSD0Gnx2LBbJ1QiZYHHE
 diWPvLYp6Lhc1BymwGUEVEa0YAUOTb0SXzfQjf48KZQYFRC7kUcE6fR6sFDh6AIeAvoL
 f0vw9hYsGLzhSMK/ChcborS+2InursiZnQ4dmRBAhTPkV66J6VBey4KWwji5qijL1H1q
 bRwhdaY20a/5CMqSpJ4JLguDDNwD/qrb9SStGAWOt+SIny+VWb/oKAGH6JMNc6kbfHFq
 33Nw==
X-Gm-Message-State: AGi0PuY/NWomwn97ONOhhogg3xFKadAelC1MHlKi/iSqbI1RanjWAfmE
 huh2M+3XmyHOHa52c7BPpeyohw==
X-Google-Smtp-Source: APiQypL0dcEPevylSoyk56qeZt4wBG2S/JxfVQwOwqYclDb2rWm8vIGL5nT0j4NY6Uk65RKVtRpV6Q==
X-Received: by 2002:a19:f606:: with SMTP id x6mr14154741lfe.44.1585738768950; 
 Wed, 01 Apr 2020 03:59:28 -0700 (PDT)
Received: from [192.168.1.108] ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id r2sm1312764lfn.35.2020.04.01.03.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Apr 2020 03:59:28 -0700 (PDT)
Subject: Re: [PATCH 5/5] drm/sun4i: tcon: Support LVDS output on Allwinner A20
To: Maxime Ripard <maxime@cerno.tech>,
 Andrey Lebedev <andrey.lebedev@gmail.com>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
 <20200219180858.4806-6-andrey.lebedev@gmail.com>
 <20200220172512.dmjtqgyay73x3ubx@gilmour.lan>
From: Andrey Lebedev <andrey@lebedev.lt>
Message-ID: <fa780b70-f1cc-ee4c-e779-089c7e9159ab@lebedev.lt>
Date: Wed, 1 Apr 2020 13:59:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220172512.dmjtqgyay73x3ubx@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: airlied@linux.ie, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Maxime,

Since Linus' merge window is now open, do I have to do anything to get 
this merged into the mainline kernel?

On 2/20/20 7:25 PM, Maxime Ripard wrote:
> On Wed, Feb 19, 2020 at 08:08:58PM +0200, Andrey Lebedev wrote:
>> From: Andrey Lebedev <andrey@lebedev.lt>
>>
>> A20 SoC (found in Cubieboard 2 among others) requires different LVDS set
>> up procedure than A33. Timing controller (tcon) driver only implements
>> sun6i-style procedure, that doesn't work on A20 (sun7i).
>>
>> Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
>> ---
>>   drivers/gpu/drm/sun4i/sun4i_tcon.c | 37 +++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/sun4i/sun4i_tcon.h | 11 +++++++++
>>   2 files changed, 47 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> index b7234eef3c7b..09ee6e8c6914 100644
>> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
>> @@ -114,6 +114,30 @@ static void sun4i_tcon_channel_set_status(struct sun4i_tcon *tcon, int channel,
>>   	}
>>   }
>>
>> +static void sun4i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
>> +				      const struct drm_encoder *encoder)
>> +{
>> +	regmap_write(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
>> +		     SUN4I_TCON0_LVDS_ANA0_CK_EN |
>> +		     SUN4I_TCON0_LVDS_ANA0_REG_V |
>> +		     SUN4I_TCON0_LVDS_ANA0_REG_C |
>> +		     SUN4I_TCON0_LVDS_ANA0_EN_MB |
>> +		     SUN4I_TCON0_LVDS_ANA0_PD |
>> +		     SUN4I_TCON0_LVDS_ANA0_DCHS);
>> +
>> +	udelay(2); /* delay at least 1200 ns */
>> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
>> +			   SUN4I_TCON0_LVDS_ANA1_INIT,
>> +			   SUN4I_TCON0_LVDS_ANA1_INIT);
>> +	udelay(1); /* delay at least 120 ns */
>> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA1_REG,
>> +			   SUN4I_TCON0_LVDS_ANA1_UPDATE,
>> +			   SUN4I_TCON0_LVDS_ANA1_UPDATE);
>> +	regmap_update_bits(tcon->regs, SUN4I_TCON0_LVDS_ANA0_REG,
>> +			   SUN4I_TCON0_LVDS_ANA0_EN_MB,
>> +			   SUN4I_TCON0_LVDS_ANA0_EN_MB);
>> +}
>> +
>>   static void sun6i_tcon_setup_lvds_phy(struct sun4i_tcon *tcon,
>>   				      const struct drm_encoder *encoder)
>>   {
>> @@ -1455,7 +1479,18 @@ static const struct sun4i_tcon_quirks sun6i_a31s_quirks = {
>>   	.dclk_min_div		= 1,
>>   };
>>
>> +static const struct sun4i_tcon_quirks sun7i_a20_tcon0_quirks = {
>> +	.supports_lvds		= true,
>> +	.has_channel_0		= true,
>> +	.has_channel_1		= true,
>> +	.dclk_min_div		= 4,
>> +	/* Same display pipeline structure as A10 */
>> +	.set_mux		= sun4i_a10_tcon_set_mux,
>> +	.setup_lvds_phy		= sun4i_tcon_setup_lvds_phy,
>> +};
>> +
>>   static const struct sun4i_tcon_quirks sun7i_a20_quirks = {
>> +	.supports_lvds		= false,
> 
> False is already the default here.
> 
> I've removed it while applying
> 
> Maxime
> 

-- 
Andrey Lebedev aka -.- . -.. -.. . .-.
Software engineer
Homepage: http://lebedev.lt/
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
