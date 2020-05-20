Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828B1DBD30
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 20:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8976E887;
	Wed, 20 May 2020 18:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E376E887;
 Wed, 20 May 2020 18:45:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h17so4199774wrc.8;
 Wed, 20 May 2020 11:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bs04m1crtOZw2SHApC8+8Cn8PYwOytxRMsUefRMQ6/8=;
 b=PPdh6/FcbTsKd+BOnlKIfzOImeVTfJwxySvatugkQOuEBDR8t5I4NcPIOLh8vS/bYc
 1onYvanG1gBTv6JOY+jw0AGIscSNW+YgsJsaMs7r8QaY1xdJobN5LlO0oEudEAwn5ewe
 myguJ9IAIAQXQjVGtYtL6NiuTX2Q1UhkTIV0N/8j450S/acFaZyJfoxrbz9iEtNJzZ5/
 fFmYOy+TRPTgp+19zg10SqSp4b46xYXh0F6E5UTFmoyQ2ZDZQ7W2yeR3UEBbES5PMk5K
 M5eSZy//JlYBJfpPKU+Upi1ORoMxEI3BMOpe7J9sy8GG0Udyu8/cpj+a2Dro2SNrJ+4y
 3dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bs04m1crtOZw2SHApC8+8Cn8PYwOytxRMsUefRMQ6/8=;
 b=q+uEAbZPCUcQzJd7mw54VkhaN4Lys8SlGLIr0yu8dqicKox2YXJiRCE0sMUWIhsNR2
 tST/NNNPKIFEKDMnrXy04Dw7WzRnHGIhQuJQ7Tm8d/jijx5BqpboC3gcsDnwxIUSqbuk
 DrpgPpfBIZ8MxWkFb+Y7ewGX+fz+Luen1YbL0DE8zFNnQZrg7Jq3qX26+6CCJ+8r1W+0
 AVmwxolU/oUuEefGDX+CnvhzrxkTe2OGRntL1EOQWomJQPrsJ3MQ0jIC82GdDUYL2NCN
 SyTGonXjdqV4YECABCQvsyGPOerWHzAVXiF/OJPwjelD8jJuyx5PRQ90DObb0P7dyLgI
 lRNg==
X-Gm-Message-State: AOAM533GQkdAHJKpsYPcQhOdX8oC/Q4kh+1kLu8q0duZsHEcBOH1qta6
 X4mnXTRFa4rmzIrgQO/OHSZUcuORWvb9ogWPdbk=
X-Google-Smtp-Source: ABdhPJxI908cXuZsz1FW1XrSA4D/eB2vUFx1mG7IyI43TN8Kn8jkxyyILz83jhiux0G9zPsa4PPAkmSddy3b/gzcYvU=
X-Received: by 2002:adf:9166:: with SMTP id j93mr4941230wrj.289.1590000310488; 
 Wed, 20 May 2020 11:45:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200515051924.12331-1-mario.kleiner.de@gmail.com>
 <20200515051924.12331-3-mario.kleiner.de@gmail.com>
 <7ab95258-02a9-fd39-6806-e6e81ddc295c@amd.com>
 <CADnq5_MJzLC4q8MU9GTmVLzN1kHxy9m15nm3WwsCoPUb-0d2WA@mail.gmail.com>
In-Reply-To: <CADnq5_MJzLC4q8MU9GTmVLzN1kHxy9m15nm3WwsCoPUb-0d2WA@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Wed, 20 May 2020 20:44:58 +0200
Message-ID: <CAEsyxyjCbRvo-o-pUeYiuBbLX9SRNtZjaOLBr6CXDTdKRnMiNg@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-11.0 -
 DCE-12.
To: Alex Deucher <alexdeucher@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Harry Wentland <hwentlan@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============0715945121=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0715945121==
Content-Type: multipart/alternative; boundary="000000000000b312f905a618cbe7"

--000000000000b312f905a618cbe7
Content-Type: text/plain; charset="UTF-8"

On Wed, May 20, 2020 at 8:25 PM Alex Deucher <alexdeucher@gmail.com> wrote:

> On Wed, May 20, 2020 at 12:39 PM Harry Wentland <hwentlan@amd.com> wrote:
> >
> > On 2020-05-15 1:19 a.m., Mario Kleiner wrote:
> > > Testing on a Polaris11 gpu with DCE-11.2 suggests that it
> > > seems to work fine there, so optimistically enable it for
> > > DCE-11 and later.
> > >
> > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> > > ---
> > >  drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2 +-
> > >  drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2 +-
> > >  drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c | 2 +-
> > >  3 files changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> > > index 9597fc79d7fa..a043ddae5149 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> > > @@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap = {
> > >               .pixel_format_support = {
> > >                               .argb8888 = true,
> > >                               .nv12 = false,
> > > -                             .fp16 = false
> > > +                             .fp16 = true
> >
> > Carrizo (DCE 11.0) has a HW bug where FP16 scaling doesn't work. I
> > recommend we leave it off here.
>
> I'll drop this hunk for upstream.
>
> Alex
>
>
Ok, no fixup patch needed from myself, thanks Alex. Does the scaling bug
refer to scaling the planes (those max_downscale_factor /
max_upscale_factor definitions seem to be unused) or the fp16 values itself?

What about DCE 8 and DCE 10 hw capabilities wrt. fp16? Should i send fp16
enable patches for those as well?

-mario

>
> > Harry
> >
> > >               },
> > >
> > >               .max_upscale_factor = {
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> > > index 4a7796de2ff5..51b3fe502670 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> > > @@ -411,7 +411,7 @@ static const struct dc_plane_cap plane_cap = {
> > >       .pixel_format_support = {
> > >                       .argb8888 = true,
> > >                       .nv12 = false,
> > > -                     .fp16 = false
> > > +                     .fp16 = true
> > >       },
> > >
> > >       .max_upscale_factor = {
> > > diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> > > index 9a9764cbd78d..8f362e8c1787 100644
> > > --- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> > > +++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> > > @@ -516,7 +516,7 @@ static const struct dc_plane_cap plane_cap = {
> > >       .pixel_format_support = {
> > >                       .argb8888 = true,
> > >                       .nv12 = false,
> > > -                     .fp16 = false
> > > +                     .fp16 = true
> > >       },
> > >
> > >       .max_upscale_factor = {
> > >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

--000000000000b312f905a618cbe7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 20, 2020 at 8:25 PM Alex Deuc=
her &lt;<a href=3D"mailto:alexdeucher@gmail.com">alexdeucher@gmail.com</a>&=
gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On Wed, May 20, 2020 at 12:39 PM Harry Wentland &lt;<=
a href=3D"mailto:hwentlan@amd.com" target=3D"_blank">hwentlan@amd.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; On 2020-05-15 1:19 a.m., Mario Kleiner wrote:<br>
&gt; &gt; Testing on a Polaris11 gpu with DCE-11.2 suggests that it<br>
&gt; &gt; seems to work fine there, so optimistically enable it for<br>
&gt; &gt; DCE-11 and later.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kleiner.=
de@gmail.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2=
 +-<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2=
 +-<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c | 2=
 +-<br>
&gt; &gt;=C2=A0 3 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resourc=
e.c b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c<br>
&gt; &gt; index 9597fc79d7fa..a043ddae5149 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c<br>
&gt; &gt; @@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap =
=3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pixel_form=
at_support =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.argb8888 =3D true,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.nv12 =3D false,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D false<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D true<br>
&gt;<br>
&gt; Carrizo (DCE 11.0) has a HW bug where FP16 scaling doesn&#39;t work. I=
<br>
&gt; recommend we leave it off here.<br>
<br>
I&#39;ll drop this hunk for upstream.<br>
<br>
Alex<br>
<br></blockquote><div><br></div><div>Ok, no fixup patch needed from myself,=
 thanks Alex. Does the scaling bug refer to scaling the planes (those max_d=
ownscale_factor / max_upscale_factor definitions seem to be unused) or the =
fp16 values itself?</div><div><br></div><div>What about DCE 8 and DCE 10 hw=
 capabilities wrt. fp16? Should i send fp16 enable patches for those as wel=
l?</div><div><br></div><div>-mario</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt;<br>
&gt; Harry<br>
&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.max_upscal=
e_factor =3D {<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resourc=
e.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c<br>
&gt; &gt; index 4a7796de2ff5..51b3fe502670 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c<br>
&gt; &gt; @@ -411,7 +411,7 @@ static const struct dc_plane_cap plane_cap =
=3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.pixel_format_support =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0.argb8888 =3D true,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0.nv12 =3D false,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.fp16 =3D false<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.fp16 =3D true<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_upscale_factor =3D {<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resourc=
e.c b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c<br>
&gt; &gt; index 9a9764cbd78d..8f362e8c1787 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c<br>
&gt; &gt; @@ -516,7 +516,7 @@ static const struct dc_plane_cap plane_cap =
=3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.pixel_format_support =3D {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0.argb8888 =3D true,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0.nv12 =3D false,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.fp16 =3D false<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0.fp16 =3D true<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_upscale_factor =3D {<br>
&gt; &gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; <a href=3D"mailto:dri-devel@lists.freedesktop.org" target=3D"_blank">d=
ri-devel@lists.freedesktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel" r=
el=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/l=
istinfo/dri-devel</a><br>
</blockquote></div></div>

--000000000000b312f905a618cbe7--

--===============0715945121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0715945121==--
