Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE8869D200
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 18:16:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8C110E236;
	Mon, 20 Feb 2023 17:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5B10E137;
 Mon, 20 Feb 2023 17:16:43 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id y8so1908388oiy.6;
 Mon, 20 Feb 2023 09:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yCCqN4WenreXQXaeokHFsokNS6R/AL5lZmu0td1QuDM=;
 b=T/wKTsaR8S2ExYBfdLknydchelnrA7/8OtWu4AOGznMnirYrEmHNuNs3B0sFTty2eW
 xL/Hxt8dQLloqzyOW+V+xJl3jLy1EMXMXLJPcpt7NeoOfFphvGsbJ2vUGD4Gnj6lm+6y
 YCLtKRuT3rW3DwB4rKgO+gzQKY/km+yioOJ1dvHyTKR9+fippc/NCmmWPDt/v6EpC7R1
 xjjRDhDQ15kg+zG4Y+G0foQ4pY+kLSdc5mhDnHHy6cvxb8buwz0L+P4oQ5bSYnhOuX+U
 KDq8Cv+PKFbSU7sTSl3vxZRK8niYisurLaNVLKFO2ax+MqwYa7fMMvqCCscnMhia2aiM
 U8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yCCqN4WenreXQXaeokHFsokNS6R/AL5lZmu0td1QuDM=;
 b=QG1doEiczPHimCoR1ACRI/rp+CakP3QizTvdVxBauREbCbw7OhX9tvWSxBSZV+aP3E
 HmcZa/thGwRBt9dXLXUZbcwll+miBc5w1S4/OID3hzSBLsJrDPqSSxtrRoDxKgPIydR4
 bbMpYZkfL2JbDw3FQNGRyw3yAtrGO+ho2qew+49/fGEB9nr529MFZTHAmj5+WdIIUUAB
 9fozT1D3SsLF3NmgcPxBbLb2wdckievqUbNcq+REHwEADQsHVzev3RrTDp57lvYXoVko
 y+7XrwKLZ5EEgT1liX2G73+RU02Na2hgNip2Gt5uQNqH18QEqLpSh2kB43DcMZ7GC163
 /DIQ==
X-Gm-Message-State: AO0yUKVni8VI2qTR8iccb/ehrVYQ3DSmr6ypwKvAKmlABiNNSbxUb714
 z1lqqVYBSutigY9RZzC75dut/XF8Lj8zK4ZWGKU=
X-Google-Smtp-Source: AK7set9QL2QkQ49Qhg6uKjBzP+LgUwTc0wS8D8yBzOZ4kzLBpGFz7I7lfHxcyo2UhLdIflGXC8hUib6BQMD5ha+mcIE=
X-Received: by 2002:a05:6808:ec7:b0:364:c0a5:1fcf with SMTP id
 q7-20020a0568080ec700b00364c0a51fcfmr1118930oiv.58.1676913402910; Mon, 20 Feb
 2023 09:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20230220010428.16910-1-rdunlap@infradead.org>
In-Reply-To: <20230220010428.16910-1-rdunlap@infradead.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 20 Feb 2023 09:16:32 -0800
Message-ID: <CAF6AEGvFsDmFnWzg09Mpk3BkaiKwZvJRKAi=YQAp=WLz+sE4Cw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: DEVFREQ_GOV_SIMPLE_ONDEMAND is no longer
 needed
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 19, 2023 at 5:04 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> DRM_MSM no longer needs DEVFREQ_GOV_SIMPLE_ONDEMAND (since dbd7a2a941b8
> in linux-next: PM / devfreq: Fix build issues with devfreq disabled),
> so remove that select from the DRM_MSM Kconfig file.
>
> Fixes: 6563f60f14cb ("drm/msm/gpu: Add devfreq tuning debugfs")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org

Thanks

Reviewed-by: Rob Clark <robdclark@gmail.com>

> ---
> v2: since <linux/devfreq.h> has been patched, this select is no longer
>     needed (Rob Clark)
>
>  drivers/gpu/drm/msm/Kconfig |    1 -
>  1 file changed, 1 deletion(-)
>
> diff -- a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -23,7 +23,6 @@ config DRM_MSM
>         select SHMEM
>         select TMPFS
>         select QCOM_SCM
> -       select DEVFREQ_GOV_SIMPLE_ONDEMAND
>         select WANT_DEV_COREDUMP
>         select SND_SOC_HDMI_CODEC if SND_SOC
>         select SYNC_FILE
