Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C98966710
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 18:39:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E9FB10E771;
	Fri, 30 Aug 2024 16:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fyDCK1Kg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFE210E4F1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 16:39:02 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2f4f8742138so22539031fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 09:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725035940; x=1725640740; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=uwq4R/f36WQQ1Swarqd8PQ+Sx4wkeeX3AmNPKu0eUyY=;
 b=fyDCK1KgD3y44eBf1J1fRh+KKPAGd+EFtVWzg3R8XlW61RdeoDLUstdCJuJNKgpJY9
 juXlZ2o/hZUambrOux017rYCj/CKKnYwGKW1bYXYz9rbjtOLE7BALj7LkS+dhog7ru3Y
 5phwggraVq2J1LRKZH2SAwNDy2tp9/eQg6FwPvUEA+RCxqQKynOFUM6ck3NcB4qip7K2
 7iPuN8jfxwRZjyy+XM/u55jXGeE5ir+Lso+gt9yEjCrQ2C/cfpOMRurU4ZmRuXoIkzEC
 3dIWzHRo3CA13/PtRurvux/i6kuxXoNNjfmrGXvxBf8KwUpzhDkJtOR6t8rWTQ0LHRFI
 yZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725035940; x=1725640740;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwq4R/f36WQQ1Swarqd8PQ+Sx4wkeeX3AmNPKu0eUyY=;
 b=Um4yQncmqT1OE3J8Z3mUitjJDRjEhMQeHTVj/tJ0vb6L5yItRaSrIjbYGVCLpms4mK
 I1aSH184qkb0co8odQL7BjUPZu7I+mUu8OpMt0TLGLeFjjUBpSF9M8Vfgzo6IGIhwPYr
 nmyEvrZammZv6qg1iPA2aOnYgod3OXQ5+MPGsSuoidh+oNTKSMO+KN8PNWiIhLQhOMyV
 MYOtnAq6hSEeDOGNcJHDU/cbD53RKbyqOZ5eugh3i0WVq36Vz5AcTT1XpQws6015kwkd
 mpx6hufPnsMNR6OaWYkuRyPLmOUCpT5S0izwz7fDesMn2jaZR1+IOWeFAWrMg0T2im45
 vxrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX29RWqy96klH/iA6S/3hk8mmoclxk+8IU6VNULapqNH6v7k2+iloMUAp8Ruznq5BO5g3vpeKTKBRQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKN1/uEC0hEyWmGZ0p1fGfFVpCK91/LzWhA3+mQUL0vXmYDSWz
 JVELJF+WzDOZVCX9mL7UVeqNiW8mvrldSQijuupF8Q6DDijKu6IkftifLk4maec=
X-Google-Smtp-Source: AGHT+IGXlaawo+aNd8bvyU9hJTs0LcQHomL+gI7bfl9YYFu3/2gV7tZKCkjm/N27yB8W8cQUyGkfZg==
X-Received: by 2002:a2e:3213:0:b0:2f3:f6fa:cfd2 with SMTP id
 38308e7fff4ca-2f6106d6968mr40049701fa.25.1725035939563; 
 Fri, 30 Aug 2024 09:38:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f615194f19sm7176211fa.130.2024.08.30.09.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 09:38:58 -0700 (PDT)
Date: Fri, 30 Aug 2024 19:38:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 02/21] drm: print clone mode status in atomic state
Message-ID: <e3moledbfob2xkgxpbta3onlzc5yi6u7cbsmuo5ao4qq7nyyhj@lr32vqnjzkbi>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-2-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-2-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:23PM GMT, Jessica Zhang wrote:
> Add clone mode status to the DRM atomic print state
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/drm_atomic.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index 07b4b394e3bf..145d6a758d4d 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -455,6 +455,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
>  	drm_printf(p, "\tconnector_mask=%x\n", state->connector_mask);
>  	drm_printf(p, "\tencoder_mask=%x\n", state->encoder_mask);
>  	drm_printf(p, "\tmode: " DRM_MODE_FMT "\n", DRM_MODE_ARG(&state->mode));
> +	drm_printf(p, "\tin_clone_mode=%d\n", drm_crtc_in_clone_mode(crtc->state));

We have encoder_mask two lines above. What is the benefit of having the
separate in_clone_mode?

>  
>  	if (crtc->funcs->atomic_print_state)
>  		crtc->funcs->atomic_print_state(p, state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
