Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BAE4FAB3A
	for <lists+dri-devel@lfdr.de>; Sun, 10 Apr 2022 02:50:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A76C10E2F7;
	Sun, 10 Apr 2022 00:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A3B10E134;
 Sun, 10 Apr 2022 00:50:28 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id c64so1981028edf.11;
 Sat, 09 Apr 2022 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7HtVe2guHiIahNbZDnAKk5WaarwcdEBXzqi2lyPe5QI=;
 b=WebFnt8vxXxGF9+rn0eXifa+Pk7Pg897od0g0G9rMzYZiHzWGLOFv4tzOcSRkloPNk
 ZfCAmKoJQSs22cv7vAEF9bb/W20yEPZjHeMijK7yMzgq8VPA4sN9R69aGH+XTVaBFsxi
 EZyeSftXxzY82g2AkJDeYAD6JLrf9mmMCM/RZoI3FHNhyOBEP5rmdL47x2r4QDiUk2nv
 UWvDfyCz5WC1Mw5oPvGqisRYdouOAht1OJhGaCswEGhFI9vr9+SjpmGUN69q+qp8zCvz
 d2QdaJVmTk0VPbfQQZ6t/ug+/Y6ojBz+2Qn474YrDwlLhzn5jfp3TjNNa6RBrmy+KQ1I
 VjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7HtVe2guHiIahNbZDnAKk5WaarwcdEBXzqi2lyPe5QI=;
 b=8EedPnd/nA1E8xwp5CESucDt+Gj4e6PF0AEPMicsWIXGJfmepaeg6f/4Zsl7hr2LPS
 PYLk7jgwpUvZksRD1IPt18TGftptuRzuzOD0OrueWaq3vFd1ylLuRsxvY7B9xnhRKwNf
 rv1UbJnOVhJ8hcIX5pRpFFc7e1qSFYjfZPVpJY5Tbxi7ZaKmMEaL0YxxRZY1HU/l8edm
 5Mc7w3gUS6aOKc/S7Nl5JtmMlMSPtmu9FKG+YrmWQMRrGglSzStvf1nghHUc9ELFamH+
 xRdUIE0/Pvg2pL3INAMzV5osMKJ56nJpQs51oKH9geIDASA45nHsTuO6M3KS43jNFe36
 7K1Q==
X-Gm-Message-State: AOAM532pW26HWwzgsUdzSsdOYuSQY2t/mkFH54WA3gFlaUF575FCTfUs
 lW/yw/ZcC7Rhh+93bBGrdvg/NdizPAPK/0bHM+A=
X-Google-Smtp-Source: ABdhPJxrqwFrLV44uG+X6bhKQxtFAe//AUKD4xulz+mQi3zOvMiBcpohNfsTapnOWH4OzRPGHvXTS8+L228j29ItyEw=
X-Received: by 2002:a05:6402:1907:b0:41d:29d9:e3d with SMTP id
 e7-20020a056402190700b0041d29d90e3dmr10131837edz.250.1649551826678; Sat, 09
 Apr 2022 17:50:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220405173632.2663-1-h0tc0d3@gmail.com>
 <614a4844-fa5d-8b8e-0628-894394f31608@amd.com>
 <874k3670ez.fsf@intel.com> <f742b6b8-4056-543c-17a5-ae373ca71b45@amd.com>
In-Reply-To: <f742b6b8-4056-543c-17a5-ae373ca71b45@amd.com>
From: Grigory Vasilyev <h0tc0d3@gmail.com>
Date: Sun, 10 Apr 2022 03:50:25 +0300
Message-ID: <CAD5ugGBZeA1+7pS2eSyXkCt+DvHY8=6wObD7eJ98UAgY-FPVOw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Senseless code and unnecessary memset
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Jiawei Gu <Jiawei.Gu@amd.com>, Jani Nikula <jani.nikula@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Christian K=C3=B6nig in fact the compiler will very often replace {0} with
a memset call. I don't see a problem using {0} for local arrays with
primitive types.
There should also be no problem with memory alignment. Because the
compiler understands it. Using sizeof is also not a good idea.
More often everyone also makes mistakes with sizeof. It's best to
leave it as is, and there's no errors.
Indeed, when using structures and {0}, errors may occur, but I am not
aware of errors when using primitive types. I also looked at the
amdgpu code and  {0} is used in many places.
Also from experience malloc+memset is the most dangerous chain, can
silently damage memory, causing a bunch of subtle problems, and it is
better to replace them with more safe calloc.
Such a problem, for example, was recently found by me in fontconfig
and it crashed intel quartus. Therefore, where possible, I try to
avoid memset.

Regards, Grigory.

=D1=81=D1=80, 6 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 17:43, Christian K=
=C3=B6nig <christian.koenig@amd.com>:
>
> Am 06.04.22 um 16:26 schrieb Jani Nikula:
> > On Tue, 05 Apr 2022, Christian K=C3=B6nig <christian.koenig@amd.com> wr=
ote:
> >> Am 05.04.22 um 19:36 schrieb Grigory Vasilyev:
> >>> Using memset on local arrays before exiting the function is pointless=
.
> >>> Compilator will remove this code. Also for local arrays is preferable=
 to
> >>> use {0} instead of memset. Mistakes are often made when working with
> >>> memset.
> >> Well actually memset is preferred when working with structures which a=
re
> >> given to the hardware parser because {0} won't initialize paddings.
> > Not that I'd know anything that's going on here... but it sure seems
> > strange to me to be passing unpacked structures where the padding might
> > matter to a "hardware parser".
>
> Well to me it is an absolute miracle why the heck compilers don't
> initialize paddings.
>
> We had so many ups moments over the years and I really don't see why it
> should be more optimal to do this.
>
> Anyway, the memset() is used intentionally here and I don't really want
> to change it. What we could do is removing the second superfluous memset
> and use sizeof() instead of hard coding the size.
>
> Regards,
> Christian.
>
> >
> > *shrug*
> >
> >
> > BR,
> > Jani.
> >
> >
> >> So please don't use {0} in any of the atom bios code.
> >>
> >> Regards,
> >> Christian.
> >>
> >>> Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> >>> ---
> >>>    drivers/gpu/drm/amd/amdgpu/atom.c | 8 +-------
> >>>    1 file changed, 1 insertion(+), 7 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/amd/amdgpu/atom.c b/drivers/gpu/drm/amd/=
amdgpu/atom.c
> >>> index be9d61bcb8ae..537e48fbbe6b 100644
> >>> --- a/drivers/gpu/drm/amd/amdgpu/atom.c
> >>> +++ b/drivers/gpu/drm/amd/amdgpu/atom.c
> >>> @@ -1538,11 +1538,9 @@ struct atom_context *amdgpu_atom_parse(struct =
card_info *card, void *bios)
> >>>    int amdgpu_atom_asic_init(struct atom_context *ctx)
> >>>    {
> >>>     int hwi =3D CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
> >>> -   uint32_t ps[16];
> >>> +   uint32_t ps[16] =3D {0};
> >>>     int ret;
> >>>
> >>> -   memset(ps, 0, 64);
> >>> -
> >>>     ps[0] =3D cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
> >>>     ps[1] =3D cpu_to_le32(CU32(hwi + ATOM_FWI_DEFMCLK_PTR));
> >>>     if (!ps[0] || !ps[1])
> >>> @@ -1551,10 +1549,6 @@ int amdgpu_atom_asic_init(struct atom_context =
*ctx)
> >>>     if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
> >>>             return 1;
> >>>     ret =3D amdgpu_atom_execute_table(ctx, ATOM_CMD_INIT, ps);
> >>> -   if (ret)
> >>> -           return ret;
> >>> -
> >>> -   memset(ps, 0, 64);
> >>>
> >>>     return ret;
> >>>    }
>
