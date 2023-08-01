Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B13A276AEE3
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 11:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F3E10E380;
	Tue,  1 Aug 2023 09:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CD810E380
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 09:42:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-31765792c7cso5683209f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Aug 2023 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690882971; x=1691487771;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZHtkQBwYJWC3v3bJWmfz/i0gWwYwgp5p+j4xvyTGTE=;
 b=RCuElZ03uOIXpeiisCk+hSTxfkXSgPS06OqCadIKp0yk3xf00FqESa8DG4xLQk+HuW
 329VXl9xTia4AwNFJPcr3K9Sieub8uRG+f1U3FDPIA7F9gdfwVVN00pDMnlQFcC4Mqkg
 Z2OjpIR31igB6ZhoCj0xVXYiXZQ24q2/O/mBDdcw74IAJntuZosDT4GGfu2uOmOHTIdU
 luXDBCKxTVOgwc7GHYB/DIRKBhhZPzPh1vsSK+40kzOJdhbVfarliq+0wMwNzkSKjJFn
 MuY9GiCTi8iqcefvIlatigbi3jvTT/kw/bZL7WLgrpBEv35R/mG8Nc8Crv/H/SwOjDp2
 +irg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882971; x=1691487771;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ZHtkQBwYJWC3v3bJWmfz/i0gWwYwgp5p+j4xvyTGTE=;
 b=SplkfCtxAE/zfjPHco80bbb3FJz2vm8UvfuOfW+aSb9uXjvUR+ViBX+TokJ3n6iMao
 tUy1yCkhXdsf19+91cPq9xTbKVLf5Xl0QJjEqJ1s6aN4mPKP4igj5e86uNShOXdb/y2c
 mhX3TzK8ADCVd8MedcXg8qVC3ouBAxr6iYwY4O7aqjqIuUxOUq0SLeOZZXMykk+FY/OI
 Oi9Sa5L6uGOXQFwlkHwb78oG/6mENoUV04Emn+8zMPEafbuDpTbKOCONdFBoOf3C7U58
 RUGL6mJWz0y2NESA02XRqYdQcir0/dmSRXzwSZBX/wJEYisLNC+J+kn66mSDWqXmXKei
 l+Zg==
X-Gm-Message-State: ABy/qLbVCYBigIQBSB8WMFitKtIi4EN3/EOCn2Pv+AMm2VtIDV6cSzgq
 nhrgF+ilFtURV8NoUfoJL0UtSA==
X-Google-Smtp-Source: APBJJlFnFH+EEEeNtiva1AIY578o6dsghC4jMpKOnKQ79gJShSS2WayhhW4ndyjf9hsAO2wSLswejg==
X-Received: by 2002:adf:e946:0:b0:317:4cf8:35f9 with SMTP id
 m6-20020adfe946000000b003174cf835f9mr1888323wrn.16.1690882971601; 
 Tue, 01 Aug 2023 02:42:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3?
 ([2a01:e0a:982:cbb0:b92a:81a9:df6e:1e3])
 by smtp.gmail.com with ESMTPSA id
 x1-20020a5d60c1000000b00317afc7949csm1091567wrt.50.2023.08.01.02.42.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Aug 2023 02:42:51 -0700 (PDT)
Message-ID: <95dc8275-feae-fd03-48bb-5f27e619c021@linaro.org>
Date: Tue, 1 Aug 2023 11:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 7/9] drm/bridge: synopsys: dw-mipi-dsi: Disable HSTX and
 LPRX timeout check
Content-Language: en-US
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230717061831.1826878-1-victor.liu@nxp.com>
 <20230717061831.1826878-8-victor.liu@nxp.com>
Organization: Linaro Developer Services
In-Reply-To: <20230717061831.1826878-8-victor.liu@nxp.com>
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
Cc: conor+dt@kernel.org, rfoss@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jonas@kwiboo.se, shawnguo@kernel.org, s.hauer@pengutronix.de,
 jernej.skrabec@gmail.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 kernel@pengutronix.de, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/07/2023 08:18, Liu Ying wrote:
> According to Synopsys DW MIPI DSI host databook, HSTX and LPRX timeout
> contention detections are measured in TO_CLK_DIVISION cycles.  However,
> the current driver programs magic values to TO_CLK_DIVISION, HSTX_TO_CNT
> and LPRX_TO_CNT register fields, which makes timeout error event wrongly
> happen for some video modes, at least for the typical 1920x1080p@60 video
> mode read from a HDMI monitor driven by ADV7535 DSI to HDMI bridge.
> While at it, the current driver doesn't enable interrupt to handle or
> complain about the error status, so true error just happens silently
> except for display distortions by visual check.
> 
> Disable the timeout check by setting those timeout register fields to
> zero for now until someone comes along with better computations for the
> timeout values.  Although the databook doesn't mention what happens when
> they are set to zero, it turns out the false error doesn't happen for
> the 1920x1080p@60 video mode at least.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 536306ccea5a..0fcadf99e783 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -684,7 +684,7 @@ static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
>   	 * timeout clock division should be computed with the
>   	 * high speed transmission counter timeout and byte lane...
>   	 */
> -	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(10) |
> +	dsi_write(dsi, DSI_CLKMGR_CFG, TO_CLK_DIVISION(0) |
>   		  TX_ESC_CLK_DIVISION(esc_clk_division));
>   }
>   
> @@ -747,7 +747,7 @@ static void dw_mipi_dsi_command_mode_config(struct dw_mipi_dsi *dsi)
>   	 * compute high speed transmission counter timeout according
>   	 * to the timeout clock division (TO_CLK_DIVISION) and byte lane...
>   	 */
> -	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(1000) | LPRX_TO_CNT(1000));
> +	dsi_write(dsi, DSI_TO_CNT_CFG, HSTX_TO_CNT(0) | LPRX_TO_CNT(0));
>   	/*
>   	 * TODO dw drv improvements
>   	 * the Bus-Turn-Around Timeout Counter should be computed

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
