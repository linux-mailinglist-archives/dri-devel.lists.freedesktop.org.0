Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D44D8C5A
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 20:26:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4658610E2A3;
	Mon, 14 Mar 2022 19:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C09B10E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 19:25:56 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id b67so13686341qkc.6
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghXEBznY5vyHF7+fdWoY5v3OsItcalBlY/KG9K7yOhU=;
 b=e2Ud08S0Q7pZF215eRKz7vixHUKMgQNfUK9aOMWNfqStkSdZvWC5Mszd1gEoj/cIZz
 IrZAiRKPJytuFVu+isbnZ5e2rAWsyFV79zcMh9/gmlkX6+VS8y5uGJTay/iSQjW/XKar
 ayFug9ECos7jYnvjtc0aR6Qmtns5qgU5i4/dof+t3R4fwNzT32kHj5wHd1lmFVGOpo3c
 VzjLN9YEOS+PZOQ5vDnQHZ+wSvqk5QfEgoYhbfvKDBo0BAVVKdSnMYOyilpqGop0zHsL
 5HjdxNO1dsVE598rdiHBPM9joHRTxK2XG7aFr29FLlMOR3LRz/PPhkSKnpJmFSQHlnr4
 N8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghXEBznY5vyHF7+fdWoY5v3OsItcalBlY/KG9K7yOhU=;
 b=cDnPlhyc5TKtNeFT9KEpDP/I104WNNpHz6pFVotuwXVpf5j06fQJxsb8FFENZ40RZ2
 YA4GKlVPZjWbzbHPqNsp5FV1/I2Pkmy4hmvJKZyFj2OfAJl49JikgMy3M0uspEcp+ZFP
 MqPjn7b2FaS2aFM4ifPOOCQ2el4Wxx/BXiHAXH2lxmbze2ugaI2/uUdi10ZLYcP3dqyO
 JSY8VQpSXVmRilHjlXnv7Fs6dAjI8jCWK2HQ7DSP/DOpZVTl7uk3XCzYFKS1NCnj4gjt
 0IAOlikitsH0tPbnrtLkUiS16nIvRUx/uV7pbMJwLuVgY3U7khNgBIVTBkfkQ83tsk2E
 oUoQ==
X-Gm-Message-State: AOAM533D8dEfZHJFFYC/QT6UV0joOd2AZOP7MG0Q/US+B7aMeEraf455
 cubWDako4nPpZtZyk3x0ZlxLn88F/qj2myGFe3c9BYZjW1bAPQ==
X-Google-Smtp-Source: ABdhPJyQEYq/aa0gjJEO9Tga4REDnt5I6yrfTmBRW4eRCznjlBUHHMh0lYM73RO7oxgtpMzyqDMXDoNaOp6yMHVijEk=
X-Received: by 2002:a05:620a:170a:b0:67d:be5c:204a with SMTP id
 az10-20020a05620a170a00b0067dbe5c204amr5211992qkb.593.1647285955193; Mon, 14
 Mar 2022 12:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Mar 2022 22:25:44 +0300
Message-ID: <CAA8EJpr2rw4eSA+PViW7UZ2rVLLDS+ipcuo-1dzOargTcbE2hA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to the maximum
 frequency in opp table during probe
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 14 Mar 2022 at 17:47, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Fixes: 25fdd5933("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e29796c..9c346ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1202,7 +1202,9 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct drm_device *ddev = priv->dev;
>         struct dpu_kms *dpu_kms;
> +       struct dev_pm_opp *opp;
>         int ret = 0;
> +       unsigned long max_freq = ULONG_MAX;
>
>         dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>         if (!dpu_kms)
> @@ -1225,6 +1227,12 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         }
>         dpu_kms->num_clocks = ret;
>
> +       opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +       if (!IS_ERR(opp))
> +               dev_pm_opp_put(opp);
> +
> +       dev_pm_opp_set_rate(dev, max_freq);
> +
>         platform_set_drvdata(pdev, dpu_kms);
>
>         ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
