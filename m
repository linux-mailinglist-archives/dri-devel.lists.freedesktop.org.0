Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2CB4FAD25
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 12:14:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B74D10F54B;
	Sun, 10 Apr 2022 10:14:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3319D10F54A
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 10:14:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id c7so19013587wrd.0
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Apr 2022 03:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pAKQLRfHBIi8gVpWsIm4XJUTgKXNjZKuay5CjFRlndQ=;
 b=VCf5YefLkMAEwD1FEbA3M/9+95V60y1Xqx6EBj4uQJjMbDDAd+MDQOfLPgvqHeoKhJ
 i40q+rYXlnsSQYx3F5AhrNnG2AsjHJ5VeHLrYys9LfEX7WymHQknubY1Jm8Et/vNOTzl
 BuIUagPUdVCsov9XGd6zT8NJgyZEcCON0Ez+v7PEvcGT0r3E9tCebYAEWz55IHR2IP/L
 hCzFHLZOKqmVpUcyZ+iGyIL7JN3oSkfp/MpVQ7Zgua+LE7kZ35agu10UX4wZ8S6tPPWt
 gUaaWeuXspLmXjM22aITSbX7FU1gzbcwN4/EN/zwNOABUJjXaX++a3pXYOkT5UukwN4r
 bF2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pAKQLRfHBIi8gVpWsIm4XJUTgKXNjZKuay5CjFRlndQ=;
 b=YK3PC7Z3TmHZTtO67VcP67e8aBbCEZ97LHmb2JTzrHq0C9Fl/0S9JAZaTwDCvsr4uX
 Yvu/bclGLNi+MFfuhE91Gp0SqCOwWZK+bXKVaKFDKh1UBASE9aVAx/U+bIgo+GvEVagE
 ED/zPRuEcjO0f8Ml3bjQEe+V9uDR9MslwY8giolMCMfFnSxjV6jbqn1Yltk4DBv35Raj
 zAkt5/ntLTlTP8cMP95LZGAw+xFjyfYsyAbhCnjNGhwqOSlgjDP0Ab0BnYJCLN3GCKXR
 emJZNCF4AcQ424OLUR3T2TM1bpt2ZKzk5KmY+Izu+8alimo6gwlw73ebh1MXElyrRv5Z
 P64w==
X-Gm-Message-State: AOAM532IF76sS7lHDjdC5ZqS5YLVuKoxaSOS2ynhfy+rT9FuSdWZikJF
 T5V8+qowgoU9TqYnInKoVEw=
X-Google-Smtp-Source: ABdhPJxletA1b6QlOrf9vLg3Ffaz3R05kgZSgfITv/n69SnaIoSn9nssUQfbsGVcrhE4jzWuW9059g==
X-Received: by 2002:a5d:47a8:0:b0:204:72:7051 with SMTP id
 8-20020a5d47a8000000b0020400727051mr21325747wrb.451.1649585658641; 
 Sun, 10 Apr 2022 03:14:18 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net.
 [89.212.118.115]) by smtp.gmail.com with ESMTPSA id
 n37-20020a05600c3ba500b0038cc9d6ff5bsm14748150wms.4.2022.04.10.03.14.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 03:14:18 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Sandor Yu <Sandor.yu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, andrzej.hajda@intel.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, hverkuil-cisco@xs4all.nl,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 4/5] drm: bridge: dw_hdmi: add reset function for PHY
 GEN1
Date: Sun, 10 Apr 2022 12:14:17 +0200
Message-ID: <8917523.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <ddf6d1b2-9fa4-4384-6eda-7cd8b1119f89@baylibre.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
 <ab85938ee3f3b4a9482b4e2414165041d6a4c62e.1649412256.git.Sandor.yu@nxp.com>
 <ddf6d1b2-9fa4-4384-6eda-7cd8b1119f89@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Dne petek, 08. april 2022 ob 14:22:52 CEST je Neil Armstrong napisal(a):
> On 08/04/2022 12:32, Sandor Yu wrote:
> > PHY reset register(MC_PHYRSTZ) active high reset control for PHY GEN2,
> > and active low reset control for PHY GEN1.
> > 
> > Rename function dw_hdmi_phy_reset to dw_hdmi_phy_gen2_reset.
> > Add dw_hdmi_phy_gen1_reset function for PHY GEN1.
> > 
> > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > ---
> > 
> >   drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 14 +++++++++++---
> >   drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c    |  2 +-
> >   include/drm/bridge/dw_hdmi.h              |  4 +++-
> >   3 files changed, 15 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c index
> > 5a7ec066e37a..13270d96e5be 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> > @@ -1369,13 +1369,21 @@ static void
> > dw_hdmi_phy_sel_interface_control(struct dw_hdmi *hdmi, u8 enable)> 
> >   			 HDMI_PHY_CONF0_SELDIPIF_MASK);
> >   
> >   }
> > 
> > -void dw_hdmi_phy_reset(struct dw_hdmi *hdmi)
> > +void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi)
> > +{
> > +	/* PHY reset. The reset signal is active low on Gen1 PHYs. */
> > +	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
> > +	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
> > +}
> > +EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen1_reset);
> > +
> > +void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi)
> > 
> >   {
> >   
> >   	/* PHY reset. The reset signal is active high on Gen2 PHYs. */
> >   	hdmi_writeb(hdmi, HDMI_MC_PHYRSTZ_PHYRSTZ, HDMI_MC_PHYRSTZ);
> >   	hdmi_writeb(hdmi, 0, HDMI_MC_PHYRSTZ);
> >   
> >   }
> > 
> > -EXPORT_SYMBOL_GPL(dw_hdmi_phy_reset);
> > +EXPORT_SYMBOL_GPL(dw_hdmi_phy_gen2_reset);
> > 
> >   void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi, u8 address)
> >   {
> > 
> > @@ -1529,7 +1537,7 @@ static int hdmi_phy_configure(struct dw_hdmi *hdmi,
> > 
> >   	if (phy->has_svsret)
> >   	
> >   		dw_hdmi_phy_enable_svsret(hdmi, 1);
> > 
> > -	dw_hdmi_phy_reset(hdmi);
> > +	dw_hdmi_phy_gen2_reset(hdmi);
> > 
> >   	hdmi_writeb(hdmi, HDMI_MC_HEACPHY_RST_ASSERT, 
HDMI_MC_HEACPHY_RST);
> > 
> > diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> > b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c index 5e2b0175df36..2860e6bff8b7
> > 100644
> > --- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> > +++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c
> > @@ -135,7 +135,7 @@ static int sun8i_hdmi_phy_config_a83t(struct dw_hdmi
> > *hdmi,> 
> >   	dw_hdmi_phy_gen2_txpwron(hdmi, 0);
> >   	dw_hdmi_phy_gen2_pddq(hdmi, 1);
> > 
> > -	dw_hdmi_phy_reset(hdmi);
> > +	dw_hdmi_phy_gen2_reset(hdmi);
> > 
> >   	dw_hdmi_phy_gen2_pddq(hdmi, 0);
> > 
> > diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> > index 2a1f85f9a8a3..70082f80a8c8 100644
> > --- a/include/drm/bridge/dw_hdmi.h
> > +++ b/include/drm/bridge/dw_hdmi.h
> > @@ -187,9 +187,11 @@ void dw_hdmi_phy_i2c_set_addr(struct dw_hdmi *hdmi,
> > u8 address);> 
> >   void dw_hdmi_phy_i2c_write(struct dw_hdmi *hdmi, unsigned short data,
> >   
> >   			   unsigned char addr);
> > 
> > +void dw_hdmi_phy_gen1_reset(struct dw_hdmi *hdmi);
> > +
> > 
> >   void dw_hdmi_phy_gen2_pddq(struct dw_hdmi *hdmi, u8 enable);
> >   void dw_hdmi_phy_gen2_txpwron(struct dw_hdmi *hdmi, u8 enable);
> > 
> > -void dw_hdmi_phy_reset(struct dw_hdmi *hdmi);
> > +void dw_hdmi_phy_gen2_reset(struct dw_hdmi *hdmi);
> > 
> >   enum drm_connector_status dw_hdmi_phy_read_hpd(struct dw_hdmi *hdmi,
> >   
> >   					       void *data);
> 
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> If a sun4i drm maintainer can ack, then it would be all good to apply.
> 
> Neil




