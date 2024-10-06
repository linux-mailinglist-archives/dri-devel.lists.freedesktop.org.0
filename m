Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88199216B
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2024 22:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D500D10E2E4;
	Sun,  6 Oct 2024 20:51:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yqpbXb8D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8576810E2E9
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2024 20:51:58 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-53994aadb66so3324411e87.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Oct 2024 13:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728247917; x=1728852717; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MJEy7PuQJx4a4Y0UOaM+z+FnS+FwHznvnpR5auCDjVc=;
 b=yqpbXb8D2Bi061D2UfFC7jG5oVfi8vcxHPl45BgxufdtAWQrnUAi//Hf4UxMXHOwUr
 MT+/P9A5r71usFRcEmtxPM65SJVaiae7I5j2EKA+GtxEnFYYpQZQJw6B90oCTJa+8qGy
 seFlo+Aoes8NjPPWj11239C7m0FF8/susn9ppOMogcW5z9ybyttsVrvaoMi4Xbi5tr+1
 U9zMsr+HZx+VuJlaj+MNW9JQ4CnkTqmgqXot2fiIxU+W118XDHqLsBUqM/zGvoPclw6Y
 AJQsGnHJ8X2iejr5ffn4rwfqUg1YA5i4IjyyIN7wC5MQBkiWy+iIbCz20ffKBO5lc3pN
 65IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728247917; x=1728852717;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJEy7PuQJx4a4Y0UOaM+z+FnS+FwHznvnpR5auCDjVc=;
 b=JqZDTxl+5epT1AvkHmycHzcE0MwBjJbFdcTDRE7D6MTXjzs96po7ZM8GkpIX1nahFq
 SPCo4diPZ8RVl0L4XwnJzALgtmcxYg5ooSe0dpl4l8VH4hQbwgfjFi4h50jZJZkT4Z43
 Fzse5Yd8xYEAuLp27wjBmmoQVNVw9O2ljOMhkAuXlQDkxqSjqaBszyHWOAWCqh3JxEL7
 e5LhvJFjyEwp+XnsY9sZDaGEEbW67aD2pj1RDK9MUMbnEzLfCeAouEhQ56ZAJmRKWb3x
 9Hvxzjfdnzu980XbdVSvX8b/maEQYJizPa6AngvnTR7DUSVbhQbyBGRxe1+7wsDPoG+4
 RHEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPapC9/WZJ+Yr6Hny/eFWmNhIvfd0BBrH6aw+5L3gSCVd2Xgb3zPTTbHaY0MVDc/9MPUR8iu7g4m0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVBSEeCtD/p3zBHhVma+Pw8HeR/IVLCSbceUEGCD36bJd6ylAP
 KSKxBQhu/laJ55TsbYct8S6eEjwQRiJMZ8/PbvcmLht27hjT6GAmn7gOKyAHELg=
X-Google-Smtp-Source: AGHT+IHnqEjLMz737rmSu/fnSVcQ0Z7KVW1dJ/VtpBWFpsUE17E1Urd/eqq5uHh+AtbSCWD0Opo76Q==
X-Received: by 2002:a05:6512:3088:b0:52f:368:5018 with SMTP id
 2adb3069b0e04-539ab8adce3mr4288082e87.43.1728247916602; 
 Sun, 06 Oct 2024 13:51:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff1d4e3sm616219e87.128.2024.10.06.13.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2024 13:51:55 -0700 (PDT)
Date: Sun, 6 Oct 2024 23:51:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 3/4] drm/msm/dpu: Add support for MSM8937
Message-ID: <25jitdhbhknv6a6axfo7vkrnbareyeuipree5aytqburdbsaph@nucjpet5kjcq>
References: <20240930-dpu-msm8953-msm8996-v2-0-594c3e3190b4@mainlining.org>
 <20240930-dpu-msm8953-msm8996-v2-3-594c3e3190b4@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-dpu-msm8953-msm8996-v2-3-594c3e3190b4@mainlining.org>
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

On Mon, Sep 30, 2024 at 08:35:58PM GMT, Barnabás Czémán wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add support for MSM8937, which has MDP5 v1.14. It looks like
> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
> etc.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> [Remove intr_start from CTLs config, reword the commit]
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   | 210 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  drivers/gpu/drm/msm/msm_drv.c                      |   1 +
>  5 files changed, 214 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
