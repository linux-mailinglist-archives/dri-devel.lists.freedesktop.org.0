Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F8B8AE63F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 14:36:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B178F113146;
	Tue, 23 Apr 2024 12:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zwnH1Lqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CE5113146
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 12:36:33 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51bae805c56so592830e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 05:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713875792; x=1714480592; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=EcR6wiJNuQG5uBPTgnJ94TkYBXMQrI+Q5aD+z7eMSQc=;
 b=zwnH1Lqxgy9Xe2Cfo6gsPmFQ5eL6vtUTgxdVksIcU5kv1tsk1cHmerM/njSi2VOcFl
 dbxNWjLQu9HeyV41OP48mugVciQ3JEbuu+T5NL3xrFwDvnsYcZ/oeX2S5tEpJUezIidr
 i7Hd1IjJ5TOeSttNnyy399+8FtHlwqshU8jHd3SHxhZJKIueum0dJNDQ0q8mIoOozDkv
 85XQdMGGRAvQydQMrzoMSes8VHXfPqFKtBMviRG/9+s0eAkeaG6vkq7A8ZwZMrQqU8Jl
 27tXGijH6DuCInuvH1OEHBu486DiL7zXQy4CHFF9pvzbqTVfw/oxWmgkgOFNyG3Src82
 HW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713875792; x=1714480592;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EcR6wiJNuQG5uBPTgnJ94TkYBXMQrI+Q5aD+z7eMSQc=;
 b=PRjfLkqzO94KePm/OSDJmnhGPebc/Fzd3yNqH4pps/2D1GreeEnwapVKnVmbTGMpb9
 qlMbczYykcXwtNa9R2i5AWaesAIpNfQFdQIJu5gSHmEp8yjCxgY+RJElyxJGHx8oAtFW
 iYZNI72+dgPcIyi3aEt3NfGNZelcQ8Z3IG+gluQBZWZrvUeudXioNWOW0q6fxuFqYvXl
 EAyLSL/xAkSM5wPo1xVoS8A8BZ7/PNP+PtxYaDZQFvpUamwI9wEsDgAJ3FFDWK1+wSUT
 PdIA3/VNYeRukyabNJ1UdvHoI7XrR15OSxQqT75xUr3ps2LhNhjkr1TlHkpcczKOJcwM
 8n8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRvrnqR75G4ES/ny8bnlj1QuKEQuQACgiGYzESpuC27wYOFX9fTuTX4y2W4lF4liDClk9Xdzyj8YQXw2Je4PXqdD1ViTr5B5gw24lbj8I3
X-Gm-Message-State: AOJu0YyfgvK0d2FThKXA1glrECDHlLLpiLoaBgy7r+3z+m7gZYBUwMCV
 Iv0b6RkFrbnsGQqZC13KA3m6uroPX1TaV60wruIhkMgIpQq56srC26sKiVNWPig=
X-Google-Smtp-Source: AGHT+IEJpRdPl93hf4hfOkqeiRE3xT9UUu8AhP8A1Hd+r8Zl367qDbSba7OkW4KPmf+cOR9c5qPLng==
X-Received: by 2002:ac2:5594:0:b0:519:27e5:83b7 with SMTP id
 v20-20020ac25594000000b0051927e583b7mr8063957lfg.27.1713875791850; 
 Tue, 23 Apr 2024 05:36:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a196b19000000b0051af5cba0f3sm959407lfa.11.2024.04.23.05.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Apr 2024 05:36:31 -0700 (PDT)
Date: Tue, 23 Apr 2024 15:36:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi: Remove dsi_phy_write_[un]delay()
Message-ID: <r2mx33pvuivenwxawsihrblzmuqucxcog3m7i4dy5o4y2qycsh@76frmib5x7x2>
References: <20240423-topic-msm_cleanup-v1-0-b30f39f43b90@linaro.org>
 <20240423-topic-msm_cleanup-v1-2-b30f39f43b90@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240423-topic-msm_cleanup-v1-2-b30f39f43b90@linaro.org>
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

On Tue, Apr 23, 2024 at 12:37:00AM +0200, Konrad Dybcio wrote:
> These are dummy wrappers that do literally nothing interesting.
> Remove them.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  3 --
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c |  3 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c | 81 +++++++++++++++++++-----------
>  3 files changed, 54 insertions(+), 33 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
