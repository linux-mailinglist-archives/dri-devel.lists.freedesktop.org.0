Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A488BAD7B7D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 21:52:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6C610E1BB;
	Thu, 12 Jun 2025 19:52:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jK502Cku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64F310E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 19:52:12 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-747fc7506d4so1380946b3a.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 12:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749757932; x=1750362732; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=z7xi4YJKAUkKxYZRl9SSrq8Evyr8Lkvoed++01daD1s=;
 b=jK502CkuGvy7p0aZ1bxBdTh3cxwj50z910RFtN6OANiJzP3hfAa121aCBEIgbAy0Tc
 hy89o18W2qGBqUWOFSKDGIK44f9aaZm9y+dO8C4AqnOz0bWL3/xFdwguhYXQ9b4UnfQ5
 vpkISwBcj/PDQKfq+Ja0p/SDaS0Jn1g1MXtoP40lm2cPPIpOYaleJq14mzpMjjXNdX9F
 Nct1SkWxmJoYsZvAhDi1fviQYPLiQ/xGW4bB0qVqzGluMMmR0agR5aBygKRkq2GRN6FP
 78Ww7Rd4SLebVoy0RnXg0Xuh1YsDWhTUvWvgRYBVus/NTQs5F/0jhx8WQlpEon3yUXvg
 z6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749757932; x=1750362732;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7xi4YJKAUkKxYZRl9SSrq8Evyr8Lkvoed++01daD1s=;
 b=XiV/HlzWT5LDYwBq6No1BaH84fj5HE/nH0mwQGLH1Mbf4WQEBRSx1UmpRprFEsOppY
 rnBZeDx0wN3gLCHLv/kKQIwiAo7sjIhtBq9JElBRZ+zlKEA7Qs/VgBRB91fBqAEnnMn8
 /L53heSBYb5tBfAuy5a2nemrBwt0qbl6V+fZbjWM4yqlhBiYf1pNwJnSjSYrEFB4CACq
 b1GsYwEUSXIye1cQwMj1lPZIWaEGnje93RygwFCVNuCZPkotwHwIQ3ONOyW/ufjiXEHZ
 21McReeeZRkzDj+i/mT9J43JzNKfgo675kJ5MpcKmLx6lC/BRQfR4sWawOjGUCzOMDZT
 hb5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD3eaw6aaRyZOO/fE4LW+xz5sHTDS8JY2kbPejLxyXhSRb/whbxKjs1AwcGNZODgWWNLMyHkjzL8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8+ovxWYJhmZi0UWEHG/ER9G0eE2k3SS9OkWGX2JtneFs2lA0l
 Fpzv8oPrpMv9Kf7ADZK7FWCBRbH0j41m5/S0D3sGzOs3z0RsoavMlROF
X-Gm-Gg: ASbGnctOP91MEV8zNLOacAH3emMrD3qPqIM0or0ykltEmSZzQB28xX2jQtdgZjb7ztb
 ERK791AXshQ1BF5Ok/7Y+4xr98vZT02CxdECHvjEaqprFMApI2FujWuG16rgq6EgQa7wcJQMMIt
 Oo47Ollv695NysCo40mnIKkA+D/T+oEZkHptU9oloXrJKimoWPMcJdp3Ypz9OLI6Xdyvrlj81YK
 zyzwqbQsUFmZPDh4jOndsKzLne5yWz7sB/AKGSevDgZWi4yvJ/zMYt15jI37oweeWezD0Gt12ml
 D+9R8vc6eEK/7JRd17tsPNRk67pbBcgcGFqkfEYUzEXEV/BaNf1/1JmXKirtMg==
X-Google-Smtp-Source: AGHT+IEU8m2F+5mxJ4HQROetGJB4LGA8zrpWrZ/HojR3rTDhNg8kjwUPP475HlXQvhwtX4Onlx73lw==
X-Received: by 2002:a05:6a00:b87:b0:736:450c:fa54 with SMTP id
 d2e1a72fcca58-7488f6c9155mr687345b3a.6.1749757932319; 
 Thu, 12 Jun 2025 12:52:12 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488ffeca70sm123370b3a.21.2025.06.12.12.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jun 2025 12:52:11 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:52:09 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 16/20] PCI: rockchip: switch to HWORD_UPDATE* macros
Message-ID: <aEsv6X5JSQkpmwvP@yury>
References: <20250612-byeword-update-v1-16-f4afb8f6313f@collabora.com>
 <20250612193728.GA924118@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612193728.GA924118@bhelgaas>
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

On Thu, Jun 12, 2025 at 02:37:28PM -0500, Bjorn Helgaas wrote:
> On Thu, Jun 12, 2025 at 08:56:18PM +0200, Nicolas Frattaroli wrote:
> > The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> > drivers that use constant masks.
> > 
> > The Rockchip PCI driver, like many other Rockchip drivers, has its very
> > own definition of HIWORD_UPDATE.
> > 
> > Remove it, and replace its usage with either HWORD_UPDATE, or two new
> > header local macros for setting/clearing a bit with the high mask, which
> > use HWORD_UPDATE_CONST internally. In the process, ENCODE_LANES needed
> > to be adjusted, as HWORD_UPDATE* shifts the value for us.
> > 
> > That this is equivalent was verified by first making all HWORD_UPDATE
> > instances HWORD_UPDATE_CONST, then doing a static_assert() comparing it
> > to the old macro (and for those with parameters, static_asserting for
> > the full range of possible values with the old encode macro).
> > 
> > What we get out of this is compile time error checking to make sure the
> > value actually fits in the mask, and that the mask fits in the register,
> > and also generally less icky code that writes shifted values when it
> > actually just meant to set and clear a handful of bits.
> > 
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Looks good to me.  I assume you want to merge these via a non-PCI tree
> since this depends on patch 01/20.  PCI subject convention would
> capitalize "Switch":

Hi,

I'd like to take patch #1 and the explicitly acked following patches in
my bitmap-for-next.Those who would prefer to move the material in their
per-driver branches (like net, as mentioned by Andrew Lunn) can wait
till the end of next merge window, and then apply the patches cleanly.

Thanks,
Yury

>   PCI: rockchip: Switch to HWORD_UPDATE* macros
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> 
> > ---
> >  drivers/pci/controller/pcie-rockchip.h | 35 +++++++++++++++++-----------------
> >  1 file changed, 18 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
> > index 5864a20323f21a004bfee4ac6d3a1328c4ab4d8a..5f2e45f062d94cd75983f7ad0c5b708e5b4cfb6f 100644
> > --- a/drivers/pci/controller/pcie-rockchip.h
> > +++ b/drivers/pci/controller/pcie-rockchip.h
> > @@ -11,6 +11,7 @@
> >  #ifndef _PCIE_ROCKCHIP_H
> >  #define _PCIE_ROCKCHIP_H
> >  
> > +#include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/kernel.h>
> >  #include <linux/pci.h>
> > @@ -21,10 +22,10 @@
> >   * The upper 16 bits of PCIE_CLIENT_CONFIG are a write mask for the lower 16
> >   * bits.  This allows atomic updates of the register without locking.
> >   */
> > -#define HIWORD_UPDATE(mask, val)	(((mask) << 16) | (val))
> > -#define HIWORD_UPDATE_BIT(val)		HIWORD_UPDATE(val, val)
> > +#define HWORD_SET_BIT(val)		(HWORD_UPDATE_CONST((val), 1))
> > +#define HWORD_CLR_BIT(val)		(HWORD_UPDATE_CONST((val), 0))
> >  
> > -#define ENCODE_LANES(x)			((((x) >> 1) & 3) << 4)
> > +#define ENCODE_LANES(x)			((((x) >> 1) & 3))
> >  #define MAX_LANE_NUM			4
> >  #define MAX_REGION_LIMIT		32
> >  #define MIN_EP_APERTURE			28
> > @@ -32,21 +33,21 @@
> >  
> >  #define PCIE_CLIENT_BASE		0x0
> >  #define PCIE_CLIENT_CONFIG		(PCIE_CLIENT_BASE + 0x00)
> > -#define   PCIE_CLIENT_CONF_ENABLE	  HIWORD_UPDATE_BIT(0x0001)
> > -#define   PCIE_CLIENT_CONF_DISABLE       HIWORD_UPDATE(0x0001, 0)
> > -#define   PCIE_CLIENT_LINK_TRAIN_ENABLE	  HIWORD_UPDATE_BIT(0x0002)
> > -#define   PCIE_CLIENT_LINK_TRAIN_DISABLE  HIWORD_UPDATE(0x0002, 0)
> > -#define   PCIE_CLIENT_ARI_ENABLE	  HIWORD_UPDATE_BIT(0x0008)
> > -#define   PCIE_CLIENT_CONF_LANE_NUM(x)	  HIWORD_UPDATE(0x0030, ENCODE_LANES(x))
> > -#define   PCIE_CLIENT_MODE_RC		  HIWORD_UPDATE_BIT(0x0040)
> > -#define   PCIE_CLIENT_MODE_EP            HIWORD_UPDATE(0x0040, 0)
> > -#define   PCIE_CLIENT_GEN_SEL_1		  HIWORD_UPDATE(0x0080, 0)
> > -#define   PCIE_CLIENT_GEN_SEL_2		  HIWORD_UPDATE_BIT(0x0080)
> > +#define   PCIE_CLIENT_CONF_ENABLE		HWORD_SET_BIT(0x0001)
> > +#define   PCIE_CLIENT_CONF_DISABLE		HWORD_CLR_BIT(0x0001)
> > +#define   PCIE_CLIENT_LINK_TRAIN_ENABLE		HWORD_SET_BIT(0x0002)
> > +#define   PCIE_CLIENT_LINK_TRAIN_DISABLE	HWORD_CLR_BIT(0x0002)
> > +#define   PCIE_CLIENT_ARI_ENABLE		HWORD_SET_BIT(0x0008)
> > +#define   PCIE_CLIENT_CONF_LANE_NUM(x)		HWORD_UPDATE(0x0030, ENCODE_LANES(x))
> > +#define   PCIE_CLIENT_MODE_RC			HWORD_SET_BIT(0x0040)
> > +#define   PCIE_CLIENT_MODE_EP			HWORD_CLR_BIT(0x0040)
> > +#define   PCIE_CLIENT_GEN_SEL_1			HWORD_CLR_BIT(0x0080)
> > +#define   PCIE_CLIENT_GEN_SEL_2			HWORD_SET_BIT(0x0080)
> >  #define PCIE_CLIENT_LEGACY_INT_CTRL	(PCIE_CLIENT_BASE + 0x0c)
> > -#define   PCIE_CLIENT_INT_IN_ASSERT		HIWORD_UPDATE_BIT(0x0002)
> > -#define   PCIE_CLIENT_INT_IN_DEASSERT		HIWORD_UPDATE(0x0002, 0)
> > -#define   PCIE_CLIENT_INT_PEND_ST_PEND		HIWORD_UPDATE_BIT(0x0001)
> > -#define   PCIE_CLIENT_INT_PEND_ST_NORMAL	HIWORD_UPDATE(0x0001, 0)
> > +#define   PCIE_CLIENT_INT_IN_ASSERT		HWORD_SET_BIT(0x0002)
> > +#define   PCIE_CLIENT_INT_IN_DEASSERT		HWORD_CLR_BIT(0x0002)
> > +#define   PCIE_CLIENT_INT_PEND_ST_PEND		HWORD_SET_BIT(0x0001)
> > +#define   PCIE_CLIENT_INT_PEND_ST_NORMAL	HWORD_CLR_BIT(0x0001)
> >  #define PCIE_CLIENT_SIDE_BAND_STATUS	(PCIE_CLIENT_BASE + 0x20)
> >  #define   PCIE_CLIENT_PHY_ST			BIT(12)
> >  #define PCIE_CLIENT_DEBUG_OUT_0		(PCIE_CLIENT_BASE + 0x3c)
> > 
> > -- 
> > 2.49.0
> > 
