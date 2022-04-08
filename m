Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047C4F9C49
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 20:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1A710E3C9;
	Fri,  8 Apr 2022 18:13:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E8C10E38E;
 Fri,  8 Apr 2022 18:13:20 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e1dcc0a327so10570018fac.1; 
 Fri, 08 Apr 2022 11:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bhP3eIOYqFQ1TLSj31wqQTbMB1cCk1qoaWt6+VR4BLw=;
 b=Qu1oWRu2JGHe24zZhQ4F0+ypq/DSujSGxjFiCTEtij0J1fAO2oFUTpnr9B9qfHoWTm
 756Lo5Sh/3bLUXO8RxhWd6obNcOrETC75QRMjwLBYClfaffoygf2/v/YfxyLHKTl5ecJ
 nVNsJzxjkHMySUYQB1ak4nnoY/U56GCcuvW8Cg04SKviYKoi3iLwj5z6nE97qGjCCtGF
 KQorSYoGfOvuJvEmLg0qYNnuV9mYVRn2i7oJIVOb69Im5NS+7sgpUEkBfuDPBLbBa26t
 UvXUWISkiodiQJDHZlbxcv/CGUUkM8gAj0ylpoOiDPy51El4YHmG/B2XsL9/siOSOnTk
 t0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bhP3eIOYqFQ1TLSj31wqQTbMB1cCk1qoaWt6+VR4BLw=;
 b=bfl43fvd/Jm1qX8cNzNd0fC+Dfm0AUldAW/qQ/K7gI7803PYND8m3OSub8TtvphV3o
 FV7FvJ61qpg+/EfKABk4GeBHG69DNao5vt0U2kgokAUNlmlxJKkoRo9lwJarOpA38Z6y
 10wvidQzDI6IUnV4JWZetxXkXDr6JSKZ2J0HJ54NdK/7XPJ/yQoo7qASWzxrPbycUT/d
 nlYKte9Hhwig5w7u6qb5kl5YxHzbdvbSHt2JTF30F9H3YKJIyKCv5jcQHM5e2Osdpl7m
 aOoPwaCuExf3WsOwHeKV4Z2o8HUL1hK3HXlbaAmm3TpmZvOAQt6qo9P/Ju4WAAmNIfnq
 aMiA==
X-Gm-Message-State: AOAM531WNiKrW7c/UPVFTbFlAs7G83UvnSyZWdRRgYNsQqwO4yenOKS/
 IiiJ8LR3W/zGkFOoVq6OWpMRL4pUM29YLhSN8JY=
X-Google-Smtp-Source: ABdhPJy/5j7dhpq7nAlYcXWuJYra1eFEi2YT/D5jTr+unwf6/PZglehZSAX76bFE1Mri4dpLdCIaFYQn1dd+nnZttqo=
X-Received: by 2002:a05:6870:d683:b0:de:eaa2:3550 with SMTP id
 z3-20020a056870d68300b000deeaa23550mr9582559oap.253.1649441599543; Fri, 08
 Apr 2022 11:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220408154447.3519453-1-richard.gong@amd.com>
 <BL1PR12MB51576654D3EEB10F5DF862A7E2E99@BL1PR12MB5157.namprd12.prod.outlook.com>
 <CADnq5_PmxGxrJG5uZkkFXQ1YbJbDZTvAqb2oYqdCE=NtqBojqw@mail.gmail.com>
 <2603fe3e-2b8b-0161-2812-6c1f21eda02b@amd.com>
In-Reply-To: <2603fe3e-2b8b-0161-2812-6c1f21eda02b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 8 Apr 2022 14:13:08 -0400
Message-ID: <CADnq5_PLwkm9tKc7Hh3WOo9nKJEeTcKGdYtVtfGVoVq6gGo1sg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: disable ASPM for legacy products that don't
 support ASPM
To: "Gong, Richard" <richard.gong@amd.com>
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Limonciello, Mario" <Mario.Limonciello@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 8, 2022 at 12:15 PM Gong, Richard <richard.gong@amd.com> wrote:
>
> Hi Alex,
>
> On 4/8/2022 10:54 AM, Alex Deucher wrote:
> > On Fri, Apr 8, 2022 at 11:47 AM Limonciello, Mario
> > <Mario.Limonciello@amd.com> wrote:
> >> [Public]
> >>
> >>
> >>
> >>> -----Original Message-----
> >>> From: Gong, Richard <Richard.Gong@amd.com>
> >>> Sent: Friday, April 8, 2022 10:45
> >>> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> >>> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> >>> airlied@linux.ie; daniel@ffwll.ch
> >>> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; l=
inux-
> >>> kernel@vger.kernel.org; Limonciello, Mario <Mario.Limonciello@amd.com=
>;
> >>> Gong, Richard <Richard.Gong@amd.com>
> >>> Subject: [PATCH] drm/amdgpu: disable ASPM for legacy products that do=
n't
> >>> support ASPM
> >>>
> >>> Active State Power Management (ASPM) feature is enabled since kernel
> >>> 5.14.
> >>> However there are some legacy products (WX3200 and RX640 are examples=
)
> >>> that
> >>> do not support ASPM. Use them as video/display output and system woul=
d
> >>> hang
> >>> during suspend/resume.
> >>>
> >>> Add extra check to disable ASPM for old products that don't have
> >>> ASPM support.
> > The patch description is incorrect.  ASPM works just fine on these
> > GPUs.  It's more of an issue with whether the underlying platform
> > supports ASPM or not.  Rather than disabling a chip family, I would
> > prefer to add a check for problematic platforms and disable ASPM on
> > those platforms.
>
> I thought that initially.
>
> But I found out that suspend/resume works just fine on the "problematic"
> platform (Dell Precision 3660, Intel ADL based) + AMD W6400 GFX card.
> With WX3200 or RX640, suspend/resume works only when ASPM was disabled.
> Both WX3200 and RX640 are from CHIP_POLARIS12 family.
>
> This is why I take chip family approach.

Sure, but you could put those polaris12 boards into a different system
and they work just fine with ASPM enabled.

Alex

>
> Regards,
>
> Richard
>
> > Alex
> >
> >>> Signed-off-by: Richard Gong <richard.gong@amd.com>
> >>> Link: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%=
2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1885&amp;data=3D04%7=
C01%7CRichard.Gong%40amd.com%7C96f8f686f75f43abb5ed08da19780fab%7C3dd8961fe=
4884e608e11a82d994e183d%7C0%7C0%7C637850300760921285%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000=
&amp;sdata=3DxVKC0Q16ho5Y2GDuN%2Fnx68wm6NzOIyR5xJbiXPgqPpQ%3D&amp;reserved=
=3D0
> >>> ---
> >>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 4 ++++
> >>>   1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> index bb1c025d9001..8987107f41ee 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >>> @@ -2012,6 +2012,10 @@ static int amdgpu_pci_probe(struct pci_dev
> >>> *pdev,
> >>>        if (amdgpu_aspm =3D=3D -1 && !pcie_aspm_enabled(pdev))
> >>>                amdgpu_aspm =3D 0;
> >>>
> >>> +     /* disable ASPM for the legacy products that don't support ASPM=
 */
> >>> +     if ((flags & AMD_ASIC_MASK) =3D=3D CHIP_POLARIS12)
> >>> +             amdgpu_aspm =3D 0;
> >>> +
> >> I think it's problematic to disable it for the entire driver.  There m=
ight be multiple
> >> AMDGPUs in the system, and others may support ASPM.
> >>
> >> Can it be done just as part of probe for Polaris?
> >>
> >>>        if (amdgpu_virtual_display ||
> >>>            amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
> >>>                supports_atomic =3D true;
> >>> --
> >>> 2.25.1
