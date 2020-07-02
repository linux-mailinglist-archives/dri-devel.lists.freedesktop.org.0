Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029F211EF6
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 10:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F2A6EA93;
	Thu,  2 Jul 2020 08:36:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10326EA93
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 08:36:03 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f7so24126832wrw.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jul 2020 01:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hgnku7Yju3s79Vx31zZuURx1E9u4J2Hc39v2v0ohpgs=;
 b=W0iRxf7rpSUzO5MObJSY4sTdXgxGLpViqm21o2OJzKu+fytqyFeNy6QhTgPssTwd+j
 xoKHQfV+WvG0ATr37ScRxGmNwXuRS+LxuNKCuc05FnzyasRfzI76nvQw4nbRvbJtjsth
 yB07Odzu4sEOk9aGpw40BJKwCpUZfncx/R7lAdfglD/NHLVYyOo5zoVfMIvTydK2kdGO
 AK6VRMUJ9MH6JEx9YB48BCVhiaPmkgRWrsI+jQ6E9e5yCOyMJOKQXXJDP9/uSyApkT55
 ZY2sHBss7xhVEc2f8rYoJtu4TDhQnlQiQ9trMRypQ2wnI0N5g6LpOYPMpk4jmsE6Kwc4
 TumQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=hgnku7Yju3s79Vx31zZuURx1E9u4J2Hc39v2v0ohpgs=;
 b=nrHiN3FoDIVRkK/eXzXJlhb6d/lXa0BMFsiJZVgCaJ7291kK1ZtmrcbrRIQSvVa+aw
 X9pSWIl5zG/HKmUpuvbZ7zbGhz7LfiCr3IrxtHL1yOvaR9L5EYG2Cdu7z5nQ7GfHdNGq
 VUtKN8v2glTdpAjSs0A5b5pn2q2TuD+1g/r1/qgjcWtEIZ05rTANBDrdq4EQDMh3uwPS
 K3wCOlfGPWFqghZDGkWA/pHp/RFK89/n0rkfGdAa0Np693llnE1LoUzE03kRZph4pCUd
 429hltdsyc+X3L/fMedaqkGtYoZAYzwWD5aDEJ7F+U2wkMXc2p39TnmyNVGAwDxPFqrI
 iDiA==
X-Gm-Message-State: AOAM5308kWfSaQ9Z6ivhjCoosY3Szk/iCQFPEn1fJCmLGGFs+JKmxaBg
 Im9uTcj0LuQgQQMGxIGaKsP7bg==
X-Google-Smtp-Source: ABdhPJyI+i2PN+9xcAVAT30oYHwbQhIv1VC84+cDkb8pNON1HivmYrv7209mLEEHRnxPGmb6A9Drbw==
X-Received: by 2002:a5d:458a:: with SMTP id p10mr29899550wrq.184.1593678962492; 
 Thu, 02 Jul 2020 01:36:02 -0700 (PDT)
Received: from [192.168.1.23] (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id n14sm10426837wro.81.2020.07.02.01.36.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2020 01:36:01 -0700 (PDT)
Subject: Re: [PATCH RESEND v1] drm/meson: viu: fix setting the OSD burst
 length in VIU_OSD1_FIFO_CTRL_STAT
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 jmasson@baylibre.com, linux-amlogic@lists.infradead.org
References: <20200620155752.21065-1-martin.blumenstingl@googlemail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <ce9e7fa5-cee6-cf69-43e6-da026f909f8a@baylibre.com>
Date: Thu, 2 Jul 2020 10:36:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200620155752.21065-1-martin.blumenstingl@googlemail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/06/2020 17:57, Martin Blumenstingl wrote:
> The burst length is configured in VIU_OSD1_FIFO_CTRL_STAT[31] and
> VIU_OSD1_FIFO_CTRL_STAT[11:10]. The public S905D3 datasheet describes
> this as:
> - 0x0 = up to 24 per burst
> - 0x1 = up to 32 per burst
> - 0x2 = up to 48 per burst
> - 0x3 = up to 64 per burst
> - 0x4 = up to 96 per burst
> - 0x5 = up to 128 per burst
> 
> The lower two bits map to VIU_OSD1_FIFO_CTRL_STAT[11:10] while the upper
> bit maps to VIU_OSD1_FIFO_CTRL_STAT[31].
> 
> Replace meson_viu_osd_burst_length_reg() with pre-defined macros which
> set these values. meson_viu_osd_burst_length_reg() always returned 0
> (for the two used values: 32 and 64 at least) and thus incorrectly set
> the burst size to 24.
> 
> Fixes: 147ae1cbaa1842 ("drm: meson: viu: use proper macros instead of magic constants")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

I also got an off-list:

Tested-by: Christian Hewitt <christianshewitt@gmail.com>

Applying to drm-misc-fixes

Thanks,
Neil

> ---
> re-send of v1 [0] with no changes as I still noticed that this is
> sitting in my tree and I wasn't asked to change anything in v1.
> 
> 
> [0] https://patchwork.kernel.org/patch/11510045/
> 
> 
>  drivers/gpu/drm/meson/meson_registers.h |  6 ++++++
>  drivers/gpu/drm/meson/meson_viu.c       | 11 ++---------
>  2 files changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_registers.h b/drivers/gpu/drm/meson/meson_registers.h
> index 8ea00546cd4e..049c4bfe2a3a 100644
> --- a/drivers/gpu/drm/meson/meson_registers.h
> +++ b/drivers/gpu/drm/meson/meson_registers.h
> @@ -261,6 +261,12 @@
>  #define VIU_OSD_FIFO_DEPTH_VAL(val)      ((val & 0x7f) << 12)
>  #define VIU_OSD_WORDS_PER_BURST(words)   (((words & 0x4) >> 1) << 22)
>  #define VIU_OSD_FIFO_LIMITS(size)        ((size & 0xf) << 24)
> +#define VIU_OSD_BURST_LENGTH_24          (0x0 << 31 | 0x0 << 10)
> +#define VIU_OSD_BURST_LENGTH_32          (0x0 << 31 | 0x1 << 10)
> +#define VIU_OSD_BURST_LENGTH_48          (0x0 << 31 | 0x2 << 10)
> +#define VIU_OSD_BURST_LENGTH_64          (0x0 << 31 | 0x3 << 10)
> +#define VIU_OSD_BURST_LENGTH_96          (0x1 << 31 | 0x0 << 10)
> +#define VIU_OSD_BURST_LENGTH_128         (0x1 << 31 | 0x1 << 10)
>  
>  #define VD1_IF0_GEN_REG 0x1a50
>  #define VD1_IF0_CANVAS0 0x1a51
> diff --git a/drivers/gpu/drm/meson/meson_viu.c b/drivers/gpu/drm/meson/meson_viu.c
> index 304f8ff1339c..aede0c67a57f 100644
> --- a/drivers/gpu/drm/meson/meson_viu.c
> +++ b/drivers/gpu/drm/meson/meson_viu.c
> @@ -411,13 +411,6 @@ void meson_viu_gxm_disable_osd1_afbc(struct meson_drm *priv)
>  			    priv->io_base + _REG(VIU_MISC_CTRL1));
>  }
>  
> -static inline uint32_t meson_viu_osd_burst_length_reg(uint32_t length)
> -{
> -	uint32_t val = (((length & 0x80) % 24) / 12);
> -
> -	return (((val & 0x3) << 10) | (((val & 0x4) >> 2) << 31));
> -}
> -
>  void meson_viu_init(struct meson_drm *priv)
>  {
>  	uint32_t reg;
> @@ -444,9 +437,9 @@ void meson_viu_init(struct meson_drm *priv)
>  		VIU_OSD_FIFO_LIMITS(2);      /* fifo_lim: 2*16=32 */
>  
>  	if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A))
> -		reg |= meson_viu_osd_burst_length_reg(32);
> +		reg |= VIU_OSD_BURST_LENGTH_32;
>  	else
> -		reg |= meson_viu_osd_burst_length_reg(64);
> +		reg |= VIU_OSD_BURST_LENGTH_64;
>  
>  	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD1_FIFO_CTRL_STAT));
>  	writel_relaxed(reg, priv->io_base + _REG(VIU_OSD2_FIFO_CTRL_STAT));
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
