Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249C9DB978
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D9F10EB04;
	Thu, 28 Nov 2024 14:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uVYs1wak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C06E10EB04
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:18:34 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2ffc357ea33so9507971fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732803512; x=1733408312; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xA8QccDB7jDinpTszrKQcVtNkmKlzXFjmJDa5bO0Mmg=;
 b=uVYs1wakQkJV1XOMH6I8R2sEORoANDh69Hy0oTFZ9CcraQDBkqA2gEF0OJst5qNSnS
 dJ8wCUGE6Pa6d9cYpfaGRJNLhWzS3Rz/Gj4rjwmVBrrexIMtzWiNR7cKmXeiiulVyeIk
 HmyQMy0xETddkNmXuUt5TFHyWskgDkvRuBXgVW97jbdS0gZ9/169dxNXuSzxDsUIUpPf
 NqWuTzvnVqs+RbhIcrQphSszNCkWiJlYu36A+2ZoZLBkx/hs1vIiuL88anKetNCP41Yo
 BdsEr02OMgnr2SiNulkOc4ro8cDchJjXXMBdtgarzp+yWHopwKSKkJ5ptFH5NPYYC9Ww
 Y0dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732803512; x=1733408312;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xA8QccDB7jDinpTszrKQcVtNkmKlzXFjmJDa5bO0Mmg=;
 b=PKp6MO4o1EPsinKxVzOFZOA7mlni5whO1gpe6Q7CAxtXSAfLNuCQ6GQcYodeVr/5B9
 v6w0SPBFAB1XqkUfLJuOIl2/q0rd6pU7dbaz+5RvzBUQUC/Dk0MwMZZ2/DyoMuH7DQ+A
 HTR/TXjCosG/SclsDCBCSa5YjCiM/kszzZwworfUqF4ygOdSQ72phrt619Ymu+H2Nssq
 3UdIYhGcF+okEOkg1olo7zyzWVEaJdqKqrYT+MVn0k2GblBWPOVlBMivg/nh3h/xBz1o
 jOAwmTwkjR1UJSCzc2jO2vnYsHDcxUcK5vZBxOM3hIr8BtrO8sHAaNAbWNsPAL1jRard
 eZ2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTejDf4NKb8C/Ags2rgfUaMLUINhp53etJ9vd550OGAzyDvztrUeeEe7Gjl42HsrSKZTem8Vuiln8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQgYQXktaLkypx0EXqIDEQcAxNC8YGjh8ZT2YCEV5jWikiDVi0
 gFPWng7LhmvLr+yrS6jpYnXCCtgZvYG3dL9838mwNuexeox51ey/2NCFHH2nd+8=
X-Gm-Gg: ASbGncu2pXlzyBnSFKxN7lDG8kOKdh6VfXecOnuQOBLSsDCwfzL+AM0jLEZjEu96wX+
 cZd7FknuJw1iNoM21eTFwg/tFZZO7mEP3C1s2/62tvZGvktyHoAmvlYC1sofpy0BLhnD7FqYIxa
 6NagEwYUr8YPFHHvuil73JbOHwjbMoPzlWgYUKUjph40eJVGPL5aMm0/Pr1t+KMH8Jrwm8C5cuL
 U0vDSzxHhulzQdchGmQ1yIPp2rMo0LpDqUFhs5DpqKIpfwjDwcwhjfSyQTjJBC/kZR/B0Eewjsj
 ydEi+x9ysjncK9YS6r2VA4HWIpCuGA==
X-Google-Smtp-Source: AGHT+IEWrfuUcnXV1iqJHqdNEOSGIK8M6/LbygKUp+v7qqACcol4zNxR8qGEVUdI0pmwpuF4EUOzaA==
X-Received: by 2002:a05:651c:887:b0:2fb:8920:99c6 with SMTP id
 38308e7fff4ca-2ffd604fc7fmr46439611fa.23.1732803512212; 
 Thu, 28 Nov 2024 06:18:32 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfc75452sm2022861fa.85.2024.11.28.06.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2024 06:18:30 -0800 (PST)
Date: Thu, 28 Nov 2024 16:18:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org, 
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it, frank.li@nxp.com
Subject: Re: [v4,09/19] drm/imx: Add i.MX8qxp Display Controller display engine
Message-ID: <kixewphwyawbyrfu6pxtqx5fywqmq7ms2sa5j5pzogetmebcjz@ouhpohk7twbc>
References: <20241125093316.2357162-10-victor.liu@nxp.com>
 <c4334c9b-833b-4923-8188-64d662231512@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4334c9b-833b-4923-8188-64d662231512@linux.dev>
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

On Thu, Nov 28, 2024 at 04:46:53PM +0800, Sui Jingfeng wrote:
> Hi,
> 
> On 2024/11/25 17:33, Liu Ying wrote:
> > i.MX8qxp Display Controller display engine consists of all processing
> > units that operate in a display clock domain.  Add minimal feature
> > support with FrameGen and TCon so that the engine can output display
> > timings.  The display engine driver as a master binds FrameGen and
> > TCon drivers as components.  While at it, the display engine driver
> > is a component to be bound with the upcoming DRM driver.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v4:
> > * Use regmap to define register map for all registers. (Dmitry)
> > * Use regmap APIs to access registers. (Dmitry)
> > * Inline some small functions. (Dmitry)
> 
> 
> Why?
> 
> Its seems that the switch to regmap APIs is not very necessary,
> as ioremap/writel/readl are simple enough and easier to use.
> 
> Isn't that this just introduce an intermediate layer? It's okay
> for display bridges/panels that behind I2C bus or SPI bus. But
> then, why drm/msm still haven't be converted to use the regmap
> APIs ?
> 
> Just a few questions, has no opinions to your patch.

Please respond to the original review comment. Then we might be able to
discuss if the suggested change was logical or not. Discussing changelog
doesn't make sense becasue there is no context here.

-- 
With best wishes
Dmitry
