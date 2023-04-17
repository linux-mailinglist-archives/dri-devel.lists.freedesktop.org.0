Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E950D6E5208
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7EE010E0FB;
	Mon, 17 Apr 2023 20:45:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48C010E0FB;
 Mon, 17 Apr 2023 20:45:22 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-187916b6543so16334491fac.7; 
 Mon, 17 Apr 2023 13:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681764319; x=1684356319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fpw6Zw0s5R3Qp1iH0xXMY6crGqEVCslknpiblwPum4=;
 b=PbL9RlrcEvNtSBq5aFF1K+XHDmkI1FDrcYfuJUZi/GpvIqLh3TS1ne611uq7ZetEs7
 wTsy6p5MIs1/M1NQGID3U8sN6mdCiFAqtLNe+1MlksdnJ4Q2BoVi9N4G4Wi32A2mcoIS
 CRtbvVrcsxf8IStYHnSXI2//mFbzdQQNb976ojo0B/ZPO7rHgUXtzBClLCH3CrBP7Ivp
 BB6UxkCNPc31gU5iVLET6tA2Dfznsf4FlRy49CqleR2cFoqqvVg7fFCUXHw/KFQi9MmZ
 cchHkgfPOma52nHjRoG4lvsUSnl5tcgdf5u9T6N1pdIsMfaUHlJeeblnSdNkg7WW4wGY
 vojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681764319; x=1684356319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fpw6Zw0s5R3Qp1iH0xXMY6crGqEVCslknpiblwPum4=;
 b=eflbo+SeFd3iI3AU6P9G9wCqKKyRyCooKOCwkb/qwHZZDoaRBTskWPT41nIRnbs2Gd
 svdh/cl+DaGkr/P5LhAlrJfd/UZIhCD1RWLcpxyunWX5/L5kgsGQ6exs0XF/cdrU7mDQ
 JUevnWy4haBJD3aF5Btuo37pTeQ0locCL3EXxHa3f4mEc7FxcqSWPCr1w9C0CRHW4pG8
 sarkW/5uBtEVmQZtUzzXuW/zRl7AhK/CHpdLGKCkwkYElj4wPQqCJSovyiaMohhACmIF
 gxMilQm/oe505soorMBG4b1NQmmJf8ToD3Xu1KeSxRyHkjdd8WT4FKxzC2FJJV+FmjO1
 fJ2g==
X-Gm-Message-State: AAQBX9dmJeRtFI7pIDdEjWgduRQ+C+MJeZveoR+p6uhGiNsu3ixSu+jc
 3NWA4bY2M8RUiVHtQNu2K8t6NeJw/Jpvk3crQgXmJ+VY
X-Google-Smtp-Source: AKy350YGawNtt/qIBtEhaGmjXWvU97vjeDYCYWAWwSsngIuB8jSH/zqF+G8k9jUHx6+c7HnX9gmC/4usZ8HmOXt9ftk=
X-Received: by 2002:a05:6870:34b:b0:187:8ee8:5f5b with SMTP id
 n11-20020a056870034b00b001878ee85f5bmr7174102oaf.5.1681764319699; Mon, 17 Apr
 2023 13:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230417201215.448099-1-robdclark@gmail.com>
In-Reply-To: <20230417201215.448099-1-robdclark@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 17 Apr 2023 13:45:08 -0700
Message-ID: <CAF6AEGumgsJJQXojapPAJOjmFo=MZ31DNmp9T+SErQ2GBKBLFg@mail.gmail.com>
Subject: Re: [RFC 0/3] drm: Add comm/cmdline fdinfo fields
To: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 17, 2023 at 1:12=E2=80=AFPM Rob Clark <robdclark@gmail.com> wro=
te:
>
> From: Rob Clark <robdclark@chromium.org>
>
> When many of the things using the GPU are processes in a VM guest, the
> actual client process is just a proxy.  The msm driver has a way to let
> the proxy tell the kernel the actual VM client process's executable name
> and command-line, which has until now been used simply for GPU crash
> devcore dumps.  Lets also expose this via fdinfo so that tools can
> expose who the actual user of the GPU is.

I should have also mentioned, in the VM/proxy scenario we have a
single process with separate drm_file's for each guest VM process.  So
it isn't an option to just change the proxy process's name to match
the client.

> Rob Clark (3):
>   drm/doc: Relax fdinfo string constraints
>   drm/msm: Rework get_comm_cmdline() helper
>   drm/msm: Add comm/cmdline fields
>
>  Documentation/gpu/drm-usage-stats.rst   | 37 +++++++++++++++----------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  4 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  2 ++
>  drivers/gpu/drm/msm/msm_gpu.c           | 27 +++++++++++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           | 12 ++++++--
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  1 +
>  6 files changed, 58 insertions(+), 25 deletions(-)
>
> --
> 2.39.2
>
