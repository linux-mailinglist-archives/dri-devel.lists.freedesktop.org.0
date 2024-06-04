Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A088FBEBD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 00:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1E710E0AB;
	Tue,  4 Jun 2024 22:18:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kgNpps3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DC210E0AB
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 22:18:03 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dfa4876a5bbso5620864276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 15:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717539482; x=1718144282; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dju8euEud3tGI0Dc64zoJcqRLm8j+Mv/qSb1l+QDEd8=;
 b=kgNpps3xQoplY4EfmjKTfMn16xDonCw3mR8WoEMNGetbAplPYnj75ZiZL2ehLw6YLK
 drQs2Gb8yU3bYj1qVTU1XF8E8l9mubdkHbYNbdhi7OUoobyjUKyAzf+rI1jaedH7DICy
 8IURyyAMH7IJdn/mZPESt0fJbXgVlVpvp6Fq4C/Q8IS9LlnVs6l1cGRs6IA0KadgEZvm
 pFBCQysncOpC7uFVPGb6P0q5I+Gp9jpqBp2Z5+Xko3hX0ZPCawbU9WgPsWBLaO4f03OG
 2pU/4iNEvpC5nW3ZN7mFRTLwJ7fl12RShB+wo3SIvpJjnbtBrA8zzxyjEzrNEVjmmVfl
 jFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717539482; x=1718144282;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dju8euEud3tGI0Dc64zoJcqRLm8j+Mv/qSb1l+QDEd8=;
 b=pF/0lvXQVG3uSRpIA2uBupAhn+jM3MrLRhXuhYeoNw2+W2PqIOI3GISC9R2GGTCPkY
 rRxmXXu8wHGdbi3UTrT7BbPOJx+38kP7c2DigEEEt9JPTtcNMy3iT1c7NtO/Z7aO2W8x
 eQJYASQj8DdmWXyb0qY0S+ITgq7BEppVWTUEEeLypyQMUEZjokM00LtuiuMTL7xU90ol
 M/lwOWS4HpdGxiSLt23X8+YpJuCOL195Ot+6AZMw7tR+m0uc/3L3NaS5Z2aUJinWpUm3
 +0B5CcMFkY1gWOnN42OLTGa3j1CqqZvko1JrrNpLTWy+PreJjD6IwZ/Ez9JvhuAkXkFj
 rzcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsX7pn5XyZf2QaelbzjqF0C8t9wgPLIUoDtvlCfFiI6GhqJTWaEkceVclmLqBDjQ0urQvLF/CUmeHj32GYD01ESWbWDWglL8wqlt2fmtfw
X-Gm-Message-State: AOJu0Ywsm1gbYooRToCMP5e8vSu4xE9ZhLqZ7vAJTPxz8t2vsN3u0Ki7
 5ZKqdtsVSb60uzpNr4FTOBLWHicRKgTcZfAs2rmF4Yur4qrJNMXrhToJqTCRVm/42FxCzoB9klI
 bvb+ZcO/Lea9UGjz6LxgHm4MbiLjWQYq2KzE9dw==
X-Google-Smtp-Source: AGHT+IGjOfS4i93Row/X3jqzU0dH+hExXMYcFf+ZqDyJ2rsltsLw1J6GpgelC+gB54Q/xtCmXF7iFbUk4LEnR14NsBE=
X-Received: by 2002:a25:828a:0:b0:df4:e791:867c with SMTP id
 3f1490d57ef6-dfacacf972fmr736847276.43.1717539482510; Tue, 04 Jun 2024
 15:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240604214018.238153-1-pbrobinson@gmail.com>
In-Reply-To: <20240604214018.238153-1-pbrobinson@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 5 Jun 2024 01:17:51 +0300
Message-ID: <CAA8EJpr2ZKugjwYzFUq3Rqjdm6DO-PiZEfiuBjxSnJDmRcMRdw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Add some missing MODULE_FIRMWARE entries
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 5 Jun 2024 at 00:40, Peter Robinson <pbrobinson@gmail.com> wrote:
>
> Add missing MODULE_FIRMWARE for firmware in linux-firmware,
> this is needed for automatically adding firmware to things
> like initrds when the drivers are built as modules. This is
> useful for devices like the X13s and the RBx devices on
> general distros.
>
> Fixes: 5e7665b5e484b ("drm/msm/adreno: Add Adreno A690 support")
> Fixes: 18397519cb622 ("drm/msm/adreno: Add A702 support")
> Fixes: 3e7042ba87da ("drm/msm/adreno: Add ZAP firmware name to A635")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index c3703a51287b4..fede5159e7f5b 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -609,8 +609,11 @@ MODULE_FIRMWARE("qcom/a650_gmu.bin");
>  MODULE_FIRMWARE("qcom/a650_sqe.fw");
>  MODULE_FIRMWARE("qcom/a660_gmu.bin");
>  MODULE_FIRMWARE("qcom/a660_sqe.fw");
> +MODULE_FIRMWARE("qcom/a660_zap.mbn");

-ENOSUCHFILE. It should qcom/particular-SoC/a660_zap.mbn

> +MODULE_FIRMWARE("qcom/a702_sqe.fw");
>  MODULE_FIRMWARE("qcom/leia_pfp_470.fw");
>  MODULE_FIRMWARE("qcom/leia_pm4_470.fw");
> +MODULE_FIRMWARE("qcom/sc8280xp/LENOVO/21BX/qcdxkmsuc8280.mbn");

I'm a bit sceptical here. Each device has its own zap MBN file (this
one is also a fancy named a690_zap.mbn).  Do we want to list all such
files? Consider all the vendors, which are open-source / Linux
friendly, like FairPhone, OnePlus, etc.

>  MODULE_FIRMWARE("qcom/yamato_pfp.fw");
>  MODULE_FIRMWARE("qcom/yamato_pm4.fw");
>
> --
> 2.45.1
>


-- 
With best wishes
Dmitry
