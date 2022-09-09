Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFC5B4125
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:59:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E7F10EE6D;
	Fri,  9 Sep 2022 20:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBB210EE6D;
 Fri,  9 Sep 2022 20:59:09 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so1824089otd.12; 
 Fri, 09 Sep 2022 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=kFpwCO+On23s16RN6YGg888A8dXgjAXd7O3o6mtZAY0=;
 b=cYkP9UO8oDCe3MN/KnrrGL0KCht5K/tJE9DYpePXowaPHMlqyifnqJxYZh769Q0PDJ
 bOkpXwXjY/PFQbSVwQr8KhksmiBqhWR8If7zp5W7RDD7ohmBSncSkEakpY8YzR90OJA0
 Veqj8LnRuQ3RNExoPv4HPo+5j19PBjKTgbXsLTwxFI57Hk66Fcxax0CICkcJBLMfwVsh
 ijLEZdx7xeQYY/JN6nqDQgmGSS4UWKbxnS4yxc8qpEayy560CNXnnml57yKnmPVbH+UU
 ir2ZwLIBmu0TwsksFOscqgME3e9SViB2Vv+67zBUehw64W0qLtp1vxmgkJ2CmohFHkqJ
 KsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=kFpwCO+On23s16RN6YGg888A8dXgjAXd7O3o6mtZAY0=;
 b=wbK4+Us3+tzSL61LYdn39/3Ob5VcCa4KJrHymt54N9Cavicao73iiRo3ky5/yeOCfp
 xTpL8N94Fo/TxgCTMRKsEWRHTZ3QcyTz5c/xH6YpJ80IagCu6MPra5mrElJc2tIHCsfj
 70jyGFQab5mw7WstLiOPDT1lUkSyFR3pzmkAD22So8xFiiYCP6tSgDtwzE36T0XKn6iy
 NPP+mp+0EoLCbVjmAiaeAZVo+cw6qJpyuCVcYw4Bw0fyHIsZdIZyXCuggN/wNrL9gWcQ
 Qw3KPDZnnnz9YXsU50lca9rWMVz8hm9vIKdPNBtykQ4kUdx0oRv8/YlQDhJr9O5Zsf+I
 IBrA==
X-Gm-Message-State: ACgBeo09O4McrjbNCpoO096ijAUjBtI+7OuiM20MnkcpelUKvY1XJPLy
 hKeHclYymvqrUGEO7zYCYaoMk9iNyPGlRK+DRxI=
X-Google-Smtp-Source: AA6agR61J889n91RmOLJ7O6XBg1xUpgddBBhA43Rf9/H121Hpj2mrQx3L2n6t+Ve2fKV/hfgVj+4xjwvoRH1KsBRfOQ=
X-Received: by 2002:a9d:376:0:b0:655:b4bc:fd6e with SMTP id
 109-20020a9d0376000000b00655b4bcfd6emr1346569otv.233.1662757148908; Fri, 09
 Sep 2022 13:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220905083825.23429-1-jingyuwang_vip@163.com>
 <18083c05-7636-2155-610b-2d1347f8585f@amd.com>
 <BL1PR12MB51444461B0F15AAF3BE46F91F77E9@BL1PR12MB5144.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB51444461B0F15AAF3BE46F91F77E9@BL1PR12MB5144.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:58:57 -0400
Message-ID: <CADnq5_M9HQViZp9yj55+yr3K0udh4-zqFDKTgXfuo9yyYeiNcw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Sep 6, 2022 at 2:48 PM Deucher, Alexander
<Alexander.Deucher@amd.com> wrote:
>
> [Public]
>
>
> Yeah, seems to be a mix.  I don't have a strong opinion as long as it has MIT.
>
> Alex
>
> ________________________________
> From: Kuehling, Felix <Felix.Kuehling@amd.com>
> Sent: Tuesday, September 6, 2022 9:46 AM
> To: Jingyu Wang <jingyuwang_vip@163.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; airlied@linux.ie <airlied@linux.ie>; daniel@ffwll.ch <daniel@ffwll.ch>
> Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
> Subject: Re: [PATCH] drm/amdgpu: cleanup coding style in amdgpu_amdkfd_gpuvm.c
>
>
> Am 2022-09-05 um 04:38 schrieb Jingyu Wang:
> > Fix everything checkpatch.pl complained about in amdgpu_amdkfd_gpuvm.c
> >
> > Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > index cbd593f7d553..eff596c60c89 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> > @@ -1,3 +1,4 @@
> > +// SPDX-License-Identifier: MIT
>
> I'm not sure if this is correct. We've used "GPL-2.0 OR MIT" in KFD. In
> amdgpu there is currently a mix of licenses. Alex, do you want to make a
> call on a consistent one to use in amdgpu?
>
> Other than that, this patch is
>
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
>
> >   /*
> >    * Copyright 2014-2018 Advanced Micro Devices, Inc.
> >    *
> > @@ -1612,6 +1613,7 @@ size_t amdgpu_amdkfd_get_available_memory(struct amdgpu_device *adev)
> >        uint64_t reserved_for_pt =
> >                ESTIMATE_PT_SIZE(amdgpu_amdkfd_total_mem_size);
> >        size_t available;
> > +
> >        spin_lock(&kfd_mem_limit.mem_limit_lock);
> >        available = adev->gmc.real_vram_size
> >                - adev->kfd.vram_used_aligned
> > @@ -2216,7 +2218,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct amdgpu_device *adev,
> >   {
> >        if (atomic_read(&adev->gmc.vm_fault_info_updated) == 1) {
> >                *mem = *adev->gmc.vm_fault_info;
> > -             mb();
> > +             mb(); /* make sure read happened */
> >                atomic_set(&adev->gmc.vm_fault_info_updated, 0);
> >        }
> >        return 0;
> >
> > base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
