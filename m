Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFC2265FFC
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 15:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEE66EA28;
	Fri, 11 Sep 2020 13:02:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D356EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 13:02:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id b79so4718108wmb.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 06:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPvTdtmbRMfkD4iZPz3f6M4OzS2nS0OYc/aAuQpERAQ=;
 b=DmN3G9E5R8pQKcwsR/QOYPBt0YGPigmdnzridG6jujYOUJnrmuUfWqlsNqHvMNfOpN
 3rROpEaWF03I1p9azSOdOLoqBkWFNYXwQcWWkXtMrxgmrP/v6dTiar2qa6V2usdl/MC2
 PRd+bF8RuP1DMPnG8ovJ8LIiiux+gGucx2K+2UDA3X+gp4hxZAEsa/eoSXKX2JmB2R7Q
 T3CTa8kmL6aDJtOObN4DKylrMo+0UKnbZdup2fDXxDHClQQKt861N3dDFPlregRtQKB1
 l0VkkxU+SXlkYeZQCJ4iMPn8v2yrH7HtO0iGSIyX+xBbx+nPZWlftmnt4Sx4UZDjxB/Q
 CQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=XPvTdtmbRMfkD4iZPz3f6M4OzS2nS0OYc/aAuQpERAQ=;
 b=MtcC+bc7wPQMpfWhC0u1tApXyVNCBvu+KS7uM3NTA77Ec6lkdzugGGYgi4lzgPcoXu
 Zi0pjxNKn4SGJyjG2xWkUwFw0ntrmWLel4gqVYzbC5aON/1TVVLv2epKpTLVxg1/3tqh
 tr+WaW98CxJX2/ItmDyVULTcjeKBjYPyeXHw2acvpCtKjyJMUr9u9BrFO3DPHuGlvWyG
 AgFlVSXgWfvDe5IYLo6RUrxsuddDEyw0FoLBi50I5vGx+5cfK6/4jmvxibf0JL83HObH
 jD59I4JJL1vuvAX3FYyPO3GdupEZ1rz2moarmoFLA0do+a/qzp/F0apWYh3GvvcXc/mn
 eRGQ==
X-Gm-Message-State: AOAM5306zwyXg2Hi/eF3ppRWV8OFA41BNJv10MPG/fPlNu8kBUvzSZtC
 g4mrv+ALeQHWbhhv/mOUeY3b4g==
X-Google-Smtp-Source: ABdhPJyoawmkjTBcyhGQBhaZdB4iRLwZ1Di8GGM++7EJ3K2peppUMQ3WUQoQLFZBOndDUXUVYdGtlg==
X-Received: by 2002:a7b:c210:: with SMTP id x16mr2057345wmi.76.1599829354408; 
 Fri, 11 Sep 2020 06:02:34 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:28ac:1772:9398:891a?
 ([2a01:e35:2ec0:82b0:28ac:1772:9398:891a])
 by smtp.gmail.com with ESMTPSA id t1sm3958177wmi.16.2020.09.11.06.02.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 06:02:33 -0700 (PDT)
Subject: Re: [PATCH] drm/bridge: dw-mipi-dsi: permit configuring the escape
 clock rate
To: Philippe CORNU <philippe.cornu@st.com>,
 "a.hajda@samsung.com" <a.hajda@samsung.com>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@siol.net" <jernej.skrabec@siol.net>
References: <20200904125531.15248-1-narmstrong@baylibre.com>
 <078aae69-936f-cb78-623f-6bdcb1c2630d@st.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <20e589a9-ce81-e53e-72b1-6022f632d591@baylibre.com>
Date: Fri, 11 Sep 2020 15:02:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <078aae69-936f-cb78-623f-6bdcb1c2630d@st.com>
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
Cc: Yannick FERTRE <yannick.fertre@st.com>,
 "heiko.stuebner@theobroma-systems.com"
 <heiko.stuebner@theobroma-systems.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/09/2020 10:29, Philippe CORNU wrote:
> 
> 
> On 9/4/20 2:55 PM, Neil Armstrong wrote:
>> The Amlogic D-PHY in the Amlogic AXG SoC Family does support a frequency
>> higher than 10MHz for the TX Escape Clock, thus make the target rate
>> configurable.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 25 +++++++++++++++----
>>   include/drm/bridge/dw_mipi_dsi.h              |  1 +
>>   2 files changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> index d580b2aa4ce9..31fc965c66fd 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
>> @@ -562,15 +562,30 @@ static void dw_mipi_dsi_disable(struct dw_mipi_dsi *dsi)
>>   
>>   static void dw_mipi_dsi_init(struct dw_mipi_dsi *dsi)
>>   {
>> +	const struct dw_mipi_dsi_phy_ops *phy_ops = dsi->plat_data->phy_ops;
>> +	unsigned int esc_rate; /* in MHz */
>> +	u32 esc_clk_division;
>> +	int ret;
>> +
>>   	/*
>>   	 * The maximum permitted escape clock is 20MHz and it is derived from
>> -	 * lanebyteclk, which is running at "lane_mbps / 8".  Thus we want:
>> -	 *
>> -	 *     (lane_mbps >> 3) / esc_clk_division < 20
>> +	 * lanebyteclk, which is running at "lane_mbps / 8".
>> +	 */
>> +	if (phy_ops->get_esc_clk_rate) {
>> +		ret = phy_ops->get_esc_clk_rate(dsi->plat_data->priv_data,
>> +						&esc_rate);
>> +		if (ret)
>> +			DRM_DEBUG_DRIVER("Phy get_esc_clk_rate() failed\n");
>> +	} else
>> +		esc_rate = 20; /* Default to 20MHz */
>> +
>> +	/*
>> +	 * We want :
>> +	 *     (lane_mbps >> 3) / esc_clk_division < X
>>   	 * which is:
>> -	 *     (lane_mbps >> 3) / 20 > esc_clk_division
>> +	 *     (lane_mbps >> 3) / X > esc_clk_division
>>   	 */
>> -	u32 esc_clk_division = (dsi->lane_mbps >> 3) / 20 + 1;
>> +	esc_clk_division = (dsi->lane_mbps >> 3) / esc_rate + 1;
>>   
>>   	dsi_write(dsi, DSI_PWR_UP, RESET);
>>   
>> diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
>> index b0e390b3288e..bda8aa7c2280 100644
>> --- a/include/drm/bridge/dw_mipi_dsi.h
>> +++ b/include/drm/bridge/dw_mipi_dsi.h
>> @@ -36,6 +36,7 @@ struct dw_mipi_dsi_phy_ops {
>>   			     unsigned int *lane_mbps);
>>   	int (*get_timing)(void *priv_data, unsigned int lane_mbps,
>>   			  struct dw_mipi_dsi_dphy_timing *timing);
>> +	int (*get_esc_clk_rate)(void *priv_data, unsigned int *esc_clk_rate);
>>   };
>>   
>>   struct dw_mipi_dsi_host_ops {
>>
> 
> Hi Neil,
> Thank you for the patch
> 
> Reviewed-by: Philippe Cornu <philippe.cornu@st.com>
> 
> Philippe :-)
> 

Thanks !

Applying to drm-misc-next

Neil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
