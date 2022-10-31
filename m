Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05447613198
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 09:20:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB95C10E152;
	Mon, 31 Oct 2022 08:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A2A10E152
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 08:20:38 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v1so14823861wrt.11
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 01:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=ZX30x93KVmADFYmGNHBbybIM7Fucv9/vRtD7L3HFB+I=;
 b=PtU52F1XkGcsIM9bVOHKYCRoiNjdGSaY2gUiiFnB0KpP/15wmLs43E1jzp0pwR125i
 l+xnxNh0QVchJymgsMeOo9hGBAQVyCR64dmvbnRpniRKYn55QyxyW5s30iA+mOWfEIKL
 ANXOKi7rj1TEUhTwi/GOT+W2ODfPC1etd4ql3aITGVBfBKV6lPQfM7MT6KzPX0YZ51S7
 dw1adqvf2Cs3R+PBPnPnqRpbkS6x8a9YcQStQxVY1Z/LZDlS1UqD78i6RwBvpkrITtqZ
 o7eMIdBrQjCvc1dxL2IBPXi5TT2RD7jxqciCLIDtjwVll5IhFVNN72QVrPQtef5BxLu6
 9k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZX30x93KVmADFYmGNHBbybIM7Fucv9/vRtD7L3HFB+I=;
 b=Tlbyvaifat8TnECyXYLTHOF5dboHvwuSLBXHJJEjLzSpOqzumoMTMvIsbE8MgkjJCB
 RUkkUej7ClPms6Tsm1AMakTaUS2HxW4loUZBJHRVGTRaRm/Z4pDpzf0EPaTYD06P6ckb
 PVlEox3n2lRn+gNRvv14vdWfOGIzbNXdRJ5QSYYgE/HkBDYBZq8dYFzVfGhZN0H3zysm
 qoAzCx2sbemJTdK5Gfx2Uhy6BvwKBpld1rrijfrPkug78Nf2BRhKq1Pm9J4emU8JSQjL
 ahtigim3YVQ0wi5sOIcMP87rwCPNlCyAMmEiqLNpjydXmLCnCIMzMHDLGmAwSPfbIfbB
 1GdQ==
X-Gm-Message-State: ACrzQf0wmyqQi43WIQ4hK30xfao+Z79OBPVo+UXXS870greRyrkrKsXf
 EPtshh/fwxCE1p3sqhA/fJQjog==
X-Google-Smtp-Source: AMsMyM7sNW8RV0MrIkYCvrvHMRMR5RuXIK7u1nn0Sg0f/TP9IAfGs+8iIMFW/mygjB2hQEwMmNKKBw==
X-Received: by 2002:adf:d1e5:0:b0:234:2aaf:3b97 with SMTP id
 g5-20020adfd1e5000000b002342aaf3b97mr7368289wrd.536.1667204437197; 
 Mon, 31 Oct 2022 01:20:37 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:f572:21f0:736:a7ca?
 ([2a01:e0a:898:f380:f572:21f0:736:a7ca])
 by smtp.gmail.com with ESMTPSA id
 bj29-20020a0560001e1d00b002366b241cf3sm6306559wrb.35.2022.10.31.01.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:20:36 -0700 (PDT)
Message-ID: <e8b6eb23-4968-af6c-c2d3-8e5fa64d9473@linaro.org>
Date: Mon, 31 Oct 2022 09:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RESEND PATCH v2] drm/bridge: dw-hdmi-i2s: set insert_pcuv bit if
 hardware supports it
To: Geraldo Nascimento <geraldogabriel@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Christian Hewitt <christianshewitt@gmail.com>
References: <Y01E5MvrnmVhnekO@geday>
Content-Language: en-US
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <Y01E5MvrnmVhnekO@geday>
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
Reply-To: neil.armstrong@linaro.org
Cc: ALSA-devel <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


On 17/10/2022 14:04, Geraldo Nascimento wrote:
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


I did some research and this insert_pcuv is already present in the 1.40a version
of the dw-hdmi databook, so I wonder why suddenly this is needed.

The insert_pcuv is documented as:
-------------------------------------------------------
When set (1'b1), it enables the insertion of the PCUV (Parity, Channel Status, User
bit and Validity) bits on the incoming audio stream (support limited to Linear PCM
audio).
If disabled, the incomming audio stream must contain the PCUV bits, mapped
acording to 2.6.4.2 Data Mapping Examples
--------------------------------------------------------


What's interesting is this register is only present if thre DW-HDMI IP is configured
as GPAUD or GDOUBLE, meaning it must have GPAUD enabled. So it has
something to do with it, so what's value of it when GPAUD isn't present in the IP ?

And HDMI2 spec added this, even PCVU were required before:
--------------------------------------------------------
Note that PCUV refers to the parity bit (P), channel status (C), user data (U), and validity bit (V) as defined in IEC
60958-1.
--------------------------------------------------------

So it has something to do with IEC60958-1 stream format, do maybe this
insert_pcuv should only be enforced when the input stream is _not_ IEC60958-1 ?

Neil

> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> 
> ---
> 
> v1->v2: SoC->SoM on description, better commenting, minor style changes,
> 	conditional application of fix for L-PCM only
> 
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio-20221017.c
> @@ -42,6 +42,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>   	struct dw_hdmi *hdmi = audio->hdmi;
>   	u8 conf0 = 0;
>   	u8 conf1 = 0;
> +	u8 conf2 = 0;
>   	u8 inputclkfs = 0;
>   
>   	/* it cares I2S only */
> @@ -101,6 +102,28 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>   		return -EINVAL;
>   	}
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
>   	dw_hdmi_set_sample_rate(hdmi, hparms->sample_rate);
>   	dw_hdmi_set_channel_status(hdmi, hparms->iec.status);
>   	dw_hdmi_set_channel_count(hdmi, hparms->channels);
> @@ -109,6 +120,7 @@ static int dw_hdmi_i2s_hw_params(struct device *dev, void *data,
>   	hdmi_write(audio, inputclkfs, HDMI_AUD_INPUTCLKFS);
>   	hdmi_write(audio, conf0, HDMI_AUD_CONF0);
>   	hdmi_write(audio, conf1, HDMI_AUD_CONF1);
> +	hdmi_write(audio, conf2, HDMI_AUD_CONF2);
>   
>   	return 0;
>   }
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-20221017.h
> @@ -931,6 +931,11 @@ enum {
>   	HDMI_AUD_CONF1_WIDTH_16 = 0x10,
>   	HDMI_AUD_CONF1_WIDTH_24 = 0x18,
>   
> +/* AUD_CONF2 field values */
> +	HDMI_AUD_CONF2_HBR = 0x01,
> +	HDMI_AUD_CONF2_NLPCM = 0x02,
> +	HDMI_AUD_CONF2_INSERT_PCUV = 0x04,
> +
>   /* AUD_CTS3 field values */
>   	HDMI_AUD_CTS3_N_SHIFT_OFFSET = 5,
>   	HDMI_AUD_CTS3_N_SHIFT_MASK = 0xe0,

