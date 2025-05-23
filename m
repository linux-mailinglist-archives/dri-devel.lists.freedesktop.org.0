Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13CCAC1D6C
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 09:02:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55D7C10E779;
	Fri, 23 May 2025 07:02:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="goDGI+/F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C8D510E779
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 07:02:08 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-442ed8a275fso111018475e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 00:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747983726; x=1748588526; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=y3chgsoPjsxPJjeKJHvKUZQo0VoemKGDA7Ek6bDVj68=;
 b=goDGI+/Fg6YLJP1ay0nRax041ndwC5ggLvA2hhzaPrN6OCyhMZR8rd0ht4qZBKWeAf
 ucVCLnxSXfqJOykeg/YauS6z1SOWYmC1gvqXGldWoGXxuTSvRpmmNOjbs0zUfbjnKFz7
 xo64ocLZuHL3W880EnZuWajd3wwhXCFCHKAdBb+keV3LunrJshHWKMnW0FfyfpvIAO/N
 82z7dLspXat67QUta4eygoEkEg/qbdbKmEwndi3PgbeqRmdUV+v/YrJqJDY/srBVRWa4
 zbkPjFpjngPhbk9hsC45jUr2z34acUtlDkMk9VicfPoz6E/7FpE0eDDmq3qYY9lxUZKZ
 urVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747983726; x=1748588526;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y3chgsoPjsxPJjeKJHvKUZQo0VoemKGDA7Ek6bDVj68=;
 b=ZJavF2VXu2ucFU7i/QlJCkYRea+7gBzw0xhjCeUphLVfCZbV9WyECGdfn1B70Wk4DP
 r9P678lGqIzgB81gyotOrg7W9hl6qumt9T0S83rvkDIU+WCm0S8gIUjfJWCUYQae32e7
 TltCnAheSg5wnzgms2Y41s2MEmpgPxfRj8deN9BltX4eXAJGQqJZwCs7iMhoAXaXVEpR
 CI7aE3emDLJrPK97+ZRGaMna2tghJ1qUP9i5x2buwJCgiGjj2DPw+wMGCupVCnNNznTz
 D+U1IVqmLHYldv4NDsns1EeH66npc90mu4uK/IWhV56ID6DCdbp5wZFXgHxp0zy3WLgm
 J72Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaRD34ZW3FmWXz9bCgFLUa6IhmJUiNZQSj0HrsR2zKakbi+llP3gNKxk61Weq/EdsTuPbiuD1wqsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyi8AV50lunS9A7sCiEtp09dyRdcrUqtQKMAoVf8GpGQLfROSXI
 iA47c57LzdWQXs8rCDQfMoazIPlt3b2rgbUu41GHqyDaVzM0KBB3bDrkVFizNK0CFdA=
X-Gm-Gg: ASbGncvBfm2UB+/szimasf202QOuSIewXNgc6XqXjLWlCAV+auA2oN6jbCNjY4W2mnN
 7S6VmagbRQ+glQlubbxCopTmBSGCDGjjI+SPy2KjJ5oEIHaw0ewEYNm626rcfQF++DmmgGk7D8J
 BNz4VM8gTJJXLAbHhwuO6ZREmRBc7dYfRU2lsEW6DSct0gqeCFM8GcQ6xv6f2UncIcadPGC+mbd
 AINxSrWmFaGahrc1Khakxa/ISg5y4Zzfc8LP+T47KD8mNHrvlVpjSOOoy8xY5buxy0cYGHVhA7g
 1LL+eLHUuLN1EYlrZ0L4H0Uf7WEwUcyxh8KmxR/dAgDee0s+
X-Google-Smtp-Source: AGHT+IFY4y/ZUB1VKe4lNbsorjCqofEy8Oz5r/Dj6XfZyxk0qjzrM+uoTb7F1fSElFjmjBLoR4SC6w==
X-Received: by 2002:a05:600c:8487:b0:43d:160:cd9e with SMTP id
 5b1f17b1804b1-44b6d6b1fdbmr13812575e9.17.1747983726219; 
 Fri, 23 May 2025 00:02:06 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f18251adsm134886385e9.2.2025.05.23.00.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 May 2025 00:02:05 -0700 (PDT)
Date: Fri, 23 May 2025 10:02:03 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <aDAdax7xdeDsvQHB@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAbxAnCN1lGGcGH@linaro.org>
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

On 25-05-23 09:55:00, Abel Vesa wrote:
> On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > differences and new implementations of setup_alpha_out(),
> > setup_border_color() and setup_blend_config().
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Changes in v4:
> > 1. Lowercase hex, use spaces for define indentation
> > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > 
> > Changes in v3:
> > 1. New patch, split from previous big DPU v12.0.
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> >  2 files changed, 94 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> >  }
> >  
> >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > +				      struct dpu_plane_state *pstate,
> > +				      const struct msm_format *format,
> > +				      const struct dpu_mdss_version *mdss_ver)
> >  {
> >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> >  	uint32_t blend_op;
> > -	uint32_t fg_alpha, bg_alpha;
> > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> >  
> >  	fg_alpha = pstate->base.alpha >> 8;
> 
> For the 10-bit alpha, you need to shift here by 5 instead of 8.

Typo. "6 instead of 8".

I blame the keyboard ...
