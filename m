Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A64A7707341
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 22:42:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B0F710E471;
	Wed, 17 May 2023 20:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9824210E471
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 20:42:36 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6ab174bb726so598249a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 13:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684356155; x=1686948155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZgjcIIHaIrUv/cWcI3J9scXd3fq/q7Z2jrBzvHuO/Q=;
 b=UY4Z4m/fszEAPFAfNys4VpAVNFrl94EYIRVRTrsWOgNt+wLFGtLDQpY4p7IJnfOaHH
 xgnb/xlRO4eiOXIUi697x3QLLfvj6x2OAVcmQNU47/GZ2oG0Fh5PA+mNuNzWeB/T3QD5
 kW1ny6kYH/aZyF4RnJ7DVKyIfM45yp9XFWefSn//0kpZVaumIMAYum625m5N4KmxrCCT
 SGb0rDxRSIG+O+frwKlsdlNxYMf8A8mT1SxQdF8PWEMXWQ0KG7PxrEPQ/qeg0oQQ4zUP
 /PlIj6+wNC+K5Iy3/YPxw/ceBYa+otQIdpTXzOoU2KXHKUu3EfDoGYr0UIOJyMjod0EE
 bMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684356155; x=1686948155;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZgjcIIHaIrUv/cWcI3J9scXd3fq/q7Z2jrBzvHuO/Q=;
 b=e68JduIvOwOQgV1elY9bFb5rkjlYxYpxWxYLsKNkaX9MvgRUZn3n8V3/YnvT5i1xfP
 A126uv/dRszUjvVy7WjVG5PiZqrMK8G1XkUka3v8ClGQ/lLGEnUsqy64eqG7isuxc44J
 MsfuanF/LJwuEMj4ZdQI478yHvB4oMqwmA8z70csaSNKp2Plyv0q0ZQRerCIkjwyPykf
 iAKkHoek/wnleNIdTVIEBB4sD0rW/3x0wLv3Nrrh09kuLxiQmrxrtnSWUUAntXEKsbhk
 FHUuwaLiaidJsn+VJQzg7kzFXyak/15zPIICPnAKtRzAJ1FE4wnErCbofR7i+jdYrbB5
 JTug==
X-Gm-Message-State: AC+VfDzdFzLCNooHweNi/O/ZHR5DOVk4JJSX63JHx9PG/vGPaqcxC5hH
 82yA8N/QIz3dxnv93bpUjf5imu8jq20xLOsj6xk=
X-Google-Smtp-Source: ACHHUZ5Ry1nigBcddViOUazxw+QHlUytjRNVqmDCRk00sA28QwOvHZNEghpC1qj6yeOmSflkgNeX7ju5Gi6KnnPvMZk=
X-Received: by 2002:a05:6870:7719:b0:184:5395:4e44 with SMTP id
 dw25-20020a056870771900b0018453954e44mr62534oab.28.1684356155276; Wed, 17 May
 2023 13:42:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230517190356.349044-1-luben.tuikov@amd.com>
In-Reply-To: <20230517190356.349044-1-luben.tuikov@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 17 May 2023 16:42:23 -0400
Message-ID: <CADnq5_MURtewWyy3-sAeYyy+cO-v35=SbDK0r15tQ0=Ank=8=Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/sched: Rename to drm_sched_can_queue()
To: Luben Tuikov <luben.tuikov@amd.com>
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
Cc: Alex Deucher <Alexander.Deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Direct Rendering Infrastructure - Development
 <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 3:04=E2=80=AFPM Luben Tuikov <luben.tuikov@amd.com>=
 wrote:
>
> Rename drm_sched_ready() to drm_sched_can_queue(). "ready" can mean many
> things and is thus meaningless in this context. Instead, rename to a name
> which precisely conveys what is being checked.
>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Alex Deucher <Alexander.Deucher@amd.com>
> Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 172e63c87bfcf3..8739322c30321b 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -848,13 +848,12 @@ void drm_sched_job_cleanup(struct drm_sched_job *jo=
b)
>  EXPORT_SYMBOL(drm_sched_job_cleanup);
>
>  /**
> - * drm_sched_ready - is the scheduler ready
> - *
> + * drm_sched_can_queue -- Can we queue more to the hardware?
>   * @sched: scheduler instance
>   *
>   * Return true if we can push more jobs to the hw, otherwise false.
>   */
> -static bool drm_sched_ready(struct drm_gpu_scheduler *sched)
> +static bool drm_sched_can_queue(struct drm_gpu_scheduler *sched)
>  {
>         return atomic_read(&sched->hw_rq_count) <
>                 sched->hw_submission_limit;
> @@ -868,7 +867,7 @@ static bool drm_sched_ready(struct drm_gpu_scheduler =
*sched)
>   */
>  void drm_sched_wakeup(struct drm_gpu_scheduler *sched)
>  {
> -       if (drm_sched_ready(sched))
> +       if (drm_sched_can_queue(sched))
>                 wake_up_interruptible(&sched->wake_up_worker);
>  }
>
> @@ -885,7 +884,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sch=
ed)
>         struct drm_sched_entity *entity;
>         int i;
>
> -       if (!drm_sched_ready(sched))
> +       if (!drm_sched_can_queue(sched))
>                 return NULL;
>
>         /* Kernel run queue has higher priority than normal run queue*/
>
> base-commit: f47d6140b7a4c858d82d263e7577ff6fb5279a9c
> --
> 2.40.1
>
