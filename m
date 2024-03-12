Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97328879AEB
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 19:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C98D10F4F2;
	Tue, 12 Mar 2024 18:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aeuRIq49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D945B10F5F3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 18:03:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-513298d6859so5732544e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 11:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710266608; x=1710871408;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HREX7H/9qDu7coR15IdnVSKnBY8ogVJjtclSGzuYtSo=;
 b=aeuRIq49fkNkcU13OE1JStax3juUb/STgqOlsqkq9vH+5TgYLjU1tKdlWDUzOKikvK
 OjF8yEcuuA7+pZK1oUhXnSzscb+Sb/ZKV9LQ201w+qAWSqnbeK6oKsP8A4sVCvHfZnSk
 Kz7PR0WoBq2Wt1WxUQXoF9o6sdb+69cwaBAzm2S3k6JuB+6A+TAxmxj3MyBh7p1wkw7X
 QyFCQ6sOq7WY+/tLN02Pb6JfJJWUnjZ9IP4WvWLLu31z4ViqqGApF9zyvKrULwnj7vB6
 jrd0/zaIA1jEVI0hNSXXwfITlcvpNNdr/mJP8Z7/WhD2Qo0E3v7Dd8y+tSB+sfTYdUHq
 tYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710266608; x=1710871408;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HREX7H/9qDu7coR15IdnVSKnBY8ogVJjtclSGzuYtSo=;
 b=Aufd+NXKBJHXTkWBBKuwEOGDAbGD1FFIbPZ5P63hUgK0Ba7KVGkegzjNwGmESpvAJL
 hyQlpsGlNhGGSzlWfyD0GCCFDIierwrzGIR8cY6uurRiBo2HJL9mOiyv1pC8mF/olN3C
 3sxfO4nxhzQItpEqX5zKYJOwkyY/jRrFVtrlXjf8Dss+Nd+y/ECAuHG1qm/5gDdogjY3
 GpfXKaUDG5sDQNrPXrpcFr7ZoYbiq1P/4Wl6e9QNqrSzEOHU+pT/aZq82ooTAijaVkZc
 o3gbmTM1MZyFC/0Ylbawt+sMBIN3HwisEWm2U4rC55mZs5qnD8EWlDIS1f80LXH+jVIz
 hkmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkUOzIOHtUP5ctaKyVf2CATcglotAiQ5CFPKvNDM+BHT8jtdG3WXEeSkTm90IVgWmW/0lTxUgjYAUp0nASp9ZdNSk9Xg5EDojYnWHGdGr2
X-Gm-Message-State: AOJu0Yx/YfQhrfah+FR9apakej2SOrs0OIdXJY37ixMQCf75eWUBa2WG
 b3mpBUpH5k5xgqV43pvxgEqK9DN07ZgkrpN7kLyUcdVTZi+kBvowj7dZz97Q47Y=
X-Google-Smtp-Source: AGHT+IH4QkVIYDqyhzAKmOcXC+nBQU3/7sOVXezpH3hXulIwAWJtf0fWxm8Rb21sEMqvyOTNR1ZG+Q==
X-Received: by 2002:a05:6512:ba4:b0:513:a72c:de7c with SMTP id
 b36-20020a0565120ba400b00513a72cde7cmr2898449lfv.46.1710266608394; 
 Tue, 12 Mar 2024 11:03:28 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 bq7-20020a5d5a07000000b0033e95794186sm6250688wrb.83.2024.03.12.11.03.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 11:03:27 -0700 (PDT)
Message-ID: <c441a132-b16b-4244-a712-8971c902d4d7@baylibre.com>
Date: Tue, 12 Mar 2024 19:03:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 26/02/2024 17:09, Mark Brown wrote:
> On Mon, Feb 26, 2024 at 03:01:50PM +0100, amergnat@baylibre.com wrote:
> 
>> index 000000000000..13e95c227114
>> --- /dev/null
>> +++ b/sound/soc/codecs/mt6357.c
>> @@ -0,0 +1,1805 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MT6357 ALSA SoC audio codec driver
>> + *
> 
> Please use a C++ comment for the whole comment to make it clearer that
> this is intentional.

ok

> 
>> +static void set_playback_gpio(struct mt6357_priv *priv, bool enable)
>> +{
>> +	if (enable) {
>> +		/* set gpio mosi mode */
>> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_CLR, GPIO_MODE2_CLEAR_ALL);
>> +		regmap_write(priv->regmap, MT6357_GPIO_MODE2_SET, GPIO8_MODE_SET_AUD_CLK_MOSI |
>> +								  GPIO9_MODE_SET_AUD_DAT_MOSI0 |
>> +								  GPIO10_MODE_SET_AUD_DAT_MOSI1 |
>> +								  GPIO11_MODE_SET_AUD_SYNC_MOSI);
> 
> This would be a lot more legible if you worked out the values to set and
> then had a single set of writes, currently the indentation makes it very
> hard to read.  Similarly for other similar functions.

ok

> 
>> +static int mt6357_put_volsw(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(component);
>> +	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret = snd_soc_put_volsw(kcontrol, ucontrol);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	switch (mc->reg) {
>> +	case MT6357_ZCD_CON2:
>> +		regmap_read(priv->regmap, MT6357_ZCD_CON2, &reg);
>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTL] =
>> +			(reg & AUD_HPL_GAIN_MASK) >> AUD_HPL_GAIN_SFT;
>> +		priv->ana_gain[ANALOG_VOLUME_HPOUTR] =
>> +			(reg & AUD_HPR_GAIN_MASK) >> AUD_HPR_GAIN_SFT;
>> +		break;
> 
> It would probably be less code and would definitely be clearer and
> simpler to just read the values when we need them rather than constatly
> keeping a cache separate to the register cache.

Actually you must save the values because the gain selected by the user 
will be override to do a ramp => volume_ramp(.....):
- When you switch on the HP, you start from gain=-40db to final_gain 
(selected by user).
- When you switch off the HP, you start from final_gain (selected by 
user) to gain=-40db.

Also, the microphone's gain change when it's enabled/disabled.

So, it can implemented differently but currently it's aligned with the 
other MTK codecs and I don't see any resource wasted here.

> 
>> +	/* ul channel swap */
>> +	SOC_SINGLE("UL LR Swap", MT6357_AFE_UL_DL_CON0, AFE_UL_LR_SWAP_SFT, 1, 0),
> 
> On/off controls should end in Switch.

Sorry, I don't understand your comment. Can you reword it please ?

> 
>> +static const char * const hslo_mux_map[] = {
>> +	"Open", "DACR", "Playback", "Test mode"
>> +};
>> +
>> +static int hslo_mux_map_value[] = {
>> +	0x0, 0x1, 0x2, 0x3,
>> +};
> 
> Why not just use a normal mux here, there's no missing values or
> reordering?  Similarly for other muxes.

I've dug into some other codecs and it's done like that, but I've 
probably misunderstood something.

The only bad thing I see is enum is missing currently:

enum {
	PGA_MUX_OPEN = 0,
	PGA_MUX_DACR,
	PGA_MUX_PB,
	PGA_MUX_TM,
	PGA_MUX_MASK = 0x3,
};

static const char * const hslo_mux_map[] = {
	"Open", "DACR", "Playback", "Test mode"
};

static int hslo_mux_map_value[] = {
	PGA_MUX_OPEN, PGA_MUX_DACR, PGA_MUX_PB, PGA_MUX_TM,
};

> 
>> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
>> +{
>> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
>> +	unsigned int val;
>> +
>> +	pr_debug("%s() reg = 0x%x", __func__, reg);
>> +	regmap_read(priv->regmap, reg, &val);
>> +	return val;
>> +}
> 
> Remove these, there are vastly more logging facilities as standard in
> the regmap core.

ok

> 
>> +/* Reg bit defines */
>> +/* MT6357_GPIO_DIR0 */
>> +#define GPIO8_DIR_MASK				BIT(8)
>> +#define GPIO8_DIR_INPUT				0
> 
> Please namespace your defines, these look very generic.

ok

-- 
Regards,
Alexandre
