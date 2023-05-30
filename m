Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7866B71714F
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 01:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D58710E43E;
	Tue, 30 May 2023 23:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3248810E43E
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 23:07:42 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2af28a07be9so53259341fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 16:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685488060; x=1688080060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aZBYZqm2QX9cYcGeEqnnE5rqTJSxRk4/JBiXuTiUxM0=;
 b=ulU+69wC13TRns9H2O4cl+nn9Tz8PwxPmBGH5PNA5IJHmcDcqr4OY3NcBQ5ialQbdJ
 bL9wumq+ipUUiEBgXf+dQO64M5/jlSPXdd9TOXfLDyi34sLTtdCae1lPq+Lov8MZTt11
 GPFB53UzyMHTv0GbSXrrQkVs2s7tRGqyyw5UiBm19a2fjdjsnwN/JZJn5WIM6tDvB0zy
 BSIGjGnT0AHRIdP/VKdLLE/EH5z8y36+GJWsh5R/nl/nbS5r36LdNEj0OrWN1WTVnEL3
 UzNufZw6i23RzNQIsWiLs+A1gUGcYNTSMFwQjelbwHM+OnEp/FOgYgpEzYp5JBD0blNU
 zUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685488060; x=1688080060;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aZBYZqm2QX9cYcGeEqnnE5rqTJSxRk4/JBiXuTiUxM0=;
 b=evPOyhTDXtsvp0bs6ywpDIPg2AgBTQAhv5Pk4Kdq44NMIoJArJLPmbPL06xZ5ljUus
 +sjw6iVDNj/pz3agW2+uNiMRqww7YeZBNcQYm2bAxcRrekLXKXo2lTbm1Ij6hLw0pwEx
 6YVUDXYo17vBMbTB694joY8MXc6sWmIjkFNtyl88cngK2B/JRgN6Y5zCfO8bH6kzo7ax
 IjHC5z/arLMYHDa+xbtB6zZcJLu79H1hbJjQVDSlGZvcUeVfGHi+XVxsqDFYEyor540p
 kPcopJbeyaaUmOcuirqenIOC5Mt5lRg0ZTqQi4wILyzeU2hpPUNKI8WyfKv+ekO7LbKD
 fPkA==
X-Gm-Message-State: AC+VfDxEKX2oKhv8xx/rbq+Tn/ygqyKkCQo9DDkPbrcVEwSLSL7oyXto
 NAVvFfDdD64F4WxWcKT4TOSHiQ==
X-Google-Smtp-Source: ACHHUZ5Ej9llgNKtAHQ57gkDu3OnNpoWD2Lx9icO+8TRpW35FdeXVdc2sZL1MNWqROBGbmmQgDUuwQ==
X-Received: by 2002:a05:651c:10b:b0:2af:d2ef:49d4 with SMTP id
 a11-20020a05651c010b00b002afd2ef49d4mr1515001ljb.1.1685488060177; 
 Tue, 30 May 2023 16:07:40 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u3-20020a2e9b03000000b002aeee2a093csm3044298lji.59.2023.05.30.16.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 16:07:39 -0700 (PDT)
Message-ID: <64fbc753-d8aa-6845-c530-f76999e8c7b9@linaro.org>
Date: Wed, 31 May 2023 02:07:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 3/3] drm/msm/dpu: remove msm_dsi_get_dsc_config()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1685464318-25031-1-git-send-email-quic_khsieh@quicinc.com>
 <1685464318-25031-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1685464318-25031-4-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/05/2023 19:31, Kuogee Hsieh wrote:
> Since msm_dsi_bridge_get_dsc_config() was added to retrieve DSI DSC
> info through DRM bridge, msm_dsi_get_dsc_config() become redundant
> and should be removed.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 2 --
>   drivers/gpu/drm/msm/dsi/dsi.c               | 5 -----
>   drivers/gpu/drm/msm/msm_drv.h               | 6 ------
>   5 files changed, 17 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

