Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4529984ED1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 01:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFB310E909;
	Tue, 24 Sep 2024 23:19:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m13HKBcc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FA210E909
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 23:19:26 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2f761461150so73586861fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219965; x=1727824765; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SvU7Vx/LdaZKtGEV8daIjq0EBTdyjFTk7utGpIyOftg=;
 b=m13HKBccThpv6L70wdeBWEgLG6hOAMPbGj9GxNe49AjLGylctUvetxrQjxgSdeatqT
 90EFZNdKuYA1AP7Nxwr34YBRabN013qmszE0jDnhqhav1AfQqzKYsR56Qdeg6KhY7Zhu
 PIKe2nqmZdBr+MBLEVyst3O+ub/VOMJuz0iXuxqS1baOEgmXU3alGrrlTBBvOphYUC7U
 U+IFGw++KB0/BSM3+jEmtFhxcRkBi6XarhSVHPfcsB9SJJ5rIh0X9ugDJhQaOaK4eWNQ
 2gWKlYP+gonra/9e1uL3U2++WGKrHgK0WCXvFeRO91nuS1MzC+b3iIbSiVcFU+MFJ6Td
 oWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219965; x=1727824765;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SvU7Vx/LdaZKtGEV8daIjq0EBTdyjFTk7utGpIyOftg=;
 b=ZN9jB86GEhzZExuY1bfcQKiQMFVW46xaS32RWPNcd2MxHTTr7W4jayprHmnfKHrPOe
 U/g6PJIp+dWXDbYKfVhlkGT717b7fPrhzFCFY0ccgBYsLwlSPohjiVPcqigAftqCuwRv
 zY0AdKY2IKjl3FA2Zh9TsNzdmzrKCR/yFygz4IBQ6VVSVo64XJ//g/qFmNgVqd7HsToF
 Q0DuBraM+M77zQkcRiymU16ZqC9LLlWrcKGd05lhQ1jrS+skaHPaRwG7J3rSWXkfeRD7
 wDFRbWI8Iw+lHc79Ba7NnJdDrZux/NaJSKAxF4OVoxZ9mfSRTxOWlTtzTNuHPHOz/utw
 zHkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgMAM2wOpgWsrplAXez3yHkSaPKH0ZTFwp/iyHlzvFFNvN7FK3rFNYFZH+XWDhFLf5Zx7TcZb7RJE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB2xj6hpj7VNEpJIlMpAWPChnmGnSwULwiwXtE+U3JvpGSHblw
 psiR60M9WpeCKOMMwUU2Wnj3nXl/KkvFBzFSN5Zsuz1a+/NGNFfyr3KUUK0/15U=
X-Google-Smtp-Source: AGHT+IH0klG/CcfMRjXMdFbReF7bhlWRSCeWv4kqKqNH0sL3opOyR4yRKdhF285Ci/EQb6g7QrSjmQ==
X-Received: by 2002:a05:651c:1991:b0:2f7:562d:cb6c with SMTP id
 38308e7fff4ca-2f915fc0a2dmr8141701fa.2.1727219964875; 
 Tue, 24 Sep 2024 16:19:24 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d283b86fsm3519751fa.30.2024.09.24.16.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:19:24 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:19:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 10/22] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB
 block
Message-ID: <sm7uvwkkir4oj3n3wdaadcfoufh3cktn7gvax6grqma2amhxxc@w3ahhlj3x3jt>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-10-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-10-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:26PM GMT, Jessica Zhang wrote:
> The CWB mux has its own registers and set of operations. Add dpu_hw_cwb
> abstraction to allow driver to configure the CWB mux.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/Makefile                |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c  | 73 +++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h  | 70 +++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  5 +-
>  4 files changed, 148 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
