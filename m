Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A96E00DC
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 23:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1B010E994;
	Wed, 12 Apr 2023 21:29:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F271E10E994
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 21:29:42 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-54f6fc7943eso126939157b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1681334980; x=1683926980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qIFurHY4aPiYQuUul9p4NVclPM+cy68RDu8zSAULlSk=;
 b=WEU63ujznZh2FcZqfQgowPZU2HcBYvcEMe/zC1BxEKqLnXcHH561gRAmJOIfzm8S4k
 4hiI/ecM/AOOmcyqoraeX+t2VSf0M3eu98eCH0Rv5ZM21WNnine1/WxcyLhEsQUopmqJ
 SxmJbvKC+Twhth5ppCg4C1yp7y2ckq/G5IjxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681334980; x=1683926980;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qIFurHY4aPiYQuUul9p4NVclPM+cy68RDu8zSAULlSk=;
 b=U3q7TvzPJWaPJDKEr1cNlcAzPXb28dy2FFZ+xRndskoXEb2QPnYtoUB/zeQQ/LT1R6
 GtLmTqMlsTR/kSrfoTBDqeajJPbPj2TpveWCGFfFNSE3mlbpXdcN6YIgkQsphoQGuDPz
 76hkGmGEvlEZUdhY3KgFcBFJSYMNJfA0R4Pj2iQhNZex3Rq+AGpDMVFQiVk4vXZJJ9fT
 uOnu+zeQfSOPQee8SvxyFtwNhLTgo1XLTXNKZRg23FesqPmAWI/2rSbmQqOLQUZguY4h
 RGdBk303ikozwmz3LxvwCIuOxApP9ghRnjJ7hhT3EBhdX2QajGN4jX4ltwxuh+ubzMWD
 3lgQ==
X-Gm-Message-State: AAQBX9dod+C6FjwUwt9DJIK3Z+CPIi8j6gcBGk+L929hm7mLiQpGUwkB
 uJbV8pXxB1yZQeFgucoVKyPnhMNy4hwTAzKwCFg=
X-Google-Smtp-Source: AKy350Z6T85FlKjd3ATpjgmi+l8pdiCAWxAQVf2rQHBcIlmfE1Imsi9QatNEMOzo/jHb1BrYBUbAZg==
X-Received: by 2002:a81:5d89:0:b0:544:75c2:d4a1 with SMTP id
 r131-20020a815d89000000b0054475c2d4a1mr15703088ywb.17.1681334979833; 
 Wed, 12 Apr 2023 14:29:39 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com.
 [209.85.128.173]) by smtp.gmail.com with ESMTPSA id
 dc21-20020a05690c0f1500b00545a08184d8sm4437527ywb.104.2023.04.12.14.29.38
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 14:29:39 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-54ee0b73e08so247524467b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 14:29:38 -0700 (PDT)
X-Received: by 2002:a81:c145:0:b0:545:1d7f:abfe with SMTP id
 e5-20020a81c145000000b005451d7fabfemr10843020ywl.7.1681334978361; Wed, 12 Apr
 2023 14:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230410165908.3094626-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230410165908.3094626-1-dmitry.baryshkov@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 12 Apr 2023 14:29:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XpPLU+_pC9MWskhm8nu8X1dmt-8dhzaYqo1J+sbBdDkA@mail.gmail.com>
Message-ID: <CAD=FV=XpPLU+_pC9MWskhm8nu8X1dmt-8dhzaYqo1J+sbBdDkA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: initialize GMU mutex earlier
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Apr 10, 2023 at 9:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Move GMU mutex initialization earlier to make sure that it is always
> initialized. a6xx_destroy can be called from ther failure path before
> GMU initialization.
>
> This fixes the following backtrace:
>
> ------------[ cut here ]------------
> DEBUG_LOCKS_WARN_ON(lock->magic !=3D lock)
> WARNING: CPU: 0 PID: 58 at kernel/locking/mutex.c:582 __mutex_lock+0x1ec/=
0x3d0
> Modules linked in:
> CPU: 0 PID: 58 Comm: kworker/u16:1 Not tainted 6.3.0-rc5-00155-g187c06436=
519 #565
> Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=3D--)
> pc : __mutex_lock+0x1ec/0x3d0
> lr : __mutex_lock+0x1ec/0x3d0
> sp : ffff800008993620
> x29: ffff800008993620 x28: 0000000000000002 x27: ffff47b253c52800
> x26: 0000000001000606 x25: ffff47b240bb2810 x24: fffffffffffffff4
> x23: 0000000000000000 x22: ffffc38bba15ac14 x21: 0000000000000002
> x20: ffff800008993690 x19: ffff47b2430cc668 x18: fffffffffffe98f0
> x17: 6f74616c75676572 x16: 20796d6d75642067 x15: 0000000000000038
> x14: 0000000000000000 x13: ffffc38bbba050b8 x12: 0000000000000666
> x11: 0000000000000222 x10: ffffc38bbba603e8 x9 : ffffc38bbba050b8
> x8 : 00000000ffffefff x7 : ffffc38bbba5d0b8 x6 : 0000000000000222
> x5 : 000000000000bff4 x4 : 40000000fffff222 x3 : 0000000000000000
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff47b240cb1880
> Call trace:
>  __mutex_lock+0x1ec/0x3d0
>  mutex_lock_nested+0x2c/0x38
>  a6xx_destroy+0xa0/0x138
>  a6xx_gpu_init+0x41c/0x618
>  adreno_bind+0x188/0x290
>  component_bind_all+0x118/0x248
>  msm_drm_bind+0x1c0/0x670
>  try_to_bring_up_aggregate_device+0x164/0x1d0
>  __component_add+0xa8/0x16c
>  component_add+0x14/0x20
>  dsi_dev_attach+0x20/0x2c
>  dsi_host_attach+0x9c/0x144
>  devm_mipi_dsi_attach+0x34/0xac
>  lt9611uxc_attach_dsi.isra.0+0x84/0xfc
>  lt9611uxc_probe+0x5b8/0x67c
>  i2c_device_probe+0x1ac/0x358
>  really_probe+0x148/0x2ac
>  __driver_probe_device+0x78/0xe0
>  driver_probe_device+0x3c/0x160
>  __device_attach_driver+0xb8/0x138
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0x9c/0x188
>  device_initial_probe+0x14/0x20
>  bus_probe_device+0xac/0xb0
>  deferred_probe_work_func+0x8c/0xc8
>  process_one_work+0x2bc/0x594
>  worker_thread+0x228/0x438
>  kthread+0x108/0x10c
>  ret_from_fork+0x10/0x20
> irq event stamp: 299345
> hardirqs last  enabled at (299345): [<ffffc38bb9ba61e4>] put_cpu_partial+=
0x1c8/0x22c
> hardirqs last disabled at (299344): [<ffffc38bb9ba61dc>] put_cpu_partial+=
0x1c0/0x22c
> softirqs last  enabled at (296752): [<ffffc38bb9890434>] _stext+0x434/0x4=
e8
> softirqs last disabled at (296741): [<ffffc38bb989669c>] ____do_softirq+0=
x10/0x1c
> ---[ end trace 0000000000000000 ]---
>
> Fixes: 4cd15a3e8b36 ("drm/msm/a6xx: Make GPU destroy a bit safer")
> Cc: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 --
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)

Sorry for the breakage and thanks for the fix!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
