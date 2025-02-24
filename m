Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE4CA4133F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 03:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0619210E04A;
	Mon, 24 Feb 2025 02:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="afpScguh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A0B10E04A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 02:16:00 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54298ec925bso5789660e87.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 18:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740363359; x=1740968159; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=03x282i+KbbFm+Sge0tO2WLnHAQK0oVCuq/xqv36OUQ=;
 b=afpScguhRjo3bQvnlh48o3Vz2+ZLG11trQVdu3Y46miTTXJkcSa/ibn45mTb9shozv
 AcK8RVtVC4nRnqKqHQ0ptM38qtOZv21nCEeR55DxvyWFSSPOQ6w1qZDZfV4QMZr1CrYK
 RmgrqX0fYteUbkLXd0B51/fhYd2xVx5J312SPONXtwWjHDeMiNDIyAgzf5HPExCu6vmP
 Nw/ojDUrantP2cRQawf/XGkjGGN8lnK/m+B0sh3K51nxgSWjWd8m9zgw4E17EAeC0Q5w
 gnEYrvvP6zQfY25kokckUP+GjonW6amKFw0k334kQOuDUxMKFCzURiJb+pXTarGZycoF
 3rwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740363359; x=1740968159;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=03x282i+KbbFm+Sge0tO2WLnHAQK0oVCuq/xqv36OUQ=;
 b=Y9igLnR7WtWBU0ubsyABpv5iZOoI06jN/UjHTJH+sflOCtzq1XlJPmhcTYetrHvy6B
 uCRCwlaVKXJ+A3iuztkSmHWkUSOYivfKDcoby6xOt+JgvvCfVB/JQwRUt2gdHmuL8cyf
 j3kUg4JqiFW08kEUh3luNJQlRPwpns18XLJq+eQHtcKbfYO9E4J561SiQW2wYTQQICew
 zkuUIQW+sFt29GrQ2EVEdvGXVUxLaZ+J100shYYmFi/Ka1GDMKiKcwOyIF8dbCS0Akpd
 /PFq7wqVnc5hjdn1ARQ1ckC2fzomC1H4Y8GKLTXPxZ0f+2FkBXRJAWgiFgVRVIYmv9Gn
 /mzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiKKqUgoUBo8kwFAC0vbKhxgJi3OZ8txKl+vyyrzpwllf/ZxJI6ndv9+Ewte7JEgaGzwALT6pS5cM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV3PEfSJttnJWgsnu5WSPeurAnHtaFfVoJ26LHI7zY2ntjaIns
 mN38O2y5Dp7aujKMm4nmMJkD9azJ/vRe2AaNZ7aNLEZbcNcD9fNsbe9goleeumg=
X-Gm-Gg: ASbGncvqIwXVBFXLqw4yKygM3PYjFlnnqNT4eqQdhMKcl48UIVgMZ9gRZM42a5CEKQh
 1xji1Jt4FxJkEX/MhsvTSN1aCxLe1G4a0TEn/JEO1AseMqiGo7hwVQ44M1oDeYnCHyrxNtTaIDQ
 7WmMysmyX41GWuGS1kEmcXPMb5n4fyAvbYwpXgvwb+mQBxoKzmo3jjfdaKUxinXpW3ydBQlSJqo
 MOQ0qcCocLU0dNtdk/kPL3TTPRln0B+xix6EEOb2vZOr1s5ki8ImWyT8RCL8uhcv6obsOrfhSFn
 eECwxtQYWRFVEc6ABat4w4RH986sr66zflIM96vKty7sfQbVSMkNFw/Q914RfDmgHCbTPSeSJyh
 XFqQByw==
X-Google-Smtp-Source: AGHT+IFD8yCSJdHxEzXcKOScOwjk4piZVuSgJw/kfPjGZPJZeEQwe/7hrMUi7SPPp71EVSbw+qv4rA==
X-Received: by 2002:a05:6512:3094:b0:545:f0a:bf50 with SMTP id
 2adb3069b0e04-54838f5b86emr4428391e87.35.1740363358410; 
 Sun, 23 Feb 2025 18:15:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54526745abcsm3068485e87.252.2025.02.23.18.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 18:15:57 -0800 (PST)
Date: Mon, 24 Feb 2025 04:15:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongbang Shi <shiyongbang@huawei.com>
Cc: xinliang.liu@linaro.org, tiantao6@hisilicon.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 daniel@ffwll.ch, kong.kongxinwei@hisilicon.com, liangjian010@huawei.com, 
 chenjianmin@huawei.com, lidongming5@huawei.com, libaihan@huawei.com, 
 shenjian15@huawei.com, shaojijie@huawei.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 drm-dp 3/8] drm/hisilicon/hibmc: Add dp serdes cfg in
 dp process
Message-ID: <scjsgypzxx7pkd255qf3t45nnqytp7q2urdvwo6zdffubawsa3@p6duklhgw3rv>
References: <20250222025102.1519798-1-shiyongbang@huawei.com>
 <20250222025102.1519798-4-shiyongbang@huawei.com>
 <d77bfuqor2rsd5tg4abywkckiqwy7j5xr43p73to2ofwpirws3@4m4g7hkvji2a>
 <c9d59963-2ebd-4a6f-bdff-1616ed8afec0@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c9d59963-2ebd-4a6f-bdff-1616ed8afec0@huawei.com>
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

On Sat, Feb 22, 2025 at 06:32:35PM +0800, Yongbang Shi wrote:
> > On Sat, Feb 22, 2025 at 10:50:56AM +0800, Yongbang Shi wrote:
> > > From: Baihan Li <libaihan@huawei.com>
> > > 
> > > Add dp serdes cfg in link training process, and related adapting
> > > and modificating. Change some init values about training,
> > > because we want completely to negotiation process, so we start with
> > > the maximum rate and the electrical characteristic level is 0.
> > > 
> > > Signed-off-by: Baihan Li <libaihan@huawei.com>
> > > Signed-off-by: Yongbang Shi <shiyongbang@huawei.com>
> > > ---
> > > ChangeLog:
> > > v2 -> v3:
> > >    - change commit to an imperative sentence, suggested by Dmitry Baryshkov.
> > >    - put HIBMC_DP_HOST_SERDES_CTRL in dp_serdes.h, suggested by Dmitry Baryshkov.
> > > v1 -> v2:
> > >    - splittting the patch and add more detailed the changes in the commit message, suggested by Dmitry Baryshkov.
> > > ---
> > >   .../gpu/drm/hisilicon/hibmc/dp/dp_config.h    |  1 +
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_hw.c    |  5 ++-
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_link.c  | 33 ++++++++++++++++---
> > >   drivers/gpu/drm/hisilicon/hibmc/dp/dp_reg.h   |  1 +
> > >   .../gpu/drm/hisilicon/hibmc/dp/dp_serdes.h    |  6 ++++
> > >   .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  8 ++---
> > >   6 files changed, 43 insertions(+), 11 deletions(-)
> > > 
> > Mostly LGTM.
> > 
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> > > index 812d0794543c..e0537cc9af41 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/dp/dp_serdes.h
> > > @@ -4,12 +4,15 @@
> > >   #ifndef DP_SERDES_H
> > >   #define DP_SERDES_H
> > > +#include "dp_comm.h"
> > No, please include it directly, where required. This simplifies possible
> > inter-header dependencies.
> 
> Okay.
> 
> 
> > > +
> > >   #define HIBMC_DP_HOST_OFFSET		0x10000
> > >   #define HIBMC_DP_LANE0_RATE_OFFSET	0x4
> > >   #define HIBMC_DP_LANE1_RATE_OFFSET	0xc
> > >   #define HIBMC_DP_LANE_STATUS_OFFSET	0x10
> > >   #define HIBMC_DP_PMA_LANE0_OFFSET	0x18
> > >   #define HIBMC_DP_PMA_LANE1_OFFSET	0x1c
> > > +#define HIBMC_DP_HOST_SERDES_CTRL	0x1f001c
> > >   #define HIBMC_DP_PMA_TXDEEMPH		GENMASK(18, 1)
> > >   /* dp serdes TX-Deempth Configuration */
> > > @@ -24,6 +27,9 @@
> > >   #define DP_SERDES_VOL2_PRE1		0x4500
> > >   #define DP_SERDES_VOL3_PRE0		0x600
> > >   #define DP_SERDES_BW_8_1		0x3
> > > +#define DP_SERDES_BW_5_4		0x2
> > > +#define DP_SERDES_BW_2_7		0x1
> > > +#define DP_SERDES_BW_1_62		0x0
> > >   #define DP_SERDES_DONE			0x3
> > > diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> > > index e6de6d5edf6b..67d39e258cac 100644
> > > --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> > > +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> > > @@ -28,9 +28,7 @@
> > >   #include "hibmc_drm_drv.h"
> > >   #include "hibmc_drm_regs.h"
> > > -#define HIBMC_DP_HOST_SERDES_CTRL		0x1f001c
> > > -#define HIBMC_DP_HOST_SERDES_CTRL_VAL		0x8a00
> > > -#define HIBMC_DP_HOST_SERDES_CTRL_MASK		0x7ffff
> > > +#include "dp/dp_serdes.h"
> > >   DEFINE_DRM_GEM_FOPS(hibmc_fops);
> > > @@ -122,8 +120,8 @@ static int hibmc_kms_init(struct hibmc_drm_private *priv)
> > >   	}
> > >   	/* if DP existed, init DP */
> > > -	if ((readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL) &
> > > -	     HIBMC_DP_HOST_SERDES_CTRL_MASK) == HIBMC_DP_HOST_SERDES_CTRL_VAL) {
> > > +	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
> > > +	if (ret) {
> > Why?
> 
> Becuase this is a serdes deempth configuration which is changed if we start cfg serdes.
> The HIBMC_DP_HOST_SERDES_CTRL_VAL is default value, but we may change it. We can just
> check if it is not zero. If it's not zero, it has dp block and we can init it.

=> commit message, please.

> 
> 
> > >   		ret = hibmc_dp_init(priv);
> > >   		if (ret)
> > >   			drm_err(dev, "failed to init dp: %d\n", ret);
> > > -- 
> > > 2.33.0
> > > 

-- 
With best wishes
Dmitry
