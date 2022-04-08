Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C804F99F1
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 17:54:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360C110E4DA;
	Fri,  8 Apr 2022 15:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842A210E476;
 Fri,  8 Apr 2022 15:54:27 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-d6ca46da48so10103981fac.12; 
 Fri, 08 Apr 2022 08:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/qt2kxYzvPSFybWE0vph5q3zSCF93j4cg+r2znVrEc=;
 b=nJYSFSwPoiZylu5Rvwor1W7DMfMJLiJi5Vjvfuuc1+qINKATI+9jEhVUHga2vPbT0I
 Or3XMCel3PUZ9F39JAd3RbPnoBDIBMWtnXEtL9k9L8CF9qICyNtSxLGQumrGUGjkkomM
 /wszEBfJYbFxRKW09cjdEdW5a9JjgpD0qp0iCbr5oWLod9cyDe84qjiC1whEAR9DpaU/
 cVFu728cxCFZJOStvhxvkwB5/ylyadlpSlB+yQJ4g8XIwyt3fuIxQMRSnmfYqPon9XnZ
 mMSKElHf/6JAoEO2JKyN+93C0XuDoyxBgq3FdKMX7eD8YLfJD3t9mskxw0eJhTtkDAEH
 fdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/qt2kxYzvPSFybWE0vph5q3zSCF93j4cg+r2znVrEc=;
 b=BtWJuUCl3XjAz65l/LuCkbHU7rH1/m3F8W3eWA1uP2kwv24mlJ0aZMbaCZZgqUyrPG
 eLbBck7TCpJ/rKa0ANcOvcdZBXzwyKJ/AUglJl5Q2phLveoxEegoRjmbsHRlT294a0HK
 kL9X16/q6dc4XcknEtP/Z9qT8nNzWrB4jFwazf4el1nJJpGkaaEZQDF+CKGySAvbjWav
 0lQSBlFFkvH9guaHnEsyetKuXT5Fs1G/UUYicXdnV7/GqMmg+0SFly7/m/fgiYKZvfYy
 pKZqBlQMPzquPLt4HA0Es4vBpg3VkVXscRNa7jwQZ5MlvLD+/xx2XiNSqQPws+cfLnjc
 8d8Q==
X-Gm-Message-State: AOAM530qGjhXXXtW0PRIjIqtz7Tx+8b0lHizyG8IFF65qJEYOK4TYoDX
 64KsdWncAGn30TBG2TATI8YEUTDUnuf9Q/Ol3RY=
X-Google-Smtp-Source: ABdhPJw9FKlPrDwVUJRr0sLTm1ZkYMWhz0SCAA0CCiO2BPNqBy7HXjZPLKYYsoKecSvHWjdPQN9syqAueyQBM/LohEo=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr8346323oaa.200.1649433266869; Fri, 08
 Apr 2022 08:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220408154447.3519453-1-richard.gong@amd.com>
 <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Apr 2022 11:54:15 -0400
Message-ID: <CADnq5_PmxGxrJG5uZkkFXQ1YbJbDZTvAqb2oYqdCE=NtqBojqw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
To: "Limonciello, Mario" <Mario.Limonciello@amd.com>
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, "Gong,
 Richard" <Richard.Gong@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 11:47 AM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
>
>
> > -----Original Message-----
> > From: Gong, Richard <Richard.Gong@amd.com>
> > Sent: Friday, April 8, 2022 10:45
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> > airlied@linux.ie; daniel@ffwll.ch
> > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com>;
> > Gong, Richard <Richard.Gong@amd.com>
> > Subject: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
> > support ASPM
> >
> > Active State Power Management (ASPM) feature is enabled since kernel
> > 5.14.
> > However there are some legacy products (WX3200 and RX640 are examples)
> > that
> > do not support ASPM. Use them as video/display output and system would
> > hang
> > during suspend/resume.
> >
> > Add extra check to disable ASPM for old products that don't have
> > ASPM support.

The patch description is incorrect.  ASPM works just fine on these
GPUs.  It's more of an issue with whether the underlying platform
supports ASPM or not.  Rather than disabling a chip family, I would
prefer to add a check for problematic platforms and disable ASPM on
those platforms.

Alex

> >
> > Signed-off-by: Richard Gong <richard.gong@amd.com>
> > Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1885
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index bb1c025d9001..8987107f41ee 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -2012,6 +2012,10 @@ static int amdgpu_pci_probe(struct pci_dev
> > *pdev,
> >       if (amdgpu_aspm == -1 && !pcie_aspm_enabled(pdev))
> >               amdgpu_aspm = 0;
> >
> > +     /* disable ASPM for the legacy products that don't support ASPM */
> > +     if ((flags & AMD_ASIC_MASK) == CHIP_POLARIS12)
> > +             amdgpu_aspm = 0;
> > +
>
> I think it's problematic to disable it for the entire driver.  There might be multiple
> AMDGPUs in the system, and others may support ASPM.
>
> Can it be done just as part of probe for Polaris?
>
> >       if (amdgpu_virtual_display ||
> >           amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
> >               supports_atomic = true;
> > --
> > 2.25.1
