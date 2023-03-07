Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE56AEA40
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 18:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1730110E278;
	Tue,  7 Mar 2023 17:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DA810E075;
 Tue,  7 Mar 2023 17:32:06 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id be16so3465002oib.0;
 Tue, 07 Mar 2023 09:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678210326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WMnHUwAy5pc1w+T7Jgak3PUg7pKDe3xFrRkk5NHVfc8=;
 b=XDlVbj6h/y2SEcS7l/u5dJQIcVGtH4KyRQlvX7kiv1aO58TchCgHydju1tkoQ1Gpex
 8ZIkKzpRv5yVLUEpocQgmzn7459YVNRpvrqVTiHGUGg9ZoCfGlUsQTNSa9rQ01V6DS8A
 0w0FXCz/7edUtiVXCZEkGQ8SS9fIEl+bKq2zLp8+L8mosbW56BIgE3TGZv0Lu17fThrN
 NFYwyAQz/m7xwmbLU1CKnaJJNmd1OitVs0QeAxhGGGBa+UZThjaENwO6Tmd1XRMbeKTk
 9tBuPqUYYNyMVrRF4jyNhsY2PApkieEWV0xnId/PszQ1nCpsHtXiyoDikX7tBnkABOIu
 Xxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678210326;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WMnHUwAy5pc1w+T7Jgak3PUg7pKDe3xFrRkk5NHVfc8=;
 b=5qE2+i4hoyn0VuHIbSys6QcYFxkajwOnLKu7Mc6Sge2Suc0kKqt1/FzhAQ2TFWMMu6
 OuRLYAr5QxEjf8fz1kxZkMHwoNt1MuNryF9bTs/8spD0m001Rt4lhKKRBkWFV9Vua0GD
 EE9qlwDdl1gzl8fP0qXqZmGBCmqT5AMmGAIK2eOojzmGSpgVwVCwoW4+x5kWZxvRt5GU
 q8gWXmCR3jxxeSeAX9w5kCGLa8v9xjDGxFaGFTymI42hO1gr6CPDt/3KkK1gd3rydJ+E
 6mULbUe503Jcs/F8GYQk51k2dRosUweiWIVpc1TQfHcrNK4UllNqGs7DrwCrn8vWm1xV
 xEwg==
X-Gm-Message-State: AO0yUKX6Okde5Q4H84z9j1slYa9EGeDhknumau2jq+rI75b89z18PXYa
 dz8Ohz4hbiwIAjBke//DhIBTHQ/WdT1MSAQOc6U=
X-Google-Smtp-Source: AK7set9bdQBOUBXS+VMa4aA1TRGDtDFTVLl+ukUGIPW4rVdPocpbwHT9n/1nZMDm6ePrr5xUNHMdUKhr8M2TtJ5yd2A=
X-Received: by 2002:aca:1206:0:b0:384:e059:c00a with SMTP id
 6-20020aca1206000000b00384e059c00amr410124ois.8.1678210325839; Tue, 07 Mar
 2023 09:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20230112-amduml-v1-1-5e4a0d37de16@pefoley.com>
 <7212f65a-4d2d-5ecd-235d-95b60f45a0e8@amd.com>
In-Reply-To: <7212f65a-4d2d-5ecd-235d-95b60f45a0e8@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Mar 2023 12:31:54 -0500
Message-ID: <CADnq5_M31w7tND+5v4_iYuKterg79te4mUM_h9agJ3a+x5FNFQ@mail.gmail.com>
Subject: Re: [PATCH] amdgpu: Avoid building on UML
To: Felix Kuehling <felix.kuehling@amd.com>
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
Cc: Peter Foley <pefoley2@pefoley.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

Alex

On Mon, Mar 6, 2023 at 11:17 AM Felix Kuehling <felix.kuehling@amd.com> wro=
te:
>
> Looks like this patch got lost over the holidays. Alex, are you OK with
> applying this patch? Or are people looking for a more general solution
> to not build HW drivers for UML? FWIW:
>
> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>
>
> Am 2023-01-12 um 23:30 schrieb Peter Foley:
> > The amdgpu driver tries to use fields not supported by UML's cpuinfo
> > struct. Disable the driver when targeting UML to avoid tripping up
> > allyesconfig.
> >
> > e.g.
> > ../drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c: In fu=
nction =E2=80=98intel_core_rkl_chk=E2=80=99:
> > ../drivers/gpu/drm/amd/amdgpu/../pm/powerplay/hwmgr/smu7_hwmgr.c:1742:3=
3: error: initialization of =E2=80=98struct cpuinfo_x86 *=E2=80=99 from inc=
ompatible pointer type =E2=80=98struct cpuinfo_um *=E2=80=99 [-Werror=3Dinc=
ompatible-pointer-types
> > ]
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c: In function =E2=
=80=98kfd_cpumask_to_apic_id=E2=80=99:
> > ../drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_topology.c:2157:48: error: =
=E2=80=98struct cpuinfo_um=E2=80=99 has no member named =E2=80=98apicid=E2=
=80=99
> >
> > Signed-off-by: Peter Foley <pefoley2@pefoley.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/Kconfig | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/a=
mdgpu/Kconfig
> > index 5fcd510f1abb..aa0008ff8712 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
> > +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
> > @@ -3,6 +3,7 @@
> >   config DRM_AMDGPU
> >       tristate "AMD GPU"
> >       depends on DRM && PCI && MMU
> > +     depends on !UML
> >       select FW_LOADER
> >       select DRM_DISPLAY_DP_HELPER
> >       select DRM_DISPLAY_HDMI_HELPER
> >
> > ---
> > base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
> > change-id: 20230112-amduml-565935d34bfb
> >
> > Best regards,
