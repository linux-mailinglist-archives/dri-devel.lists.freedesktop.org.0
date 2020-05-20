Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B18B1DBEEC
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 21:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D30326E894;
	Wed, 20 May 2020 19:58:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915616E894;
 Wed, 20 May 2020 19:58:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id j5so4442725wrq.2;
 Wed, 20 May 2020 12:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NQsGr8yLRmLepS9IgXnFNybwzo5KqpNOJrQPRcG/TI=;
 b=KiILePGFtCftl4JmWhWs7hVc0SNd1YzSXa/VZ8yJ+QuNFXGfg5YOJe90KZD+HpuKBL
 wMyp4LGOvJ2GBIXBoMyVN8in5RBLCi6vrtimaJ4DaWyXJtCwdA2ToYwWfFSXQo960B0M
 6vemgE8mX+XejglkSB6mRRKL2Gizz3oI4qXTtlkaxxvgzZhn/e5L5pwHcJNmzGRJgPDD
 LQdjnKEaaQS2UBhD+asWW6ZBAN22eh+WStmnTyO3FwmdjuUZXxPmpBAQxITmr0zQvwT6
 2Zl/SPbi88CYrKTdJbw+L3JY3mN4ezyhvIr3Q6sUfMSAoDKMD/0KCewHoFM1J20GmlvG
 rchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NQsGr8yLRmLepS9IgXnFNybwzo5KqpNOJrQPRcG/TI=;
 b=LsH1BxKi/3xmQk58WlhoFcsRZMF42VhPsRpEkJUspJNDk9GF6Ms8PtYIuIL2dzRNe/
 I4bV4slrQmgFa+w7VtZfZYD6/nMF4z2NXa72IdRxWUvROodsSiWXm9QcAE5MLrDKQgSa
 uzjfjfHRI5Cr0YDA0zqavlbYbEb93NhRYTwhpS3wSH/oucY3RjLzrUAiGM9CZsLo2/iF
 90bDIdHHJ1RbmBsCtyjAkcftJaKJby/7Gsir+ob+sZkpS/yPFMXyplUuZ7wO/oXFaV7w
 fnf/IV3TXByBL9+aSmNkM61tCnhSpcVTsbuib2wqcVz9TQne+MLRfw0QNN0ynQ95xeqR
 OZBw==
X-Gm-Message-State: AOAM5314VHsj4bFJzhQ1p1e5Q3HSSs4fmFXO8+HHZUrq7+vgJfGthk2/
 ULKZhg8mVouSZsP+X86dkESPpEIw0ncV7CeYyOc=
X-Google-Smtp-Source: ABdhPJwGpnFc6MOntb9V48VABOY0lgr9qs+MRV+r8xaU2pZ/a4g2HfSeTkkJF1kApVDh+zII+EdzTUpIRAOi+zgEDI8=
X-Received: by 2002:adf:9166:: with SMTP id j93mr5129841wrj.289.1590004689229; 
 Wed, 20 May 2020 12:58:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200515051924.12331-1-mario.kleiner.de@gmail.com>
 <20200515051924.12331-3-mario.kleiner.de@gmail.com>
 <7ab95258-02a9-fd39-6806-e6e81ddc295c@amd.com>
 <CADnq5_MJzLC4q8MU9GTmVLzN1kHxy9m15nm3WwsCoPUb-0d2WA@mail.gmail.com>
 <CAEsyxyjCbRvo-o-pUeYiuBbLX9SRNtZjaOLBr6CXDTdKRnMiNg@mail.gmail.com>
 <54f52bcf-83a6-f087-762d-3c8534f84865@amd.com>
In-Reply-To: <54f52bcf-83a6-f087-762d-3c8534f84865@amd.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Wed, 20 May 2020 21:57:57 +0200
Message-ID: <CAEsyxyjFHU-ZzGoEyPszVcsBNipojLHVBAxgdC1G=YLVb+todw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/amd/display: Enable fp16 also on DCE-11.0 -
 DCE-12.
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1493260015=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1493260015==
Content-Type: multipart/alternative; boundary="000000000000b15d5c05a619d056"

--000000000000b15d5c05a619d056
Content-Type: text/plain; charset="UTF-8"

On Wed, May 20, 2020 at 9:07 PM Kazlauskas, Nicholas <
nicholas.kazlauskas@amd.com> wrote:

> On 2020-05-20 2:44 p.m., Mario Kleiner wrote:
> > On Wed, May 20, 2020 at 8:25 PM Alex Deucher <alexdeucher@gmail.com
> > <mailto:alexdeucher@gmail.com>> wrote:
> >
> >     On Wed, May 20, 2020 at 12:39 PM Harry Wentland <hwentlan@amd.com
> >     <mailto:hwentlan@amd.com>> wrote:
> >      >
> >      > On 2020-05-15 1:19 a.m., Mario Kleiner wrote:
> >      > > Testing on a Polaris11 gpu with DCE-11.2 suggests that it
> >      > > seems to work fine there, so optimistically enable it for
> >      > > DCE-11 and later.
> >      > >
> >      > > Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com
> >     <mailto:mario.kleiner.de@gmail.com>>
> >      > > ---
> >      > >  drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c | 2 +-
> >      > >  drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2 +-
> >      > >  drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c | 2 +-
> >      > >  3 files changed, 3 insertions(+), 3 deletions(-)
> >      > >
> >      > > diff --git
> >     a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> >     b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> >      > > index 9597fc79d7fa..a043ddae5149 100644
> >      > > --- a/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> >      > > +++ b/drivers/gpu/drm/amd/display/dc/dce110/dce110_resource.c
> >      > > @@ -410,7 +410,7 @@ static const struct dc_plane_cap plane_cap
> = {
> >      > >               .pixel_format_support = {
> >      > >                               .argb8888 = true,
> >      > >                               .nv12 = false,
> >      > > -                             .fp16 = false
> >      > > +                             .fp16 = true
> >      >
> >      > Carrizo (DCE 11.0) has a HW bug where FP16 scaling doesn't work. I
> >      > recommend we leave it off here.
> >
> >     I'll drop this hunk for upstream.
> >
> >     Alex
> >
> >
> > Ok, no fixup patch needed from myself, thanks Alex. Does the scaling bug
> > refer to scaling the planes (those max_downscale_factor /
> > max_upscale_factor definitions seem to be unused) or the fp16 values
> itself?
> >
> > What about DCE 8 and DCE 10 hw capabilities wrt. fp16? Should i send
> > fp16 enable patches for those as well?
> >
> > -mario
>
> Yeah, the upscale and downscale factors were intended to block FP16
> accepted and reject the commit but I guess nobody ever added those to
> atomic check.
>
> I reviewed the patch with the idea in mind that we already blocked this
> on a DC level. We can re-enable it in the caps after this is in I think.
>
> Off the top of my head I don't remember what DCE8/DCE10 supports, but
> I'm also not sure if they even support sending the SDP message for those
> to really be usable.
>

While HDR is the typical user for fp16, even on SDR displays, without any
HDR signalling, fp16 should give an additional bit of precision ~ 11 bpc
effective in standard 0.0 - 1.0 unorm range on a 12 bit pipeline with a 12
bpc panel or even on a 10 bpc panel with dithering. Useful for
neuroscience/medical research applications or the color precision obsessed
people. I take every bit i can get ;)

-mario



> Regards,
> Nicholas Kazlauskas
>
> >
> >      >
> >      > Harry
> >      >
> >      > >               },
> >      > >
> >      > >               .max_upscale_factor = {
> >      > > diff --git
> >     a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> >     b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> >      > > index 4a7796de2ff5..51b3fe502670 100644
> >      > > --- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> >      > > +++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
> >      > > @@ -411,7 +411,7 @@ static const struct dc_plane_cap plane_cap
> = {
> >      > >       .pixel_format_support = {
> >      > >                       .argb8888 = true,
> >      > >                       .nv12 = false,
> >      > > -                     .fp16 = false
> >      > > +                     .fp16 = true
> >      > >       },
> >      > >
> >      > >       .max_upscale_factor = {
> >      > > diff --git
> >     a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> >     b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> >      > > index 9a9764cbd78d..8f362e8c1787 100644
> >      > > --- a/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> >      > > +++ b/drivers/gpu/drm/amd/display/dc/dce120/dce120_resource.c
> >      > > @@ -516,7 +516,7 @@ static const struct dc_plane_cap plane_cap
> = {
> >      > >       .pixel_format_support = {
> >      > >                       .argb8888 = true,
> >      > >                       .nv12 = false,
> >      > > -                     .fp16 = false
> >      > > +                     .fp16 = true
> >      > >       },
> >      > >
> >      > >       .max_upscale_factor = {
> >      > >
> >      > _______________________________________________
> >      > dri-devel mailing list
> >      > dri-devel@lists.freedesktop.org
> >     <mailto:dri-devel@lists.freedesktop.org>
> >      > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >     <https://lists.freedesktop.org/mailman/listinfo/dri-devel>
> >
>
>

--000000000000b15d5c05a619d056
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, May 20, 2020 at 9:07 PM Kazlauska=
s, Nicholas &lt;<a href=3D"mailto:nicholas.kazlauskas@amd.com">nicholas.kaz=
lauskas@amd.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On 2020-05-20 2:44 p.m., Mario Kl=
einer wrote:<br>
&gt; On Wed, May 20, 2020 at 8:25 PM Alex Deucher &lt;<a href=3D"mailto:ale=
xdeucher@gmail.com" target=3D"_blank">alexdeucher@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:alexdeucher@gmail.com" target=3D"_blank">=
alexdeucher@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Wed, May 20, 2020 at 12:39 PM Harry Wentland &lt=
;<a href=3D"mailto:hwentlan@amd.com" target=3D"_blank">hwentlan@amd.com</a>=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:hwentlan@amd.com" targ=
et=3D"_blank">hwentlan@amd.com</a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On 2020-05-15 1:19 a.m., Mario Kleiner wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; Testing on a Polaris11 gpu with DCE-11.2=
 suggests that it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; seems to work fine there, so optimistica=
lly enable it for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; DCE-11 and later.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; Signed-off-by: Mario Kleiner &lt;<a href=
=3D"mailto:mario.kleiner.de@gmail.com" target=3D"_blank">mario.kleiner.de@g=
mail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:mario.kleiner.de@gmail=
.com" target=3D"_blank">mario.kleiner.de@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 drivers/gpu/drm/amd/display/dc/dce=
110/dce110_resource.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 drivers/gpu/drm/amd/display/dc/dce=
112/dce112_resource.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 drivers/gpu/drm/amd/display/dc/dce=
120/dce120_resource.c | 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 3 files changed, 3 insertions(+), =
3 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/drivers/gpu/drm/amd/display/dc/dce110/dce110_reso=
urce.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/display/dc/dce110/dce110_reso=
urce.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; index 9597fc79d7fa..a043ddae5149 100644<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; --- a/drivers/gpu/drm/amd/display/dc/dce=
110/dce110_resource.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +++ b/drivers/gpu/drm/amd/display/dc/dce=
110/dce110_resource.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; @@ -410,7 +410,7 @@ static const struct =
dc_plane_cap plane_cap =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0.pixel_format_support =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.argb=
8888 =3D true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.nv12=
 =3D false,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D=
 false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D=
 true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Carrizo (DCE 11.0) has a HW bug where FP16 sc=
aling doesn&#39;t work. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; recommend we leave it off here.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I&#39;ll drop this hunk for upstream.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Alex<br>
&gt; <br>
&gt; <br>
&gt; Ok, no fixup patch needed from myself, thanks Alex. Does the scaling b=
ug <br>
&gt; refer to scaling the planes (those max_downscale_factor / <br>
&gt; max_upscale_factor definitions seem to be unused) or the fp16 values i=
tself?<br>
&gt; <br>
&gt; What about DCE 8 and DCE 10 hw capabilities wrt. fp16? Should i send <=
br>
&gt; fp16 enable patches for those as well?<br>
&gt; <br>
&gt; -mario<br>
<br>
Yeah, the upscale and downscale factors were intended to block FP16 <br>
accepted and reject the commit but I guess nobody ever added those to <br>
atomic check.<br>
<br>
I reviewed the patch with the idea in mind that we already blocked this <br=
>
on a DC level. We can re-enable it in the caps after this is in I think.<br=
>
<br>
Off the top of my head I don&#39;t remember what DCE8/DCE10 supports, but <=
br>
I&#39;m also not sure if they even support sending the SDP message for thos=
e <br>
to really be usable.<br></blockquote><div><br></div><div>While HDR is the t=
ypical user for fp16, even on SDR displays, without any HDR signalling, fp1=
6 should give an additional bit of precision ~ 11 bpc effective in standard=
 0.0 - 1.0 unorm range on a 12 bit pipeline with a 12 bpc panel or even on =
a 10 bpc panel with dithering. Useful for neuroscience/medical research app=
lications or the color precision obsessed people. I take every bit i can ge=
t ;) <br></div><div><br></div><div>-mario<br></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Nicholas Kazlauskas<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Harry<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0.max_upscale_factor =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/drivers/gpu/drm/amd/display/dc/dce112/dce112_reso=
urce.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/display/dc/dce112/dce112_reso=
urce.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; index 4a7796de2ff5..51b3fe502670 100644<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; --- a/drivers/gpu/drm/amd/display/dc/dce=
112/dce112_resource.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +++ b/drivers/gpu/drm/amd/display/dc/dce=
112/dce112_resource.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; @@ -411,7 +411,7 @@ static const struct =
dc_plane_cap plane_cap =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.pixel_format_=
support =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.argb8888 =3D true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.nv12 =3D false,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_upscale_f=
actor =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; diff --git<br>
&gt;=C2=A0 =C2=A0 =C2=A0a/drivers/gpu/drm/amd/display/dc/dce120/dce120_reso=
urce.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/drivers/gpu/drm/amd/display/dc/dce120/dce120_reso=
urce.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; index 9a9764cbd78d..8f362e8c1787 100644<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; --- a/drivers/gpu/drm/amd/display/dc/dce=
120/dce120_resource.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +++ b/drivers/gpu/drm/amd/display/dc/dce=
120/dce120_resource.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; @@ -516,7 +516,7 @@ static const struct =
dc_plane_cap plane_cap =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.pixel_format_=
support =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.argb8888 =3D true,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.nv12 =3D false,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D false<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.fp16 =3D true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.max_upscale_f=
actor =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; _____________________________________________=
__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; dri-devel mailing list<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"mailto:dri-devel@lists.freedesktop=
.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:dri-devel@lists.freede=
sktop.org" target=3D"_blank">dri-devel@lists.freedesktop.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; <a href=3D"https://lists.freedesktop.org/mail=
man/listinfo/dri-devel" rel=3D"noreferrer" target=3D"_blank">https://lists.=
freedesktop.org/mailman/listinfo/dri-devel</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://lists.freedesktop.org/mailma=
n/listinfo/dri-devel" rel=3D"noreferrer" target=3D"_blank">https://lists.fr=
eedesktop.org/mailman/listinfo/dri-devel</a>&gt;<br>
&gt; <br>
<br>
</blockquote></div></div>

--000000000000b15d5c05a619d056--

--===============1493260015==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1493260015==--
