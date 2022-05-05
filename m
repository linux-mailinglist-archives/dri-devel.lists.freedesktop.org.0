Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B0351B5D0
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 04:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C8510EBE5;
	Thu,  5 May 2022 02:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD4B10ED63;
 Thu,  5 May 2022 02:23:24 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e9027efe6aso3016532fac.10; 
 Wed, 04 May 2022 19:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A3ItVx1AlgQz9xrG3sUVb2odNuGC9onNLhKh26bH4o0=;
 b=nqO9L2ccR2RLv0hwu7Of1bMPd1ToYdb0OEmTNEdEXWBBQWWrawL5nsIcTfe7LHb8rk
 XgqmKSrJuZbBKIOQDX45VSItS592sCDghequZ1qAlJmU9Clu1OZ6+oCtugZLex8ADpz3
 NXe5rNZQlEtA7Sw/KGoatTdL8Egct9qIxptDzk/2kqUizNV5NMZYtq+ZXhwzpbXHSfUm
 JnXcUYoQdez9wkcQm573XA8sLUCgCBXZtSOKDQEn3Ka7c0x9DuLx05KfOCyi7xNoQOuZ
 dWlhsjjy6e9g/ti7uTyFr/djsXjmgf8dSERB2FWDic5SpEstVrFuzbb0ZnrKdSWUmRcq
 D2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A3ItVx1AlgQz9xrG3sUVb2odNuGC9onNLhKh26bH4o0=;
 b=hVPdzeLoJZv0r1aeZ35l5OOculzlhTwfrmgKACiCt7atltRulTuv4KSacghI6zzr5l
 Elb9NU6mCMoVsPpKgk165RT9HqxX0ewH7Z6df7ILG7vY0DagILk6JtFqaj9ZN0/uCupZ
 yymM0cDfU2os62HnL+M+h64xSZAhPLLiY9wzMJsM/HcR5L4EFUMod6X051FqWq74eTKZ
 SoEU4mnnq1cvFokKrCkwlTpEGzJ6uqSRxhvJl7BsjHWf0b98reVn9lQiT+FVfcNew+Me
 w9pnlmDN5QGnO9bW9vTue6/f4GVxtuZv8HDcBJDcDKWGlGBohoEeVeS0lfwvEJ+gOeO3
 OOxg==
X-Gm-Message-State: AOAM530QNPOsc9k+WA6UxfF9S4rRE0Iqvxx7oDLRPicUxvhxN9F4kB5w
 M+cLnGoE1RcrewJKrZubtRkKrKIIDCbVgbQTH7Q=
X-Google-Smtp-Source: ABdhPJxi2y6RMZ/DLsjgBCaLyfBSFPZir8BNrMgCe9x6p7v8seLLkdib9jOl2z7FHT9uGxCW8VAhJpM6K4D0fMy4Pdg=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr1186962oaa.200.1651717403721; Wed, 04
 May 2022 19:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220505021057.54044-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220505021057.54044-1-chi.minghao@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 4 May 2022 22:23:12 -0400
Message-ID: <CADnq5_MQRLDUD_XzHOBw=xBudLrHLbp4qGnYe-pTPouvGLD5sA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: simplify the return expression
To: CGEL <cgel.zte@gmail.com>
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Zeal Robot <zealci@zte.com.cn>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Minghao Chi <chi.minghao@zte.com.cn>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, May 4, 2022 at 10:11 PM <cgel.zte@gmail.com> wrote:
>
> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Simplify the return expression.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 54446162db8b..3d8093bf1679 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -4688,7 +4688,6 @@ static void gfx_v10_0_gpu_early_init(struct amdgpu_device *adev)
>  static int gfx_v10_0_gfx_ring_init(struct amdgpu_device *adev, int ring_id,
>                                    int me, int pipe, int queue)
>  {
> -       int r;
>         struct amdgpu_ring *ring;
>         unsigned int irq_type;
>
> @@ -4708,17 +4707,13 @@ static int gfx_v10_0_gfx_ring_init(struct amdgpu_device *adev, int ring_id,
>         sprintf(ring->name, "gfx_%d.%d.%d", ring->me, ring->pipe, ring->queue);
>
>         irq_type = AMDGPU_CP_IRQ_GFX_ME0_PIPE0_EOP + ring->pipe;
> -       r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
> +       return amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
>                              AMDGPU_RING_PRIO_DEFAULT, NULL);
> -       if (r)
> -               return r;
> -       return 0;
>  }
>
>  static int gfx_v10_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>                                        int mec, int pipe, int queue)
>  {
> -       int r;
>         unsigned irq_type;
>         struct amdgpu_ring *ring;
>         unsigned int hw_prio;
> @@ -4743,12 +4738,8 @@ static int gfx_v10_0_compute_ring_init(struct amdgpu_device *adev, int ring_id,
>         hw_prio = amdgpu_gfx_is_high_priority_compute_queue(adev, ring) ?
>                         AMDGPU_RING_PRIO_2 : AMDGPU_RING_PRIO_DEFAULT;
>         /* type-2 packets are deprecated on MEC, use type-3 instead */
> -       r = amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
> +       return amdgpu_ring_init(adev, ring, 1024, &adev->gfx.eop_irq, irq_type,
>                              hw_prio, NULL);
> -       if (r)
> -               return r;
> -
> -       return 0;
>  }
>
>  static int gfx_v10_0_sw_init(void *handle)
> --
> 2.25.1
>
>
