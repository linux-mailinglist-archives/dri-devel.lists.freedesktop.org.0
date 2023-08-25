Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A73789257
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 01:31:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6252910E035;
	Fri, 25 Aug 2023 23:30:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF04D10E035
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 23:30:52 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-d7766072ba4so3413521276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 16:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693006252; x=1693611052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ey6d5gZX4O+5Ormvdw+/edKbvFqUfGvPPdAwBns5XZ0=;
 b=YHweFZN6GWWe9k+V0XvG5rYvHDivYVgMTQvoLW7JqGs9V57KqEMh6nTzyqMyJL6+/c
 s140AfjtRqHCG1/0hCF6C9gMhAY+tEA2aYYkowHtj1IKRtu5k7c40MK1YyUtqmVqZAYF
 VDBXC2/ohxwnd83Z1nFnA2SIed4XNoM918BSHyBRJNkUQQXXB/AeV7anRnURqmWmj5oB
 DkFvwRIu8uavah6wkkOOelblaW4sDJRrCAVmX+IApCje0g0Myy2CIMg4fMoaVli9w6eh
 a4EZZyD/MlvDAiYn2i+hOeIIAgxn+ctWAVAlg9j4LiE7bmAxEmPctT1CsDKNdLFJKodV
 bgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693006252; x=1693611052;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ey6d5gZX4O+5Ormvdw+/edKbvFqUfGvPPdAwBns5XZ0=;
 b=RNOoCSCHUAuJkXZtREZOW8Kx2HrtZTBEUsS7xQeyq0rYz0wB4Rvad3XF5OZ5vsEglD
 HgVt5pWelLJGq0+eYvxGna8BFGfNymEISHxkE9ca/7SqyP67nirOphIFQEx/Y40zHxEN
 GvIr6ubT8c+cCdDqlD1f6xPU2dIeYAZ/xc3sQ/Po+NL5xQaIxWIqFTp2Y5UaVk1sLgB4
 SKCWvuWstY8vyHXB+pwcyIgS+tXPLTa/swD9IGWQR5qxKZvebPfO45/SlxMFmIpks6YD
 OkW+XkZFPUZWSnsUFRVureRgHKy3BsVdowSbGnsy9iRSSnItx4Tddxx42CbJ8zIHTOS4
 tmyA==
X-Gm-Message-State: AOJu0YwQTnmF7QCjlFJsm8Kw9XXoNJFGfVOUgJtvf8KwxTTbFAu8ds/n
 kJRRmvg8sXud0hEsqPP6+dIhF1njvqUEazzBXnxmJw==
X-Google-Smtp-Source: AGHT+IH96iZdBFBpub3t9rZ+AHNDzp0KpWqQfScrAOFxIgwNDRNv8otji8p9J6NWQaVh/hdaQCLvseVk6BJ7yxkTnWk=
X-Received: by 2002:a05:6902:185:b0:d4b:a962:76a3 with SMTP id
 t5-20020a056902018500b00d4ba96276a3mr14239474ybh.29.1693006251979; Fri, 25
 Aug 2023 16:30:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230825230109.2264345-1-swboyd@chromium.org>
In-Reply-To: <20230825230109.2264345-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 26 Aug 2023 02:30:40 +0300
Message-ID: <CAA8EJprmvczug0zxuhrHuK2kBYtnkLfkZmYwS78hdVRe8waDXA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Add newlines to debug printks
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: linux-arm-msm@vger.kernel.org, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 Vinod Polimera <quic_vpolimer@quicinc.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 26 Aug 2023 at 02:01, Stephen Boyd <swboyd@chromium.org> wrote:
>
> These debug printks are missing newlines, causing drm debug logs to be
> hard to read. Add newlines so that the messages are on their own line.
>
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)


Fixes: 601f0479c583 ("drm/msm/dp: add logs across DP driver for ease
of debugging")
Fixes: cd779808cccd ("drm/msm/dp: Add basic PSR support for eDP")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 42427129acea..6375daaeb98e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1090,7 +1090,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>         } else if (dp_link_read_psr_error_status(link)) {
>                 DRM_ERROR("PSR IRQ_HPD received\n");
>         } else if (dp_link_psr_capability_changed(link)) {
> -               drm_dbg_dp(link->drm_dev, "PSR Capability changed");
> +               drm_dbg_dp(link->drm_dev, "PSR Capability changed\n");
>         } else {
>                 ret = dp_link_process_link_status_update(link);
>                 if (!ret) {
> @@ -1107,7 +1107,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>                 }
>         }
>
> -       drm_dbg_dp(link->drm_dev, "sink request=%#x",
> +       drm_dbg_dp(link->drm_dev, "sink request=%#x\n",
>                                 dp_link->sink_request);
>         return ret;
>  }
>
> base-commit: 706a741595047797872e669b3101429ab8d378ef
> --
> https://chromeos.dev
>


-- 
With best wishes
Dmitry
