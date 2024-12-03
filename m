Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 252359E1E44
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:53:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8755310E470;
	Tue,  3 Dec 2024 13:53:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g+qBSwKt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A91210E469
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:53:19 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53dd0cb9ce3so4912093e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733233998; x=1733838798; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g8tb3PPgv++CfPZVKWrMsVoIqmBSMscd8BSedQU9tSk=;
 b=g+qBSwKtNPKRtKHctYBgX89argTFPpnYuiF7moZeJ5oVC9BLZiI9H6DXtfuA+MB4L5
 Zu05lgxmuSe1YICJcyrPM92WrGWTQt+GZcZo4Mmmo2W471So5W9kZPN9781ca+N3ErW4
 DWBt5haLgCPwD3Ht3Z7FPinI8Ui5zfo7eUbJ43qts40rKSfSqW4/0tZmf4OWud2fOZv6
 9iXrVwAF+ePK/2/bl4PiomExPPYNm9tj5WjSIcynlso7iOd6OIz4lg7oYW3JiGSMe3uk
 yxXExUyf8kS04ZuOw6EEFNueZB7aECq8votzrtIp0H/zBpYqMddJWl2xfSQyZuctLZZy
 c3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733233998; x=1733838798;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g8tb3PPgv++CfPZVKWrMsVoIqmBSMscd8BSedQU9tSk=;
 b=HmB6/4S/Np2W6ZDVsCrvm2u8X1fkWDLSgEXKuC+kldZumhTJGgPOKDBiKcsBEciant
 jiJh0dOIo5nXah8bYEBjLpd/PN+IVt1zVhpZ5rJ1+XENrjS1QCCu04BytEp0MOzqVdBn
 YdKPs/MHnd9HH4IYwHaM36TWP2qYGNKUf1k8/hh6E6baBJejivlzqheVIdsP2kh9Pg2s
 1t1XKKJD/nrSTsPfgQSbdMzWqISumoz/UqyW6yPsTp5hqfTp4Och31pUBagIYOiOLGwY
 BbxjG2LPaaQmfG+17zJxS7Y5t1DqYoZYxG+jHWZOu7WcO0s5AVUc7ocugQfR3T2YqzMb
 auIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBhp18rr2u0EOKHlMYD8boG+jID5jJXZzg1vPkhLQn+h9tIsFZY2N62084Q3iSyUx2QwcQ+cqiaJ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxsupUW6RojmauOkZR+vJBmeslYlxrvqi+f4nqOE8SxcuqgOqy
 tkwWgmTKVwY8y984+jOccRbX7rOE8kvefs2UEuXVljM04J8p0l/JgPpcf1yD4ds=
X-Gm-Gg: ASbGncscWIXr6DIql6MJ/bic9dZsdMp1kUSQDUKOgSjrabyj/5DFy9qXkZdawr7Doe5
 rEPE1/B7PStKVyBXBhDtY56JVAqfVV42Ixfu9kK5ecEesJtSbQ0XLax0URC5LhfybtHvCPqlZ1I
 27S0duQ1oFOOYv6IzIiJ30goh8GY6QeT4VYJ6JUcDWUj8/UEuiRWlJpMuVlj7wE3pj/VeQuTLo/
 pnkc/yW8N43XSKanmXGrT85z6Q3c4Bzxr2UxvqCwHLbmQp18PEorPM/1W5zRhlRF/vePvZtKSYf
 ceY7JIX6v8VFEn1pFbscP0iyHGMcEw==
X-Google-Smtp-Source: AGHT+IHmwhiWYRAUKFwNF3ZPoG27Uk1n5LAAWFLyHl2lAlSgMJV5sQBtJbBDUsi85Xo7F4t3kAwO1g==
X-Received: by 2002:a05:6512:10cd:b0:53d:eefc:260f with SMTP id
 2adb3069b0e04-53e1b881433mr165323e87.16.1733233997647; 
 Tue, 03 Dec 2024 05:53:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e1356906esm215368e87.15.2024.12.03.05.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:53:16 -0800 (PST)
Date: Tue, 3 Dec 2024 15:53:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>, 
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks
 in msm_dp_bridge_atomic_enable()
Message-ID: <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
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

On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
> The checks in msm_dp_display_prepare() for making sure that we are in
> ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
> 
> DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.

Can the state change between atomic_check() and atomic_commit()?

> 
> For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> there is an atomic_enable() without a prior atomic_disable() which once again
> should not really happen.
> 
> To simplify the code, get rid of these checks.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 992184cc17e4..614fff09e5f2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>  		return;
>  	}
>  
> -	state = msm_dp_display->hpd_state;
> -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> -		mutex_unlock(&msm_dp_display->event_mutex);
> -		return;
> -	}
> -
>  	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>  	if (rc) {
>  		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
