Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2226D978A74
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 23:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463A110EDAC;
	Fri, 13 Sep 2024 21:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RxxXGWuX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4633510EDB0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 21:12:44 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-374c7e64b60so1622544f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 14:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726261962; x=1726866762; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=QP4N0jFbDkKOuN4zodu72FSNgcwkeZYI9qprlris/e8=;
 b=RxxXGWuX3f1hpBydeL/HWfOwhW2A/9d+3qBNQ9p5p8H6h9844BlqyT4LePJp6HGv+k
 tCqhkw+KGqgljYlPmuUHneatPvOI+38Pz9SFbRuxmHJBY5kuJrH4l6idRcdXLutrQfK6
 f+8Ub+L4O91hxh527cqejbiaYpbvuyeGQnc6BvJ1jDTUEXjsr0xdqOVYKxaED1doxvvI
 pk3UGTY/5wWUe7ib74nfNd/mEUOpO1Zj3xywAFq1OUH2B8a4WsVCTO7iM3w26cP5Rbxe
 K9D4CPBX0+aJkBklvzypzR44/Q+sj7LFMb/wDz0Ms0PT+jxprkLWUPVi6c4GOOgZ7Wy/
 RSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726261962; x=1726866762;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QP4N0jFbDkKOuN4zodu72FSNgcwkeZYI9qprlris/e8=;
 b=HOXNPW+n/mWRJCoxEMgdXgNmgKE1qFY9oVUpP2un9bshRdoaZHv27ie63IQNWxT71M
 7vzSeswXp6dnNvdP/rw4rqE55HURkv42waJSEXleJI1s6NDy5ykDIrmpFJfwvuMg/pqq
 mqaoTCuJSqRm29rpyTh2nCN+JBmPoxdEWYeU5mSLJFQ7x5TXt+cHgfNsJgrB2tQzLtnp
 25HjDWsNKIpffg5/5ygRQqqGxfeEcOs6u9mSz2fV5l1FbS8gXZEuwRgkPX/55qaD+YRY
 xYFjHwmjvU/JonkRz09NQp9BmXi7M2x0JTZNC+S/WpZ7ELBU6CivoEirPQnXfS7oxDRb
 XZvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4h5W33eMu7HtRKYnybI6wnnRZyTd0vfYtlUItH7F97X0Mmzgy74I1NuM2TkMLToL1/G2oNUWxeRo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw9s06UX4ITJ/Rq3K5J0hU/D9n8jaqtvVJQ67y9R5gy3wePfHsE
 9fLmVlUdMB9f/M5QN70SZxfV2qiZhwnTWqHy3DSOGALRfGp4rLYM
X-Google-Smtp-Source: AGHT+IGfcJE76v+t0nq/ngpBNhAyG0Jx8lYj7L8r7xRuQaBHUsh5Vps4FAmFOnjokTlsatC8O0jocw==
X-Received: by 2002:a5d:6781:0:b0:374:c2e9:28b8 with SMTP id
 ffacd0b85a97d-378c2d065cemr4370850f8f.18.1726261961510; 
 Fri, 13 Sep 2024 14:12:41 -0700 (PDT)
Received: from ?IPV6:2a02:8010:6606:0:24fa:de0f:fe08:38e3?
 ([2a02:8010:6606:0:24fa:de0f:fe08:38e3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e780ddebsm101457f8f.112.2024.09.13.14.12.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 14:12:41 -0700 (PDT)
Message-ID: <9b0a0cd8-0994-4235-9823-37f0da1a751d@gmail.com>
Date: Fri, 13 Sep 2024 22:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hugh Cole-Baker <sigmaris@gmail.com>
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit if
 hardware supports it
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 Mark Brown <broonie@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <Y01E5MvrnmVhnekO@geday>
Content-Language: en-GB
In-Reply-To: <Y01E5MvrnmVhnekO@geday>
Content-Type: text/plain; charset=UTF-8
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

Hi Geraldo, and apologies for resurrecting a 2 year old thread...

On 17/10/2022 13:04, Geraldo Nascimento wrote:
> Hi Mark, resending this as it failed to apply in my last submission. Added
> Neil Armstrong to Cc: as hopefully he will be able to better review this.
> 
> Thanks,
> Geraldo Nascimento
> 
> ---
> 
> Starting with version 2.10a of Synopsys DesignWare HDMI controller the
> insert_pcuv bit was introduced. On RK3399pro SoM (Radxa Rock Pi N10),
> for example, if we neglect to set this bit and proceed to enable hdmi_sound
> and i2s2 on the device tree there will be extreme clipping of sound
> output, to the point that music sounds like white noise. Problem
> could also manifest as just mild cracking depending of HDMI audio
> implementation of sink. Setting insert_pcuv bit (bit 2 of
> aud_conf2 Audio Sample register) fixes this.
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>

I also had the HDMI audio clipping issue described here, on a RK3399. This was
on a 6.1.23 kernel based on the one used by LibreELEC.tv with their out-of-tree
patches for video decoding, 4k HDMI support, etc. When testing this patch I
also updated my kernel tree to 6.10.3, and found that even without this patch,
on 6.10.3 the problem no longer happens.

I added printk to show the value of AUD_CONF2, and found that on 6.1.23, the
value is 0 before the code in this patch sets the insert_pcuv bit. On 6.10.3
the value is 4, i.e. insert_pcuv is already set.

According to the RK3399 TRM, the value-after-reset of the insert_pcuv bit is 1,
so apparently on the 6.1.23 kernel something is clearing the bit after HW reset
but before this driver sets the hw_params, and this patch sets it back to the
correct value. On 6.10.3 the bit is not cleared, i.e. this patch is seemingly
no longer necessary (but is a harmless no-op).

> 
> ---
> 
> v1->v2: SoC->SoM on description, better commenting, minor style changes,
> 	conditional application of fix for L-PCM only
> 
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> @@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>  	struct dw_hdmi *hdmi = audio->hdmi;
>  	u8 conf0 = 0;
>  	u8 conf1 = 0;
> +	u8 conf2 = 0;
>  	u8 inputclkfs = 0;
>  
>  	/* it cares I2S only */
> @@ -101,6 +102,28 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>  		return -EINVAL;
>  	}
>  
> +	/*
> +	 * dw-hdmi introduced insert_pcuv bit in
> +	 * version 2.10a.
> +	 *
> +	 * This single bit (bit 2 of HDMI_AUD_CONF2)
> +	 * when set to 1 will enable the insertion of the PCUV
> +	 * (Parity, Channel Status, User bit and Validity)
> +	 * bits on the incoming audio stream.
> +	 * 
> +	 * Support is limited to Linear PCM audio. If
> +	 * neglected, the lack of valid PCUV bits
> +	 * on L-PCM streams will cause anything from
> +	 * mild cracking to full blown extreme
> +	 * clipping depending on the HDMI audio
> +	 * implementation of the sink.
> +	 *
> +	 */
> +
> +	if (hdmi_read(audio, HDMI_DESIGN_ID) >= 0x21 &&
> +			!(hparms->iec.status[0] & IEC958_AES0_NONAUDIO))
> +		conf2 = HDMI_AUD_CONF2_INSERT_PCUV;
> +
>  	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
>  	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
>  	dw_hdmi_set_channel_count(hdmi, hparms->channels);
> @@ -109,6 +120,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>  	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
>  	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
>  	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
> +	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
>  
>  	return 0;
>  }
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h

btw, this patch doesn't apply without edits as these filenames are incorrect.

> @@ -931,6 +931,11 @@ enum {
>  	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
>  	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
>  
> +/* AUD_CONF2 field values */
> +	HDMI_AUD_CONF2_HBR = 0x01,
> +	HDMI_AUD_CONF2_NLPCM = 0x02,
> +	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
> +
>  /* AUD_CTS3 field values */
>  	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
>  	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,

Best regards,
Hugh
