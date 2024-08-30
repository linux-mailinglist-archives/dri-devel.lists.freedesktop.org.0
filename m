Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97648966ABE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 22:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EBF10E076;
	Fri, 30 Aug 2024 20:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UW3TubCd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B61410E076;
 Fri, 30 Aug 2024 20:37:13 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-3df0c4a65baso1259271b6e.2; 
 Fri, 30 Aug 2024 13:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725050232; x=1725655032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o+kQe6VsLr0w8NPho0fLf/Dst/MLp8Ox6OpvKwqHs6A=;
 b=UW3TubCdX3C8d0iD0Q5K8ljD+hpwatFILxe3o9gCfmQR8aEKhp//IiMQfCWowsX81M
 bmbRYeKYHPciTdZEud9R254TuvvM9juSA0MmzTCShjm4tT0Ul5Atdnf+iLrIAQ0+ifK1
 oflbd/4WHjT+2tQWdH+UuGpbyVbr0RhrJDVPJloAl2wugr7+Xj/7VHiOfZUU+mgZXldg
 dyEHbZMuBrlhixjRMhSmaWF7SFiV2QuyE6GKjpImvzunBOcDl/LuIvmOTcBxUpjiRVut
 2HYjxgbGn/MQ9emC7vJJMpxkLaUUH8LaVy34nnpmBKxBn985V+5HyPXzqeRFWbp1ScZA
 cGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725050232; x=1725655032;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o+kQe6VsLr0w8NPho0fLf/Dst/MLp8Ox6OpvKwqHs6A=;
 b=lOpkTgMMhhOAXc7Zy5GqQxZIfZfpfR70qE1GOxOsv4QzNKItPG4Y4+EsOW1Y2Iw+o1
 IPiONO79Pw4VaYfPt+ZPU3pNZ33JhFh7QppTyj8B81AJbROJKlt8CDJXli0tmQvrgxnV
 ep4MKd1k9CBdI87+VQasLrwgX8KVW5h2SIJR0elBiJIskcskmOHXyarmMYItGQ56qbwJ
 bXmiW4jRY52MbJUiEsfvsx33WGyoDWCpFrh/lA5qca3GhdvGIzF8a5+DFFH+wHFX2RvC
 JoblEFDICN4Gp+2arTeNf0ZnDz1D8+Khe356Dvxb6a9qd8G/Fjf+lTs1DwTX5OAFEjAP
 cjwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrYfpMOAKc5gitcxvCBQZmqtKXlDekaQDcnNhR7ByhMwFsneyeaebYojrpD8NN566czJ69I6am1rc=@lists.freedesktop.org,
 AJvYcCXsqwDjtzOijur0slRfDzMm9Vi80vS+/+jOu3z2RZHkw/6gmvCuvcdVUy6DISaMnYZgZa/bnUTY1kB2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwV/nW1zoddTdjNEZxbGelYNEMdQ+mShPFUGx4sxmdCQtZeUeQE
 22aYnq2ClZVdnKDvsTqhzWIWQYWfJoQnqh07w3lqi6fnwHm6SVnLHf30HxCjNegeM9SlMKmUUKB
 UGXYAhDtWlJtj1j+f7ctS08FNY40=
X-Google-Smtp-Source: AGHT+IGBK5VzsLTg+8hHTDlEwYoRoCMP3HK0fagxgjtTycr60ZVf6Hnz+b7BKk+/0NUyK2hlKcW4jKAotktIaq2r89c=
X-Received: by 2002:a05:6808:144c:b0:3da:bc80:b233 with SMTP id
 5614622812f47-3df05d6e387mr8639762b6e.17.1725050232471; Fri, 30 Aug 2024
 13:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240830-preemption-a750-t-v2-0-86aeead2cd80@gmail.com>
 <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
In-Reply-To: <20240830-preemption-a750-t-v2-4-86aeead2cd80@gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 30 Aug 2024 13:36:59 -0700
Message-ID: <CAF6AEGuMah=C_i1qqaAP+Pz5t=bX5+Tq4Mq6HXoSeyWpaj7Cqw@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] drm/msm/A6xx: Implement preemption for A7XX targets
To: Antonino Maniscalco <antomani103@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
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

On Fri, Aug 30, 2024 at 8:33=E2=80=AFAM Antonino Maniscalco
<antomani103@gmail.com> wrote:
>
> This patch implements preemption feature for A6xx targets, this allows
> the GPU to switch to a higher priority ringbuffer if one is ready. A6XX
> hardware as such supports multiple levels of preemption granularities,
> ranging from coarse grained(ringbuffer level) to a more fine grained
> such as draw-call level or a bin boundary level preemption. This patch
> enables the basic preemption level, with more fine grained preemption
> support to follow.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
> ---
>  drivers/gpu/drm/msm/Makefile              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 323 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 168 ++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 431 ++++++++++++++++++++++++=
++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      |   7 +
>  5 files changed, 921 insertions(+), 9 deletions(-)
>

[snip]

> +void a6xx_preempt_trigger(struct msm_gpu *gpu)
> +{
> +       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu =3D to_a6xx_gpu(adreno_gpu);
> +       u64 preempt_offset_priv_secure;
> +       unsigned long flags;
> +       struct msm_ringbuffer *ring;
> +       uint64_t user_ctx_iova;
> +       unsigned int cntl;
> +
> +       if (gpu->nr_rings =3D=3D 1)
> +               return;
> +
> +       /*
> +        * Lock to make sure another thread attempting preemption doesn't=
 skip it
> +        * while we are still evaluating the next ring. This makes sure t=
he other
> +        * thread does start preemption if we abort it and avoids a soft =
lock.
> +        */
> +       spin_lock_irqsave(&a6xx_gpu->eval_lock, flags);
> +
> +       /*
> +        * Try to start preemption by moving from NONE to START. If
> +        * unsuccessful, a preemption is already in flight
> +        */
> +       if (!try_preempt_state(a6xx_gpu, PREEMPT_NONE, PREEMPT_START)) {
> +               spin_unlock_irqrestore(&a6xx_gpu->eval_lock, flags);
> +               return;
> +       }
> +
> +       cntl =3D (((a6xx_gpu->preempt_level << 6) & 0xC0) |
> +               ((a6xx_gpu->skip_save_restore << 9) & 0x200) |
> +               ((a6xx_gpu->uses_gmem << 8) & 0x100) | 0x1);

nit, could we define these fields in the xml, and not open-code
register building?

BR,
-R
