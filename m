Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF83A1D777
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 14:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D32210E51C;
	Mon, 27 Jan 2025 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JOQF+pMT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292F410E51F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 13:54:42 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-304e4562516so44730281fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 05:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737986080; x=1738590880; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MG8vL6IasZgSPWiGApP4GVL5c9606qD22ZEA08oiK0c=;
 b=JOQF+pMT6yt0NcObN8yjUy7XRjb3A5UwrKwAgEqrDKEQhazI+LwhrvFIMwySO4wpTE
 7ghGCSF/GZRJA8cU4ZDpjHhW04It/GCK01zC+qvrrMP01pOjxWMq2nfgpqBkPjc9QbKo
 eAN4G7ZIWLe0qZMRR2sGOovTcyLnQ++mQVYRDc/SQfPzd+Eh70effkRYlJJ0a3TWuxaN
 gMXbMFuIyoDTY7EGYfjNZwG5lVMHwTVPXMhj4JEGXPTx6/oWzA7eXSXEoLnVIj6eZaoO
 sHHjdA8/ezbCtcSNGmYDfby2VZoQ0rt59mxzstBZUsI2S9RvUx9G/1pqUFWEh8h9ql3s
 CNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737986080; x=1738590880;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MG8vL6IasZgSPWiGApP4GVL5c9606qD22ZEA08oiK0c=;
 b=KEZ/ozSdENiw1npPLzuigrpTvwRWl+D4ABRsyE16iTUiGmy0aceohRXJTviHbLcovs
 1Xej5ODcs3BmqSjgFAaB3dbNCZKkfGFEQGRU7WWgF8hXGa30da+U6vKPuks5YMV1MIJF
 BztFsQBdklavrOy/ER2zYXsZ1jXxEa9FsW9cbCsuRyprXYY5JpMx6BcD0VMZShCll9lm
 Wz2aCGTrYngfTKhVppxE3XZkiuazJSf+/Nb3ufatxtdCmP5Maf9KzKHsirPBDm9GnkCF
 0jo0xZvL2wvWD+9KkiVIkkggjCyxwBCeDlHpYG4KtP76gh1XnAxD8wt/2iuhlxx82LYo
 vaGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCRM64yzZSLnyN47IXg0IEjrqKukhglEutyl60MtbZb+8ZaJXBrNYFyiKQGdwxiSF87Fx2K79mk6U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6qrt8qEILvUCx+LMKIBAoYKj8UVaef6lmF21CL0hUo/3j9+tX
 s3CZ6TXL9Wj1sweGiM+h/NPWfbaZ7Fz6TSXdi+XakkaRjYXumRWGfbycSauXuo0=
X-Gm-Gg: ASbGncsFqzkGeH0uCH084zMH6IKUrwCMy2eRErk70sMLgt3408sUN5plAJftNY7IXOR
 mvO1k75lQRAgh/HaQkdpM/XGQklTgsj+GzohqRsKaWNj+jl1mM3daWwUVKgC5BSlGKm5RguhlUK
 xk/j1yPQpnt0scnD39MuT5X9gnKNZS1OyCNiYYnSKQCwN2CBO5FDqcsw81DM7t8CxBddBF1MgZL
 TqDaPcZr+yyybh3AcE4yjZgJHlFe8QZu5J63kjSOoV/dvri97q26EfX/IXtzFyb5OhGs3E/De7c
 +9GKiF7LynwXxVAcPCvebV1SXAe+p4aAF7SGuD+zA0R7/xIUNEYOuCFrRO+u
X-Google-Smtp-Source: AGHT+IEZNRgyG7avdiIFrrqpYNJ9ma4eAM8WC44WUlJD0d6Eyzriv+5OslGJLlbJ5m5dOBVSOwRTkw==
X-Received: by 2002:a2e:a917:0:b0:302:2097:392f with SMTP id
 38308e7fff4ca-3076c33d8d0mr50387271fa.7.1737986080297; 
 Mon, 27 Jan 2025 05:54:40 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3076ba6bd1asm14100191fa.11.2025.01.27.05.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 05:54:38 -0800 (PST)
Date: Mon, 27 Jan 2025 15:54:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
Message-ID: <ccs5oxfgtk5zrnw27okvbskddqynurx6hl3e6g4zbmlqcqm4yl@sxghz575bqdo>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
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

On Mon, Jan 27, 2025 at 02:21:05PM +0100, Krzysztof Kozlowski wrote:
> Use the header with clock IDs to bind the interface between driver and
> DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 5 ++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 1 +
>  6 files changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
