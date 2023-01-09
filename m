Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 889D7662101
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F5D10E37A;
	Mon,  9 Jan 2023 09:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB2C10E37A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:09:29 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id v19so2025669ybv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ksUju8ytzlEweTpFQYqcZ9BkrnYInhKOiXTltSA/eNo=;
 b=KE2dHBcJ85l1aPKOz2mZustc8ycE905TTmv0LmYCR3+SU7Fcb9oIDIC3gA/LE+NGoc
 UWuGEtIYHR2PZtNw87jyhYqZcB699Gp39dylMUUATXUF8/v82qsSarg+eQ4ccoPUevmy
 0WuDy3drpNywj9k7GRGHPML4fZcofOtx5nyYYHGwHawzvputQJ6OshoE9dmMgxlCNd65
 fmpBm+j1sWd9tFiuwKEQG9iKHFF+/kMAkC9HWC4/5w4geGsONLkpUMHVeMhABiBfmXzC
 oNh6Che20j7CWPrm2Qbo9ImKj6xn8w8oH6SJcXoqUrp0iQAmOi2VZ+ZOIwwreGavcCeu
 hRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ksUju8ytzlEweTpFQYqcZ9BkrnYInhKOiXTltSA/eNo=;
 b=LgPpwSeAhA06/tWkiyX1+S6gnRzgTZXLrKlGRhc4foSnidNNjciYan6Z1xqcu8kdU8
 vxPV5T5baVPVZHiytCWX9/dfm+2qUETjKuwp2GuPRud6Xd1tF3rzw580B1ss6cOAi1L5
 /VLzFRnYMQRis0XzMZ1fJeT4bJ7biXChY9bX6/mFVhMujXL5Ugbce9fjornsnGDPnjV3
 YZsBkPjXeXJY9fAhAMm5cIPZz9HZ3mG1Vwh/pPzgHdWB9k5y7I843YVKf0xLcjYKB546
 g3NT0t2+tQrgN07BvB8SrZWz0+B2jkD8wuypciJuoEM5AZL/Xpba+FRx2sZoRviQQDle
 xyqQ==
X-Gm-Message-State: AFqh2ko2DCVhiIjtyTsXEH8onNmKrqN0lWaD+TJMrF8ySWQKfBbQpdqB
 W7vbjjjzVlrpT8FMAjo+oVQPpwCCS6EzhKSCnjNu9w==
X-Google-Smtp-Source: AMrXdXvgY4bPiSF3cDb82Kc6j/QVAY8FdBTgl+GCmX5CEP6zIModo62yxzJQ6CmBGYfoIPPv5/HCpyD+a7FlHgIMbfY=
X-Received: by 2002:a25:81c7:0:b0:726:7335:50af with SMTP id
 n7-20020a2581c7000000b00726733550afmr7898518ybm.516.1673255368894; Mon, 09
 Jan 2023 01:09:28 -0800 (PST)
MIME-Version: 1.0
References: <20230109025044.27766-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230109025044.27766-1-jiasheng@iscas.ac.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 9 Jan 2023 11:09:18 +0200
Message-ID: <CAA8EJpr=1E6JvE+8NBa7fW5jKe23NhDeAXGBp90XLCphnYc12A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Add missing check for
 alloc_ordered_workqueue
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
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
Cc: marex@denx.de, vkoul@kernel.org, sean@poorly.run, vladimir.lypak@gmail.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 9 Jan 2023 at 04:51, Jiasheng Jiang <jiasheng@iscas.ac.cn> wrote:
>
> Add check for the return value of alloc_ordered_workqueue as it may return
> NULL pointer and cause NULL pointer dereference.
> Moreover, change the "goto fail" into "return ret" and drop the "fail"
> label since they are the same.
>
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
>
> v1 -> v2:
>
> 1. Change the "goto fail" into "return ret" and drop the "fail" label.

These are separate changes and should come as separate patches.

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 89aadd3b3202..819f5be5fd77 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -1884,7 +1884,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>         msm_host = devm_kzalloc(&pdev->dev, sizeof(*msm_host), GFP_KERNEL);
>         if (!msm_host) {
>                 ret = -ENOMEM;
> -               goto fail;
> +               return ret;
>         }
>
>         msm_host->pdev = pdev;
> @@ -1893,14 +1893,14 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>         ret = dsi_host_parse_dt(msm_host);
>         if (ret) {
>                 pr_err("%s: failed to parse dt\n", __func__);
> -               goto fail;
> +               return ret;
>         }
>
>         msm_host->ctrl_base = msm_ioremap_size(pdev, "dsi_ctrl", &msm_host->ctrl_size);
>         if (IS_ERR(msm_host->ctrl_base)) {
>                 pr_err("%s: unable to map Dsi ctrl base\n", __func__);
>                 ret = PTR_ERR(msm_host->ctrl_base);
> -               goto fail;
> +               return ret;
>         }
>
>         pm_runtime_enable(&pdev->dev);
> @@ -1909,7 +1909,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>         if (!msm_host->cfg_hnd) {
>                 ret = -EINVAL;
>                 pr_err("%s: get config failed\n", __func__);
> -               goto fail;
> +               return ret;
>         }
>         cfg = msm_host->cfg_hnd->cfg;
>
> @@ -1917,7 +1917,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>         if (msm_host->id < 0) {
>                 ret = msm_host->id;
>                 pr_err("%s: unable to identify DSI host index\n", __func__);
> -               goto fail;
> +               return ret;
>         }
>
>         /* fixup base address by io offset */
> @@ -1927,19 +1927,19 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>                                             cfg->regulator_data,
>                                             &msm_host->supplies);
>         if (ret)
> -               goto fail;
> +               return ret;
>
>         ret = dsi_clk_init(msm_host);
>         if (ret) {
>                 pr_err("%s: unable to initialize dsi clks\n", __func__);
> -               goto fail;
> +               return ret;
>         }
>
>         msm_host->rx_buf = devm_kzalloc(&pdev->dev, SZ_4K, GFP_KERNEL);
>         if (!msm_host->rx_buf) {
>                 ret = -ENOMEM;
>                 pr_err("%s: alloc rx temp buf failed\n", __func__);
> -               goto fail;
> +               return ret;
>         }
>
>         ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
> @@ -1977,15 +1977,17 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
>
>         /* setup workqueue */
>         msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
> +       if (!msm_host->workqueue) {
> +               ret = -ENOMEM;
> +               return ret;
> +       }
> +
>         INIT_WORK(&msm_host->err_work, dsi_err_worker);
>
>         msm_dsi->id = msm_host->id;
>
>         DBG("Dsi Host %d initialized", msm_host->id);
>         return 0;
> -
> -fail:
> -       return ret;
>  }
>
>  void msm_dsi_host_destroy(struct mipi_dsi_host *host)
> --
> 2.25.1
>


-- 
With best wishes
Dmitry
