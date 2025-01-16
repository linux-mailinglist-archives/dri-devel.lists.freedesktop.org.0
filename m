Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 117EEA1345E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 08:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1227F10E8CF;
	Thu, 16 Jan 2025 07:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eoghUWyp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1008C10E8C6
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:54:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54025432becso775594e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737014088; x=1737618888; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+Jjg1mbduj57rKOjNRlVksmRWcTyDNvupEP5TEf++8E=;
 b=eoghUWyp0qCmmzRUFO5K6pDeRXm/ZJmkWO1P5HlGD+4T7u0DwDFdXhBCadpI/MwGu9
 9ZBIgeysADVSx1pZ6rYNhmo8ljJKVgEEXJ51G+EW1toLFPFXtdX84Z0a/aVDNwqgOOB2
 UFW5MqpN0lbowb0CD5b18R68YYYQg2+V51lD4Afyocq564xASHQuPpCDMUNjYelCz+Ei
 m0tiuIgd4ATCOWi2heo4YGNXP9IAHmofa2y3WYFeTpQrvT2cZG/nk+1sltp6oY0iNk3+
 g2Zw/00Y7lUG2E38F7H4MWvsmCbENEqWHyY/DbbEEjbyjWnv5oBXBt2hWTyuOpbak9hm
 I3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737014088; x=1737618888;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Jjg1mbduj57rKOjNRlVksmRWcTyDNvupEP5TEf++8E=;
 b=jf3yOGxrgi3wf0D7EZpGo9fhqq3KAoD5ydcU7tSnsIUPcpH9QOJJy7mtYP/UtkEINY
 1P99LWhHpmocYX+ppxZNTJ1Zb1NgmP/UJlaZJ65+LbexUYtmhcouahTnl5lI+spxwGU2
 fFVd/UcuGbn35iOm5WTB/jYx+yKOMn1Zta+Tj55Y+1MfaQUZWf2jajlLoJILoFIenc0u
 6Ed9OmUzFe8Q8gza0s/IE130cgcENFwC107Fya/6O2czMdNbp7PWmp3rguab+cK2KedN
 6tRjeWQoFOQc9e7YNpxCR0h141Inw08+b8w5S1e5pYLi0HnbVqbzEtra9qL8yY5wCk6K
 Zh8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWZaNTMIO7Twn1+FCMcFiVeNSYQS5TphjAedW2YIQ9V9tLapigiVKmFht1e3duZ6sdxG+fKWgJDEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywa8HffNJzIRSJql/2RO0LaaA5ugJUSYMPVO644PpIyt8XCZMwe
 8pprrkf2yMr+RsaftGYHdHVXcgVLeKbixR5qu9EyMnyWklsPLBokiFQEbzwK0wU=
X-Gm-Gg: ASbGncuA8YpBD/Fd4mbYxuFHsAdZvzbsbAiUtOKTWSwkcsOEZJRjNyPPjnb+lanDPcF
 /TZ3WkIc0Krti4y0HYvHe3fCI+7R2RZ/UGdxBa6DW7jWqH3qDEorHijbctj83Oq1Fr/mRvtYUag
 4G27/VAC5A1OYKT9HqTcqYZbg+TZqtejygM/SeH5ho1OtCFcAL4bnjbNEBn1w0e1j98ykBh8fOl
 ATP1HVd6d+trupSkm35Z2721yn5SoLvR+6ZzGyNSclveoJCo8gVqRqQ/HvsqHCwCq7tpQJpFKEc
 inC7hnCZVJ4uBEJ1LTL0gX/6GD0reN43HwJP
X-Google-Smtp-Source: AGHT+IGWSf/yOZvfXpZLF9q6SysUzRLStDO6lKJGlRWpgWwJ6ksytVOsuvgX8Usotsu+jYmZJps9Bg==
X-Received: by 2002:a05:6512:3c82:b0:542:622f:124 with SMTP id
 2adb3069b0e04-5428444d202mr11223288e87.0.1737014088248; 
 Wed, 15 Jan 2025 23:54:48 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49f0bsm2221108e87.36.2025.01.15.23.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:54:47 -0800 (PST)
Date: Thu, 16 Jan 2025 09:54:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/16] drm/msm/dpu: fix mixer number counter on
 allocation
Message-ID: <lyl74bqxrc46ygtkhawdmmjrfrl3jnxmmkoyjtlhjmghmztqvt@c3zlpfxcz4st>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
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

On Thu, Jan 16, 2025 at 03:25:55PM +0800, Jun Nie wrote:
> Add the case to reserve multiple pairs mixers for high resolution.
> Current code only supports one pair of mixer usage case. To support
> quad-pipe usage case, two pairs of mixers are needed.
> 
> Reset the current lm_count to an even number instead of completely
> clearing it. This prevents all pairs from being cleared in cases
> where multiple LM pairs are needed.

- The pairs are not being cleared here.
- Problem description before solution.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 24e085437039e..3b3660d0b166d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
>  		if (!rm->mixer_blks[i])
>  			continue;
>  
> -		lm_count = 0;
> +		/*
> +		 * Reset lm_count to an even index. This will drop the previous
> +		 * primary mixer if failed to find its peer.
> +		 */
> +		lm_count &= ~1;
>  		lm_idx[lm_count] = i;
>  
>  		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
