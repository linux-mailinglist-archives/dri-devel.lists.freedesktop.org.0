Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B03547F46
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 07:53:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3FF89269;
	Mon, 13 Jun 2022 05:53:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7EB10E66E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 05:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lviILeZfMx47/T5mT57g5CF3Go1+RnlpuLxpXoQJAzs=;
 b=sUYyi0kX/qm8dYiqVBEu30Ua03s1/pEag+lIBuG61+eOdPZ0ibmZ8L0jC+Mbw9yLJkxXoH1rFwvnY
 IppPwkQoYAL2aKyaU6xPHLjOQvqjDW87zkWVzetmd8eoBw0ztD+1nwLVHJQnCbdjwS2jYX2+1zAfoN
 qdZDfyAfIM419tB7J3rikYpJiHi7HKv8JXlhBxyb/XAIPXpwZ3GGIdVPINGD+N41VjuI+vAup3aom3
 YjaDyc5yTGH0ptGOp30T8PCxQgimrWbTiYLlODVBtJXzAl/ApAbLxTxbWuVEhRQy/MeTC3o8dOyv2a
 65tqVAIKPJHAVKK4pA3XHh+4cL23G6w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=lviILeZfMx47/T5mT57g5CF3Go1+RnlpuLxpXoQJAzs=;
 b=X74rpjvF9v21uUYO5EGbAEcnnWsBe1DgVlkBhT2gw+Uak7jOwZ/GSdKzOSsHmluG6E9lCcsNJO/Jy
 reK92zBBQ==
X-HalOne-Cookie: 4e71c7d0b0e443bd93c3ca12317c244ea4f8fa6a
X-HalOne-ID: 24fddb4a-eadd-11ec-a6c1-d0431ea8a283
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 24fddb4a-eadd-11ec-a6c1-d0431ea8a283;
 Mon, 13 Jun 2022 05:53:27 +0000 (UTC)
Date: Mon, 13 Jun 2022 07:53:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [LINUX PATCH 2/2] drm: xlnx: dsi: driver for Xilinx DSI Tx
 subsystem
Message-ID: <YqbQ1fLUKR/iwbTD@ravnborg.org>
References: <1652363593-45799-1-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <1652363593-45799-3-git-send-email-venkateshwar.rao.gannavarapu@xilinx.com>
 <Yn47YsSH4fn/wjKN@ravnborg.org>
 <YqZY4QMAkGiFOOWE@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqZY4QMAkGiFOOWE@pendragon.ideasonboard.com>
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
Cc: airlied@linux.ie, vgannava@xilinx.com,
 Venkateshwar Rao Gannavarapu <venkateshwar.rao.gannavarapu@xilinx.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

> [snip]
> 
> > > +static inline void xlnx_dsi_writel(void __iomem *base, int offset, u32 val)
> > > +{
> > > +	writel(val, base + offset);
> > > +}
> > > +
> > > +static inline u32 xlnx_dsi_readl(void __iomem *base, int offset)
> > > +{
> > > +	return readl(base + offset);
> > > +}
> > 
> > When I see implementations like this I wonder if a regmap would be
> > beneficial?
> 
> regmap often seems overkill to me when the driver only needs plain
> 32-bit mmio read/write, given the overhead it adds at runtime. Is it
> just me ?

There are several points that speaks for using regmap:
- The interface is well known
- It has nice helpers - like update_bits
- No need for own wrappers, that sometimes are made in creative ways
  (not the case here)
- There is a possibility to add some run-time checks so one can catch
  attempt to write outside the register window, write to read-only
  registers etc.


On top of this - it is simple to configure:

static const struct regmap_config regmap_config = {
        .reg_bits = 32,
        .val_bits = 32,
        .reg_stride = 4,
};


From the probe function:

	priv->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
	if (IS_ERR(priv->regs))
		return dev_err_probe(dev, PTR_ERR(priv->regs), "Failed to get memory resource\n");

	regmap_cfg = regmap_config;
	regmap_cfg.max_register = res->end - res->start;
	priv->regmap = devm_regmap_init_mmio(dev, priv->regs, &regmap_cfg);
	if (IS_ERR(priv->regmap))
		return dev_err_probe(dev, PTR_ERR(priv->regmap), "Failed to init regmap\n");


The one point that brought me over was the well known interface.
But using wrappers works too.

	Sam
