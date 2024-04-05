Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C1089A0B1
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 17:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B682210EA52;
	Fri,  5 Apr 2024 15:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tOv5YhLx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453D910EA52
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 15:09:53 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-516d0162fa1so2363050e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 08:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712329791; x=1712934591; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XJdX04IMH/Sr5fcTtZ7IsQwpDomVdtoarGfuP7SX06s=;
 b=tOv5YhLxaeCIwzGHeIMB573G7xJ/xWj1dE/6iE0Jd0hnhQQ4VpfC41txinVA9IjinN
 dfN/iN+xgS9sc8/0Yp6pFtf2RcQ4N4aFUzqkkMcawyF8qL6jNLHk+WvMEH8Jg0ME6vIK
 52yYu6jaJ93Wx9qCa16KEaY1vUzbFscPckagYb35DDcDMJirpi29VMdxD/zyS0kcyEYX
 50hM9kQRF+fFzRvdcI/LmJPXTnBP3mAKO+9ymEtCBAkeQo6fgctXc3KBe37ywTIOpnzP
 RWXpbwJClYiRxC46ULaSPmkO4qwjqOe3ZZbmaZKnMnBtBihh12fa6DYHoyV39/U5wbDl
 wbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712329791; x=1712934591;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XJdX04IMH/Sr5fcTtZ7IsQwpDomVdtoarGfuP7SX06s=;
 b=MgJalHeZxUP31C8w3BODJp0YZIOyXqoa9ErL7O9/FlzZiHC0Z3E+95EjgcrZhDttg4
 T7sWTB6+QbzMMgYr6/Rqk/HB7o8d64cJjt15MNVZ107mbQNEV0o3w7uv5ln2bIjbvmts
 USpZFNwspV1KYeUKYQo6lyqG7Xdarbf/HmC/w8XH20Fox9AsiVuBF+A/PxFbcOD6kLIE
 xJKOyd24nGqW/+AiBWv1ruHdL3QdwzZiuvjU1LEomKGPC/h4oIZ7FrD0rNTwv3B5yJgB
 78TNfGUdu0qzBvDKI8JcnMRQQLao5oqdAWXYCJ/QnzSSX+AydcAwqyJmT+Ow//KRBruy
 dkqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV18oUZkFSutXotaD2cnRuCx/O84ummuYZe9btGosAzsjyZF944eG6IUsPFLrwUVp1+z3aUPTckRaJTbWS7Hg6lyMdOKjDSKB6Jl0EStXm6
X-Gm-Message-State: AOJu0Yz2lVpkD2MRIp3XBiuY+WN7w5jKDB95qYi+exAkLdMxUK5r0aLn
 s/H9JkDJ1UQc+ASyLghq8y0y3w08Sv7KhVFN9kQAmp4RnSk09oW3Mbhp+qGicZY=
X-Google-Smtp-Source: AGHT+IHr0Gt4JNXkFtNyK4SoOL2Aljmp8TnDpiAo6jcvc0P5uChKtBqN0OC5YPsqfbIT76tBCMSLfQ==
X-Received: by 2002:a05:6512:44b:b0:513:cf5e:f2ad with SMTP id
 y11-20020a056512044b00b00513cf5ef2admr1527967lfk.60.1712329790930; 
 Fri, 05 Apr 2024 08:09:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a056512208300b00516cf20b276sm214121lfr.86.2024.04.05.08.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 08:09:50 -0700 (PDT)
Date: Fri, 5 Apr 2024 18:09:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sandor Yu <Sandor.yu@nxp.com>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject: Re: [PATCH v15 2/8] phy: Add HDMI configuration options
Message-ID: <7uculhmuov3z6o4xgv54ubdmju52y4jw7qkjbnslnyqbqgf5ku@sxrkuw4uwavx>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-3-alexander.stein@ew.tq-group.com>
 <20240306-inquisitive-funny-bull-017550@houat>
 <ZhAJridEyhUeFVr0@matsya>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZhAJridEyhUeFVr0@matsya>
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

On Fri, Apr 05, 2024 at 07:54:46PM +0530, Vinod Koul wrote:
> On 06-03-24, 15:48, Maxime Ripard wrote:
> > Hi Alexander,
> > 
> > On Wed, Mar 06, 2024 at 11:16:19AM +0100, Alexander Stein wrote:
> > > From: Sandor Yu <Sandor.yu@nxp.com>
> > > 
> > > Allow HDMI PHYs to be configured through the generic
> > > functions through a custom structure added to the generic union.
> > > 
> > > The parameters added here are based on HDMI PHY
> > > implementation practices.  The current set of parameters
> > > should cover the potential users.
> > > 
> > > Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Acked-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  include/linux/phy/phy-hdmi.h | 24 ++++++++++++++++++++++++
> > >  include/linux/phy/phy.h      |  7 ++++++-
> > >  2 files changed, 30 insertions(+), 1 deletion(-)
> > >  create mode 100644 include/linux/phy/phy-hdmi.h
> > > 
> > > diff --git a/include/linux/phy/phy-hdmi.h b/include/linux/phy/phy-hdmi.h
> > > new file mode 100644
> > > index 0000000000000..b7de88e9090f0
> > > --- /dev/null
> > > +++ b/include/linux/phy/phy-hdmi.h
> > > @@ -0,0 +1,24 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
> > > + * Copyright 2022 NXP
> > > + */
> > > +
> > > +#ifndef __PHY_HDMI_H_
> > > +#define __PHY_HDMI_H_
> > > +
> > > +#include <linux/hdmi.h>
> > > +/**
> > > + * struct phy_configure_opts_hdmi - HDMI configuration set
> > > + * @pixel_clk_rate: Pixel clock of video modes in KHz.
> > > + * @bpc: Maximum bits per color channel.
> > > + * @color_space: Colorspace in enum hdmi_colorspace.
> > > + *
> > > + * This structure is used to represent the configuration state of a HDMI phy.
> > > + */
> > > +struct phy_configure_opts_hdmi {
> > > +	unsigned int pixel_clk_rate;
> > > +	unsigned int bpc;
> > > +	enum hdmi_colorspace color_space;
> > > +};
> > 
> > Does the PHY actually care about the pixel clock rate, color space and
> > formats, or does it only care about the character rate?
> 
> Nope it should not

After taking a look at the Cadence PHY driver, I share the feeling that
hdptx_hdmi_feedback_factor() should be reworked into drm_display helper
and then the struct phy_configure_opts_hdmi can be limited to having a
single unsigned long char_freq or bit_rate field.

I'm not sure whether we need anything corresponding to the TMDS Bit
Clock Ratio control. As far as I understand, it can be deduced from the
Bit Rate.

-- 
With best wishes
Dmitry
