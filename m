Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E32C07B0DF0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 23:17:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824AE10E09D;
	Wed, 27 Sep 2023 21:16:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E43B898C4
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 21:16:54 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-59f7cc71e2eso94058747b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 14:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695849413; x=1696454213; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Egs/0a9obKo4OfCKrbX3EcZMRe8x/y6shojMDmUEqA=;
 b=p7YLPwSq0HlryOIxT5FLwdmfWGuFUnyL1ryI/durV2AGyVgDmMiq2NOzA/FI5hptLO
 e43aSFdFE0lGxOR6bSd3Rr4i0KXXLZ4ECYW3qLctYqd92kMgQxThhCEs1XQpINNYPOk1
 gG0rHYkxAlGL31Lm4DU40+nhlrm6pQIS7uZ2xir+BPztWT9iklfHIS3iB4pEJvRYFOCj
 eU0HKdCDAF4cX0IrqyzTYzAXH6zV2uSpVqImsrZfcJUNXB1FY+lJp6FjtfhIvaKUAZ9H
 N4jBs0v7ucz4tSH8db+y5vuUw/ofO5mUFbKIRnuiNKdY1u7OxfJWDZPuuD9Li8D/1bV/
 suzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695849413; x=1696454213;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Egs/0a9obKo4OfCKrbX3EcZMRe8x/y6shojMDmUEqA=;
 b=gm2Fh8mevSsvRjD9Ebxp1ECahIfDL2hYKzTgs1kfiMFWaROZNMWpc9fBrRgvOJOdq+
 ly8QWPqSPxPqZ/tJy64/xuLHI5F+nOoSj8icCe+KbWl8We+rDtvFY5Nqb1OCaA8HVX3n
 kRuATlOLPISJn7jUBckCYkAMxXHznFsIte3T3ydrYZOGxupFjsnC7r5mFPm83y+J1w8h
 vykxxcFjGjY7SGyuHpyxeQBKbkDlAKEapiFSiepI76nqs5+xcKCrpIw9lDahMf7OVgId
 zWlajw59mhE51ZMS/K31jzCSVer9rAFrN+P/oTiw1ldshDaRKqEn/wnS6AtCD34+nrsL
 wUXw==
X-Gm-Message-State: AOJu0YzxK/BrjGjP+LWXa3WDS+qGTObw2bRZav76NmC6mxhFdRIFbymK
 ZY97YHqF7c4OISyjkgMhPa38Tox8k2LyOxGFm7AEOQ==
X-Google-Smtp-Source: AGHT+IGO1KiVE2bI8blvCLR/sjY97K/2QcJne6dK+EgiphioOMUo1x3UAeM4EbLQnYd1r63pwHNusKznnhSsSR1nJT0=
X-Received: by 2002:a0d:fa82:0:b0:59f:5361:d18c with SMTP id
 k124-20020a0dfa82000000b0059f5361d18cmr3552091ywf.41.1695849413286; Wed, 27
 Sep 2023 14:16:53 -0700 (PDT)
MIME-Version: 1.0
References: <1695848028-18023-1-git-send-email-quic_khsieh@quicinc.com>
 <1695848028-18023-5-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1695848028-18023-5-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 28 Sep 2023 00:15:46 +0300
Message-ID: <CAA8EJprubda19zW=XBRp-ORQwEB1YYrmkUiqmy5gH5TzCM8bhQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/msm/dp: move parser->parse() and
 dp_power_client_init() to probe
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, andersson@kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 swboyd@chromium.org, sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Sept 2023 at 23:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Move parser->parse() and dp_power_client_init() from dp_display_bind()
> to dp_display_probe() in preparation of adding pm_runtime framework
> at next patch.

This describes what the patch does, not why it is done. Could you
please rewrite it to describe the reason for the change?

>
> Changes in v4:
> -- split this patch out of "incorporate pm_runtime framework into DP driver" patch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 7ae3b8b..3ef141c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -276,11 +276,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>         dp->dp_display.drm_dev = drm;
>         priv->dp[dp->id] = &dp->dp_display;
>
> -       rc = dp->parser->parse(dp->parser);
> -       if (rc) {
> -               DRM_ERROR("device tree parsing failed\n");
> -               goto end;
> -       }
>
>
>         dp->drm_dev = drm;
> @@ -291,11 +286,6 @@ static int dp_display_bind(struct device *dev, struct device *master,
>                 goto end;
>         }
>
> -       rc = dp_power_client_init(dp->power);
> -       if (rc) {
> -               DRM_ERROR("Power client create failed\n");
> -               goto end;
> -       }
>
>         rc = dp_register_audio_driver(dev, dp->audio);
>         if (rc) {
> @@ -1249,6 +1239,18 @@ static int dp_display_probe(struct platform_device *pdev)
>                 return -EPROBE_DEFER;
>         }
>
> +       rc = dp->parser->parse(dp->parser);
> +       if (rc) {
> +               DRM_ERROR("device tree parsing failed\n");
> +               return -EPROBE_DEFER;
> +       }
> +
> +       rc = dp_power_client_init(dp->power);
> +       if (rc) {
> +               DRM_ERROR("Power client create failed\n");
> +               return -EPROBE_DEFER;
> +       }
> +
>         /* setup event q */
>         mutex_init(&dp->event_mutex);
>         init_waitqueue_head(&dp->event_q);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
