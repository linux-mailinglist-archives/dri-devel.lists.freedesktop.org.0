Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01CD51DCDB
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 18:04:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2E410E73D;
	Fri,  6 May 2022 16:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC25410E4C2;
 Fri,  6 May 2022 16:04:32 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so7629279fac.7; 
 Fri, 06 May 2022 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qDk8CLpGRoVS/nwhqjQcSZZPJtApcIin/4k05h1/9dQ=;
 b=k9ASF4o+zPpG8um1hBui3JtPfn+7sZeylk1K8M1/Z0zTdpqY05/keSvxcQviqyqfX5
 uYcaR/jGP63IklF1ElrKpy76Amh/FA7ZV3lh7+wdoisgbEWVB2cFOldPvZ5tzxLfG5rA
 0H6KPWAMoElssOOKoHWDR+kjcp8/T/Ex9r8yxnzF0HOO22tPCSqtyJJs+9TmfHZZjBC/
 DO+zVKhW6F0PX/HFlh13IHyGnNnC0vqoNPNEgbh330DGD2nDCzHuqNniAsMLX/mHLVe6
 CUD5yAILef0nRPVuUGkI9EORUlV+DF52Hm8TfG906EBDKsOp17O6X0saCqVFcrC6RpiE
 wedA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qDk8CLpGRoVS/nwhqjQcSZZPJtApcIin/4k05h1/9dQ=;
 b=JuPQTfbnC32kaGlw6/Aj6XNv5Xl7LanWzIkcpnYOgtU0OcR2n7CLXWn0UqCufuTn0x
 rJA9HbSO7InEXsKGdihvVwMMgqx7Y6zGMY4KWHb0Dvy3ou6MYu7+Z6GNnp2EWEc8OeR+
 W5IOnK2h33o0JS7QTykrxjYTRu0u1TyxxSfiqaudFwu5YV/7lgZrg35sYscKZqxFCO9k
 aQ6CfTFlX0VHlybrvgj3w3yyvwlpIFr3AegXzo4rVDtJ3jxmqc4q69S1vYLmByx/QUFx
 MjBweF6SoY1j3WwyjkUNLst+u0UAi87WOK2k+2Ae3dvd+UCQthDQQ0ttMwqAUQ46J8Ch
 wyiw==
X-Gm-Message-State: AOAM533H048a5kc3QNo6DOT6YY00vm0iU/tX7D1x1lV6PG5445S7nrWz
 hGDF7C7bvxB2uS6oRteR0EimPEAdr7ZIC5mDySI=
X-Google-Smtp-Source: ABdhPJw+NxCjtZCwZoT1SPToIWlf3F2AZG01IK+k6OAXZP1VvMETGiq/IXGbU5zuneU6f/ritu5vQyqtnNCtn5PT4Xs=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr1644821oap.253.1651853071705; Fri, 06
 May 2022 09:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220505232312.129997-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220505232312.129997-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 6 May 2022 12:04:20 -0400
Message-ID: <CADnq5_NWmHJHFtnMJfHYdQsBPGOAXcS2XR1vC1XYWjMrHKRGQw@mail.gmail.com>
Subject: Re: [PATCH -next 2/2] drm/amdkfd: Return true/false (not 1/0) from
 bool functions
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, Abaci Robot <abaci@linux.alibaba.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

On Thu, May 5, 2022 at 7:28 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Return boolean values ("true" or "false") instead of 1 or 0 from bool
> functions. This fixes the following warnings from coccicheck:
>
> ./drivers/gpu/drm/amd/amdkfd/kfd_int_process_v11.c:244:9-10: WARNING:
> return of 0/1 in function 'event_interrupt_isr_v11' with return type
> bool
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
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
> 2.20.1.7.g153144c
>
