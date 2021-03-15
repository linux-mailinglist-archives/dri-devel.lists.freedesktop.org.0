Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6F133AA30
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 05:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2616892BE;
	Mon, 15 Mar 2021 04:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BABB589341
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 04:03:30 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id u18so14609716plc.12
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 21:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c7OJnHCRmwFk8fofgO7P2TCmA9anENj2NKzvbROCVrw=;
 b=hqFTPqznnNTRx313WjH/Y3rQxyT1qRk2tsjcNVxk6Hrjol4OfsLVJAACk5S5GCeBIN
 DUPZ/2/BGxScEjnruZkDvsVu7pnsFXZ7N4zstn9qEl8Fgh/HQaGB5JV/pkl9Br3HoCOi
 i64U4nBnHPt+1Xi5F2gQwMxITwYJMb1Um+iYOQ6ojSR1WU9DezeWcNfnJiJ8w11ERSEr
 UChVNzm6vqvXvOO1iZ7xVRBakAg/WIocWyURqM6EHJjAujbHTyE6NgBKuUb+t/F7avLm
 rWQq2i6tEhG/s1AIiG+/WUpZhYbj36Vuiav5Pq8c+WaDHPXcR8LK3WT+pRJ2r6gMw6bd
 ep6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c7OJnHCRmwFk8fofgO7P2TCmA9anENj2NKzvbROCVrw=;
 b=Ydk7yqnKdPhxrVyqKuOnoYEwrbGr/fgPbSePCVlb/cbDYkjzpg/NpcVzhbexLRfF1M
 HzR3GCQ6MhTVB9WxRw6xyEdHZNoWqO+f70QIbYrHSNhoFjFIOG4qdi9QaNivzpcL+WPr
 9Ep3WNfw6coMbYOnbexKu1l2NZsYLN9+YS9t1L5GYVnocUxh09dgBro2BGvRQcTiydJs
 hL4+XMxF65YfoIJZOA/KE1eFLDn01gUp1z+8jOvj4/9k3+YbAnJe1TE9SAEAA0kFumY5
 wHjc+d0NygWeFZWLxct5Ye/k2FMh4YDvu4eH3LvGYRTOQvp3F6u5ssUubwkL+/sWOlOB
 tvwg==
X-Gm-Message-State: AOAM531/CnLdb6bcjXSiwhoSMzFSo7/9BlGrEcPwe7cebdT6q+pihajA
 oLGowA5hiAAtk0Xfr5nAGsB/Ww==
X-Google-Smtp-Source: ABdhPJxRDau7gIDAmMsnWR7FCOk4vgRj39P8KqGrKbOykRijnyhWvAXlMXcpaXxZjPuzVl/GOTJ9CQ==
X-Received: by 2002:a17:902:7889:b029:e6:b9c3:bc0d with SMTP id
 q9-20020a1709027889b02900e6b9c3bc0dmr5992pll.23.1615781010271; 
 Sun, 14 Mar 2021 21:03:30 -0700 (PDT)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id r23sm9182422pje.38.2021.03.14.21.03.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Mar 2021 21:03:29 -0700 (PDT)
Date: Mon, 15 Mar 2021 09:33:27 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 11/15] drm/msm: Convert to use resource-managed OPP API
Message-ID: <20210315040327.qwn4rt75yqs5datl@vireshk-i7>
References: <20210314163408.22292-1-digetx@gmail.com>
 <20210314163408.22292-12-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210314163408.22292-12-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, freedreno@lists.freedesktop.org,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14-03-21, 19:34, Dmitry Osipenko wrote:
> From: Yangtao Li <tiny.windzz@gmail.com>
> 
> Use resource-managed OPP API to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 11 +++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 --
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 23 +++++++------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 --
>  drivers/gpu/drm/msm/dp/dp_ctrl.c        | 30 +++++--------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h        |  1 -
>  drivers/gpu/drm/msm/dp/dp_display.c     |  5 +----
>  drivers/gpu/drm/msm/dsi/dsi_host.c      | 13 ++++-------
>  11 files changed, 25 insertions(+), 68 deletions(-)

This patch has some updates in linux-next, which I don't have. Please
get this merged with the drm tree over 5.13-rc1 later.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
