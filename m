Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0C396F070
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 11:55:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2910110E9E9;
	Fri,  6 Sep 2024 09:55:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b09e+0IY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F3410E9E8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 09:55:38 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53654e2ed93so1832374e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 02:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725616536; x=1726221336; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E0KxWIleE3u20+F+aCD6IZbLW7v8LcTSKTjCbUE1knk=;
 b=b09e+0IY+j4QoC7qydycW+i/xoaUdWZVO0G6+c76oK0XERL+4PY5lgoZjTI25ouV3J
 peYVpAakGOX/eBRjuCVqSDE7VpPg13ZPnJaWf4UUvPIzd94chYYoRLOSDRyZJuDC/m6X
 lns1mT1zMV83n2a8lbhRdSbBpPvolIvxXrBdo820wM/VpNRPfrO0IVLN+2H+r/Y4vlSV
 gphzKVIE71SUzdy/pwyc02K6O+Qz8m0WKb2q5Afvv8h0l+Bo0Npw8gxawZvXy/p+W6c2
 WxHFFraDjS+jYTIn7CQGncQWw3AVjnIMOMlC756trmhlX6EmlWEgOox3y+KYU8ndNW4Z
 aO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725616536; x=1726221336;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0KxWIleE3u20+F+aCD6IZbLW7v8LcTSKTjCbUE1knk=;
 b=szuU3J7tzCHFPv7FLglrxLknpS6ITdeJjrX4X1uGUm7JoBpCbxPJrkeaLsUKFBi/VP
 Rgvdgmf5wVXtzsFi+kFLY8YbNN5eFDjLyDWerzxz48hSZxPEW/g3dIXZUHtis3O8S4EA
 4k6FxEsb7De5DV1ptpXGdnupB/0X/zLFfbH4wqG2L9PEYI/8yH7OVVMZM9NPwXXQt7bB
 lWWXxoKBYQ7h3qMWDC2uR2dd8FttsGM0qvH4aUt89Ksi9tTgjIFVlYQPEWOpuTfTZJw7
 84myB/uj7CQjP8WUuM0kpU7x/2mLkRajPpj/T9HfuZK3adWcHVfZLAPkGqawLo2OiSk3
 CSzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNWU5D7ff4FGuhnZ+o2/q6yOHR4qve1tdXOw9XDGLHz2BuU7BDJDqPsE5GjanFo+8cnrPHhbNUDEU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdIGlGHZTvKqNAAawLvf3/7y0ue9OtoWLaqL62FydyG27eQWiz
 jlfNGPEyD00TEMb2gMr8EHIYAfexgTeB7DKDISg4t4hIWGHdwnUFZDmKx5U1RnI=
X-Google-Smtp-Source: AGHT+IHe6zEb04EsF0hZnI8DiBbVQp4TFTFoRxW/b4jeG49e40MhUMCQNyAhID2vjkNmhWuQrjfCRQ==
X-Received: by 2002:a05:6512:1250:b0:535:ea75:e913 with SMTP id
 2adb3069b0e04-536587c6333mr1667237e87.33.1725616536233; 
 Fri, 06 Sep 2024 02:55:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536592c2dfcsm120331e87.260.2024.09.06.02.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 02:55:35 -0700 (PDT)
Date: Fri, 6 Sep 2024 12:55:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, p.zabel@pengutronix.de,
 robdclark@gmail.com, 
 sean@poorly.run, konradybcio@kernel.org, quic_abhinavk@quicinc.com, 
 marijn.suijten@somainline.org, thierry.reding@gmail.com, mperttunen@nvidia.com,
 jonathanh@nvidia.com, agx@sigxcpu.org, gregkh@linuxfoundation.org, 
 jordan@cosmicpenguin.net, dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 5/5] drm/msm/adreno: Use IRQF_NO_AUTOEN flag in
 request_irq()
Message-ID: <5j626cfkrv5otd7v766r5ml6v5xtxrxe6ezp4m3agei27bvb4f@whi2rott2qrt>
References: <20240906082325.2677621-1-ruanjinjie@huawei.com>
 <20240906082325.2677621-6-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906082325.2677621-6-ruanjinjie@huawei.com>
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

On Fri, Sep 06, 2024 at 04:23:25PM GMT, Jinjie Ruan wrote:
> disable_irq() after request_irq() still has a time gap in which
> interrupts can come. request_irq() with IRQF_NO_AUTOEN flag will
> disable IRQ auto-enable when request IRQ.
> 
> Fixes: 4b565ca5a2cb ("drm/msm: Add A6XX device support")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
