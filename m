Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CB31ED113
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 15:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165BE89BA3;
	Wed,  3 Jun 2020 13:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9791589B9F;
 Wed,  3 Jun 2020 13:43:47 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l11so2466821wru.0;
 Wed, 03 Jun 2020 06:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SOmyve9bUDmubIVPzpcziP63vVpum2UbcrFicqpkq+w=;
 b=dLQbd/+8npTMk4QLp1GlJLJSXrvXa8CCkj+1zvjWm4wHCtiVTwrq10h9aZ8EzttvgH
 kJY1Ro32Qv32VjsmheO8rPIQTYMTXHQjWKtsoKdhC/6fkjgi+uMe3mJgDggZWU0HwoYQ
 Cs3Goq8PKh3PlsqRTG8pZ/803xSfaphW1r5tJVqAKbBoTb9M4N5qVQuqUIxhxAKqX6df
 wSO4RTleRp1+UKJ8HlRhL2Ev7l6ZAZXGAJP5BeFs7Ar9uPyJ84DvN0XCHKha6fuo4Kb0
 4paMO6Z/6XR5CFul1cJJmPh5unfcREiHYfKfg09IJmc+76JgIlchU9bNd8vJcirWpn0h
 QFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SOmyve9bUDmubIVPzpcziP63vVpum2UbcrFicqpkq+w=;
 b=INEPDKsoSjznCO5+PzHeCdHzwgVuhSXlngtbnfipw7mfePIVUZ7I/DIKEWXhSNepeB
 igqc92MfnUZyhqQ1nw6vINTxTmJkvCy+0fx1w2UCkCxrGtESUkfw4lyGXKAsS2vumTzx
 OGovr1VhN6Ahw9aRdpA5pkZBVpg70t6PMohg5GSUbonz3LfPUcY0xE5UV+FQxtL7v7Ah
 wLwo8vV+BeqjqDWyRvouQDFFHtsRCix7NmcmtJQeTc6VfdfWzDsjURdKM/chwxhC1V8A
 7EFr1NKqcfyEfwL0aLefaug5t9iU79iUm6dcLh/+l8HsrhuYCXrAAtWHkW7XgCVl7qXj
 qR1g==
X-Gm-Message-State: AOAM532CNAck0AIQXm6P2dIq3UdJ7jUZZ6Fg+5edQ3Kmjp4GO9ckLrAr
 LgrHkSsKgRumrPrTHzxYVjr8LDE9t5UUNPqV+DE=
X-Google-Smtp-Source: ABdhPJyDqMwuUN33to+4ovZr0Z2o1K7X5Asu5DFxHM0Idg4MwGzkmHriwv3Fc/65Nvi83qQQQIvJeu3qs+VvIdRSuGc=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr33118221wru.124.1591191826155; 
 Wed, 03 Jun 2020 06:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200603114212.12525-1-piotr.stankiewicz@intel.com>
 <20200603114758.13295-1-piotr.stankiewicz@intel.com>
In-Reply-To: <20200603114758.13295-1-piotr.stankiewicz@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 3 Jun 2020 09:43:34 -0400
Message-ID: <CADnq5_Pa4J3NVprJnpKTih8O1G-oyMMUT4nHb=RZz96i_x+sKw@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] drm/amdgpu: Use PCI_IRQ_MSI_TYPES where
 appropriate
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
Cc: David Airlie <airlied@linux.ie>, Linux PCI <linux-pci@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Emily Deng <Emily.Deng@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 shaoyunl <shaoyun.liu@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 3, 2020 at 7:48 AM Piotr Stankiewicz
<piotr.stankiewicz@intel.com> wrote:
>
> Seeing as there is shorthand available to use when asking for any type
> of interrupt, or any type of message signalled interrupt, leverage it.
>
> Signed-off-by: Piotr Stankiewicz <piotr.stankiewicz@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> index 5ed4227f304b..2588dd1015db 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
> @@ -249,15 +249,10 @@ int amdgpu_irq_init(struct amdgpu_device *adev)
>
>         if (amdgpu_msi_ok(adev)) {
>                 int nvec = pci_msix_vec_count(adev->pdev);

I think you can drop pci_msix_vec_count() here.  It's not used since
we always request 1 vector.

Alex

> -               unsigned int flags;
>
> -               if (nvec <= 0) {
> -                       flags = PCI_IRQ_MSI;
> -               } else {
> -                       flags = PCI_IRQ_MSI | PCI_IRQ_MSIX;
> -               }
>                 /* we only need one vector */
> -               nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1, flags);
> +               nvec = pci_alloc_irq_vectors(adev->pdev, 1, 1,
> +                                            PCI_IRQ_MSI_TYPES);
>                 if (nvec > 0) {
>                         adev->irq.msi_enabled = true;
>                         dev_dbg(adev->dev, "amdgpu: using MSI/MSI-X.\n");
> --
> 2.17.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
