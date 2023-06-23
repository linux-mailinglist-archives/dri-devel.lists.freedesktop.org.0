Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA6E73B624
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 13:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7DA410E0E9;
	Fri, 23 Jun 2023 11:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD99510E046
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 11:29:47 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fa7512e5efso8167235e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 04:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687519785; x=1690111785; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GwLc2J0o+y5k6wlRVJRO3JHyqT4XLHI9Q44A1K2LKY0=;
 b=zvDJX6vY/uiWXlyfmlBjjf6R7Br40yyDfeI1GUAFj0tGhAX42GnYu0AXt9p50h58Yy
 wljtBAy/FjDNNHNSMqFmkK4HdulH3oOl7+iNC22mh35B4dm1inWC66i/gQ6ifYK0r0m8
 DsyM/+DLmC/9Qo6T4cQM0ubF2YLJoQxK5aiaLaJVq9SDQTUWEDBb0oHR3s97MGkkqJm+
 VTvGxO3UCOHOI4nIsHxxXjxeNwmTf4dbvXKDAPDSeewQfPycGNrGwFaRtplSSSO0DtWm
 yQDj4lfAMr+QX/YfbODPOZaFvndAWGQeDeyobrJEia/Kh1+jbw13QfhiGI22kwnr5KDp
 A8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687519785; x=1690111785;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GwLc2J0o+y5k6wlRVJRO3JHyqT4XLHI9Q44A1K2LKY0=;
 b=LyVz5kRq5xpsBXiDkdwRwrvoVUwGn07n2mCv0CfGn5aK6f/MgC1ZflEeTtoi3qLr46
 SnT1461w1N0BP3j8t8KeAz/zNRWE31EqnMvTAdE+a9X47vRVFLq3xXYzbMTtGq0dwgLh
 s4+uImXU+psk3yq4oDC0Qd3B2pUERhPQS5qbjCH4NJIjK+0eo0cDWPhIapm77OmoejdB
 h687QVYdbEa51q/gcbzZA3XPYcM0pGCr7OKIbag2vYT7VDwtbgQRdw9tPMADTwZnFkSZ
 dhFX0RFRNQADTnu2s6JqKxce43xLmI0xmW6TZWPGGj2p2a7hnr3XfqxeP6t0qoL4KRE0
 whrw==
X-Gm-Message-State: AC+VfDwar2uPGbCtkXdaiEqKFjlyK0raYr/N/9LNqW3gVU3I1lOtkI6I
 IsxtkI1UQmRvNjB+KnejJEIo7A==
X-Google-Smtp-Source: ACHHUZ5aPtUZFe/KKL/C7n1SGLSR1IlxyOoKC4gu0sd+mBCMxwwyM4tC0jICO/cIs2AZ1uae8JQDBg==
X-Received: by 2002:a05:600c:24a:b0:3f9:b06:a3f6 with SMTP id
 10-20020a05600c024a00b003f90b06a3f6mr17252877wmj.24.1687519784873; 
 Fri, 23 Jun 2023 04:29:44 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a1c4b11000000b003f9b24cf881sm2103050wma.16.2023.06.23.04.29.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jun 2023 04:29:44 -0700 (PDT)
Message-ID: <2f1d4e6b-bf03-25d1-dac2-83e0dbd5734f@baylibre.com>
Date: Fri, 23 Jun 2023 13:29:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET
 settings/handling
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
References: <20230523104234.7849-1-angelogioacchino.delregno@collabora.com>
 <735623c5-3eeb-bda3-db87-2b33d9ad3446@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <735623c5-3eeb-bda3-db87-2b33d9ad3446@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, shaoming.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23/06/2023 11:47, AngeloGioacchino Del Regno wrote:
> Il 23/05/23 12:42, AngeloGioacchino Del Regno ha scritto:
>> Due to the initial confusion about MIPI_DSI_MODE_EOT_PACKET, properly
>> renamed to MIPI_DSI_MODE_NO_EOT_PACKET, reflecting its actual meaning,
>> both the DSI_TXRX_CON register setting for bit (HSTX_)DIS_EOT and the
>> later calculation for horizontal sync-active (HSA), back (HBP) and
>> front (HFP) porches got incorrect due to the logic being inverted.
>>
>> This means that a number of settings were wrong because....:
>>   - DSI_TXRX_CON register setting: bit (HSTX_)DIS_EOT should be
>>     set in order to disable the End of Transmission packet;
>>   - Horizontal Sync and Back/Front porches: The delta used to
>>     calculate all of HSA, HBP and HFP should account for the
>>     additional EOT packet.
>>
>> Before this change...
>>   - Bit (HSTX_)DIS_EOT was being set when EOT packet was enabled;
>>   - For HSA/HBP/HFP delta... all three were wrong, as words were
>>     added when EOT disabled, instead of when EOT packet enabled!
>>
>> Invert the logic around flag MIPI_DSI_MODE_NO_EOT_PACKET in the
>> MediaTek DSI driver to fix the aforementioned issues.
>>
>> Fixes: 8b2b99fd7931 ("drm/mediatek: dsi: Fine tune the line time 
>> caused by EOTp")
>> Fixes: 2d52bfba09d1 ("drm/mediatek: add non-continuous clock mode and 
>> EOT packet control")
>> Signed-off-by: AngeloGioacchino Del Regno 
>> <angelogioacchino.delregno@collabora.com>
> 
> Gentle ping for an important fix.
> 
> Regards,
> Angelo
> 
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c 
>> b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> index 7d5250351193..b0ab38e59db9 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -407,7 +407,7 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
>>       if (dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS)
>>           tmp_reg |= HSTX_CKLP_EN;
>> -    if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
>> +    if (dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET)
>>           tmp_reg |= DIS_EOT;
>>       writel(tmp_reg, dsi->regs + DSI_TXRX_CTRL);
>> @@ -484,7 +484,7 @@ static void mtk_dsi_config_vdo_timing(struct 
>> mtk_dsi *dsi)
>>                 timing->da_hs_zero + timing->da_hs_exit + 3;
>>       delta = dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST ? 18 : 12;
>> -    delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 2 : 0;
>> +    delta += dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET ? 0 : 2;
>>       horizontal_frontporch_byte = vm->hfront_porch * dsi_tmp_buf_bpp;
>>       horizontal_front_back_byte = horizontal_frontporch_byte + 
>> horizontal_backporch_byte;
> 
> 

Sounds logic

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
