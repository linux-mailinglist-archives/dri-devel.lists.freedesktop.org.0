Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344D8AB857
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 03:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1388310E128;
	Sat, 20 Apr 2024 01:35:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d+efUy+8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D4E10E128
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 01:35:03 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2d88a869ce6so35736741fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 18:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713576901; x=1714181701; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wgAQ/k6ftf3kEmS4VwOGK2aR3cS1PKvV6nYGLQ/jFMA=;
 b=d+efUy+8o6SfTpekN2BNLH6G5Q7RWI1ZAfWo7Feg3vXVO0tYL+xbADNBofY9C9PLie
 YO+AfkFcEz805B9PBATxgZCJOxWDyBgpC9m5G2y9GLWv0p5F55o0BN80RRRKUBVSuT7E
 +YLLry75syP+HDOZKJgEH4nauaALiosdmv2+CPpmWmf8B+IAawt4ybDYGVlC05FTyRLi
 i+2c8H01sKjVZJbhsJUOzVWl/4ejCJbvcB99yk34Odf7nbiBzMJNViXOA63a11l/PNTT
 isXf7/lYQ6E1zpWHSHZOnrygFrKH/4usLZxcW4K2/K92+CyvtBhvqnDbsciuj9F+KKcg
 gyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713576901; x=1714181701;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wgAQ/k6ftf3kEmS4VwOGK2aR3cS1PKvV6nYGLQ/jFMA=;
 b=X2UCmp0Y1AT66P7zKOyTaFe/gXM9d9qhnreAQvUJLHWo4ZYKg9WCHpRjQLx6CTRSD/
 O2teB/mjWxcRbmeqopqd9SLa86/yUuw/LF1RXt1LUrLKbwjDO6kKhBPkftNWUQIGxsHV
 U8E9e+N/YopJBAoZgWVEBmA2n8xgDnxujT3GuRIViDaj1nD6F68iqeMFXu1mi/us2OCG
 E7Z6qIEVpDjnqOy0c41WMh8jZs/v4TU9YIWgnfkLhOBujmfpNkELOmDbwgh+U5LiYeN1
 AH9z0LcH+oJNJYvu7N/eVrgrxYoIG7s4Z4g7ZFpBv0wRBZxvcN8Xhp0WNZFGRC0Us0pY
 GtDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8IHO9JbWtD2Cdx9zsP8iaiUbMqZqVwr4lEZkDcQmFYBPnGSPwlcfmAhoDQ1VmqzmBNHOtrAoEoVVcrV6LxcA5KQC24rnawxnTUNUHREkv
X-Gm-Message-State: AOJu0YwlgHqefUNE3sggsfn95r+C2VqzMr22Dk4cu8vzyqliOljOF/W5
 fTEkIxz0Mfpy8+XwANU3e0UUUPFv64r8CAbbljFoObSJROSkLutKPlsJG9hGxz8=
X-Google-Smtp-Source: AGHT+IEG6UkWO9sIFqMDD0T/BshwP0AYdtwN/X6v+kaloTqHDQPNP766LYg8ZRKTcjRMLZeQMwntlA==
X-Received: by 2002:a2e:8386:0:b0:2da:a3ff:524e with SMTP id
 x6-20020a2e8386000000b002daa3ff524emr2687356ljg.9.1713576901417; 
 Fri, 19 Apr 2024 18:35:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a2e9c43000000b002dcb831d958sm615016ljj.56.2024.04.19.18.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 18:35:01 -0700 (PDT)
Date: Sat, 20 Apr 2024 04:34:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 4/9] drm/msm/dpu: move dpu_format_populate_plane_sizes to
 atomic_check
Message-ID: <rqddqmqznhq4liusiyvowt4lfybb25qfdxak6ql6hdrreduutt@6uwkrlsxa4gw>
References: <20240319-dpu-mode-config-width-v1-0-d0fe6bf81bf1@linaro.org>
 <20240319-dpu-mode-config-width-v1-4-d0fe6bf81bf1@linaro.org>
 <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a122a43a-8def-0c11-41ef-b01fab33f98e@quicinc.com>
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

On Fri, Apr 19, 2024 at 05:14:01PM -0700, Abhinav Kumar wrote:
> 
> 
> On 3/19/2024 6:22 AM, Dmitry Baryshkov wrote:
> > Move a call to dpu_format_populate_plane_sizes() to the atomic_check
> > step, so that any issues with the FB layout can be reported as early as
> > possible.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index d9631fe90228..a9de1fbd0df3 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -673,12 +673,6 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
> >   		}
> >   	}
> > -	ret = dpu_format_populate_plane_sizes(new_state->fb, &pstate->layout);
> > -	if (ret) {
> > -		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > -		return ret;
> > -	}
> > -
> >   	/* validate framebuffer layout before commit */
> >   	ret = dpu_format_populate_addrs(pstate->aspace,
> >   					new_state->fb,
> > @@ -864,6 +858,12 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >   		return -E2BIG;
> >   	}
> > +	ret = dpu_format_populate_plane_sizes(new_plane_state->fb, &pstate->layout);
> > +	if (ret) {
> > +		DPU_ERROR_PLANE(pdpu, "failed to get format plane sizes, %d\n", ret);
> > +		return ret;
> > +	}
> > +
> 
> I think we need another function to do the check. It seems incorrect to
> populate the layout to the plane state knowing it can potentially fail.

why? The state is interim object, which is subject to checks. In other
parts of the atomic_check we also fill parts of the state, perform
checks and then destroy it if the check fails.

Maybe I'm missing your point here. Could you please explain what is the
problem from your point of view?

> 
> Can we move the validation part of dpu_format_populate_plane_sizes() out to
> another helper dpu_format_validate_plane_sizes() and use that?
> 
> And then make the remaining dpu_format_populate_plane_sizes() just a void
> API to fill the layout?

-- 
With best wishes
Dmitry
