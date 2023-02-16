Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7F569A228
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 00:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2651310E395;
	Thu, 16 Feb 2023 23:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A8C10E395;
 Thu, 16 Feb 2023 23:15:14 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id o8so3735127pls.11;
 Thu, 16 Feb 2023 15:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOrfIPBVHyXsCRwwROx/BsBty9DiIQBe0zYeec/wKME=;
 b=JjDfoqzyJdK1Z+JLju5+wXufzKS9j1J2UGrsG8zH1vJThpOvyv2wG4doMtKDQqmv4E
 iqYvzssDipr+537Uwii89iTv4iOHU3nEI21OGm/bmj484ud1ovKW1O3QU/HIx66Vc+U1
 hSloSIfMVpFHHAFJhesC5/+XyUUmZNfH40lBCdIbWxpQ240tDspmR7vs4QLR6IgzjGhZ
 7XdcHZ6j0U1p6qBhwylQ2qGlX2DvtYmhG8lZSBIWiOO0Zm7dmHGeNNxZUhTYxYiXGD3l
 pyxpnPYWgyzD9HUwKth+kQfgkDqjrIAgwRHUIBAwiBuc9Vi5lPon1C3YqM6YxOx3fXJB
 gDhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOrfIPBVHyXsCRwwROx/BsBty9DiIQBe0zYeec/wKME=;
 b=pRNro/GAR719QVoWk2Y9hLy5cZM2M/7M/r8tJ+e4Fm4gSeMHv0dSGgKTJbcbJnh5Hn
 MROgapbgG6OTo0uIP0ssgc/mFVJd3DrC33bJGkVXXLkG+3vjEA3o8F/B5s7K3NC5Izkw
 B+Ukd1RPuYMF37k/x7Ksx3Zibmo8z9W0N8bFy97LyzT5hUi0cEj4weLilGEpiW30tp/I
 seSGGtUhPGYFDZS64cQg67jMosPHjR6/p3sOMeRg8mIg8Bca6NIeT9KsiQP8hWK2Ejuu
 Kg6sJXLf6q7mB1HGXykBRf2JkNLcJjVIbIysoEVDQ9qO36HDtCGJGlaVHC5Blv+HBR+A
 qb5A==
X-Gm-Message-State: AO0yUKW+O0nnmZUsIVyYmWckVUsSfqKa4lV+4REJH5KLyIbfq8xn/SrJ
 LUSjp+t7oX5hdb9mPLo/g+o=
X-Google-Smtp-Source: AK7set/H9inEjyTBJ5xH8PuOEx/wInnSuKCdjl4oy5mBMQXn9NKjK6WdSMSBZ60Mlqq1NFbtQPuKkg==
X-Received: by 2002:a05:6a20:3d0b:b0:bf:45d7:6d0b with SMTP id
 y11-20020a056a203d0b00b000bf45d76d0bmr9195937pzi.33.1676589314420; 
 Thu, 16 Feb 2023 15:15:14 -0800 (PST)
Received: from redecorated-mbp ([202.53.32.211])
 by smtp.gmail.com with ESMTPSA id
 11-20020aa7914b000000b005a77b030b5csm1788401pfi.88.2023.02.16.15.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 15:15:14 -0800 (PST)
Date: Fri, 17 Feb 2023 10:15:03 +1100
From: Orlando Chamberlain <orlandoch.dev@gmail.com>
To: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [PATCHv2] drm/amdgpu: register a vga_switcheroo client for
 MacBooks with apple-gmux
Message-ID: <20230217101503.6196ab7f@redecorated-mbp>
In-Reply-To: <CADnq5_OMA3+FXwUB5eK=Y3qcGW1xNY6RjQAtywT3_bh6HmJztA@mail.gmail.com>
References: <20230216102856.11987-1-orlandoch.dev@gmail.com>
 <CADnq5_OMA3+FXwUB5eK=Y3qcGW1xNY6RjQAtywT3_bh6HmJztA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.35; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Aun-Ali Zaidi <admin@kodeit.net>, Evan Quan <evan.quan@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aditya Garg <gargaditya08@live.com>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Kerem Karabay <kekrby@gmail.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Feb 2023 09:52:57 -0500
Alex Deucher <alexdeucher@gmail.com> wrote:

> On Thu, Feb 16, 2023 at 8:45 AM Orlando Chamberlain
> <orlandoch.dev@gmail.com> wrote:
> >
> > Commit 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
> > vga_switcheroo") made amdgpu only register a vga_switcheroo client
> > for GPU's with PX, however AMD GPUs in dual gpu Apple Macbooks do
> > need to register, but don't have PX. Instead of AMD's PX, they use
> > apple-gmux.
> >
> > Use apple_gmux_detect() to identify these gpus, and
> > pci_is_thunderbolt_attached() to ensure eGPUs connected to Dual GPU
> > Macbooks don't register with vga_switcheroo.
> >
> > Fixes: 3840c5bcc245 ("drm/amdgpu: disentangle runtime pm and
> > vga_switcheroo") Link:
> > https://lore.kernel.org/amd-gfx/20230210044826.9834-10-orlandoch.dev@gmail.com/
> > Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>  
> 
> This needs ifdefs around the apple_gmux stuff so that it will build
> without the gmux support.

There are ifdefs in include/linux/apple-gmux.h already, will
those be sufficient?

> 
> Alex
> 
> > ---
> > v1->v2: Use apple_gmux_detect()
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 21
> > ++++++++++++++++----- 1 file changed, 16 insertions(+), 5
> > deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c index
> > 2f28a8c02f64..ef8b996f0622 100644 ---
> > a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c +++
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c @@ -35,6 +35,7 @@
> >  #include <linux/devcoredump.h>
> >  #include <generated/utsrelease.h>
> >  #include <linux/pci-p2pdma.h>
> > +#include <linux/apple-gmux.h>
> >
> >  #include <drm/drm_aperture.h>
> >  #include <drm/drm_atomic_helper.h>
> > @@ -3919,12 +3920,15 @@ int amdgpu_device_init(struct amdgpu_device
> > *adev, if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> >                 vga_client_register(adev->pdev,
> > amdgpu_device_vga_set_decode);
> >
> > -       if (amdgpu_device_supports_px(ddev)) {
> > -               px = true;
> > +       px = amdgpu_device_supports_px(ddev);
> > +
> > +       if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
> > +                               apple_gmux_detect(NULL, NULL)))
> >                 vga_switcheroo_register_client(adev->pdev,
> >                                                &amdgpu_switcheroo_ops,
> > px); +
> > +       if (px)
> >                 vga_switcheroo_init_domain_pm_ops(adev->dev,
> > &adev->vga_pm_domain);
> > -       }
> >
> >         if (adev->gmc.xgmi.pending_reset)
> >                 queue_delayed_work(system_wq,
> > &mgpu_info.delayed_reset_work, @@ -4029,6 +4033,7 @@ void
> > amdgpu_device_fini_hw(struct amdgpu_device *adev) void
> > amdgpu_device_fini_sw(struct amdgpu_device *adev) {
> >         int idx;
> > +       bool px;
> >
> >         amdgpu_fence_driver_sw_fini(adev);
> >         amdgpu_device_ip_fini(adev);
> > @@ -4048,10 +4053,16 @@ void amdgpu_device_fini_sw(struct
> > amdgpu_device *adev)
> >
> >         kfree(adev->bios);
> >         adev->bios = NULL;
> > -       if (amdgpu_device_supports_px(adev_to_drm(adev))) {
> > +
> > +       px = amdgpu_device_supports_px(adev_to_drm(adev));
> > +
> > +       if (px || (!pci_is_thunderbolt_attached(adev->pdev) &&
> > +                               apple_gmux_detect(NULL, NULL)))
> >                 vga_switcheroo_unregister_client(adev->pdev);
> > +
> > +       if (px)
> >                 vga_switcheroo_fini_domain_pm_ops(adev->dev);
> > -       }
> > +
> >         if ((adev->pdev->class >> 8) == PCI_CLASS_DISPLAY_VGA)
> >                 vga_client_unregister(adev->pdev);
> >
> > --
> > 2.39.1
> >  

