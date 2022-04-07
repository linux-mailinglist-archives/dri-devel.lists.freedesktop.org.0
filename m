Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB524F79B5
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6713710E9E8;
	Thu,  7 Apr 2022 08:31:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46C4910E9E8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:30:59 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w4so6657664wrg.12
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mhNafdINL/bGSsdlwXHEq3XpvjEJWoppfiwKb+g/P+c=;
 b=ueQuovcZvEt3n41Rr5VE/fSBy6pGmbFsDIHSEDegP7Du3XYgNWq9xzJDUuLESdpJ2K
 27O5kvicyEcqww64Id2bAU3wdmT4ulnvrCP3KEnFdrlZo24ekaISTuI+oDQnsa/lYBDC
 mfEl5+8MsJKNxPjf8HeSWf1WFJwD+VSINxrw8s5FuMnOqQ2wdp4LLDDMD6iW30HYArl7
 /iHWftqJlMj316Zw4w/T+st8ed53A1WUoC0E1d2N2VoUR5PInyHfgtC4CdX3zCLodMLW
 61PHkxhRX2KF4MIKnhn2PtQXHvlDyOeVAN9HR/JUmAKVfcbfXYdpI+h1axeibEfeO28L
 kycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mhNafdINL/bGSsdlwXHEq3XpvjEJWoppfiwKb+g/P+c=;
 b=OcB/oCmlJPCRyt76YhDubTWiw7HEHAikO5/QEHHRrIvqfqBlMCCQ+qK+2nB1LByppC
 91o8bu3FOMz2WHhvHzhFHaY2M0EXttzaHeTIFVgknWb0uTI8OF07uAQ50KDklFACwhD6
 8nrQSro0p/SFGBcaoDf7/ZuwIu9N4L5FzLH/0mFoo8Duoeea++KLh03V0rvETKHfzW7T
 6naz+DJnC/Zlrqxj4ULML1N4pbrJon4ya5bM2ymQar3m0d/JCA7S4PA+lZgshXKCI/hO
 yQlnKegvNh6zufYLUC3t4cYcUl23CfdsiPQ04VFsKTFw5LmZ25BtN6fLl4zofIMZC/tr
 rZ9g==
X-Gm-Message-State: AOAM533CC/XeUvsTwoCWlihi0Tppt2m4CUfjh0Z4blrsW/QlgFlBVU4E
 OewBpQ8xCda+bILXqKDj7Bkyqg==
X-Google-Smtp-Source: ABdhPJyDahYyDu5X5b9pS0X7gZEs4+O0WHJD+fGEmCO9oi7r9gXJOeQ3Y1cMEpPj7dDF7hjSGxZ0UA==
X-Received: by 2002:adf:f387:0:b0:206:1028:921f with SMTP id
 m7-20020adff387000000b002061028921fmr9785982wro.706.1649320257690; 
 Thu, 07 Apr 2022 01:30:57 -0700 (PDT)
Received: from [10.1.3.188]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 11-20020a056000156b00b002040674fd13sm20116879wrz.38.2022.04.07.01.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Apr 2022 01:30:57 -0700 (PDT)
Message-ID: <b3abd199-0acb-a2d3-bd53-aa26182aa0c9@baylibre.com>
Date: Thu, 7 Apr 2022 10:30:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v0 01/10] drm/bridge: dw-hdmi: add low-active PHY reset
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>
References: <20220406160123.1272911-1-l.stach@pengutronix.de>
 <20220406160123.1272911-2-l.stach@pengutronix.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220406160123.1272911-2-l.stach@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-phy@lists.infradead.org,
 patchwork-lst@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On 06/04/2022 18:01, Lucas Stach wrote:
> Allow vendor PHY implementations to reset PHYs with different polarity
> than the current Gen2 reset.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 +++++++
>   include/drm/bridge/dw_hdmi.h              | 1 +
>   2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 4befc104d220..7600f26aab27 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -1365,6 +1365,13 @@ void dw_hdmi_phy_reset(struct dw_hdmi *hdmi)
>   }
>   EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset);
>   
> +void dw_hdmi_phy_reset_active_low(struct dw_hdmi *hdmi)
> +{
> +	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
> +	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
> +}
> +EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset_active_low);
> +
>   void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address)
>   {
>   	hdmi_phy_test_clear(hdmi, 1);
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 2a1f85f9a8a3..9b3d52a1e62a 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -190,6 +190,7 @@ void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
>   void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable);
>   void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable);
>   void dw_hdmi_phy_reset(struct dw_hdmi *hdmi);
> +void dw_hdmi_phy_reset_active_low(struct dw_hdmi *hdmi);
>   
>   enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
>   					       void *data);

This has already been submitted at https://lore.kernel.org/r/800262112191a720639ba321be18f0926d4e1d2a.1649230434.git.Sandor.yu@nxp.com
