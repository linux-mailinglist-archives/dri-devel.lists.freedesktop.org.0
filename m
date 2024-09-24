Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61B984EC6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB710E8FE;
	Tue, 24 Sep 2024 23:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="InJ8GJUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7035910E8FE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:17:06 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2f759688444so51350421fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219824; x=1727824624; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=amf3q/K5YstY5wPuuYpFOTakoTT4hxs6zudXgHWSQJk=;
 b=InJ8GJUnXDDU8vpXEsIkCK4qDHKQDNU6fNeB3/SU3/kWE0q2jVmgNvhmWhVzLqu9Ai
 icg0VAi18mnxhiTKXLj/9ka2nLeuM+HQPRce3g+GTGjNbYS8N93QwcA4QeraRVmsmKzf
 pnzKmJUPI2TV+H6rz9EhUEZKGKdcZpUWXMCo0hHeoCuo1JzIUW+DsM0Swn2VPzxMzfja
 hf4r8A3egMn0Hf76mxnb4fzZDuOYYy5AoSYCN3mWn2QBqHL0IdCmk4f1WfLGUb9qS67W
 AS7mJM4DJucLTwlMZxQLJacM5wUapZBPbqz8Yj2fOK7W0QQmO806p6XPTFndJkBAwIaD
 /t7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219824; x=1727824624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amf3q/K5YstY5wPuuYpFOTakoTT4hxs6zudXgHWSQJk=;
 b=SRxQAcujAHxGlUrA09BAdHTR78GIScho5TsDlp7RSfB65xI0b+sZtko/XNWi1PIHFd
 4amjHUbjcUVAI5Je4uyAhFSZMDDGkw64Bl+h/tCO5jmnRcaTgcYm48RWMzLJiMn/oOgC
 w7cs1YaV9Qmyh8yiULQhEPLbOg4OzV/R+OruC/DN6uejCHhMEY9fqIRuy2JzD5fg1mSL
 PcyN5iCmY/DwQTRCN3S0LcThyh4MLxUMjcgFvoyw9RTTH2pblUNrAAUIsdD9CY6r8R/L
 Gd/LQT4BlXlLk6iVADHskNuXY1l5KqeQe3ygkXarCuXrsBTTuvx1mHpdTnAvmcpF9ulz
 04Ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIuKYicJStTC/b8D6aOrbdZZY1D9DwaUDsrhgzXPsRG9/uWlUWtJ+ExzjuiYYCeA4xIr/Pr9PxL4g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3WNUJ/8c8R0Hgyr+eaGnbVNvAvYHcza5Nbco5cDXnSZoYw+TB
 vHwZuFruJa8dKUPreD76pLxKARvLYTNRQJfTQPEqzSvAoITcRiHyc6X/8lX/65Y=
X-Google-Smtp-Source: AGHT+IHrcqwe5Lj4ifpe/VvN6Ok72x0l12WG1jRQc+gjBjBJs2YI2Wo9HDUJ71yLZDgpMhF1y7Ff7Q==
X-Received: by 2002:a05:651c:50d:b0:2f6:6202:bfd5 with SMTP id
 38308e7fff4ca-2f91ca426e9mr4371961fa.34.1727219824482; 
 Tue, 24 Sep 2024 16:17:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d282ff00sm3383631fa.25.2024.09.24.16.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:17:03 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:17:00 +0300
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
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 07/22] drm/msm/dpu: Add CWB entry to catalog for SM8650
Message-ID: <w2af6gh45xiw3p3iruqemftdysmyv47cxftogalvs33nrad5xt@e5jrv7bk4adl>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-7-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-7-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:23PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Add a new block for concurrent writeback mux to the SM8650 HW catalog
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
