Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FC99E1F32
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 15:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF77810EA32;
	Tue,  3 Dec 2024 14:31:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EiAQHFQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25BF10EA30
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 14:31:17 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53de771c5ebso6590436e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 06:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733236276; x=1733841076; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0ppjUCx+akaTFnajbfVQ++O9bxKq4WYvR9tllyJseno=;
 b=EiAQHFQwAGsZ/i93JhySXtVOiplkICOguJ7cJAitKKKic1JHNfGIqUfLJZevRgVr01
 hKRJYkzdgirOK5HSdrvlq3hMs+GauQzlfnTJ/3zpak+ECNkMukunX/9u93O6XsUspb0t
 kQLXtG24dJyxU7+AHLW/WhJzWpw74HVvxFxhxobevmsDktRk5cMQAkry+4Lyaiu5Ojtx
 IvBIukQvso9jHvmMN1kvXMlDfVGDvpCa6IF4udLjEw9W35t8/mFmLW6+aJlHrnXF7ou1
 IpTqGgW1nM75sIDjg2rxU2iipuNvc/F59AcY5OIuYM2CJ2yHvY1EW/zROHpp3ff2sWPW
 TVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733236276; x=1733841076;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ppjUCx+akaTFnajbfVQ++O9bxKq4WYvR9tllyJseno=;
 b=QIK/ezE4ya/rUXwYWnPdw2h2beYZ6IbrzBdzZU6YfBP6K0YVKu97JxyYcov4ZujUf7
 jzI0ivPbbKPoRIGguPBycFET0h3DP4ViplpFlvbMoXa19kYmJ2XTu1vmwKAG7NJUQR/A
 R8JImyMMBEKG8vn3F9O4BAd1cLBY4FTlx0yaDJonCldDz1n38SJz0yf0ItrCs1c6K5Da
 6xuotWjVkPx2Cf1VZo52kTRjfFwLC7sfiLmijCGVTeRCKVYIK7bZNnuqWX3rMswrqpRd
 boug1xOkDiA5taYWk7YCMjkgi96oRFufoDDC3Hze/4hUFSuH1GQGms4oeQ1YEL8904tz
 ADbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2zXBhciUivWvNPAbqowYHBuC7BiQW6EwtqMxX8zbsTb7tIHC3oBN/D55ye/EUxdm+F0jUzt/kolA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAB62yI3Npw6DcGzdC6ZO/ZxU6vi+qXyHHwEINGMc+IRNwUdGg
 avHLw/Fz1agUmYDgEwrtXW2qiogl/45q8FZzV42W3j9HUOudSTLdO8krjtqqtXw=
X-Gm-Gg: ASbGnct4UdxCN2eW4dI28EohfYzA5YINkiyUa2/Usesl0G1NP7xWL5afLtVSdJNyb+m
 Y+Wsby/FuYBheSyBCCr0E3r+bbzQgoHQlW8KctBnhwctu23Z6VwN+v7qF5hVe+tOiR+DAbx2BmZ
 4IJbDZ84Qimw6a0n2EDgajYK+depx/0OPkIa+8jgMy8mSS8DqfXiT+JQ5FoOVAy7gQnraa99Fbm
 xFSXCwIy2YxbPEh03EMRxspkISUsy5UL8x4NMXl33oai9GJ4t50+UBmLAxrSHbRhCEGCCoqhEwp
 16jAufAqEkF7EmaEbX8u1lCiRvZ4uw==
X-Google-Smtp-Source: AGHT+IH+C+nsRz5D3FTagtbct/svuhNvAQpqymCZAx0WUlFs66GBL4uvVcP+kOsYG099fP8ZE7IRGQ==
X-Received: by 2002:a05:6512:3a93:b0:53d:e5fd:a44a with SMTP id
 2adb3069b0e04-53e12a281f8mr1564355e87.54.1733236275798; 
 Tue, 03 Dec 2024 06:31:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df64968cbsm1829701e87.212.2024.12.03.06.31.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 06:31:14 -0800 (PST)
Date: Tue, 3 Dec 2024 16:31:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 0/3] drm/msm/dp: Fix and utilize TPG with a debugfs
Message-ID: <lpkhftx62hbnrftzoy6zprhvir7dffz5ynwo3kr5j5obc3dcle@73ljnmpdt7ts>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
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

On Mon, Dec 02, 2024 at 12:41:57PM -0800, Abhinav Kumar wrote:
> DP Test Patten Generator is a very useful tool to debug issues such
> as blank screen or corruption seen on the DP monitor by isolating it
> to whether the corruption is coming from further upstream such as DPU
> OR from the DP controller and below. It was noted in [1] that this API
> is unused. Rather than dropping the API, it should be fixed and used.
> 
> Hence, this series fixes the DP Test Patten Generator API and also utilizes
> it by adding a debugfs for it.
> 
> [1] : https://patchwork.freedesktop.org/patch/623508/?series=141074&rev=1

I'd prefer for this to be rebased on top of [2]. The series has been
posted a month ago.

[2] https://patchwork.freedesktop.org/series/141074/

> 
> To: Rob Clark <robdclark@gmail.com>
> To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> To: Sean Paul <sean@poorly.run>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Stephen Boyd <swboyd@chromium.org>
> To: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> Abhinav Kumar (3):
>       drm/msm/dp: account for widebus in msm_dp_catalog_panel_tpg_enable()
>       drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for tpg
>       drm/msm/dp: add a debugfs node for using tpg
> 
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 15 +++++++--
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 61 +++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  2 ++
>  3 files changed, 76 insertions(+), 2 deletions(-)
> ---
> base-commit: 798bb342e0416d846cf67f4725a3428f39bfb96b
> change-id: 20241202-tpg-3f7543c036ac
> 
> Best regards,
> -- 
> Abhinav Kumar <quic_abhinavk@quicinc.com>
> 

-- 
With best wishes
Dmitry
