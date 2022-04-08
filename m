Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133384F9592
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 14:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E77D10F0FA;
	Fri,  8 Apr 2022 12:22:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769B710F0FA
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 12:22:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso5422924wmz.4
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 05:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gtTftlQzlflLQzzKEoG76sKlqDpy0xKEo3XRwr3sgJs=;
 b=xSMyHrkkJ3LsZUuXmvCWNnhyZI4dboegG4Cpa1jwO4GPcTIIZBLT7kwA6lD/dX5gt8
 jOmwOYgbaZ0ETJmkPF6d3+dqg2PtJBSdsVoyI8k4DgT3uQ1ANxc2CE/Gex2hSzHN8ZDZ
 T3i3Azsp0P+26go+ZsKPlSVBGGxJ6VtQQ4jnlWyRcKTW4GhumBAGTzNxBiJFwSxeerjg
 fXGkphtKJ/E3F/I2hyjiqVTq4zquNHqh4tzE4tiFH/LZSyevhFG5m9481ouUzjTVsQpW
 TZsQsGuRCKm5llKzGaCcVzrLx7FfgmAmFWO0ovIh5hiBWWuZfy1Q5PvP/n0ZYzOvknpB
 9Fng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=gtTftlQzlflLQzzKEoG76sKlqDpy0xKEo3XRwr3sgJs=;
 b=vmmA5GBf1nsFA8Zc4hN1ReEyfDcz+srfGuS0uTUyj1/fXM5Mf9SMuvoiVTNzPjs4dq
 tiaWoWJgfnI7ybidGv6a1fzQ/fWqGLlR62VadgAfne2mxpveiDlen77x0MDYoqNmY402
 PNUzOsqtdF8YiBKToXRuRo86i+M7UQSCGah+53QOGKf3agyxIryy9kEb+rStAZ/Xn1LX
 rbq3+J2ZPXwHrCLeh1yP0KjyMDfh8ARioHT/OZiiLWCmWItNx5rDsaM0ybuSVGkJgfOl
 PLNvfVZtU5gN2CBaLSvWCitdF1UeJ7AzchezmsHnE6yX7avRmfvmL/NgkhP/w+XrWWMU
 Mb+w==
X-Gm-Message-State: AOAM532V64+C+Z+rAX2UXVeXkV8x06bRFAsYhr5pfx+Mtz6bT6nA149K
 TFDtmSdzV1YfZLp1dCYv00ZybQ==
X-Google-Smtp-Source: ABdhPJx2hFRVIqw4iw6u3Z4qCynzf2kAvxBtYcdMh9joKkhRISNecGlpu95SByRopHrlMAn/FRYAZg==
X-Received: by 2002:a05:600c:3b26:b0:38c:8358:4b84 with SMTP id
 m38-20020a05600c3b2600b0038c83584b84mr16879351wms.185.1649420574715; 
 Fri, 08 Apr 2022 05:22:54 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:eacd:ce6:e294:acd1?
 ([2001:861:44c0:66c0:eacd:ce6:e294:acd1])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1cf708000000b0034d7b5f2da0sm10266598wmh.33.2022.04.08.05.22.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 05:22:54 -0700 (PDT)
Message-ID: <ddf6d1b2-9fa4-4384-6eda-7cd8b1119f89@baylibre.com>
Date: Fri, 8 Apr 2022 14:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 4/5] drm: bridge: dw_hdmi: add reset function for PHY
 GEN1
Content-Language: en-US
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <ab85938ee3f3b4a9482b4e2414165041d6a4c62e.1649412256.git.Sandor.yu@nxp.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <ab85938ee3f3b4a9482b4e2414165041d6a4c62e.1649412256.git.Sandor.yu@nxp.com>
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
Cc: shengjiu.wang@nxp.com, cai.huoqing@linux.dev, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/04/2022 12:32, Sandor Yu wrote:
> PHY reset register(MC_PHYRSTZ) active high reset control for PHY GEN2,
> and active low reset control for PHY GEN1.
> 
> Rename function dw_hdmi_phy_reset to dw_hdmi_phy_gen2_reset.
> Add dw_hdmi_phy_gen1_reset function for PHY GEN1.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 14 +++++++++++---
>   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c    |  2 +-
>   include/drm/bridge/dw_hdmi.h              |  4 +++-
>   3 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 5a7ec066e37a..13270d96e5be 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1369,13 +1369,21 @@ static void dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)
>   			 HDMI_PHY_CONF0_SELDIPIF_MASK);
>   }
>   
> -void dw_hdmi_phy_reset(struct dw_hdmi *hdmi)
> +void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi)
> +{
> +	/* PHY reset. The reset signal is active low on Gen1 PHYs. */
> +	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
> +	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen1_reset);
> +
> +void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi)
>   {
>   	/* PHY reset. The reset signal is active high on Gen2 PHYs. */
>   	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
>   	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
>   }
> -EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset);
> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen2_reset);
>   
>   void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address)
>   {
> @@ -1529,7 +1537,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
>   	if (phy->has_svsret)
>   		dw_hdmi_phy_enable_svsret(hdmi, 1);
>   
> -	dw_hdmi_phy_reset(hdmi);
> +	dw_hdmi_phy_gen2_reset(hdmi);
>   
>   	hdmi_writeb(hdmi, HDMI_MC_HEACPHY_RST_ASSERT, HDMI_MC_HEACPHY_RST);
>   
> diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> index 5e2b0175df36..2860e6bff8b7 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> @@ -135,7 +135,7 @@ static int sun8i_hdmi_phy_config_a83t(struct dw_hdmi *hdmi,
>   	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
>   	dw_hdmi_phy_gen2_pddq(hdmi, 1);
>   
> -	dw_hdmi_phy_reset(hdmi);
> +	dw_hdmi_phy_gen2_reset(hdmi);
>   
>   	dw_hdmi_phy_gen2_pddq(hdmi, 0);
>   
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 2a1f85f9a8a3..70082f80a8c8 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -187,9 +187,11 @@ void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address);
>   void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
>   			   unsigned char addr);
>   
> +void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi);
> +
>   void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable);
>   void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable);
> -void dw_hdmi_phy_reset(struct dw_hdmi *hdmi);
> +void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi);
>   
>   enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>   					       void *data);

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

If a sun4i drm maintainer can ack, then it would be all good to apply.

Neil
