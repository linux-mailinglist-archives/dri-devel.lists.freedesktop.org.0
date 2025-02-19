Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3206AA3C5BA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 18:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724C810E359;
	Wed, 19 Feb 2025 17:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bBkGFznA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5767C10E359
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 17:10:36 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-545fed4642aso81276e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 09:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739985034; x=1740589834; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F35gCuOu8YlsVwzY+YGVE1BEl6QJE8ppkj0geSACBWg=;
 b=bBkGFznAS0BWE/OUGxldbG71DlmWvUgBSZHC06digVFf+bNu2yV8zTpnUFJEvsw5E3
 eUAd9ImAEtHg+OB492xlD66OGNMQ84bFaSu7U0BGRLdsKUOwd2Fq54NWfWUSoXeHwVKK
 aQpIMQCBe3T4tAyEEnYIYliRSxmzjqQ4bQGANMMpXwmFWUaW41c6TTjY0hBe83CooUjs
 mGGkQU9IzMk9KbDHiEpJQXiz+mLOofbVWiV+vGiziujef+8nuHoosoqrM5p0ZNsn0ZnO
 VPnu1/zIxohnVDC+ZrPlwWxI9/nVK3UaYb6OCkq7RtuM3HfRpmqSMB4wdAoSSLcR8j2J
 dRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739985034; x=1740589834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F35gCuOu8YlsVwzY+YGVE1BEl6QJE8ppkj0geSACBWg=;
 b=VseoBidDDOiNOVu6XdnwC/kUgvk+3YEOUfgKpe0m24Ql6APxJ1d9Kr3Tc7dq631l4L
 dFGBDLRHXUpNqew8DoZ36i/t+smCX9C1rmPLZU2p9y01+z9UxegD4PTcYg+QK5vC3t2x
 s9RLzi+62rIojQ+biS3AXbKkIkxi0J1UrmEJEu4NfAJH+yU60cD6ZvlLQLUv8XhyE/Ba
 0xM9eVRXytsnEEBv5EshMBg9DJFdEWKrB/5/lGE16o6Jyn57iAYS08E0f2AQOTTfSM4I
 +nQ7TGdmK4bTf42mMM5CpPxSdOOT+rWYwbCXQMPvj7VA1qcRi9rqV/54mSghTARTW3N+
 7yaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFooMngwu9pyPIGR/SYoIf/7jtEMuzKw74k7mLnX8nQ0yg6jkkArzwTWChWCB4oCbS0fPz2kI5Uk8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6KfaqQJ5KBbFV0GuTsgFDo24sZIsliAVG75hTxN77u8TuJL3o
 nfxhl6qwlPhTXV8yf3SDkX9TxbHUYvyvI1xwES2YZFLII6hRBEimQ0QizOvRt1U=
X-Gm-Gg: ASbGnctnNe+V7tikIPxRNKREDYJlzmShw+GOMhdEq0d5vJKsXHahwzj/ZYRAgEyRnnR
 izfqka+GMQT73l6oyeckBAqrpZkPSTpEGF5W/KafOIP/VDNXuVSab9QyF/8MzBePjdbMRx0ozc3
 G89cAIyDor0Qfn5c8m+a4DtpRXXT+4MD2g468MepAz1xx8r6Xknv+0OjcmpdDsbQFGmjt1pCiRL
 YAgyId8CY9m2EHrL0Hw5BOEkjw0IKDwqrIyDUQJuXi7Yy4minG1NH9TSz0WvqkXvjRqg6CmYAWq
 McKaFq1zMWJjOiagdj9tgD8w+e3v12bygXjXjfH+ZZhZKyCPidaiuEh4/6Sfr6Nm1qqY2K4=
X-Google-Smtp-Source: AGHT+IFNdrdyD9GAVtk7sxhJJ4dLAUs6KGeB5DVJLnVCoJxAbOFvAQQeAKi5DJMc6n1MUTqkvNcKFw==
X-Received: by 2002:a05:6512:1054:b0:545:f70:8a95 with SMTP id
 2adb3069b0e04-5452fe8bee7mr6037250e87.32.1739985034390; 
 Wed, 19 Feb 2025 09:10:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54623984659sm947630e87.73.2025.02.19.09.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 09:10:32 -0800 (PST)
Date: Wed, 19 Feb 2025 19:10:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH v5 1/2] drm/msm/dsi/phy: Use
 dsi_pll_cmn_clk_cfg1_update() when registering PLL
Message-ID: <mjgyuej55v3oyq57lqsm2cqjmmwy4jtkufing227gtzlsivrn5@jmscpw7ot4mr>
References: <20250219-drm-msm-phy-pll-cfg-reg-v5-0-d28973fa513a@linaro.org>
 <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219-drm-msm-phy-pll-cfg-reg-v5-1-d28973fa513a@linaro.org>
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

On Wed, Feb 19, 2025 at 05:23:32PM +0100, Krzysztof Kozlowski wrote:
> Newly added dsi_pll_cmn_clk_cfg1_update() wrapper protects concurrent
> updates to PHY_CMN_CLK_CFG1 register between driver and Common Clock
> Framework.  pll_7nm_register() still used in one place previous
> readl+writel, which can be simplified with this new wrapper.
> 
> This is purely for readability and simplification and should have no
> functional impact, because the code touched here is before clock is
> registered via CCF, so there is no concurrency issue.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v5:
> 1. New patch
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             | 8 +++-----
>  drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 1 +
>  2 files changed, 4 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
