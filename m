Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AA6992168
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8666010E2EA;
	Sun,  6 Oct 2024 20:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XS+alPE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1170910E2EA
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:51:46 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-5398b2f43b9so4472064e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 13:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728247904; x=1728852704; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6fDEjUTjzLtS905mTVQnS2WQIUmuG01B4JauAoWq8Cw=;
 b=XS+alPE2Sf+daS9TxeyU/N5yFruLVSXJ1K+rtCWPifijt5JJiQE1mxnl7vSaE7OxdB
 c9jRoM/26tAHFxOz+yrLI6jPNAeokgv6mUz6TwBLHXJYOJX/bl+oPQ4QeBQ2y6HmnU8H
 RNRHVhNWg5LoNV4jFYO3MDPtOCoGye12/RxSde5XwWrdTwSQW0EopOeSM2+mcHgHO/2P
 TbyyB2MP5azmZU2JXW0kJnFzINNUkcvISk8ZPQjI90p5DStookAA1VP+Kxp/GOWYjmhx
 WMxBkUXPucjNXiMhjAYj59k2sGrDm6dDgUtC06gnBaTnLmd2abzU21U1Qq7NpCKE3MxF
 Ecqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728247904; x=1728852704;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6fDEjUTjzLtS905mTVQnS2WQIUmuG01B4JauAoWq8Cw=;
 b=MWcXi+kx8y8RkEgA2PPrIg+FPgE0Oecw1WH7K0KvUWFJd/iY6DFDNh6Gs6YPCn1SUJ
 +DNNjgf/0OO/YFkVLpTiDA5BbWN+BC1cVxQTT0YStXgNEsgD+/5p2kcnRiFumTNkpTm0
 3VQch8DO+anI5AkZNQOKG3VufXnjvp1fJc4OrVwQQsRelkPDvfhbrgtOvO0ZcEzbLP3e
 dkZqLeIT6BuaTKHT0nND/X5edVhSClBOkrT5IcTRi3LYYi3Z2tmx5FEkog2SxTBdT4j0
 SNxhNrI2Pa8BmEt/q89CSPaXYZQAEemDuhZB8tpf4rBShqbGH2MSn2q1hOQhG18nNO0Q
 OObA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVR5zbuCUian+RInt+mgGs6AZxJr8mUbD0F+FAEmabxlvKRUIu+I3HLiNFmCYUmAbfsvimjMnwHdpY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwUNYOIfw/uQvQNKyqzQiukQRDCXHqiYRhTd0aBLZ7MK2z80Ith
 BbVSsncI289zHXoe6+NmTLJdKA7vl12mNX7m2VReLbemQKcCrjKB2ShixM20Q28=
X-Google-Smtp-Source: AGHT+IHA1dhDE6pxQBeIXUSkV+5WjaiKuLQOgi9ZWdiP841coIo7OznF4+2/EqVdEHJp5/8gE8mjHw==
X-Received: by 2002:a05:6512:108e:b0:539:8dde:903e with SMTP id
 2adb3069b0e04-539a627badcmr4336222e87.22.1728247904116; 
 Sun, 06 Oct 2024 13:51:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d298sm611583e87.127.2024.10.06.13.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 13:51:43 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:51:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4] drm/msm/dpu: Add support for MSM8953
Message-ID: <awjaaluhzpuuqjeqvcdduxeeqotbuxeqbqd6obhcy74q2qljs6@c5fyet73al2d>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
 <20240930-dpu-msm8953-msm8996-v2-2-594c3e3190b4@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-2-594c3e3190b4@mainlining.org>
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

On Mon, Sep 30, 2024 at 08:35:57PM GMT, Barnabás Czémán wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for MSM8953, which has MDP5 v1.16. It looks like
> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> etc.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [Remove intr_start from CTLs config, reword the commit]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   | 218 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  12 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>  5 files changed, 233 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
