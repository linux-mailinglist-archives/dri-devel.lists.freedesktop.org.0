Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2CD9E83D7
	for <lists+dri-devel@lfdr.de>; Sun,  8 Dec 2024 07:22:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F9E10E240;
	Sun,  8 Dec 2024 06:22:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IBLCjjDW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC4C10E239
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2024 06:22:47 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-5401c68b89eso159067e87.0
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Dec 2024 22:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733638966; x=1734243766; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=38gctL7UTrHCs9qA1LF95XHQwmYDkv868rO2ODhNpiw=;
 b=IBLCjjDWvZ4tE0kP9g1OHK0+uTicmOZnYddGE5kv4y0UKyrxfU1gAzfwzsHYMiqtFL
 yxC96uwa6YjVeUsJ+saKWwmrmv4qy5pk5nU+2XcS0E1UgrgybWUWLekS6XrwcPTg6nhz
 zxTIJciOBFSXU4sF8EFTzeWR2RXZ4LS5trx44UpQdhdBfcvwqYLhwd3KwXY4bcjZuets
 R75tclYEM3tEBKznR538MEcU6SaxaNXx0Sj3mw12fwcG3QvvIMOJ2rbnWy7ZgFLw5BXL
 C9TCbMoryCSYLBCQ8rnZMOdnkQtSbB26hQHsDvr6FHKCuA7/DasvI8fchXRH8lj6Q8i5
 Djfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733638966; x=1734243766;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=38gctL7UTrHCs9qA1LF95XHQwmYDkv868rO2ODhNpiw=;
 b=kENK8vnW4rslmbUkUs1Umu3WKLZkFsinrM+EqukqpYUQwtSH0oFsUmID2oEEZsHT/h
 z45to2JzNfCD8RTMJxrwx425zcQ8gX4i6QgEjkoWfDsIULzD1t4+tzk0K0og25lHhSd9
 QKoa60uA5uH/BdKZF59F7hL/AZPsaJnwcXIbvvGzUgd7L+NYZHf7eB/I8BkGAbLRNkrr
 2+zhRCYs2FPw87CIv5IUTba2pRVpYs/GPXF3wv9TrnsSeuXsCzBaNfqz/hw6ejBXAWw3
 YIUvNMDA/SN5r0BjVvW8cq2i7nJkmNtN6cd4wVNK9MzY3fG+Hzg/tIYWgMNQoudYQPsY
 zT0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZDzdhv/F84x5TCsYY2+wHQ0gHn9dW8ZUY7q4HUdLX2dkSrCPrdILy8bVw8KOnJUhJv8A/7F8hoKk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4Sq6WhhVIMoAjWEokHDY3j0A5gaEdqKL2q4jA3AYCNGL3r4B7
 wfAL+fIGQm/fZ8QAHynjYwTTfVi0WQUX4jVwpK+hMiVWtmQNQJCoxB7i/piLiL4=
X-Gm-Gg: ASbGncupiZNCKOg8ZQ9xzvpd7Rq/28rrz1W1KNuczAONKcko6zEngg28ghUnF3GkIWR
 dlKUyvu0XXhkNwXsoDlVHvqA6+q1ra1YtNQCFQHSGapIPuVvjyjtV6XfHw47KQySQYI803dPAle
 nMJEGMZPTeDR8p3t6TwgHyyv+cC+yHKVm+KJeUCuCe6CGsQYWx3Klt9lYNJQxr2MrwIYJuXc8Se
 j6Qztv0HyMCotYpNjmZ54aLtQO0l32ITsDe2+RLC8ZzU+QdJV7a9DEcM8QtbbI/5UJtIkXuToXs
 iUZOtXAatUQJcMzqqgf9gR1qtXeIkg==
X-Google-Smtp-Source: AGHT+IH0qp1aPQA+2OpPaXQ/vPvKw2/kQ5aoewjrbzmt3QID8qu4PyXFLKKH22VCjIXIHCP65iqmvA==
X-Received: by 2002:a05:6512:3dac:b0:540:1bc3:1061 with SMTP id
 2adb3069b0e04-5401bc31213mr349243e87.11.1733638965870; 
 Sat, 07 Dec 2024 22:22:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401c2c700fsm99554e87.86.2024.12.07.22.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2024 22:22:45 -0800 (PST)
Date: Sun, 8 Dec 2024 08:22:42 +0200
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
Message-ID: <ku6ytypptjtydcgscdvwsi62cgxokxn6svwwzs2ce3otnnlrrl@uvr6st3365kv>
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
> +	return readl_relaxed(catalog->io.p1.base + offset);
> +}

After looking at the actual code, please implement
msm_dp_read_pn(stream_id)  / msm_dp_write_pn(stream_id)

> +
>  static inline u32 msm_dp_read_link(struct msm_dp_catalog_private *catalog, u32 offset)
>  {
>  	return readl_relaxed(catalog->io.link.base + offset);

-- 
With best wishes
Dmitry
