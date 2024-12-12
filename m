Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39BB49EE20A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 09:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C5E10ED0D;
	Thu, 12 Dec 2024 08:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vP8M9vpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E53410ED0D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 08:58:17 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53e3a5fa6aaso1576077e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 00:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733993895; x=1734598695; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0zULvzH3pBwj/buB357mGt94OsxfZJXtnXCYQYT/Q3I=;
 b=vP8M9vpyhLk2qoUUPM/Ivoi/tstiJz2MY1/pU6GbAk7ymDimk3yGAl/1iXr7sm25xC
 5miiJYhxWRA0cRk4pIWkqWq5RkK1YH0GVICo0uYo9axbgULm94LYvecoF7NF2SDLZKhr
 zEInsraz1dA9zEedKlkOCyOm4XRWnC2TPyFNQFapxiUYI/elfjTIjCgH6eeCk+k2N0yh
 HmogJUX4swKnW2Oe02iAXVr/2gyqNVEaSQHX2UjFuyCWKVl5lZ9TPve12KIBXW4iLjKk
 HNoAwefPKm+llxCr9FMpTBTbP/V7xBq/R9WNoqbxybCDuyYJx6tkNMiNODKBlu0AnWLM
 xPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733993895; x=1734598695;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0zULvzH3pBwj/buB357mGt94OsxfZJXtnXCYQYT/Q3I=;
 b=CUrmUm8XYomAGs6N91Rgu7LFaiVBUg/dT1/HpCFmdrHHGWrsC7lopHDrO/xW4NqQNx
 /+a/5d2gC03noUCPePdxVXdIgYyNPtWSylW4i673VSvws/nBPqHKcISaT4aLwWkTXDc3
 Z6ZL88NIMB2QW6lgXPpxWd/lKQx0i5acEc8d7JkqmUVhyguUgCsgivKlb3U5p/TjwI9y
 GyTfSCdIZ8OOIpp+0mybI75zYFNdhW0JvgTTDTxq69EdWwviCw2vGEmeR0bkB1SQuCQ4
 Ayax1AuMxVdvAkWSXULD0L1Fus7DDslAnZ1g+Q2vNG+g46fvxYollcsvIr8YbfwXqED4
 XPOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHP7HsEzj46jHMC07LfLrnXJaUldnRAqfaJYFtNbdv0dnBjt6sNG/EzRB8K2AAMN6YJPYH2MAvFsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/AnSp/1SLM1rVimxXLU4NUk7o+lix/V5w6jvD1IGutNUf7ylF
 o1uhaSfZTkmsmVa31GmyJyBqhf7tdiJri20Zyjg71auoqSFWtNjXruNBEBN7UMo=
X-Gm-Gg: ASbGncuTaQWPJTvrO3LLRpIRUPnpwIdzDZF1njvoZ7h4w92jrsAISD7+v+u5tysOOcI
 btKy/4KM4O8kDaDQBGT8W6Z/sd1gDvSyjfItqD6cBvpybujw48j5uKd44+5/kZAFVtGkpTNjrhH
 QWk6A4Fsc0LoLSmZxlhxr83W4qjpGsVPqR8baNWlxtZBBa2YtpbYKBkebqCUA5Nhkno5zVf3gfH
 s3Ha9sDelQImelrM5cWXAAWTV21wZlubwLEDUBWtpzts1cRygoveZAqRStyKq0EOA51JmawnYaI
 hJJjz+HWOPXPIe3Ye+TdDR3ytbDO1L2kNBfg
X-Google-Smtp-Source: AGHT+IFu73D5FA5z5HI+3RvFUYF8dHx/2OrBQKBCGrrR98zpwQOoDZGpuD2JAU6jhKxYEcNRR36Ziw==
X-Received: by 2002:a05:6512:ba0:b0:540:2fe6:6a3c with SMTP id
 2adb3069b0e04-54032bfde4fmr243145e87.0.1733993895382; 
 Thu, 12 Dec 2024 00:58:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e36ec76fesm1884440e87.246.2024.12.12.00.58.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2024 00:58:14 -0800 (PST)
Date: Thu, 12 Dec 2024 10:58:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 01/14] drm/msm/dp: set safe_to_exit_level before
 printing it
Message-ID: <iugoc25pnh5zzzr5mamutycqohj2z2255omgh3ztyoqgyjkg23@c7axf3mg5wy5>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-1-0b1c65e7dba3@linaro.org>
 <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01f84965-8a11-4d6d-99a6-b0e37240d4cb@quicinc.com>
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

On Wed, Dec 11, 2024 at 05:14:18PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > Rather than printing random garbage from stack and pretending that it is
> > the default safe_to_exit_level, set the variable beforehand.
> > 
> > Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202411081748.0PPL9MIj-lkp@intel.com/
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 74e01a5dd4195d5e0e04250663886f1116f25711..5cbb11986460d1e4ed1890bdf66d0913e013083c 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -329,10 +329,10 @@ static void msm_dp_audio_safe_to_exit_level(struct msm_dp_audio_private *audio)
> >   		safe_to_exit_level = 5;
> >   		break;
> >   	default:
> > +		safe_to_exit_level = 14;
> >   		drm_dbg_dp(audio->drm_dev,
> >   				"setting the default safe_to_exit_level = %u\n",
> >   				safe_to_exit_level);
> > -		safe_to_exit_level = 14;
> >   		break;
> >   	}
> > 
> 
> This was already picked up in -fixes, so no need to include

I have been rebasing on linux-next. Please make sure that your -fixes
branch is a part of linux-next.

-- 
With best wishes
Dmitry
