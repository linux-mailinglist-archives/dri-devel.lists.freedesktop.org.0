Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EAD59EE35
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 23:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D41C10E464;
	Tue, 23 Aug 2022 21:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5659210EBF0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 21:31:12 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so10613126otd.12
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 14:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=8ZboJ+gALwBhWvL4dlU7KPc90cYPf0VICAV5D3dyilo=;
 b=N8os5fKmzT0/gfD0YXlR2aM/DG2R7410uKS9Eakn1wLD+Uo05BGGBIZYkAT47MRMhZ
 UmchDXRS45VUtA3D2fGJvrR3CAnmtWbdUvZgplLstLvDjEOp5BDCxOcq/tH1Cnc4SBoo
 cblCtfNdbUKXPATK8ilLSGT06GsmQ7l75bByk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=8ZboJ+gALwBhWvL4dlU7KPc90cYPf0VICAV5D3dyilo=;
 b=HkLpjBJ6Kg9Ya08QAd9e3cVLVGSnYNTjZkdPOhtesi+YUDcFFWRlOnki2PPOAsJbgz
 qVhRZ54je+ncstzMCO2UT20f59yEa2gLU0KZbxnp7RmGPPb301qc5EtJJUvx+abwrr+U
 pFKIXqbVcI/Tq21DfBXcmp09FbTOyynd/pRTc4+pekU2/hXB5wZKuVFH5kyzRIrnJnmh
 pXgmIe0B8k2wLqhgIJ+kFWaBGNd2oagnn9ZU9wwONL8Qky2VhvdxhIU0VaG/Q975G6qR
 km/foxza8rOLa/4T/02eAhkkICoATZxHoJSVrp6kTPPFijYP33fmPuNyTVgJCyynaht4
 hFqw==
X-Gm-Message-State: ACgBeo3uCNsn6p84kvPSKhwItP8kc34Bk0dGQQqWOBRHVAHc7LiUwQBF
 M/FBlBBZXKBGCZx60Xd+D7CAYl9ViXVbyR7G86+fOA==
X-Google-Smtp-Source: AA6agR6+bOJxyPJi+ZdRZme7+uoNUzSX4eStlilOe39pgMZX5L+Y9tdYtICzflFAOvd0qwR7ke5pFg6LaQA40ifHUtM=
X-Received: by 2002:a9d:738c:0:b0:638:9962:8cb6 with SMTP id
 j12-20020a9d738c000000b0063899628cb6mr9871156otk.73.1661290271516; Tue, 23
 Aug 2022 14:31:11 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Aug 2022 16:31:11 -0500
MIME-Version: 1.0
In-Reply-To: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
References: <20220805115630.506391-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 23 Aug 2022 16:31:11 -0500
Message-ID: <CAE-0n51XQEoi-+6njQaz3oR=wMwe+WVnqA1PApmZDuQ3-gjMqg@mail.gmail.com>
Subject: Re: [RFC PATCH] drm/msm: lookup the ICC paths in both mdp5/dpu and
 mdss devices
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-05 04:56:30)
> diff --git a/drivers/gpu/drm/msm/msm_io_utils.c b/drivers/gpu/drm/msm/msm_io_utils.c
> index 7b504617833a..d02cd29ce829 100644
> --- a/drivers/gpu/drm/msm/msm_io_utils.c
> +++ b/drivers/gpu/drm/msm/msm_io_utils.c
> @@ -124,3 +126,23 @@ void msm_hrtimer_work_init(struct msm_hrtimer_work *work,
>         work->worker = worker;
>         kthread_init_work(&work->work, fn);
>  }
> +
> +struct icc_path *msm_icc_get(struct device *dev, const char *name)
> +{
> +       struct device *mdss_dev = dev->parent;
> +       struct icc_path *path;
> +
> +       path = of_icc_get(dev, name);
> +       if (path)
> +               return path;
> +
> +       /*
> +        * If there are no interconnects attached to the corresponding device
> +        * node, of_icc_get() will return NULL.
> +        *
> +        * If the MDP5/DPU device node doesn't have interconnects, lookup the
> +        * path in the parent (MDSS) device.
> +        */
> +       return of_icc_get(mdss_dev, name);

Perhaps this would be better served by having another icc_get() API that
looks in the device and also the parent? Or maybe there should be
interconnect-ranges (similar to clock-ranges) so that interconnects can
be mapped to child nodes in DT.
