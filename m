Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 050788D111D
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 02:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5637E10FDA3;
	Tue, 28 May 2024 00:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="viAY7MnI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B8410FDA3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:48:13 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so349614e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 17:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716857292; x=1717462092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ypB2D9Bb+O5VK4pY/eZpWiPU4q5dgpNVinp1IWPeDkY=;
 b=viAY7MnIxDjaeXnfv946ctOTAJKVb2dh0G95q6BwJmKf+MI4oLN4GnNI7V+XLnvjUI
 SoTe7wSRMR3o3RW/Be0fBzXbGlVYXnj8Fv1YMICjZEn3IeV+NMbDPmRTdukrEPjxyckT
 Zrv2wa0TeK4M8BqY2N9KqYQOJqbI8BZhjXPuuXTsZ+PTr48EhnrWTObxwIgNnWNTQ9Y+
 dRv52/W5FFkq2SXWXlHymlneTbKviXUmtnrtPuYXRvfqsWZ9+/BXWT4I35VVO9+zhh8+
 Xuf2+YFC/zjBWf4Vp7m0U0T/Yu8Pl+aLxm7eBLHjL4emUFd5pT/3+GDgqOBY44W9GK9M
 lQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716857292; x=1717462092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ypB2D9Bb+O5VK4pY/eZpWiPU4q5dgpNVinp1IWPeDkY=;
 b=A1t2OpWJqbsLSBgHkaEF13AO5djEgoNXISIJbrgwkMDL+IYrYptDbZ0ivjBmEAKuXD
 pQNNkmCXuOgcYb+B5aTfM/ihvuQviV2q3yTYEKrT3ocBg8SmVw8UeNJlXFLYLqECUFiN
 EfR8b3dJnQwGq2QZVnI7PoteJcnocCROkt7AjgazWfL238fe1J56/QHmbSbr6jZd7vGI
 bJMKfh/TPUWBrWO39vpABokwe11yQqGPd3QDPO6RpdTWhdBUc3fFjH96vhKydIaM3V65
 ZmamjHbFM1xuY7p3JbhEu4BhLrLZv3XWMF7LyA0U6H7jK6LeNTQqeVL616sWiQnQqGzS
 1NYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUtAqcE397KZ4NUjalBsMCMjMhD/CKSCcQjtxwNfo+xLVoI/izUWBJ0SBWqJ+TGru/30WVy4GRMSf1QUikIU7UqIB84/BSJ0Jii0J+5YtL
X-Gm-Message-State: AOJu0YxOuOLul231EaptW97h2wmrGRDkJGXCjudrd4VLju6Pl55JHQEm
 M8GcpL4cfDz2rD+xWcIPVz5pIjZ64XzL0vxXB0NUEedNCa8WBWQj91KikktUc0g=
X-Google-Smtp-Source: AGHT+IEVie+TQv3jITNYhblOTW1JouMd65as19e2NeHTBjHaj+9QaGA8P0Iw3XMZQXdTAy8/gfB5ig==
X-Received: by 2002:a05:6512:45c:b0:51b:fc6c:cbf6 with SMTP id
 2adb3069b0e04-52964baf307mr6988063e87.16.1716857291477; 
 Mon, 27 May 2024 17:48:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5296e887a77sm811073e87.58.2024.05.27.17.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 17:48:11 -0700 (PDT)
Date: Tue, 28 May 2024 03:48:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/6] drm/msm/dpu: adjust data width for widen bus case
Message-ID: <57sr3ssi6nwermdqtnb2ackmu4tlxs4gcslvp4v6ndafnvbqhb@4npuqfpkzzan>
References: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-0-f797ffba4682@linaro.org>
 <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-2-f797ffba4682@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240527-msm-drm-dsc-dsi-video-upstream-4-v5-2-f797ffba4682@linaro.org>
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

On Mon, May 27, 2024 at 10:21:48PM +0800, Jun Nie wrote:
> data is valid for only half the active window if widebus
> is enabled
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 225c1c7768ff..f97221423249 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -168,6 +168,15 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>  
>  	data_width = p->width;
>  
> +	/*
> +	 * If widebus is enabled, data is valid for only half the active window
> +	 * since the data rate is doubled in this mode. But for the compression
> +	 * mode in DP case, the p->width is already adjusted in
> +	 * drm_mode_to_intf_timing_params()

Is there any reason for divergence here?

> +	 */
> +	if (p->wide_bus_en && !dp_intf)
> +		data_width = p->width >> 1;
> +
>  	hsync_data_start_x = hsync_start_x;
>  	hsync_data_end_x =  hsync_start_x + data_width - 1;
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
