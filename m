Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91519931C51
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2024 23:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E327D10E524;
	Mon, 15 Jul 2024 21:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eP8c1cYC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF59510E51F;
 Mon, 15 Jul 2024 21:00:24 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-595856e2336so1145366a12.1; 
 Mon, 15 Jul 2024 14:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721077223; x=1721682023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ENhBd/giIBmvRGbAMxmpkg4562kxij7xYuSKRQdtVwY=;
 b=eP8c1cYCXp4vgXoAiXHit5m1U/1LQ71vKpUyxUvbpdykEQU8o6YDMujIIGkWgpBqw8
 fIhNOFRHc6u5y/LXY0haR0iKxNp5D6zpiihFt5O+T5PHBF957/e8ibrAKC9z5xQgpx6/
 Y7cfto0+GWPMsaJ+Ar11Ky/HngsHExipOVwqyrCWYODFWb91PxjW0BqUBSBhNFXQqLkc
 LpqCw5VqsvAU+9VfJBYZz88jlYUO6Muj3fiT2GqSbdUWKr+1V0k/mSkT5Xj0sNRRRNuZ
 LmLnPkYigcBCfg5fcNz3ED58XV4wSrn12t2gVDm/8g9FlOep838EsSDZq1PvTJxoqjT3
 fCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721077223; x=1721682023;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ENhBd/giIBmvRGbAMxmpkg4562kxij7xYuSKRQdtVwY=;
 b=KSC9MjzRCzeanaTVwIUpyv+mA2M+jMQ0I9Vke6Jlwb4KIWAoKzVM+joGbZQnfv/jf0
 u0uzvUWp0WFecwr8e6EhlFb8Jz3sxqxSv/hAZb2YWHNMYfnNtkaVloxpyBYK9k9TI5O3
 RGx6xtmCVuHcovQfago8sB6sMpvJK59CibxdmNA4I2KZTbB+fglqFEjuguUW7/KOLIyx
 WD7O0iQVByixsre6hUm1gK/5hZ3IF7GmyfstthcpKITQVlSC8VXbBBtxV/cFIAS+xNYO
 ulZAgjjKZoNXGZbB7FTfaip/ZhSJudcsi27FQKr3kkGqx2ltnFqCMQl8Z9t84e6lNJvR
 yfQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJYu4opGfoBDhsVFBXG6jqN1wXl0595y6tVpHk6wyc6wFvbPCdietDa4S8BpORzx1SDkXBZI745KC77EYZ/2Pkt1fiVUyZJ+k1D7cCERMJlEVSsy+kj01D08DOsrZBVV8FGWhyKWPA1u4sXh6FNKmQ
X-Gm-Message-State: AOJu0Yz+vuvKDlwX+bSy27fI7QBrxJ8/4MB9Wr7vVAYo8+Zs9CjgVK5v
 K7EjXhjhuWfezvwaRA5wyswliuswsOO7dggi7JPxUXNgqsAPnvBl9DuVDNw5rJ6tdcqZYV6CHxV
 WJwsCNI5RJdbzmR07rFxxaKp34mA=
X-Google-Smtp-Source: AGHT+IELtIRuj2IFPS5Auby4HYA8C0n5FWUVbyyAlN9va4Y+v2PBAGvwaktfslNPDacTrYXKOEvXvFlTGlHsl4ysZ4c=
X-Received: by 2002:a50:a6c3:0:b0:58c:10fd:5082 with SMTP id
 4fb4d7f45d1cf-59eefbabcadmr72316a12.10.1721077222774; Mon, 15 Jul 2024
 14:00:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240711100038.268803-1-vladimir.lypak@gmail.com>
 <20240711100038.268803-2-vladimir.lypak@gmail.com>
In-Reply-To: <20240711100038.268803-2-vladimir.lypak@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 15 Jul 2024 14:00:10 -0700
Message-ID: <CAF6AEGsyhQfsfyNwZQa99HSKxy6uXQvf=ikEijjLOBnkXJ=-2g@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/msm/a5xx: disable preemption in submits by default
To: Vladimir Lypak <vladimir.lypak@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 11, 2024 at 3:02=E2=80=AFAM Vladimir Lypak <vladimir.lypak@gmai=
l.com> wrote:
>
> Fine grain preemption (switching from/to points within submits)
> requires extra handling in command stream of those submits, especially
> when rendering with tiling (using GMEM). However this handling is
> missing at this point in mesa (and always was). For this reason we get
> random GPU faults and hangs if more than one priority level is used
> because local preemption is enabled prior to executing command stream
> from submit.
> With that said it was ahead of time to enable local preemption by
> default considering the fact that even on downstream kernel it is only
> enabled if requested via UAPI.
>
> Fixes: a7a4c19c36de ("drm/msm/a5xx: fix setting of the CP_PREEMPT_ENABLE_=
LOCAL register")
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a5xx_gpu.c
> index c0b5373e90d7..6c80d3003966 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -150,9 +150,13 @@ static void a5xx_submit(struct msm_gpu *gpu, struct =
msm_gem_submit *submit)
>         OUT_PKT7(ring, CP_SET_PROTECTED_MODE, 1);
>         OUT_RING(ring, 1);
>
> -       /* Enable local preemption for finegrain preemption */
> +       /*
> +        * Disable local preemption by default because it requires
> +        * user-space to be aware of it and provide additional handling
> +        * to restore rendering state or do various flushes on switch.
> +        */
>         OUT_PKT7(ring, CP_PREEMPT_ENABLE_LOCAL, 1);
> -       OUT_RING(ring, 0x1);
> +       OUT_RING(ring, 0x0);

From a quick look at the a530 pfp fw, it looks like
CP_PREEMPT_ENABLE_LOCAL is allowed in IB1/IB2 (ie. not restricted to
kernel RB).  So we should just disable it in the kernel, and let
userspace send a CP_PREEMPT_ENABLE_LOCAL to enable local preemption.

BR,
-R

>         /* Allow CP_CONTEXT_SWITCH_YIELD packets in the IB2 */
>         OUT_PKT7(ring, CP_YIELD_ENABLE, 1);
> --
> 2.45.2
>
