Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A0F804E28
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 10:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79810E235;
	Tue,  5 Dec 2023 09:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A03C510E235
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 09:42:31 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50c0478f970so581835e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 01:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701769350; x=1702374150; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/y3Vg5ki+IoMj7omIloPoDeW/5zFvlvLCGnQkp6xOOk=;
 b=Matkz7Gytd2NbJ2+BblgfzBR6lL575CAbqNc/kDnhk9l2eeSzjtNd2a//mnWp/owHt
 skhfKOhlglQseyXmOObpqr5DpBN/UnGOlnBOuo186kH8qMHQX9gURTJ7e+59c1s1CDDf
 G8OVlWK6MU+3p5al9W9Y61ZcirbmCl92s2KYVYMEUdC6GGUHzsdISyMUJYtFxAF6tQCS
 ACNaBHZisLCp/CmjjuuOAgCLwqCu6T4roZL6I6ghdY44dtKCxiIbOCV/pPArR31+syup
 f+Yiklo28UjyIfONEWMp5nld61feyVDeqpeZkeIGEUqw0a41IBjBL7GpZYjXAsWZnaWH
 9GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701769350; x=1702374150;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/y3Vg5ki+IoMj7omIloPoDeW/5zFvlvLCGnQkp6xOOk=;
 b=MLFNl7dAHm0DImZMQplAfY/M7eTQYTm8ItsaJa5hLSm187FxPw8Sd4Zg5loISeeMmY
 ZUsM/kWsVbu2IQv7jmhFKy98m7Qqp1Buue1Dh8CNVpUZ38+ts61CvmS3lRsRFm1cY7M0
 Yyb6n2AxG+72XuUY772gwGvjEoPhj0Qpxii9JV8NfrNW1hjIaYiepFSw/ejJf908zN5K
 gAWnWKk7psjjc8UCSszDwOKeL61wGa8w24UE1l+xZN2JFi+l0Fu5iDMdVaDr4L//HFQj
 RyaWEAlGANMq3Ab6tvi3VMQzxjMmDsno45pUAn/uQfEhkz9blxuwtMm4bjNSnT22at7U
 8xdw==
X-Gm-Message-State: AOJu0YwSOwcPOOnLjT4t7IoLU2vQLGHDMVvvsJjnX02XG/6fYg8Rcr5V
 VBzYxOs9I7zt1yC8ucA/5obVTu+Knim2fpipZ30=
X-Google-Smtp-Source: AGHT+IGBBBOmFjy2mDfjtMOLbPU/i+V1nTj2x+JU6qAs87SU8aApQrS6005KuSXneAspHONFY0l1PqVX3TOZGhOQMME=
X-Received: by 2002:ac2:4542:0:b0:50b:f820:ae36 with SMTP id
 j2-20020ac24542000000b0050bf820ae36mr1214892lfm.66.1701769349320; Tue, 05 Dec
 2023 01:42:29 -0800 (PST)
MIME-Version: 1.0
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-7-boris.brezillon@collabora.com>
In-Reply-To: <20231204173313.2098733-7-boris.brezillon@collabora.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Tue, 5 Dec 2023 10:42:17 +0100
Message-ID: <CAJiuCcftQ13n+NR4=Bv7EsYrKMsRC1u6xLKdSLxRWzOe7A7TWw@mail.gmail.com>
Subject: Re: [PATCH v3 06/14] drm/panthor: Add the devfreq logical block
To: Boris Brezillon <boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Grant Likely <grant.likely@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

On Mon, 4 Dec 2023 at 18:33, Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> Every thing related to devfreq in placed in panthor_devfreq.c, and
> helpers that can be called by other logical blocks are exposed through
> panthor_devfreq.h.
>
> This implementation is loosely based on the panfrost implementation,
> the only difference being that we don't count device users, because
> the idle/active state will be managed by the scheduler logic.
>
> v3:
> - Add acks for the MIT/GPL2 relicensing
>
> v2:
> - Added in v2
>
> Cc: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com> # MIT+GPL2 relicensing

For the MIT+GPL2 relicensing.

Acked-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>

> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Acked-by: Steven Price <steven.price@arm.com> # MIT+GPL2 relicensing,Arm
> Acked-by: Grant Likely <grant.likely@linaro.org> # MIT+GPL2 relicensing,L=
inaro
> Acked-by: Boris Brezillon <boris.brezillon@collabora.com> # MIT+GPL2 reli=
censing,Collabora
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 283 ++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  25 ++
>  2 files changed, 308 insertions(+)
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.c
>  create mode 100644 drivers/gpu/drm/panthor/panthor_devfreq.h
>
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/=
panthor/panthor_devfreq.c
> new file mode 100644
> index 000000000000..dd28b15337d4
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -0,0 +1,283 @@
> +// SPDX-License-Identifier: GPL-2.0 or MIT
> +/* Copyright 2019 Collabora ltd. */
> +
> +#include <linux/clk.h>
> +#include <linux/devfreq.h>
> +#include <linux/devfreq_cooling.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_opp.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "panthor_device.h"
> +#include "panthor_devfreq.h"
> +
> +/**
> + * struct panthor_devfreq - Device frequency management
> + */
> +struct panthor_devfreq {
> +       /** @devfreq: devfreq device. */
> +       struct devfreq *devfreq;
> +
> +       /** @gov_data: Governor data. */
> +       struct devfreq_simple_ondemand_data gov_data;
> +
> +       /** @busy_time: Busy time. */
> +       ktime_t busy_time;
> +
> +       /** @idle_time: Idle time. */
> +       ktime_t idle_time;
> +
> +       /** @time_last_update: Last update time. */
> +       ktime_t time_last_update;
> +
> +       /** @last_busy_state: True if the GPU was busy last time we updat=
ed the state. */
> +       bool last_busy_state;
> +
> +       /*
> +        * @lock: Lock used to protect busy_time, idle_time, time_last_up=
date and
> +        * last_busy_state.
> +        *
> +        * These fields can be accessed concurrently by panthor_devfreq_g=
et_dev_status()
> +        * and panthor_devfreq_record_{busy,idle}().
> +        */
> +       spinlock_t lock;
> +};
> +
> +static void panthor_devfreq_update_utilization(struct panthor_devfreq *p=
devfreq)
> +{
> +       ktime_t now, last;
> +
> +       now =3D ktime_get();
> +       last =3D pdevfreq->time_last_update;
> +
> +       if (pdevfreq->last_busy_state)
> +               pdevfreq->busy_time +=3D ktime_sub(now, last);
> +       else
> +               pdevfreq->idle_time +=3D ktime_sub(now, last);
> +
> +       pdevfreq->time_last_update =3D now;
> +}
> +
> +static int panthor_devfreq_target(struct device *dev, unsigned long *fre=
q,
> +                                 u32 flags)
> +{
> +       struct dev_pm_opp *opp;
> +
> +       opp =3D devfreq_recommended_opp(dev, freq, flags);
> +       if (IS_ERR(opp))
> +               return PTR_ERR(opp);
> +       dev_pm_opp_put(opp);
> +
> +       return dev_pm_opp_set_rate(dev, *freq);
> +}
> +
> +static void panthor_devfreq_reset(struct panthor_devfreq *pdevfreq)
> +{
> +       pdevfreq->busy_time =3D 0;
> +       pdevfreq->idle_time =3D 0;
> +       pdevfreq->time_last_update =3D ktime_get();
> +}
> +
> +static int panthor_devfreq_get_dev_status(struct device *dev,
> +                                         struct devfreq_dev_status *stat=
us)
> +{
> +       struct panthor_device *ptdev =3D dev_get_drvdata(dev);
> +       struct panthor_devfreq *pdevfreq =3D ptdev->devfreq;
> +       unsigned long irqflags;
> +
> +       status->current_frequency =3D clk_get_rate(ptdev->clks.core);
> +
> +       spin_lock_irqsave(&pdevfreq->lock, irqflags);
> +
> +       panthor_devfreq_update_utilization(pdevfreq);
> +
> +       status->total_time =3D ktime_to_ns(ktime_add(pdevfreq->busy_time,
> +                                                  pdevfreq->idle_time));
> +
> +       status->busy_time =3D ktime_to_ns(pdevfreq->busy_time);
> +
> +       panthor_devfreq_reset(pdevfreq);
> +
> +       spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
> +
> +       drm_dbg(&ptdev->base, "busy %lu total %lu %lu %% freq %lu MHz\n",
> +               status->busy_time, status->total_time,
> +               status->busy_time / (status->total_time / 100),
> +               status->current_frequency / 1000 / 1000);
> +
> +       return 0;
> +}
> +
> +static struct devfreq_dev_profile panthor_devfreq_profile =3D {
> +       .timer =3D DEVFREQ_TIMER_DELAYED,
> +       .polling_ms =3D 50, /* ~3 frames */
> +       .target =3D panthor_devfreq_target,
> +       .get_dev_status =3D panthor_devfreq_get_dev_status,
> +};
> +
> +int panthor_devfreq_init(struct panthor_device *ptdev)
> +{
> +       /* There's actually 2 regulators (mali and sram), but the OPP cor=
e only
> +        * supports one.
> +        *
> +        * We assume the sram regulator is coupled with the mali one and =
let
> +        * the coupling logic deal with voltage updates.
> +        */
> +       static const char * const reg_names[] =3D { "mali", NULL };
> +       struct thermal_cooling_device *cooling;
> +       struct device *dev =3D ptdev->base.dev;
> +       struct panthor_devfreq *pdevfreq;
> +       struct dev_pm_opp *opp;
> +       unsigned long cur_freq;
> +       int ret;
> +
> +       pdevfreq =3D drmm_kzalloc(&ptdev->base, sizeof(*ptdev->devfreq), =
GFP_KERNEL);
> +       if (!pdevfreq)
> +               return -ENOMEM;
> +
> +       ptdev->devfreq =3D pdevfreq;
> +
> +       ret =3D devm_pm_opp_set_regulators(dev, reg_names);
> +       if (ret) {
> +               if (ret !=3D -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n=
");
> +
> +               return ret;
> +       }
> +
> +       ret =3D devm_pm_opp_of_add_table(dev);
> +       if (ret)
> +               return ret;
> +
> +       spin_lock_init(&pdevfreq->lock);
> +
> +       panthor_devfreq_reset(pdevfreq);
> +
> +       cur_freq =3D clk_get_rate(ptdev->clks.core);
> +
> +       opp =3D devfreq_recommended_opp(dev, &cur_freq, 0);
> +       if (IS_ERR(opp))
> +               return PTR_ERR(opp);
> +
> +       panthor_devfreq_profile.initial_freq =3D cur_freq;
> +
> +       /* Regulator coupling only takes care of synchronizing/balancing =
voltage
> +        * updates, but the coupled regulator needs to be enabled manuall=
y.
> +        *
> +        * We use devm_regulator_get_enable_optional() and keep the sram =
supply
> +        * enabled until the device is removed, just like we do for the m=
ali
> +        * supply, which is enabled when dev_pm_opp_set_opp(dev, opp) is =
called,
> +        * and disabled when the opp_table is torn down, using the devm a=
ction.
> +        *
> +        * If we really care about disabling regulators on suspend, we sh=
ould:
> +        * - use devm_regulator_get_optional() here
> +        * - call dev_pm_opp_set_opp(dev, NULL) before leaving this funct=
ion
> +        *   (this disables the regulator passed to the OPP layer)
> +        * - call dev_pm_opp_set_opp(dev, NULL) and
> +        *   regulator_disable(ptdev->regulators.sram) in
> +        *   panthor_devfreq_suspend()
> +        * - call dev_pm_opp_set_opp(dev, default_opp) and
> +        *   regulator_enable(ptdev->regulators.sram) in
> +        *   panthor_devfreq_resume()
> +        *
> +        * But without knowing if it's beneficial or not (in term of powe=
r
> +        * consumption), or how much it slows down the suspend/resume ste=
ps,
> +        * let's just keep regulators enabled for the device lifetime.
> +        */
> +       ret =3D devm_regulator_get_enable_optional(dev, "sram");
> +       if (ret && ret !=3D -ENODEV) {
> +               if (ret !=3D -EPROBE_DEFER)
> +                       DRM_DEV_ERROR(dev, "Couldn't retrieve/enable sram=
 supply\n");
> +               return ret;
> +       }
> +
> +       /*
> +        * Set the recommend OPP this will enable and configure the regul=
ator
> +        * if any and will avoid a switch off by regulator_late_cleanup()
> +        */
> +       ret =3D dev_pm_opp_set_opp(dev, opp);
> +       if (ret) {
> +               DRM_DEV_ERROR(dev, "Couldn't set recommended OPP\n");
> +               return ret;
> +       }
> +
> +       dev_pm_opp_put(opp);
> +
> +       /*
> +        * Setup default thresholds for the simple_ondemand governor.
> +        * The values are chosen based on experiments.
> +        */
> +       pdevfreq->gov_data.upthreshold =3D 45;
> +       pdevfreq->gov_data.downdifferential =3D 5;
> +
> +       pdevfreq->devfreq =3D devm_devfreq_add_device(dev, &panthor_devfr=
eq_profile,
> +                                                   DEVFREQ_GOV_SIMPLE_ON=
DEMAND,
> +                                                   &pdevfreq->gov_data);
> +       if (IS_ERR(pdevfreq->devfreq)) {
> +               DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
> +               ret =3D PTR_ERR(pdevfreq->devfreq);
> +               pdevfreq->devfreq =3D NULL;
> +               return ret;
> +       }
> +
> +       cooling =3D devfreq_cooling_em_register(pdevfreq->devfreq, NULL);
> +       if (IS_ERR(cooling))
> +               DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> +
> +       return 0;
> +}
> +
> +int panthor_devfreq_resume(struct panthor_device *ptdev)
> +{
> +       struct panthor_devfreq *pdevfreq =3D ptdev->devfreq;
> +
> +       if (!pdevfreq->devfreq)
> +               return 0;
> +
> +       panthor_devfreq_reset(pdevfreq);
> +
> +       return devfreq_resume_device(pdevfreq->devfreq);
> +}
> +
> +int panthor_devfreq_suspend(struct panthor_device *ptdev)
> +{
> +       struct panthor_devfreq *pdevfreq =3D ptdev->devfreq;
> +
> +       if (!pdevfreq->devfreq)
> +               return 0;
> +
> +       return devfreq_suspend_device(pdevfreq->devfreq);
> +}
> +
> +void panthor_devfreq_record_busy(struct panthor_device *ptdev)
> +{
> +       struct panthor_devfreq *pdevfreq =3D ptdev->devfreq;
> +       unsigned long irqflags;
> +
> +       if (!pdevfreq->devfreq)
> +               return;
> +
> +       spin_lock_irqsave(&pdevfreq->lock, irqflags);
> +
> +       panthor_devfreq_update_utilization(pdevfreq);
> +       pdevfreq->last_busy_state =3D true;
> +
> +       spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
> +}
> +
> +void panthor_devfreq_record_idle(struct panthor_device *ptdev)
> +{
> +       struct panthor_devfreq *pdevfreq =3D ptdev->devfreq;
> +       unsigned long irqflags;
> +
> +       if (!pdevfreq->devfreq)
> +               return;
> +
> +       spin_lock_irqsave(&pdevfreq->lock, irqflags);
> +
> +       panthor_devfreq_update_utilization(pdevfreq);
> +       pdevfreq->last_busy_state =3D false;
> +
> +       spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/=
panthor/panthor_devfreq.h
> new file mode 100644
> index 000000000000..875fbb5a1c1b
> --- /dev/null
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 or MIT */
> +/* Copyright 2019 Collabora ltd. */
> +
> +#ifndef __PANTHOR_DEVFREQ_H__
> +#define __PANTHOR_DEVFREQ_H__
> +
> +#include <linux/devfreq.h>
> +#include <linux/spinlock.h>
> +#include <linux/ktime.h>
> +
> +struct devfreq;
> +struct thermal_cooling_device;
> +
> +struct panthor_device;
> +struct panthor_devfreq;
> +
> +int panthor_devfreq_init(struct panthor_device *ptdev);
> +
> +int panthor_devfreq_resume(struct panthor_device *ptdev);
> +int panthor_devfreq_suspend(struct panthor_device *ptdev);
> +
> +void panthor_devfreq_record_busy(struct panthor_device *ptdev);
> +void panthor_devfreq_record_idle(struct panthor_device *ptdev);
> +
> +#endif /* __PANTHOR_DEVFREQ_H__ */
> --
> 2.43.0
>
