Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A223EE74F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 09:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DEC89B51;
	Tue, 17 Aug 2021 07:35:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C4BF89B51
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 07:35:32 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r6so27184483wrt.4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 00:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TXvj3Jqmqvj5AogWs4QqfqINOpj0gH3CoW+SyWWNh9M=;
 b=LLywOYYel/1eZkqX8CMyyZG7FGTKJvikarloGCN6dzF25Yzut5wSmAGvudNYJo/SFk
 Nbb33XK4DJG8HQouGg40ULIz/VG/UBzHqvU1ChcL9htQcfk3kuy9ouUKDxPH0XD/vYO3
 VgEIYxQCjb/Nn1uJHYstLnnpS5rePtbjXH/ccTXz1f6MsXcERyzXcL9Jl3P1czzSqOoD
 XKVTWzorM0mIxIg9eRr4EIxPMtN/ciCxP/SskVNzm/My0bXCg/oILWNu6wQbsT1Ywhj/
 eYupQANLXSR1qjXVSfA/6knAWGDGJrjgX4Jqf/YOH5xzc7VyfKDJbYfOHXhSrGrhsrew
 2n1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TXvj3Jqmqvj5AogWs4QqfqINOpj0gH3CoW+SyWWNh9M=;
 b=dCT6Lk2CaVYSx546EBoqKha847WKcmEbcF0nGuZH1NQDCCv8SqXXi/N5KadFDP+eCr
 d8Ytchw4KHhyLLtM9+VFTZF9dm8H2/R9ScxWN4/T5b6T4B+wGl8cG6xbftrPTq+vqjOv
 /jWwzXbTUBzuBCofvXQjMN8j1avEh3ctr3zMsXy8QFcECTwBHDRtKvCZ+2EZf9zMITUN
 GNW106gcKn3yxUqjhAT5xON9OuxcfUVLVr1ozzSn6lW4nzGb3en9Jp9KUnjXN8KYc4eS
 1KH1sYtjSDp+9O0pYXpFmPB3cI07a/lEGUtYvcmEa/yfPZgko6WfvFREFvPWObq/B1lP
 h/fw==
X-Gm-Message-State: AOAM531CnmwfEOsJU3PWNKmb0WgV8/kGyObvHf4KYJMA61rxJ6ZX9foY
 xa2WEZ8BkQehuiPtMXhWmby9Ug==
X-Google-Smtp-Source: ABdhPJwn6K1cETtZ0I/mA9qEnPbAB72QYtgySQju7g6XMDoCexjSx6mxPKzEu1fSylRmp24kr4X2bQ==
X-Received: by 2002:a5d:510b:: with SMTP id s11mr2373572wrt.63.1629185731019; 
 Tue, 17 Aug 2021 00:35:31 -0700 (PDT)
Received: from blmsp ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id w9sm1108777wmc.19.2021.08.17.00.35.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 00:35:30 -0700 (PDT)
Date: Tue, 17 Aug 2021 09:35:30 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 5/5] drm/mediatek: Add mt8195 DisplayPort driver
Message-ID: <20210817073530.uocllhlkyg767uok@blmsp>
References: <20210816192523.1739365-1-msp@baylibre.com>
 <20210816192523.1739365-6-msp@baylibre.com>
 <1629178605.7579.3.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1629178605.7579.3.camel@mtksdaap41>
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

Hi,

On Tue, Aug 17, 2021 at 01:36:45PM +0800, CK Hu wrote:
> Hi, Markus:
> 
> On Mon, 2021-08-16 at 21:25 +0200, Markus Schneider-Pargmann wrote:
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports both functional units on the mt8195, the embedded
> > DisplayPort as well as the external DisplayPort units. It offers
> > hot-plug-detection, audio up to 8 channels, and DisplayPort 1.4 with up
> > to 4 lanes.
> > 
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> 
> [snip]
> 
> > +
> > +static const struct of_device_id mtk_dp_of_match[] = {
> > +	{
> > +		.compatible = "mediatek,mt8195-dp_tx",
> 
> Where is the binding document of "mediatek,mt8195-dp_tx"?
> 
> > +		.data = &mt8195_dp_driver_data,
> > +	},
> > +	{
> > +		.compatible = "mediatek,mt8195-edp_tx",
> 
> Where is the binding document of "mediatek,mt8195-edp_tx"?

I didn't include the bindings in this RFC, but will include them in the
next version.

> 
> > +		.data = &mt8195_edp_driver_data,
> > +	},
> > +	{},
> > +};
> > +MODULE_DEVICE_TABLE(of, mtk_dp_of_match);
> > +
> > +struct platform_driver mtk_dp_driver = {
> > +	.probe = mtk_dp_probe,
> > +	.remove = mtk_dp_remove,
> > +	.driver = {
> > +		.name = "mediatek-drm-dp",
> > +		.of_match_table = mtk_dp_of_match,
> > +		.pm = &mtk_dp_pm_ops,
> > +	},
> > +};
> > +
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > new file mode 100644
> > index 000000000000..83afc79d98ff
> > --- /dev/null
> > +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> > @@ -0,0 +1,3095 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Copyright (c) 2021 BayLibre
> > + */
> > +#ifndef _MTK_DP_REG_H_
> > +#define _MTK_DP_REG_H_
> > +
> > +#define MTK_DP_SIP_CONTROL_AARCH32 0x82000523
> > +# define MTK_DP_SIP_ATF_VIDEO_UNMUTE 0x20
> > +# define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE 0x21
> > +# define MTK_DP_SIP_ATF_REG_WRITE 0x22
> > +# define MTK_DP_SIP_ATF_REG_READ 0x23
> > +# define MTK_DP_SIP_ATF_CMD_COUNT 0x24
> > +
> > +#define TOP_OFFSET		0x2000
> > +#define ENC0_OFFSET		0x3000
> > +#define ENC1_OFFSET		0x3200
> > +#define TRANS_OFFSET		0x3400
> > +#define AUX_OFFSET		0x3600
> > +#define SEC_OFFSET		0x4000
> > +
> > +#define MTK_DP_HPD_DISCONNECT	BIT(1)
> > +#define MTK_DP_HPD_CONNECT	BIT(2)
> > +#define MTK_DP_HPD_INTERRUPT	BIT(3)
> > +
> > +#define MTK_DP_ENC0_P0_3000              (ENC0_OFFSET + 0x000)
> > +# define LANE_NUM_DP_ENC0_P0_MASK                                      0x3
> > +# define LANE_NUM_DP_ENC0_P0_SHIFT                                     0
> > +# define VIDEO_MUTE_SW_DP_ENC0_P0_MASK                                 0x4
> > +# define VIDEO_MUTE_SW_DP_ENC0_P0_SHIFT                                2
> > +# define VIDEO_MUTE_SEL_DP_ENC0_P0_MASK                                0x8
> > +# define VIDEO_MUTE_SEL_DP_ENC0_P0_SHIFT                               3
> > +# define ENHANCED_FRAME_EN_DP_ENC0_P0_MASK                             0x10
> > +# define ENHANCED_FRAME_EN_DP_ENC0_P0_SHIFT                            4
> > +# define HDCP_FRAME_EN_DP_ENC0_P0_MASK                                 0x20
> > +# define HDCP_FRAME_EN_DP_ENC0_P0_SHIFT                                5
> > +# define IDP_EN_DP_ENC0_P0_MASK                                        0x40
> 
> Remove useless definition.

Ok, will do. Thanks for the feedback.

Best,
Markus

> 
> Regards,
> CK.
> 
> > +# define IDP_EN_DP_ENC0_P0_SHIFT                                       6
> > +# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_MASK                           0x80
> > +# define BS_SYMBOL_CNT_RESET_DP_ENC0_P0_SHIFT                          7
> > +# define MIXER_DUMMY_DATA_DP_ENC0_P0_MASK                              0xff00
> > +# define MIXER_DUMMY_DATA_DP_ENC0_P0_SHIFT                             8
> > +
> 
> > +
> > +#endif /*_MTK_DP_REG_H_*/
> 
