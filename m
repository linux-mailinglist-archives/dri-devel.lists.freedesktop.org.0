Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7DB51DCE5
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D5F10EC67;
	Fri,  6 May 2022 16:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D97A010EC67;
 Fri,  6 May 2022 16:06:05 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so7641993fac.4; 
 Fri, 06 May 2022 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WFYD1jtv4MA5LyJp0wwZQbqa5q7DVbRBltnx1dOLS0M=;
 b=Q6GMzu3yDKdD2l/P8Rj2/FCcd55ZuvN3ETDxp95fGf5PnnibB7rU7MdAqR3pJEsY34
 Stq5PX6X1kOx7lFSw9rlnYzyckX8AwFbICA/qsXLSs4Syq+pSKgozjQ6sIUyRRRvYBCa
 Iydt5yoDndp07Zaq1Ssi7Qqp0rEgAbcLQBBV7U+vQzPov2FT7WtfyRRshbYLwQAUdSo8
 bntFfRgRXuhSdRouyAvEc1OvC0tZuveq3ymvxMrclsCkCweBUNeFFsnaMe5w58rgk48a
 AW5DxTTTG4RLz4NtblJ1swjwJakzDOId13RF3nDL2c1We7HqeRLOlMVx5RePupkAtTAz
 AkOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WFYD1jtv4MA5LyJp0wwZQbqa5q7DVbRBltnx1dOLS0M=;
 b=6Rmjj82qcl54AW/jcI8TCYAmGAx0IKJuCBcQ5/nXooV1c+8zpa2j6O7lSaS+BV9aiX
 7q8F+oCl1A34zctsu99Jlp2wlAmkH0X09RQEA5B1ypPGFK4Nh9Y1sjgF0ltaZWLo7v7K
 Mer15W6wG6PK1Ju/1vA26euVr23egLHaNUjjDV8KGfbFAFyCQCkCHjrZxmyIYowQEh+8
 Tp0+8cK/6ddpewn41HLVB+Fn8f5mOQvVqeQGvHye5DI7o8A5mronY2YvvpxOW7cH6y7q
 Rho5ZykBBQo4PDj/L0d0KMReeIiewaqAhvkq0H7nsWZ9UfO1C9FVTSeFXK5myU8Ufe+7
 rxgA==
X-Gm-Message-State: AOAM531+W7csFT1B2cKQ4Rv2VTGbTSSBIFCaWo8KFkAvbAgTlvORk0Mz
 10Vlo6HJz3p420fb/IKP2twUrWH2evkYbYeZf3CfBKBvqrk=
X-Google-Smtp-Source: ABdhPJwo87Hs508g6ZdsuRY/hsmhIFexXOZO7iBLAGkYXXKy1oIC2sqTKW25TuRzhMTaJudebfNM+2FiDQNN8muD9b4=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr1649641oap.253.1651853165161; Fri, 06
 May 2022 09:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <1651802677-10154-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1651802677-10154-1-git-send-email-baihaowen@meizu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 May 2022 12:05:54 -0400
Message-ID: <CADnq5_M0-makbeLxNhgSaW01MMG_v5zMMRuqHi2u1G0wuiyxpg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: Return true/false (not 1/0) from bool
 functions
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 5, 2022 at 10:05 PM Haowen Bai <baihaowen@meizu.com> wrote:
>
> Return boolean values ("true" or "false") instead of 1 or 0 from bool
> functions.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>

Thanks, I just applied the same fix from someone else.

Alex

> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> index c3919aaa76e6..1431f0961769 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c
> @@ -241,14 +241,14 @@ static bool event_interrupt_isr_v11(struct kfd_dev *dev,
>         if (/*!KFD_IRQ_IS_FENCE(client_id, source_id) &&*/
>             (vmid < dev->vm_info.first_vmid_kfd ||
>             vmid > dev->vm_info.last_vmid_kfd))
> -               return 0;
> +               return false;
>
>         pasid = SOC15_PASID_FROM_IH_ENTRY(ih_ring_entry);
>         context_id0 = SOC15_CONTEXT_ID0_FROM_IH_ENTRY(ih_ring_entry);
>
>         if ((source_id == SOC15_INTSRC_CP_END_OF_PIPE) &&
>             (context_id0 & AMDGPU_FENCE_MES_QUEUE_FLAG))
> -               return 0;
> +               return false;
>
>         pr_debug("client id 0x%x, source id %d, vmid %d, pasid 0x%x. raw data:\n",
>                  client_id, source_id, vmid, pasid);
> @@ -258,7 +258,7 @@ static bool event_interrupt_isr_v11(struct kfd_dev *dev,
>
>         /* If there is no valid PASID, it's likely a bug */
>         if (WARN_ONCE(pasid == 0, "Bug: No PASID in KFD interrupt"))
> -               return 0;
> +               return false;
>
>         /* Interrupt types we care about: various signals and faults.
>          * They will be forwarded to a work queue (see below).
> --
> 2.7.4
>
