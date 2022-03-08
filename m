Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4CE4D1E2E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 18:09:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EA410E2D4;
	Tue,  8 Mar 2022 17:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com
 [IPv6:2607:f8b0:4864:20::f31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B4A10E2C1
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 17:09:47 +0000 (UTC)
Received: by mail-qv1-xf31.google.com with SMTP id jq9so1064104qvb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Mar 2022 09:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UQsloRHTSaGiGetdbDWoxqQEJYsHpKTImpl+EXTJaU0=;
 b=H2042iFn8zbvVMiOulmTBRC55hfhpLFhLPRiEwvUGuLHJeAjSulrbb/dnZ+gGOGpdx
 z+nEoUPsD5v9kA7aLyUd3mh/+c+OPht0WtwZz7SUgG5EpIxXKtD33/rrpjJgBRLOZ+Wc
 +w4Ng70uS1XwbnLD2GxLQoEqEPlzd/G0Nj4DbBPsF4RU+8mYeOajlGGlmH85BpFpMHq4
 V9pj+HOsO1K0j7YJzSI1eVB8yORUl7FQ0K4fuwqcZEq2hj4nu6kvqSciK8Z1UvqSgnGX
 2Gg1wU8u+siIqzrk0fumIX8gcdhjob0cCaqDCKEe8NWqBvwoktmRCHASmW+vII/XTqBi
 SkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UQsloRHTSaGiGetdbDWoxqQEJYsHpKTImpl+EXTJaU0=;
 b=B+JuGbvFaKUQY11DjK3va+SFv8R33KCi5Xhoz5nyhAp3hAzyaB2rm2OjKTPpWFn+vy
 QodRVLieqddIhJ/tDRi5Y0nH/aQuRM2Oai1TEMYA7RSHPEplFbm0hYld+Wkit1LCFynf
 n1SvRNo5QkGKO/GoGy9n/vleJ/IAEwBNRGciksVTkiqCAFVFDHKRK3rnemOkz/a0YgA8
 PA+3ao1v7l8i2QdLoonDiIL9FNreWIc8i2PciKmW/uWLP4n6q57Pvd6QShEeego494z6
 uDfMLySuHaL7hBvuW9Fh5SIq2ncgYwaC8pa5js8SMwMYLArj+msabkSjrDtj3uuUUIXh
 TpOA==
X-Gm-Message-State: AOAM53004Tf0Y69xZmYms6qFsBFqdIk/AhuTOH8IdWEgnP2DJ3p36Eb/
 Xfc4CdKWGSrD8wo2r8RyJx7pSKsAlmdcAd4hQv53Vg==
X-Google-Smtp-Source: ABdhPJziwHM3mwjCjwO4Ib9qlCcqXaMHab7YQ1KRTIBpOJvcb8c3ZW4vgDTtKRTvbt8UU9j7WWhqwP7KKAN7SmM4acc=
X-Received: by 2002:a05:6214:1bcf:b0:435:4c86:607a with SMTP id
 m15-20020a0562141bcf00b004354c86607amr12909937qvc.122.1646759386744; Tue, 08
 Mar 2022 09:09:46 -0800 (PST)
MIME-Version: 1.0
References: <1646758500-3776-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646758500-3776-6-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 8 Mar 2022 20:09:35 +0300
Message-ID: <CAA8EJprgJvOGCU_PvAHCNoMvSam8QV4x9N2ZEm+oer5d7B-cPA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] drm/msm/disp/dpu1: set mdp clk to the maximum
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
 dri-devel@lists.freedesktop.org, dianders@chromium.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Mar 2022 at 19:55, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index d550f90..d9922b9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1221,6 +1221,7 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         struct dpu_kms *dpu_kms;
>         struct dss_module_power *mp;
>         int ret = 0;
> +       unsigned long max_freq = ULONG_MAX;
>
>         dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>         if (!dpu_kms)
> @@ -1243,6 +1244,8 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>                 return ret;
>         }
>
> +       dev_pm_opp_find_freq_floor(dev, &max_freq);

You leak a reference to the opp here. The function returns a value,
which should be dev_pm_opp_put().
Moreover judging from the dev_pm_opp_set_rate() code I think you don't
have to find an exact frequency, as it will call
clk_round_rate()/_find_freq_ceil() anyway.
Could you please check that it works?

> +       dev_pm_opp_set_rate(dev, max_freq);
>         platform_set_drvdata(pdev, dpu_kms);
>
>         ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
