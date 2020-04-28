Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B61C91BC541
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 18:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E996E171;
	Tue, 28 Apr 2020 16:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A105D6E171
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 16:32:49 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k22so16907343eds.6
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 09:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qqW799+HyF2Wu1dNjLV/flMm63iL6Ca6J7Iog3lLWc=;
 b=Kq3im6G2fM6gJlqVbnR7mFw3MsPG03Yyop9QuNdzkCmIpo1BTfus/PBvM8dD3EBeFp
 9mptje/OKsZ+kLHmfaXvQLR90ERhU++VjWtcLv3noHdXgySzrqOMh3FUTpi0CUlWoK/8
 9lmY3/c+SaegTnTYbU0Ij9uQXN2KmS2V9uUH11ZoknM8vVX0dGm7hWb2FOq4Blb3EEr4
 dNwbaL2mebMqTFRp4VOeyQCxHZdhJS0roycBBZ0wlCcO/FPWT1QJ6kaBPJ8iDvZA0Sfr
 GHv/8qNMGEeo43u/fw8QjotCwf1N+K3IF5ZErmPYBheqcTqGezVVsrlobB/iVvaO5uuD
 QueQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qqW799+HyF2Wu1dNjLV/flMm63iL6Ca6J7Iog3lLWc=;
 b=pwovYxii804rMb49052eNKsWW4wmMyIxuIzTLjSvG050D8XpeztdDoggb1EYIV9exE
 TOHg/XR2iiInYseWAz/LaBWSLmHRLtHbqgICxBLU3nNerb4xcphU3HiRwtxQ+zEhM/gO
 vNBQa2zELGUdE04ubM2uLfCdd/vFZro7IPUJEARjRKILPkq8EZjthDLDDM+fGProjtWj
 vXgSHAoqPzDgvw54oiNoMHN/zJgJiahaYCYT+VEUoUBq7EOTZNh3WU30KqhwmHJGIyRH
 bzAWctoBxgoecrRpduyjafvf5XgCdL+2hi06t1B+bpAIRLUAF9U1Kc1smJuvmmygkBzM
 rRmA==
X-Gm-Message-State: AGi0PuYKDtWrtECjjrI2n5CrvODpSrDiNlvSUMfPpFawbda9vBzaVl0w
 H4/9TrRrlYBCe4biUM6hcrpgypWJVqM+rfktEWk=
X-Google-Smtp-Source: APiQypKVOWS0ju9saQ65COkWMwGdZrVXzxnXC6xYv19adm5Pgg9snY4hju2y8SnJwZR+KZM4j2KGIJYSM8xx21EjpU8=
X-Received: by 2002:a05:6402:22ea:: with SMTP id
 dn10mr23067239edb.70.1588091568165; 
 Tue, 28 Apr 2020 09:32:48 -0700 (PDT)
MIME-Version: 1.0
References: <1588080785-6812-1-git-send-email-rnayak@codeaurora.org>
 <1588080785-6812-6-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1588080785-6812-6-git-send-email-rnayak@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 28 Apr 2020 09:32:36 -0700
Message-ID: <CAF6AEGsEgZc=NehvFH2bRfHxcM1uR6s3sLLhk-cQPXM0SXw6Lw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] drm/msm/dpu: Use OPP API to set clk/perf state
To: Rajendra Nayak <rnayak@codeaurora.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Matthias Kaehlcke <mka@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 6:39 AM Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
> On some qualcomm platforms DPU needs to express a perforamnce state

s/perforamnce/performance/

> requirement on a power domain depennding on the clock rates.

s/depennding/depending/

> Use OPP table from DT to register with OPP framework and use
> dev_pm_opp_set_rate() to set the clk/perf state.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  3 ++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 25 ++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  4 ++++
>  3 files changed, 30 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 11f2beb..fe5717df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -7,6 +7,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/errno.h>
>  #include <linux/mutex.h>
> +#include <linux/pm_opp.h>
>  #include <linux/sort.h>
>  #include <linux/clk.h>
>  #include <linux/bitmap.h>
> @@ -239,7 +240,7 @@ static int _dpu_core_perf_set_core_clk_rate(struct dpu_kms *kms, u64 rate)
>                 rate = core_clk->max_rate;
>
>         core_clk->rate = rate;
> -       return msm_dss_clk_set_rate(core_clk, 1);
> +       return dev_pm_opp_set_rate(&kms->pdev->dev, core_clk->rate);

I think this leaves msm_dss_clk_set_rate() unused now?


Other than that,

Reviewed-by: Rob Clark <robdclark@chromium.org>

>  }
>
>  static u64 _dpu_core_perf_get_core_clk_rate(struct dpu_kms *kms)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ce19f1d..2f53bbf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/dma-buf.h>
>  #include <linux/of_irq.h>
> +#include <linux/pm_opp.h>
>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_file.h>
> @@ -1033,11 +1034,23 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         if (!dpu_kms)
>                 return -ENOMEM;
>
> +       dpu_kms->opp_table = dev_pm_opp_set_clkname(dev, "core");
> +       if (IS_ERR(dpu_kms->opp_table))
> +               return PTR_ERR(dpu_kms->opp_table);
> +       /* OPP table is optional */
> +       ret = dev_pm_opp_of_add_table(dev);
> +       if (!ret) {
> +               dpu_kms->has_opp_table = true;
> +       } else if (ret != -ENODEV) {
> +               dev_err(dev, "Invalid OPP table in Device tree\n");
> +               return ret;
> +       }
> +
>         mp = &dpu_kms->mp;
>         ret = msm_dss_parse_clock(pdev, mp);
>         if (ret) {
>                 DPU_ERROR("failed to parse clocks, ret=%d\n", ret);
> -               return ret;
> +               goto err;
>         }
>
>         platform_set_drvdata(pdev, dpu_kms);
> @@ -1051,6 +1064,11 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>
>         priv->kms = &dpu_kms->base;
>         return ret;
> +err:
> +       if (dpu_kms->has_opp_table)
> +               dev_pm_opp_of_remove_table(dev);
> +       dev_pm_opp_put_clkname(dpu_kms->opp_table);
> +       return ret;
>  }
>
>  static void dpu_unbind(struct device *dev, struct device *master, void *data)
> @@ -1059,6 +1077,9 @@ static void dpu_unbind(struct device *dev, struct device *master, void *data)
>         struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>         struct dss_module_power *mp = &dpu_kms->mp;
>
> +       if (dpu_kms->has_opp_table)
> +               dev_pm_opp_of_remove_table(dev);
> +       dev_pm_opp_put_clkname(dpu_kms->opp_table);
>         msm_dss_put_clk(mp->clk_config, mp->num_clk);
>         devm_kfree(&pdev->dev, mp->clk_config);
>         mp->num_clk = 0;
> @@ -1090,6 +1111,8 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
>         struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
>         struct dss_module_power *mp = &dpu_kms->mp;
>
> +       /* Drop the performance state vote */
> +       dev_pm_opp_set_rate(dev, 0);
>         rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, false);
>         if (rc)
>                 DPU_ERROR("clock disable failed rc:%d\n", rc);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 211f5de9..2a52e4e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -128,6 +128,10 @@ struct dpu_kms {
>
>         struct platform_device *pdev;
>         bool rpm_enabled;
> +
> +       struct opp_table *opp_table;
> +       bool has_opp_table;
> +
>         struct dss_module_power mp;
>
>         /* reference count bandwidth requests, so we know when we can
> --
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
