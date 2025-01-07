Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E1A03ED6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 13:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5183510E4C1;
	Tue,  7 Jan 2025 12:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HFfZYffJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0247110E4C1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 12:12:06 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-53ffaaeeb76so16390772e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 04:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736251864; x=1736856664; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1BZ9YGNo2SXE7kqR3kflhucDH3azbi8G4Q6AF5m/Ioc=;
 b=HFfZYffJJh3giD7WMBVlqpMZ/ug4mBktqScY3A0HztcbP2VhJYU9zlfp6d2Hgh3NhR
 tcZpS8TymSbaujtRKh2FGFL4ct+jTW58eAQKWUbrjarbRHJl1aiS5rXUcN6jkQHTcS0U
 wJJjnKsz2etgDPL/B9+0DqNl8BQ9rlvw0ESmvCO2dWmwqcj1JCh6oTZd+OyMpIdlVo2Y
 JRUl/3buXycNolZGp7W5plr45TAcaNsGv6rLWjOC/p/kuoo8Ot0HA4LS6AbDB8sD7c9b
 l0EmDiUaX8T54qIKX+/TTuWdF1H2gnI7M1SFMzFz9ksM1vytMdszm1qj/HD+yX0wAkSt
 ZNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736251864; x=1736856664;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1BZ9YGNo2SXE7kqR3kflhucDH3azbi8G4Q6AF5m/Ioc=;
 b=moRVpJI822EZh9ZdQP/SjXh6Cl2Hkj7BJUAvR1AYyhjTg/zZ1R8qksHvmBrbXzGSk9
 SZDQDcq3xRmGosG+CX13i9+v1vr4oKCbt8HYHdqMV/FNvfUiiBnxHGROHwhAmt+U7lAt
 WwpM4CShY0+rZEzlf/kesLx1CRh5rET50UEd/x7tXJR34ogQU4KUn5z9pZYmQqABeke4
 HiQgwZCbTc1r2FipCF1XtfzEOrFWMv/b9cVgKGVQ30t9dkE2mThe0u538YegZ+x63hSC
 +Sqct5NzjcZxUyuLjSuRzX3TZ8CgjtccT8GvsopK+VP9bd5rE1EM74+5u+U+Ntll/1pe
 iJtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvwYrt0hBs94ITkdkXuVTZUGC1bhRodGSYrcP/ojkONVUvRMuwQdI8EY5kC1RQ14tABnG+uBNoTwg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzZHmd7X5AW0QCjIrJE7WZ21N1o5DhKDy8x2+Apcfdj9VX0X4UQ
 I1A3N6pezwapwtc2Sn1tsukNYQC9pWmhzM3f8wP6cLdqZayFTbLG/xNbPNyB+AOVJiH57GXkOss
 EYIg=
X-Gm-Gg: ASbGncvzoyXBO1nGi7+PJoUmrA5/iP2FB2FqrnWfbdwEObM33d0iD8cy4T9vpoWFleZ
 z1yWgrTtSKfD+JvtsJ+RduzYTmCqzlTzsjGXklqw8Hz5V/UOmGCWQyobVD7Uyo+oiOhYPvHKufz
 hkrVMUR6Ya/VWY5rqzT3KJOmsquMsJwsT3VEZeNoM69OzvZMmknm8Yk058JfbHTtfXlZiZR65zE
 tbiMtQH39jT45UJO0NFNcytjmRhTulPTihjqEYgNF3yBgN7iWd7r1Yil5yrseLp/epjYPTCEq2W
 Dd/nXxp9SKTwTSrwSt0f3VMJ/ZrDfpSHZ3WK
X-Google-Smtp-Source: AGHT+IF/JNesMMW9YpGdlDaPx32nw8jUIyI7gzybSiownU+qrpr62y2ro0G/5CclxAQbTzS55DGgEA==
X-Received: by 2002:a05:6512:318c:b0:542:2943:db06 with SMTP id
 2adb3069b0e04-54229547836mr17722319e87.33.1736250487515; 
 Tue, 07 Jan 2025 03:48:07 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223832002sm5244113e87.264.2025.01.07.03.48.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 03:48:06 -0800 (PST)
Date: Tue, 7 Jan 2025 13:48:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
Message-ID: <t2pun2bz73aq426jokjlyeweknln74ygf5xj44tnmsoxowvnku@qtxqjruhfkju>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
 <92ba142e-0793-4a47-a8b4-115050114132@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92ba142e-0793-4a47-a8b4-115050114132@quicinc.com>
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

On Mon, Jan 06, 2025 at 07:17:40PM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/23/2024 8:25 PM, Dmitry Baryshkov wrote:
> > Enable CDM block on all the platforms where it is supposed to be
> > present. Notably, from the platforms being supported by the DPU driver
> > it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> > (DPU 6.9)
> > 
> 
> Thanks for enabling it, but can you also explain on which of these has
> validation already been done and on which ones you need Tested-by from the
> community?

Actually none :D It is purely based on your CDM support and existing
vendor DT trees. Maybe we should spend some time validating it.

> 
> Is it fair to assume that changes (3) and (4) were sent out separately and
> not squashed into (2) because they are pending validation?

No, it's because I don't have DT (and so I didn't have reference) for
SC8280XP or X Elite.

> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (4):
> >        drm/msm/dpu: rename CDM block definition
> >        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
> >        drm/msm/dpu: enable CDM_0 for SC8280XP platform
> >        drm/msm/dpu: enable CDM_0 for X Elite platform
> > 
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
> >   26 files changed, 26 insertions(+), 4 deletions(-)
> > ---
> > base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> > change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> > 
> > Best regards,

-- 
With best wishes
Dmitry
