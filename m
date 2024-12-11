Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E559ED994
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 23:24:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E34910EC41;
	Wed, 11 Dec 2024 22:24:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AFXCXLUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C8510E138
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 22:24:20 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-53ff1f7caaeso5051585e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 14:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733955859; x=1734560659; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=TQt0c/B79tzZ92JCkmXyGPgoiCeeT1lFWyXxnDRmJf0=;
 b=AFXCXLUStuFZSaar+9cl4lZ++6ifJdxE/BCRgAdCTm0GhMofPbRLB7bWmD0unyTZpt
 mf3HQhzJSzZa42PmIYjs1RQdjI+U4OqudLS7ZebsJS4WCCS/eFGAPIG3qZh3/2b5sF5K
 4o4WubPeHBjkpLSfh4LxbnKspcz0WCRmc2weEYqmAIlWY6Iby+8oH9J55NksKOgihaKY
 dweylNflBjSGjIQFt/xaCjBZX9m1IqtS48yV2DgEA8+4lsiJY6PeE/8cYC8T32OE9qna
 B1MLme5VBxXog4q26Bc1kxW4oPAC1MG6u2gqiO0+aQaw+QetX5g+Tr7TcEdzVIvgsJWN
 ipZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733955859; x=1734560659;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TQt0c/B79tzZ92JCkmXyGPgoiCeeT1lFWyXxnDRmJf0=;
 b=O4uJ/t45jIc7U+lG8OZzWdLL3DlBgms9XayzuQtAg6RnrF/glEWyjSy4hdwoUhHtU7
 gqXmuGwnQF/NSBSYK13GQcJ2O/3rt2I4d1M+LfIDskRrBS65nuwS+9m7jR1t5GsC+dA8
 82IrszfkrmsHg5O4TAQVwmXZmfwZWXeosoFRIZ4ZASWkpmwkFVp6bx+HbuL6gDtJVGuU
 ha373h9CGn7HxJ0ZbA2tDwS57aDFqE1VE+zKJ2FXXi47qVUCPcltOIlHmqEhxzLaVXZr
 WO9UkEp8TP5aEayDW4TBbU8AFR2BWI9bxPF6Bhs/dhzHuFy7rXQFW00X2GkIxVk8issl
 WhsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlGn8luLC53wO9y24Ru3kjh5TgCIfiqdLUwOioo500fL47xJ+N6B2Oyk2wzz+snGdyoSWa7LwhI8I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBW40ybGu5Uw5FLkMRDDxUklHymjKdz52/gCAvKjHnjskh2qVt
 VeX0X4ZYQJzX0N4OIs+itTpzM6AF9qOmj8kCoXPEICZtkMSD+MqdlnasDpM9xTA=
X-Gm-Gg: ASbGncsdpPSHhYL/CslGDN+WWPIoLlTXmXoCEpXpEQDly4xdY5rmFn7HqNTNtyrlQtT
 W7r8GmwM8rcP43GU//tYGAVBndDNBMCso3OHHQ0rCJxpZg2Ji5VIoqpwPXhDFPyPIJl7GfvrBc1
 NTKoWcTmpPQXFjUL4V5KRo6k3ytlekpZ+IClkhaWEET/g5/GHAeqgcQbdv/8fo8/hT8q8b8sN72
 YRusJplyZwzuIIgF7yykHrMvMT+QGsBv2iG3ds+f48g4ZtsP7EqWuoVC3dGS0vhdleSrng18EkC
 FlTxFG/9RUPqPaTHqbNuJTTcQ9618MkWPw==
X-Google-Smtp-Source: AGHT+IGUjnHXz8xm14gX4NMTwgGnSmfUk9Frni6oN0Mq2JYlv9txb+UhgRCFjpynV3Xptsxw0hq6Fg==
X-Received: by 2002:a05:6512:238b:b0:53e:39b7:54a3 with SMTP id
 2adb3069b0e04-5402a5daa14mr1547884e87.24.1733955859171; 
 Wed, 11 Dec 2024 14:24:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e3c48b122sm1519955e87.65.2024.12.11.14.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 14:24:17 -0800 (PST)
Date: Thu, 12 Dec 2024 00:24:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/3] drm/msm/dpu: allow using two SSPP blocks for a
 single plane
Message-ID: <hpmxj7tjmvbo55izoxgygqmysbabnpb35mprvn6w53vbtehnwe@yxmiigoeuyf3>
References: <20241130-dpu-virtual-wide-v7-0-991053fcf63c@linaro.org>
 <20241130-dpu-virtual-wide-v7-2-991053fcf63c@linaro.org>
 <160151f0-9cc6-40f6-9f53-466185835e4d@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <160151f0-9cc6-40f6-9f53-466185835e4d@quicinc.com>
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

On Wed, Dec 11, 2024 at 01:51:51PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/29/2024 5:55 PM, Dmitry Baryshkov wrote:
> > Virtual wide planes give high amount of flexibility, but it is not
> > always enough:
> > 
> > In parallel multirect case only the half of the usual width is supported
> > for tiled formats. Thus the whole width of two tiled multirect
> > rectangles can not be greater than max_linewidth, which is not enough
> > for some platforms/compositors.
> > 
> > Another example is as simple as wide YUV plane. YUV planes can not use
> > multirect, so currently they are limited to max_linewidth too.
> > 
> > Now that the planes are fully virtualized, add support for allocating
> > two SSPP blocks to drive a single DRM plane. This fixes both mentioned
> > cases and allows all planes to go up to 2*max_linewidth (at the cost of
> > making some of the planes unavailable to the user).
> > 
> 
> Overall looks so much cleaner after unification!
> 
> One small nit below,
> 
> 
> You can still have,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Note: we have started testing this series with sc7180 CrOS, and will report
> our findings/ give tested-by this week.
> 
> 
> <snip>
> 
> > +static bool dpu_plane_try_multirect_parallel(struct dpu_sw_pipe *pipe, struct dpu_sw_pipe_cfg *pipe_cfg,
> > +					     struct dpu_sw_pipe *r_pipe, struct dpu_sw_pipe_cfg *r_pipe_cfg,
> > +					     struct dpu_hw_sspp *sspp, const struct msm_format *fmt,
> > +					     uint32_t max_linewidth)
> > +{
> > +	r_pipe->sspp = NULL;
> > +
> > +	pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +	pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +	r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +	r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> 
> 
> There are two places where the multirect_index and multirect_mode are reset.
> Would it be better to just have a small api dpu_plane_reset_multirect() and
> do this there?

I'm not sure, what's the benefit. We can add an API to reset one pipe
(to also be able to use it in _dpu_plane_atomic_disable()), but then
it's just deduplication for the sake of deduplication.


-- 
With best wishes
Dmitry
