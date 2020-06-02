Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21F91EB8CE
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 11:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 130BC88052;
	Tue,  2 Jun 2020 09:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31E5E88052;
 Tue,  2 Jun 2020 09:49:32 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id bg4so1148435plb.3;
 Tue, 02 Jun 2020 02:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tCSz+uYodVj42SY8RVM02hyZNCG8C1YkgVUlyk0KTjU=;
 b=SMr2IQjG7D46C5m9upI3klxct3blMqDraFFkJYfnknlybYOmcYPnZXmRNHIfss5yzk
 vQwSNY0YWdC9St5dXcDpurLKIOvgtbBNTpvf9/pSI7opdPZsuy/4G7kQMoY1aoN6YbJv
 Ksspyv4MxvHyha/frHRMpppbr7/jIkNgTNn7SegtOf46UcpRZtQrmHMhyKxhHle8TzaB
 y946LTPjdgOnZLq1+UyZOSU0fXd7x8wLUZlmmEDDfRZ1OieUK6DrER+Z/MeFXCiIoeCp
 MPVbFnZ8fhfvWNZZtLbHs8YyqacdK90NiR5+7T5p41J31Ailu1w9e6c73WdufDG+4iBM
 o2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tCSz+uYodVj42SY8RVM02hyZNCG8C1YkgVUlyk0KTjU=;
 b=O3XrRCTYLkp4aMDZHLoypTsmmal1YU2mYPJc20bYJikpSoS6ud8+In3t9rpXJRjSwt
 nhQCCltR04rPHfMvBht5D5khMfHDShO18a9UFgnCJnlUu8ZR1j01sr3sID4CyrF3DGII
 aLHhkJVpHPwfyHEI+zEV+vobWwjiz4xFkUpMbOr3B3rxmvnRYS12fF/+JU/OtviFYI18
 t8SsIHnkXUsSMXyI4+YjsiRFaEEFIzKEiMgxni9iUyzExYNi3QC3Q3ELCiVbgdLKn7oP
 nzPYJDwcLujtfydrFaUu+3a92mceD1ejkCk31KZyKHusT2hQs9OWLxa2uQWIDyPVms69
 bGgg==
X-Gm-Message-State: AOAM5312gwp4b9XEqGle6ybIiOIaOZPUITxiSmmPmxVg80fSTRUnNmkR
 BO2Yh5MzeC9ZStfOjrVPr2Mmm1tr+9XgSYoE5Zc=
X-Google-Smtp-Source: ABdhPJymZ6h2WYYw5fSCwRyhn3hpPpEakJ8uvqOtOyGfE8Ue5GAXhScl1/g8/52s+KsGW/qY9axU6XvClMPQIAyj23Y=
X-Received: by 2002:a17:90a:220f:: with SMTP id
 c15mr4643652pje.129.1591091371638; 
 Tue, 02 Jun 2020 02:49:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200602092030.31966-1-piotr.stankiewicz@intel.com>
In-Reply-To: <20200602092030.31966-1-piotr.stankiewicz@intel.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 2 Jun 2020 12:49:20 +0300
Message-ID: <CAHp75Ve9tdNB7s+gybsg-OUjA3HiZBgzxeOzw=qkx8t1Ybbmsg@mail.gmail.com>
Subject: Re: [PATCH 07/15] drm/amdgpu: use PCI_IRQ_MSI_TYPES where appropriate
To: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 2, 2020 at 12:24 PM Piotr Stankiewicz
<piotr.stankiewicz@intel.com> wrote:
>
> Seeing as there is shorthand available to use when asking for any type
> of interrupt, or any type of message signalled interrupt, leverage it.
>
> Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 5ed4227f304b..6dbe173a9fd4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -251,11 +251,11 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>                 int nvec = pci_msix_vec_count(adev->pdev);
>                 unsigned int flags;
>
> -               if (nvec <= 0) {
> +               if (nvec > 0)
> +                       flags = PCI_IRQ_MSI_TYPES;
> +               else
>                         flags = PCI_IRQ_MSI;
> -               } else {
> -                       flags = PCI_IRQ_MSI | PCI_IRQ_MSIX;
> -               }
> +
>                 /* we only need one vector */
>                 nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, flags);

I'm not sure if you have seen my last comment internally about this patch.

I don't understand why we need these pci_msix_vec_count() followed by
conditional at all.
Perhaps we may simple drop all these and supply flag directly?

But OTOH, I don't know the initial motivation, so, the above patch is
non-intrusive and keeps original logic.

>                 if (nvec > 0) {
> --
> 2.17.2
>


-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
