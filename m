Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6936F5E904C
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 00:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5905610E196;
	Sat, 24 Sep 2022 22:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BEB10E196;
 Sat, 24 Sep 2022 22:21:28 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id sb3so7157519ejb.9;
 Sat, 24 Sep 2022 15:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=YCNfMed/pPVYD7J51KG0xapFPT3OMA7Ln3KDUFVm268=;
 b=imGTgCM8dGuV2WIK67Q/oM9q4nye4CU67RDehEiGBgBdaiktWb1dcby4PPmtJ4wKZN
 dmKQehrUyo3Yq8Gk6lA4wu9+FgiAXNXh8zA/SRz2yn/2yGA9ttqgW8d9O5XdyIc/eaqW
 Kbl+fTTj4YhRYZKuFPSRniG/cJ+s7nYJYNdKiAhgV1tt8Zi/KMMG1h7Smw0zMSQJLdFk
 yDgbYUCFJ5sjwmeyVvPO/DPDLYvsO4RUfn3DeqnQ1BZimIrO0GHpfc76O9YAYwfdDdJd
 j+3PMrW/ljPT7B/X67+ivbovsjZLKPHirUiARaGue/z1+i5bm9gC5WNHVwBa9eN1Ci7D
 mHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=YCNfMed/pPVYD7J51KG0xapFPT3OMA7Ln3KDUFVm268=;
 b=rwjpK7R7cIGqoqzNpqtfvu9lVLiNZGar4Mwrqer54KwnnT0hP0/xBG/Z7K/lFekSkg
 zf7cqFGgtdpxbwRWKIYHD+yXBfXvYn1M+I+GD3Ekl8At2qdR8e/85AnGrQZXNFh1NYQe
 +Y7Y8dLVBFQ8eAOel8+7zjubdG2skev8lpJljaums5WI4QJXGs0vh19GdVoVcJrjxIcM
 rGk+jLWnX6ISpoMPHwblv8zM74azi7Vi463ZXn7MdT8JQ1HwFUGazM5xqB5PMd73/R67
 LDCpIx+1VRQUSMK9+rxGTaCjystI/GQ/E+VfAWFcqOJ2nnNmSdQzMFlRTYPkm+Q2Ajmf
 QoHA==
X-Gm-Message-State: ACrzQf3jnfUOjUOlLb1ePpU6HmN4MO5brAjrBU7CAYH/4DrZF17YHs1e
 hOY/bzzVMoh+h4i4qKw0iFC+IRtZm/TKrQSC5Bs=
X-Google-Smtp-Source: AMsMyM66lrmEJVLqH4rkw+tCv3o1v//7NW/wmDVSRWIIbtSICMzRae4iwi37xCkJqI7StQIWEpGLf86tpKMrwUowOkk=
X-Received: by 2002:a17:907:2d0f:b0:780:2170:e079 with SMTP id
 gs15-20020a1709072d0f00b007802170e079mr13023619ejc.185.1664058087119; Sat, 24
 Sep 2022 15:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220922200613.1703624-1-floridsleeves@gmail.com>
 <900023c1-a02e-25cd-f255-0e43693afe23@amd.com>
In-Reply-To: <900023c1-a02e-25cd-f255-0e43693afe23@amd.com>
From: Li Zhong <floridsleeves@gmail.com>
Date: Sat, 24 Sep 2022 15:21:17 -0700
Message-ID: <CAMEuxRrNFDqEjQwhjTRbCxxdVVxk1yNhnkWJDjYyxKGMvs3eNg@mail.gmail.com>
Subject: Re: [PATCH v1] drivers/amd/kv_dpm: check the return value of
 amdgpu_kv_smc_bapm_enable
To: "Lazar, Lijo" <lijo.lazar@amd.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, evan.quan@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 8:04 PM Lazar, Lijo <lijo.lazar@amd.com> wrote:
>
>
>
> On 9/23/2022 1:36 AM, Li Zhong wrote:
> > Check the return value of amdgpu_kv_smc_bapm_enable() and log the error
> > when it fails.
> >
> > Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> > ---
> >   drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> > index 8fd0782a2b20..d392256effe2 100644
> > --- a/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> > +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/kv_dpm.c
> > @@ -1384,13 +1384,16 @@ static int kv_dpm_enable(struct amdgpu_device *adev)
> >   static void kv_dpm_disable(struct amdgpu_device *adev)
> >   {
> >       struct kv_power_info *pi = kv_get_pi(adev);
> > +     int err;
> >
> >       amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
> >                      AMDGPU_THERMAL_IRQ_LOW_TO_HIGH);
> >       amdgpu_irq_put(adev, &adev->pm.dpm.thermal.irq,
> >                      AMDGPU_THERMAL_IRQ_HIGH_TO_LOW);
> >
> > -     amdgpu_kv_smc_bapm_enable(adev, false);
> > +     err = amdgpu_kv_smc_bapm_enable(adev, false);
> > +     if (ret)
> > +             DRM_ERROR("amdgpu_kv_smc_bapm_enable failed\n");
>
> Return code is captured in 'err' and check is for ret' variable.
>
> BTW, does this code compile?
>
> Thanks,
> Lijo
>
> >
> >       if (adev->asic_type == CHIP_MULLINS)
> >               kv_enable_nb_dpm(adev, false);
> >

Thanks for your reply. So sorry for submitting the wrong commit. Now it's
fixed in v2 patch.
