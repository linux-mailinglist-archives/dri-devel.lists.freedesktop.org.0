Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A16366DDE60
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 16:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B344310E579;
	Tue, 11 Apr 2023 14:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068D310E576;
 Tue, 11 Apr 2023 14:46:38 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id w19so5563273oiv.13;
 Tue, 11 Apr 2023 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681224398; x=1683816398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrfRR7HhAFqhczXMVPJxrWKzrc2/IOvOKRMrdzOfWlc=;
 b=ZIqJisXFCpVkcd+4us40BxlfABS295EDrQYsXBfH8r4HjPC2tHL+jM+r3jxpVjTMH+
 BLB46FAMemCm0yTNM8sfvFJ6j7iiPUBqNmkb8WxokxUdIZ0TwkpVNr7yfE4clCFKQuNj
 sVVVioaG0fsIqo1v4kSqk9NwIl+McUrRV+rPYbgJAftiv3fXLtS23yZOdt7vUhG4FpzJ
 3Z7ZNC7mefUVMOHtAnHXGPDqEF8RNSUsF2vdnUoey87pwkGDDMW9O1Mvdg4FxyohP8pL
 HHcXFcH2/5udxRoPmBE9zWm5wfbMcwEP6S0Rz7zRp0ecSzNc7xMsIXcxtJyPKeayibK4
 US2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681224398; x=1683816398;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JrfRR7HhAFqhczXMVPJxrWKzrc2/IOvOKRMrdzOfWlc=;
 b=o5BGryvLFaS4WsBNycSCJZIxnfTAhM4DLa3BDyNbuZjAtSQOlDg10LwEaU0qXAq/SB
 AcQVSNNeK3T9PHNq7PXf/7UZLsFXBPNDdYsT7eOWIxiGY3MG37U1P9/he4XB3N3P0eEA
 mzmsl3p+0h7rRXZZUpZnqL0RVhHN2gzCyasw/RjTxL7BlD+CUooa289rUJuNZrDAMxKn
 TB+lXaqhp0UTNPDrvJHhg+gu+x3RPODKn6hwKJuFvGA+3KG6ACXYV5TB4heHutvCDuhQ
 5wvFzarJVvg/++4U2MCaTxmlWznY8BC3ogbTSw3TS8cpVP6XcR7qgxvoeljqK5GsKHsy
 4/Gw==
X-Gm-Message-State: AAQBX9c0D2klODp46qJFAklAI5GQrnWvhf/S+yu7gANNrBbkZaToXUVy
 7ov8+vUMpENf33cfIRtethJ4ZOEQITcelCol6z4=
X-Google-Smtp-Source: AKy350YyAmf8dRnzbklcOFFfkDftOQv7P7qLqfumZ97TrhAv8Bn0J8jkhexehkE0CLfJ8OA0q6X/5den4E6MbNfC9EM=
X-Received: by 2002:aca:1b19:0:b0:387:e26:4b6f with SMTP id
 b25-20020aca1b19000000b003870e264b6fmr2155450oib.3.1681224397797; Tue, 11 Apr
 2023 07:46:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230331164041.1859088-1-trix@redhat.com>
 <DM6PR12MB26199298CA3AFC2736E8E9CDE4959@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26199298CA3AFC2736E8E9CDE4959@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 11 Apr 2023 10:46:26 -0400
Message-ID: <CADnq5_MK=2WeQ0MpM9g36B1z8mSRMV24Au0+sHdd__=mQDodfQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: remove unused num_of_active_display variable
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: "Lazar, Lijo" <Lijo.Lazar@amd.com>, "Huang, Tim" <Tim.Huang@amd.com>, "Feng,
 Kenneth" <Kenneth.Feng@amd.com>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Wang,
 Yang\(Kevin\)" <KevinYang.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Tom Rix <trix@redhat.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>, "Limonciello,
 Mario" <Mario.Limonciello@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Liu, Kun" <Kun.Liu2@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Apr 9, 2023 at 8:48=E2=80=AFPM Quan, Evan <Evan.Quan@amd.com> wrote=
:
>
> [AMD Official Use Only - General]
>
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: Tom Rix <trix@redhat.com>
> > Sent: Saturday, April 1, 2023 12:41 AM
> > To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> > airlied@gmail.com; daniel@ffwll.ch; nathan@kernel.org;
> > ndesaulniers@google.com; Zhang, Hawking <Hawking.Zhang@amd.com>;
> > Feng, Kenneth <Kenneth.Feng@amd.com>; Lazar, Lijo
> > <Lijo.Lazar@amd.com>; Wang, Yang(Kevin) <KevinYang.Wang@amd.com>;
> > Huang, Tim <Tim.Huang@amd.com>; andrealmeid@igalia.com; Liu, Kun
> > <Kun.Liu2@amd.com>; Limonciello, Mario <Mario.Limonciello@amd.com>
> > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; lin=
ux-
> > kernel@vger.kernel.org; llvm@lists.linux.dev; Tom Rix <trix@redhat.com>
> > Subject: [PATCH] drm/amd/pm: remove unused num_of_active_display
> > variable
> >
> > clang with W=3D1 reports
> > drivers/gpu/drm/amd/amdgpu/../pm/swsmu/amdgpu_smu.c:1700:6: error:
> > variable
> >   'num_of_active_display' set but not used [-Werror,-Wunused-but-set-
> > variable]
> >         int num_of_active_display =3D 0;
> >             ^
> > This variable is not used so remove it.
> >
> > Signed-off-by: Tom Rix <trix@redhat.com>
> > ---
> >  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 7 -------
> >  1 file changed, 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > index b5d64749990e..f93f7a9ed631 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> > @@ -1696,8 +1696,6 @@ static int smu_display_configuration_change(void
> > *handle,
> >                                           const struct
> > amd_pp_display_configuration *display_config)  {
> >       struct smu_context *smu =3D handle;
> > -     int index =3D 0;
> > -     int num_of_active_display =3D 0;
> >
> >       if (!smu->pm_enabled || !smu->adev->pm.dpm_enabled)
> >               return -EOPNOTSUPP;
> > @@ -1708,11 +1706,6 @@ static int smu_display_configuration_change(void
> > *handle,
> >       smu_set_min_dcef_deep_sleep(smu,
> >                                   display_config-
> > >min_dcef_deep_sleep_set_clk / 100);
> >
> > -     for (index =3D 0; index < display_config-
> > >num_path_including_non_display; index++) {
> > -             if (display_config->displays[index].controller_id !=3D 0)
> > -                     num_of_active_display++;
> > -     }
> > -
> >       return 0;
> >  }
> >
> > --
> > 2.27.0
