Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F5E44AEB0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 14:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CA96E889;
	Tue,  9 Nov 2021 13:23:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFCD6E88B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 13:23:54 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id m25so7470971qtq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 05:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0DLOTiy6uZY8gn6Kg56dLhNVby+whfyfkmUWkLQ+UOA=;
 b=f8pVbfVtU3/8Nlsv80NbQejsTjrSvwbHd+l3a81MOru4mYEVYBqz0mSC6JdLqmKQTB
 /vnbji78y6ZeGFXlWOwg45m5JuCR5r8KfUjjj0AKi/c7LyAasT8E7TH69Ff4mofhe8uc
 6B9/raP1Wv8x4/57E/wDz1hS3mHcwWGrpd927pvnFBCClMpXNxdehbZaeGVwCKbHEfte
 bepk/oR4z7+8X+cnmYIXpfjLIzSs6DKfJO6pXWynlecutd/1P1GGu5at1UUXoAwi3Rmx
 qcd2ylczNGOxNbiNbZ7Nzz2WGyW2msrH9dCoecEqqHbvqGWXw7Ja2AZfEoWtwsHttlW4
 WC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0DLOTiy6uZY8gn6Kg56dLhNVby+whfyfkmUWkLQ+UOA=;
 b=x4pWfdrFoSpJK6P62NtixF/2FwfL+krJWlGi4NZmylQ9cg+QHteZyLQd1GNnjzGXMm
 0Cip5SU/yy/UR11WiULBwPzD9zeXs9pLQ/AdO8I8suc0anT4d7Hev0Q6J5tNePMLgOhF
 zAjDTq2AnnzWygsSIun7A/DvMuwXXH2wObaKn1g3U5tk4zZS97Yhrd0VpuJWp4DnhWif
 68US5s0yEGoF5lrQdZQ5tfeK2cKYUlHb7cShv1yz+ed7ewTrazJklj8ncvbNG7M6CDs0
 9MEJjhNIWuStpdtC/OEqMeTZa+y/kAaf3x/KfD6dCcYghud5zcYmXa91aoOqAftTYwNh
 JQDQ==
X-Gm-Message-State: AOAM533MsNCnn/DB4/53vVBl4X6WaRDoBxdqdtAIzk0olm/H5ecbuiWp
 ToAgQD5Qf6cmAa+STc6tR68oPhKLMPmo+q1txWdCcg==
X-Google-Smtp-Source: ABdhPJxHnSv1ag1UA5YDSEU6aEzZr4vb+6lgWQ1FhKR8ZuYwYjGVbuwc6M+VdPn4JgyJsr8SfH25i8l+XgtGybnggEs=
X-Received: by 2002:ac8:57cb:: with SMTP id w11mr8208764qta.285.1636464233688; 
 Tue, 09 Nov 2021 05:23:53 -0800 (PST)
MIME-Version: 1.0
References: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
In-Reply-To: <1636451248-18889-1-git-send-email-quic_mkrishn@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 9 Nov 2021 16:23:42 +0300
Message-ID: <CAA8EJppuuuY+Oksjv8_U80icK-mr5gjgix6DCnyoMDBwHf4A5w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm: use compatible lists to find mdp node
To: Krishna Manikandan <quic_mkrishn@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 9 Nov 2021 at 12:47, Krishna Manikandan
<quic_mkrishn@quicinc.com> wrote:
>
> In the current implementation, substring comparison
> using device node name is used to find mdp node
> during driver probe. Use compatible string list instead
> of node name to get mdp node from the parent mdss node.
>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
>
> Changes in v2:
>   - Use compatible lists instead of duplicate string
>     check (Stephen Boyd)
>
> Changes in v3:
>   - Use match tables to find the mdp node (Stephen Boyd)
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 3 ++-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 ++-
>  drivers/gpu/drm/msm/msm_drv.c            | 7 ++++---
>  drivers/gpu/drm/msm/msm_kms.h            | 3 +++
>  4 files changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index ad247c0..c778b6d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1273,7 +1273,7 @@ static const struct dev_pm_ops dpu_pm_ops = {
>                                 pm_runtime_force_resume)
>  };
>
> -static const struct of_device_id dpu_dt_match[] = {
> +const struct of_device_id dpu_dt_match[] = {
>         { .compatible = "qcom,sdm845-dpu", },
>         { .compatible = "qcom,sc7180-dpu", },
>         { .compatible = "qcom,sc7280-dpu", },
> @@ -1282,6 +1282,7 @@ static const struct of_device_id dpu_dt_match[] = {
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, dpu_dt_match);
> +EXPORT_SYMBOL(dpu_dt_match);

There is no need to export these symbols, as they will be used within
the module.

>
>  static struct platform_driver dpu_driver = {
>         .probe = dpu_dev_probe,
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 7b24224..8b97008 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -1031,13 +1031,14 @@ static const struct dev_pm_ops mdp5_pm_ops = {
>         SET_RUNTIME_PM_OPS(mdp5_runtime_suspend, mdp5_runtime_resume, NULL)
>  };
>
> -static const struct of_device_id mdp5_dt_match[] = {
> +const struct of_device_id mdp5_dt_match[] = {
>         { .compatible = "qcom,mdp5", },
>         /* to support downstream DT files */
>         { .compatible = "qcom,mdss_mdp", },
>         {}
>  };
>  MODULE_DEVICE_TABLE(of, mdp5_dt_match);
> +EXPORT_SYMBOL(mdp5_dt_match);
>
>  static struct platform_driver mdp5_driver = {
>         .probe = mdp5_dev_probe,
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 7936e8d..445788f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1277,9 +1277,10 @@ static int add_components_mdp(struct device *mdp_dev,
>         return 0;
>  }
>
> -static int compare_name_mdp(struct device *dev, void *data)
> +static int find_mdp_node(struct device *dev, void *data)
>  {
> -       return (strstr(dev_name(dev), "mdp") != NULL);
> +       return of_match_node(dpu_dt_match, dev->of_node) ||
> +               of_match_node(mdp5_dt_match, dev->of_node);
>  }
>
>  static int add_display_components(struct platform_device *pdev,
> @@ -1304,7 +1305,7 @@ static int add_display_components(struct platform_device *pdev,
>                         return ret;
>                 }
>
> -               mdp_dev = device_find_child(dev, NULL, compare_name_mdp);
> +               mdp_dev = device_find_child(dev, NULL, find_mdp_node);
>                 if (!mdp_dev) {
>                         DRM_DEV_ERROR(dev, "failed to find MDSS MDP node\n");
>                         of_platform_depopulate(dev);
> diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> index 6a42b81..8b132c8 100644
> --- a/drivers/gpu/drm/msm/msm_kms.h
> +++ b/drivers/gpu/drm/msm/msm_kms.h
> @@ -198,6 +198,9 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev);
>  struct msm_kms *mdp5_kms_init(struct drm_device *dev);
>  struct msm_kms *dpu_kms_init(struct drm_device *dev);
>
> +extern const struct of_device_id dpu_dt_match[];
> +extern const struct of_device_id mdp5_dt_match[];
> +
>  struct msm_mdss_funcs {
>         int (*enable)(struct msm_mdss *mdss);
>         int (*disable)(struct msm_mdss *mdss);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
