Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C85C500585
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 07:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C7C610FF16;
	Thu, 14 Apr 2022 05:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3214210FF16
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 05:37:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4D6B61E35;
 Thu, 14 Apr 2022 05:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F4D6C385A1;
 Thu, 14 Apr 2022 05:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649914669;
 bh=OvCUBTX1ZAgB8ToDSbNbmHnIQ8kXnV7+uWxjqjVKne4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JvF5esoQdpTyrqK52quS/FxxjB6PsrHksGx2OwyQ32LgEPhrRjWvKRZApfVZzXLzw
 mA/YzjocNeAB361OfVk1iLricCnMsGhmKaQQqqMfLFpVUocSK4EhKtAscdPfSwqhrq
 61hU3bfa98o3jlZ/v1AgXq1C3TVpQ0yveoZNwhXTnKyverfK8/aZ5gQ+2fv5F/6Yha
 f763hQHqXQoT1EGd9LR0VdPPty+PIp2BUpsTOsGjGR8Te7nd4gHYNJPOaRk/g7SOWW
 4zLCRUHSSRU7olwtqyyhe8J0FK1EaMKmywiIk1SaQ+5kZ5/lRPH3EdDz8v3kaL4BRH
 l0m1h0e63GeeQ==
Date: Thu, 14 Apr 2022 11:07:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v6 resend 2/5] phy: Add LVDS configuration options
Message-ID: <YlezKAw+W8HOa322@matsya>
References: <20220402052451.2517469-1-victor.liu@nxp.com>
 <20220402052451.2517469-3-victor.liu@nxp.com>
 <YlZpnrKt9NbHZv26@matsya>
 <d77b41d911e126331138ddaca146a581d316bd09.camel@nxp.com>
 <YlaqwoFCfusFgIIe@matsya>
 <a2731b2d77f9bf2adf36f0c05cb5e3b14a5a91a9.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2731b2d77f9bf2adf36f0c05cb5e3b14a5a91a9.camel@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 martin.kepplinger@puri.sm, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org, shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13-04-22, 20:39, Liu Ying wrote:
> On Wed, 2022-04-13 at 16:19 +0530, Vinod Koul wrote:
> > On 13-04-22, 18:04, Liu Ying wrote:
> > > Hi Vinod,
> > > 
> > > On Wed, 2022-04-13 at 11:41 +0530, Vinod Koul wrote:
> > > > On 02-04-22, 13:24, Liu Ying wrote:
> > > > > This patch allows LVDS PHYs to be configured through
> > > > > the generic functions and through a custom structure
> > > > > added to the generic union.
> > > > > 
> > > > > The parameters added here are based on common LVDS PHY
> > > > > implementation practices.  The set of parameters
> > > > > should cover all potential users.
> > > > > 
> > > > > Cc: Kishon Vijay Abraham I <kishon@ti.com>
> > > > > Cc: Vinod Koul <vkoul@kernel.org>
> > > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > > > ---
> 
> [...]
> 
> > > > > + */
> > > > > +
> > > > > +#ifndef __PHY_LVDS_H_
> > > > > +#define __PHY_LVDS_H_
> > > > > +
> > > > > +/**
> > > > > + * struct phy_configure_opts_lvds - LVDS configuration set
> > > > > + * @bits_per_lane_and_dclk_cycle:	Number of bits per data
> > > > > lane
> > > > > and
> > > > > + *					differential clock
> > > > > cycle.
> > > > 
> > > > What does it mean by bits per data lane and differential clock
> > > > cycle?
> > > 
> > > Please check
> > > Documentation/devicetree/bindings/display/panel/lvds.yaml.
> > > lvds.yaml metions slot.  'bits_per_lane_and_dclk_cycle' means the
> > > number of slots.  But, I don't find the word 'slot' in my lvds
> > > relevant
> > > specs which mentioned in lvds.yaml, so 'slots' is probably not a
> > > generic name(lvds.yaml is for display panel).  So, I use
> > > 'bits_per_lane_and_dclk_cycle' as the name tells what it means.
> > 
> > variable name is fine, explanation for bit per lane and differential
> > clock cycle didnt help, maybe add better explanation of what this
> > variable means
> 
> I may add an example diagram as below...

Not really a diagram, you can add if you like.. But something which
explains in a sentence or few about the variable.

bits per lane per differential clock cycle ?

-- 
~Vinod
