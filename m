Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E57D9E6A8A
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 10:39:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D580F10F064;
	Fri,  6 Dec 2024 09:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d7/rFf7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC3D910F064
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 09:39:54 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53e22458fb5so1679817e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Dec 2024 01:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733477992; x=1734082792; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lyjy+B1BzCuYPV6TYOZ9W+qMOzIQt8vOgPam9Y/pajs=;
 b=d7/rFf7R7LGit7rpT3hQLq7n3lOIflYGUj5wx3ZP2rwKcFDdkeGSkxm0h1VZfRlDZ4
 1tnqYtTAcF8vc9jwS9T2wWgEj7ezJy+roJaRTepKvVLnncpIeRWCgykv1tgQtXLJfStt
 xTogF767Vbd6ban92rR1+TP6uYMV90kS58cw8NFlnD3CAtAYtSvF+ZgDdpBc33tTJmnX
 ib0PfF0r6WMMwvH1+qJ+g9ge3eT8TrVMuDuK0964IjjI6VvhMfUSgTTsWrlQpaVA+di0
 J4BwOxmr8o/KcjqBn+tB+hZ5hY4o/QUKx4KSLsBeJ4Ths0vbm4atJ1fI3iYMZjcBodhs
 0mqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733477992; x=1734082792;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyjy+B1BzCuYPV6TYOZ9W+qMOzIQt8vOgPam9Y/pajs=;
 b=XQ3VNstZDzO59d68BrTb7gIIXiWabC9SwdyJiS3aDOOMBPI0TBAySsObQFhECE9hAT
 u5k1nBv+ltxK3C21K0btMDmTDvuqEGRGNoRPFFNc2+SrLBGBv57vry7+HYdkO9qq8dBP
 gg1VHpeF+vDCBZHo4idysEMBLCCUpKlK74cGg3OQKVwNPl73HS27MsX6ObTKLscAMJt3
 8JguS6yF6x/irHIcOkyQDuJmhRqY4KO4j8tmqR61g+oY3eS15zZD3FrUpQzcUQegsCxq
 2IO2mHIQxCqNWqy8M95JKq4v1UeI+FRIch+LvanX1+IFGiUplz1LCabiBQMBXx1Dhn2n
 HLPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrQ58rhoUYTt6MVmk+WCoMNTpSF1+xABlNcOQPH+/4ESrEGFNpJ8EhFfw/CzqL4iax6MP10jX3A7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxk80QxWxXhEevvm/pJRuHV8Cc43lzEESmj0yrj7iHq2l7WjqEs
 c+jlFLqefuThKxFkkKf/dG5flK+t13vXKRbKHdZ/PIOHH9+e1B8XusRuxfbCbss=
X-Gm-Gg: ASbGncvYGUqIZLNgVhrCVShEIKBtWEZNr6CIErhk6a+IFi5yeVWjzF+TrOrpVNTIzGy
 T9+u9o/wh1pASOq5XjSE6FVFNII5kdGyjjpbTDjb3nd+ztK/DhecTy2KOg++QTo6PHSVYpnakEQ
 XNYsuWf6ECj1tN3F3Ald3XdA3oASo7hmiIQUSikPhmsuvbsq0JVDd7ooxe+sjI9QIlNSwU+/ZoN
 GmFTxPUw9aqyGnYgLlM7WuZ1NddQAzkB4SFlXxchMvqyGwLQ9tzUuoAXlw9ZD3K8F3fdUvyLZIi
 oxb/Cm20gyvuN7gXvPNmAEjHb5SFTg==
X-Google-Smtp-Source: AGHT+IGNBPdaS1w4uQtjk5trf2hXxJbni2d/hlEYqanCr4EtCYjz+uzjDBO9Y74HuWm6AMKmFcMGVQ==
X-Received: by 2002:a05:6512:138a:b0:53e:232b:6864 with SMTP id
 2adb3069b0e04-53e2c2b17f4mr621540e87.2.1733477992487; 
 Fri, 06 Dec 2024 01:39:52 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e229ca4aasm448445e87.244.2024.12.06.01.39.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Dec 2024 01:39:51 -0800 (PST)
Date: Fri, 6 Dec 2024 11:39:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>, 
 Tanmay Shah <tanmay@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 16/45] drm/msm/dp: add support for programming p1
 register block
Message-ID: <d6hwd3mktcgrczwiqmkuf53byjushkdxgadilcjb5dqu2sdq2n@z7tzffqkn6tg>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
 <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205-dp_mst-v1-16-f8618d42a99a@quicinc.com>
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

On Thu, Dec 05, 2024 at 08:31:47PM -0800, Abhinav Kumar wrote:
> p1 register block is needed for the second mst stream.
> Add support in the catalog to be able to program this block.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b4c8856fb25d01dd1b30c5ec33ce821aafa9551d..ee7f2d0b23aa034428a01ef2c9752f51013c5e01 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -73,6 +73,7 @@ struct dss_io_data {
>  	struct dss_io_region aux;
>  	struct dss_io_region link;
>  	struct dss_io_region p0;
> +	struct dss_io_region p1;
>  };
>  
>  struct msm_dp_catalog_private {
> @@ -93,6 +94,8 @@ void msm_dp_catalog_snapshot(struct msm_dp_catalog *msm_dp_catalog, struct msm_d
>  	msm_disp_snapshot_add_block(disp_state, dss->aux.len, dss->aux.base, "dp_aux");
>  	msm_disp_snapshot_add_block(disp_state, dss->link.len, dss->link.base, "dp_link");
>  	msm_disp_snapshot_add_block(disp_state, dss->p0.len, dss->p0.base, "dp_p0");
> +

Drop extra empty line, please

> +	msm_disp_snapshot_add_block(disp_state, dss->p1.len, dss->p0.base, "dp_p1");
>  }
>  
>  static inline u32 msm_dp_read_aux(struct msm_dp_catalog_private *catalog, u32 offset)
> @@ -145,6 +148,26 @@ static inline u32 msm_dp_read_p0(struct msm_dp_catalog_private *catalog,
>  	return readl_relaxed(catalog->io.p0.base + offset);
>  }
>  
> +static inline void msm_dp_write_p1(struct msm_dp_catalog_private *catalog,
> +				   u32 offset, u32 data)
> +{
> +	/*
> +	 * To make sure interface reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */
> +	writel(data, catalog->io.p1.base + offset);
> +}
> +
> +static inline u32 msm_dp_read_p1(struct msm_dp_catalog_private *catalog,
> +				 u32 offset)
> +{
> +	/*
> +	 * To make sure interface reg writes happens before any other operation,
> +	 * this function uses writel() instread of writel_relaxed()
> +	 */

Not applicable to the actual function.

> +	return readl_relaxed(catalog->io.p1.base + offset);
> +}
> +
>  static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
>  {
>  	return readl_relaxed(catalog->io.link.base + offset);
> @@ -1137,6 +1160,12 @@ static int msm_dp_catalog_get_io(struct msm_dp_catalog_private *catalog)
>  			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0.base);
>  			return PTR_ERR(dss->p0.base);
>  		}
> +
> +		dss->p1.base = msm_dp_ioremap(pdev, 4, &dss->p1.len);

p1 is not populated for eDP case, it wasn't always present in DT, etc.
So please make it optional.

> +		if (IS_ERR(dss->p1.base)) {
> +			DRM_ERROR("unable to remap p1 region: %pe\n", dss->p1.base);
> +			return PTR_ERR(dss->p1.base);
> +		}
>  	}
>  
>  	return 0;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
