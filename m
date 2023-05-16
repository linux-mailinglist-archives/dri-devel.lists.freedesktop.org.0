Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85614704648
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 09:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD0110E305;
	Tue, 16 May 2023 07:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA8110E305
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 07:26:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3f41dceb9c9so73959365e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 00:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684221985; x=1686813985;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=dV6nEqOUElvHkxC7khMfphDue4ZzawC+PYSKHurzfeI=;
 b=Bvdv/OIOnjfVz26O/LfR3SLAYirWkZRc7cb0OviMirHCR40pqVDXaUQ9pHKRBARdOZ
 oGGy4+8ygMEztNDyoe0Rlig7mgz0T2vZwNdAkhtTDwRUHQxDPYUmLYrAljRaPAu0ivkv
 +8oyHmV1zjol8RGBUD5ku8QUR0feWpQYXJEGGhIWbiMPlhimdsp+7w7mjLnkir6F4tyq
 9OqBaSMyJx2dt/SsXfsiAUEfqwS0yBqPuWpuWqhWfFNZRNjQbfbNjs5dEHwXu8bDix47
 dc4Pnr5UT+Axps/jF9AvAbJTyw5zosNB/eXxu7wVxf2nlJMSgSI+tiTr3Zz7sxG9GGy2
 SH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684221985; x=1686813985;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dV6nEqOUElvHkxC7khMfphDue4ZzawC+PYSKHurzfeI=;
 b=TBlNz+nJuTYO7lR4Ufhvknzu1jiDHOMyr1atNVoZqa90pPUZbv/B5wSCwmBfpJhotO
 W7LiD5KsOlG6xepxhvQvZouhQqpyTg7j2F9YiTqvoyxaCbXWD6cj5RnCQSx3Tl5Wc8XJ
 KHcRBkxPqlEB1W1nq/Q/7RsJC3xo3asWGDSmTL6/b1xuYMh5LRosWOWJb5UzHnjCqFPK
 Xgg9lNgSvmDeq+8jg9dewncpnARF30R9HJN6WMgJhr/W3uQ4k6rxhwxyvVDvqIHcuy2k
 fAsXEMPHVQ+lDhFxh+BxSEs2+CNL7nGTzj1I963faMuBcpoeZkflmOZ6inCX7pfeBROx
 5Jnw==
X-Gm-Message-State: AC+VfDx1SlegpKNS9bc7m5/r2tasimYeWBDJwa8JEIKUK1+U8DTUwBTW
 A87wVpOKQGfYz03sSKeLGsXX6Q==
X-Google-Smtp-Source: ACHHUZ7M2fGU2KaLLdMa1ZKoROTfhea09i0vpvFyhxGSzTF5u2GdaySKXAkL8YzkoM5YJYlJ36bEUQ==
X-Received: by 2002:a7b:cc82:0:b0:3f4:26d4:91b0 with SMTP id
 p2-20020a7bcc82000000b003f426d491b0mr17724550wma.40.1684221984802; 
 Tue, 16 May 2023 00:26:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:86be:97a:a043:77a8?
 ([2a01:e0a:982:cbb0:86be:97a:a043:77a8])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a1ccc07000000b003f4ebeaa970sm1288579wmb.25.2023.05.16.00.26.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 May 2023 00:26:24 -0700 (PDT)
Message-ID: <21ec3bdb-aa5a-7b32-456d-404ae46511fc@linaro.org>
Date: Tue, 16 May 2023 09:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/1] drm/bridge: tc358767: explicitly set readable
 registers
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230516071949.375264-1-alexander.stein@ew.tq-group.com>
Organization: Linaro Developer Services
In-Reply-To: <20230516071949.375264-1-alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/05/2023 09:19, Alexander Stein wrote:
> This map was created from register map from datasheet (section 5.1.2).
> Unused registers are stated by address, so they show up in debugfs as well.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> When dumping the registers in debugfs there are a lot of unused and/or
> undocumented addresses. Instead explicitly state each readable register.
> 
>   drivers/gpu/drm/bridge/tc358767.c | 195 +++++++++++++++++++++++++++++-
>   1 file changed, 194 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 91f7cb56a654..954881ad5bdc 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1781,7 +1781,200 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
>   
>   static bool tc_readable_reg(struct device *dev, unsigned int reg)
>   {
> -	return reg != SYSCTRL;
> +	switch (reg) {
> +	/* DSI D-PHY Layer */
> +	case 0x004:
> +	case 0x020:
> +	case 0x024:
> +	case 0x028:
> +	case 0x02c:
> +	case 0x030:
> +	case 0x038:
> +	case 0x040:
> +	case 0x044:
> +	case 0x048:
> +	case 0x04c:
> +	case 0x050:
> +	case 0x054:
> +	/* DSI PPI Layer */
> +	case PPI_STARTPPI:
> +	case 0x108:
> +	case 0x110:
> +	case PPI_LPTXTIMECNT:
> +	case PPI_LANEENABLE:
> +	case PPI_TX_RX_TA:
> +	case 0x140:
> +	case PPI_D0S_ATMR:
> +	case PPI_D1S_ATMR:
> +	case 0x14c:
> +	case 0x150:
> +	case PPI_D0S_CLRSIPOCOUNT:
> +	case PPI_D1S_CLRSIPOCOUNT:
> +	case PPI_D2S_CLRSIPOCOUNT:
> +	case PPI_D3S_CLRSIPOCOUNT:
> +	case 0x180:
> +	case 0x184:
> +	case 0x188:
> +	case 0x18c:
> +	case 0x190:
> +	case 0x1a0:
> +	case 0x1a4:
> +	case 0x1a8:
> +	case 0x1ac:
> +	case 0x1b0:
> +	case 0x1c0:
> +	case 0x1c4:
> +	case 0x1c8:
> +	case 0x1cc:
> +	case 0x1d0:
> +	case 0x1e0:
> +	case 0x1e4:
> +	case 0x1f0:
> +	case 0x1f4:
> +	/* DSI Protocol Layer */
> +	case DSI_STARTDSI:
> +	case 0x208:
> +	case DSI_LANEENABLE:
> +	case 0x214:
> +	case 0x218:
> +	case 0x220:
> +	case 0x224:
> +	case 0x228:
> +	case 0x230:
> +	/* DSI General */
> +	case 0x300:
> +	/* DSI Application Layer */
> +	case 0x400:
> +	case 0x404:
> +	/* DPI */
> +	case DPIPXLFMT:
> +	/* Parallel Output */
> +	case POCTRL:
> +	/* Video Path0 Configuration */
> +	case VPCTRL0:
> +	case HTIM01:
> +	case HTIM02:
> +	case VTIM01:
> +	case VTIM02:
> +	case VFUEN0:
> +	/* System */
> +	case TC_IDREG:
> +	case 0x504:
> +	case SYSSTAT:
> +	case SYSRSTENB:
> +	case SYSCTRL:
> +	/* I2C */
> +	case 0x520:
> +	/* GPIO */
> +	case GPIOM:
> +	case GPIOC:
> +	case GPIOO:
> +	case GPIOI:
> +	/* Interrupt */
> +	case INTCTL_G:
> +	case INTSTS_G:
> +	case 0x570:
> +	case 0x574:
> +	case INT_GP0_LCNT:
> +	case INT_GP1_LCNT:
> +	/* DisplayPort Control */
> +	case DP0CTL:
> +	/* DisplayPort Clock */
> +	case DP0_VIDMNGEN0:
> +	case DP0_VIDMNGEN1:
> +	case DP0_VMNGENSTATUS:
> +	case 0x628:
> +	case 0x62c:
> +	case 0x630:
> +	/* DisplayPort Main Channel */
> +	case DP0_SECSAMPLE:
> +	case DP0_VIDSYNCDELAY:
> +	case DP0_TOTALVAL:
> +	case DP0_STARTVAL:
> +	case DP0_ACTIVEVAL:
> +	case DP0_SYNCVAL:
> +	case DP0_MISC:
> +	/* DisplayPort Aux Channel */
> +	case DP0_AUXCFG0:
> +	case DP0_AUXCFG1:
> +	case DP0_AUXADDR:
> +	case 0x66c:
> +	case 0x670:
> +	case 0x674:
> +	case 0x678:
> +	case 0x67c:
> +	case 0x680:
> +	case 0x684:
> +	case 0x688:
> +	case DP0_AUXSTATUS:
> +	case DP0_AUXI2CADR:
> +	/* DisplayPort Link Training */
> +	case DP0_SRCCTRL:
> +	case DP0_LTSTAT:
> +	case DP0_SNKLTCHGREQ:
> +	case DP0_LTLOOPCTRL:
> +	case DP0_SNKLTCTRL:
> +	case 0x6e8:
> +	case 0x6ec:
> +	case 0x6f0:
> +	case 0x6f4:
> +	/* DisplayPort Audio */
> +	case 0x700:
> +	case 0x704:
> +	case 0x708:
> +	case 0x70c:
> +	case 0x710:
> +	case 0x714:
> +	case 0x718:
> +	case 0x71c:
> +	case 0x720:
> +	/* DisplayPort Source Control */
> +	case DP1_SRCCTRL:
> +	/* DisplayPort PHY */
> +	case DP_PHY_CTRL:
> +	case 0x810:
> +	case 0x814:
> +	case 0x820:
> +	case 0x840:
> +	/* I2S */
> +	case 0x880:
> +	case 0x888:
> +	case 0x88c:
> +	case 0x890:
> +	case 0x894:
> +	case 0x898:
> +	case 0x89c:
> +	case 0x8a0:
> +	case 0x8a4:
> +	case 0x8a8:
> +	case 0x8ac:
> +	case 0x8b0:
> +	case 0x8b4:
> +	/* PLL */
> +	case DP0_PLLCTRL:
> +	case DP1_PLLCTRL:
> +	case PXL_PLLCTRL:
> +	case PXL_PLLPARAM:
> +	case SYS_PLLPARAM:
> +	/* HDCP */
> +	case 0x980:
> +	case 0x984:
> +	case 0x988:
> +	case 0x98c:
> +	case 0x990:
> +	case 0x994:
> +	case 0x998:
> +	case 0x99c:
> +	case 0x9a0:
> +	case 0x9a4:
> +	case 0x9a8:
> +	case 0x9ac:
> +	/* Debug */
> +	case TSTCTL:
> +	case PLL_DBG:
> +		return true;
> +	}
> +	return false;
>   }
>   
>   static const struct regmap_range tc_volatile_ranges[] = {

Will wait for some tests before applying.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
