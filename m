Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B25FB2ED629
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484AE6E4C5;
	Thu,  7 Jan 2021 17:57:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F6176E4B6;
 Thu,  7 Jan 2021 17:57:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id k10so5899697wmi.3;
 Thu, 07 Jan 2021 09:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gUcaGZymQDcRxIuTOkPyZzspElfBfd5elnWZrJnNXyo=;
 b=L0E1Une++LOEx0Pt4ihgcDL9xG8yU6sidln1Nlvtbz4yLgYFMfj97I+SGuH2P9LPt5
 58EaNHSNhzz9mYRRVpvJr16fgq+cGjIjKTJLx2uyOBvHGtM8inijm1LhVgdHYeNe6kes
 c6Lc80xtbUlPIIfmhgQOfzHkJvEsFecR2e2Sgdre+zYIpzaVLXzfqkh8aBy9ax1tCrTz
 evLaMdG+vRCrKsWDy6ARgLZzQth1BDnPmpqqYKZyJLlTKzB4phba4lMSMlUNKVDAcxmW
 +4vkuSOUQrMEC3LLCF240esDaL9qQOjK4DHSXWmh5ntuFJmgSoKmIt9hsdskbulS/C0o
 oQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gUcaGZymQDcRxIuTOkPyZzspElfBfd5elnWZrJnNXyo=;
 b=cP/mz9bpcIdVVnaIOd0INgXJ+DfgkjWQBMqnwMyjhDtLBSTMZGKK1FEKUGsvNnabHh
 NkOweFhH38jrSuxZ86/7wJ3raiAQ3PplquCJjQQrh95GB34R90maQUzQSRvLECWbDuHK
 TiizqLyTPngYOjFufTWwrT0Ir3XogelxbQYNwpbUH/xlRbPsnkFcT6fcUis1hIAivF6V
 r4pjehd5leay+OtW0lriKq6hsWTvH1onetNF+DIsUJYxGMI6ltMff33ZVW41mk9rGEXM
 mKpRngea2uwn16UPpsJml4nKlCUebuCx8Aq8jU3cdwM0ZU04bwo7yk1lBsUKwLQ3cGgM
 Fr7Q==
X-Gm-Message-State: AOAM531x0tlsWpZshbfevavNs/INzLKaNcDpeRkcWocOoTCuk35+HOyT
 fcAvn9WQxcnVSfLwg7Ujz/3fYkdzpSVfcksYllw=
X-Google-Smtp-Source: ABdhPJy5MAo/JXMTvtDBMKZAe9XhgkRkHWX5QsMRBM/JCcr6SBcyxr93ztF6UsG2OSXluIh03OLUS1TtCfyLO/VBjbk=
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr8987465wmj.164.1610042272305; 
 Thu, 07 Jan 2021 09:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
 <CAP+8YyHJpE39aea8OhGuQNjaGjLq4vcK-hNL+pC_wL5qsHwv2A@mail.gmail.com>
 <DM6PR12MB29719139A32F7BA9037AA45B9ED20@DM6PR12MB2971.namprd12.prod.outlook.com>
 <DM6PR12MB2971F5C08DA2DB1646E9FC379ED00@DM6PR12MB2971.namprd12.prod.outlook.com>
 <DM6PR12MB297104CA9471887DE00F64489EAF0@DM6PR12MB2971.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB297104CA9471887DE00F64489EAF0@DM6PR12MB2971.namprd12.prod.outlook.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 7 Jan 2021 18:57:40 +0100
Message-ID: <CAEsyxyhoyVt=z+54XHo+FTSg=Q0ktL83QanpqJAnEdqJTFZ13Q@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
To: "Liu, Zhan" <Zhan.Liu@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1026362548=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1026362548==
Content-Type: multipart/alternative; boundary="000000000000b6d42005b8532d2a"

--000000000000b6d42005b8532d2a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 7, 2021 at 6:21 PM Liu, Zhan <Zhan.Liu@amd.com> wrote:
>
> [AMD Official Use Only - Internal Distribution Only]
>
> > -----Original Message-----
> > From: Liu, Zhan
> > Sent: 2021/January/06, Wednesday 10:04 AM
> > To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Mario Kleiner
> > <mario.kleiner.de@gmail.com>
> > Cc: dri-devel <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-
> > gfx@lists.freedesktop.org>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Daniel Vetter <daniel.vetter@ffwll.ch>;
> > Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Ville Syrj=C3=A4l=
=C3=A4
> > <ville.syrjala@linux.intel.com>
> > Subject: RE: [PATCH] drm: Check actual format for legacy pageflip.
> >
> >
> > > -----Original Message-----
> > > From: Liu, Zhan <Zhan.Liu@amd.com>
> > > Sent: 2021/January/04, Monday 3:46 PM
> > > To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Mario Kleiner
> > > <mario.kleiner.de@gmail.com>
> > > Cc: dri-devel <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-
> > > gfx@lists.freedesktop.org>; Deucher, Alexander
> > > <Alexander.Deucher@amd.com>; Daniel Vetter <daniel.vetter@ffwll.ch>;
> > > Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Ville Syrj=C3=A4l=
=C3=A4
> > > <ville.syrjala@linux.intel.com>
> > > Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
> > >
> > >
> > >
> > > + Ville
> > >
> > > On Sat, Jan 2, 2021 at 4:31 PM Mario Kleiner
> > > <mario.kleiner.de@gmail.com>
> > > wrote:
> > > >
> > > > On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> > > > <bas@basnieuwenhuizen.nl> wrote:
> > > > >
> > > > > With modifiers one can actually have different format_info struct=
s
> > > > > for the same format, which now matters for AMDGPU since we conver=
t
> > > > > implicit modifiers to explicit modifiers with multiple planes.
> > > > >
> > > > > I checked other drivers and it doesn't look like they end up
> > > > > triggering this case so I think this is safe to relax.
> > > > >
> > > > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for
> > > > >converted metadata.")
> > > > > ---
> > > > >  drivers/gpu/drm/drm_plane.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > > > b/drivers/gpu/drm/drm_plane.c index e6231947f987..f5085990cfac
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct
> > > drm_device
> > > > >*dev,
> > > > >         if (ret)
> > > > >                 goto out;
> > > > >
> > > > > -       if (old_fb->format !=3D fb->format) {
> > > > > +       if (old_fb->format->format !=3D fb->format->format) {
> > > >
> > >
> > > I agree with this patch, though considering the original way was made
> > > by Ville, I will wait for Ville's input first. Adding my "Acked-by"
here.
> > >
> > > This patch is:
> > > Acked-by: Zhan Liu <zhan.liu@amd.com>
>
> Since there is no objection from the community on this patch over the
past few days, and this patch totally makes sense to me, this patch is:
>
> Reviewed-by: Zhan Liu <zhan.liu@amd.com>
>

Well, there is my alternative one-line patch, which is equally simple and
solves the problem in a similar way that doesn't undo Ville's stricter
checks, but it doesn't seem to get any attention:

https://lists.freedesktop.org/archives/dri-devel/2021-January/292763.html

Mine keeps the check as strict as before for non-atomic drivers, but
removes the check for atomic drivers, given the assumption that they should
be able to do without it.

In the end both patches solve the problem in the short term, also
satisfying my (users) needs, and the future is unknown. But it would be
nice to get an opinion from an atomic expert which one is the more future
proof / elegant / final solution to stick to in the face of potential
future atomic kms drivers

With that said, i will add to Bas patch a

Reported-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Acked-by: Mario Kleiner <mario.kleiner.de@gmail.com>

thanks,
-mario

> >
> > Ping...
> >
> > >
> > > > This was btw. the original way before Ville made it more strict
> > > > about
> > > > 4 years ago, to catch issues related to tiling, and more complex
> > > > layouts, like the dcc tiling/retiling introduced by your modifier
> > > > patches. That's why I hope my alternative patch is a good solution
> > > > for atomic drivers while keeping the strictness for potential legac=
y
> > > > drivers.
> > > >
> > > > -mario
> > > >
> > > > >                 DRM_DEBUG_KMS("Page flip is not allowed to change
> > > > >frame buffer format.\n");
> > > > >                 ret =3D -EINVAL;
> > > > >                 goto out;
> > > > > --
> > > > > 2.29.2
> > > > >

--000000000000b6d42005b8532d2a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>On Thu, Jan 7, 2021 at 6:21 PM Liu, Zhan &lt;<a href=
=3D"mailto:Zhan.Liu@amd.com">Zhan.Liu@amd.com</a>&gt; wrote:<br>&gt;<br>&gt=
; [AMD Official Use Only - Internal Distribution Only]<br>&gt;<br>&gt; &gt;=
 -----Original Message-----<br>&gt; &gt; From: Liu, Zhan<br>&gt; &gt; Sent:=
 2021/January/06, Wednesday 10:04 AM<br>&gt; &gt; To: Bas Nieuwenhuizen &lt=
;<a href=3D"mailto:bas@basnieuwenhuizen.nl">bas@basnieuwenhuizen.nl</a>&gt;=
; Mario Kleiner<br>&gt; &gt; &lt;<a href=3D"mailto:mario.kleiner.de@gmail.c=
om">mario.kleiner.de@gmail.com</a>&gt;<br>&gt; &gt; Cc: dri-devel &lt;<a hr=
ef=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesktop.o=
rg</a>&gt;; amd-gfx list &lt;amd-<br>&gt; &gt; <a href=3D"mailto:gfx@lists.=
freedesktop.org">gfx@lists.freedesktop.org</a>&gt;; Deucher, Alexander<br>&=
gt; &gt; &lt;<a href=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher=
@amd.com</a>&gt;; Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.c=
h">daniel.vetter@ffwll.ch</a>&gt;;<br>&gt; &gt; Kazlauskas, Nicholas &lt;<a=
 href=3D"mailto:Nicholas.Kazlauskas@amd.com">Nicholas.Kazlauskas@amd.com</a=
>&gt;; Ville Syrj=C3=A4l=C3=A4<br>&gt; &gt; &lt;<a href=3D"mailto:ville.syr=
jala@linux.intel.com">ville.syrjala@linux.intel.com</a>&gt;<br>&gt; &gt; Su=
bject: RE: [PATCH] drm: Check actual format for legacy pageflip.<br>&gt; &g=
t;<br>&gt; &gt;<br>&gt; &gt; &gt; -----Original Message-----<br>&gt; &gt; &=
gt; From: Liu, Zhan &lt;<a href=3D"mailto:Zhan.Liu@amd.com">Zhan.Liu@amd.co=
m</a>&gt;<br>&gt; &gt; &gt; Sent: 2021/January/04, Monday 3:46 PM<br>&gt; &=
gt; &gt; To: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.n=
l">bas@basnieuwenhuizen.nl</a>&gt;; Mario Kleiner<br>&gt; &gt; &gt; &lt;<a =
href=3D"mailto:mario.kleiner.de@gmail.com">mario.kleiner.de@gmail.com</a>&g=
t;<br>&gt; &gt; &gt; Cc: dri-devel &lt;<a href=3D"mailto:dri-devel@lists.fr=
eedesktop.org">dri-devel@lists.freedesktop.org</a>&gt;; amd-gfx list &lt;am=
d-<br>&gt; &gt; &gt; <a href=3D"mailto:gfx@lists.freedesktop.org">gfx@lists=
.freedesktop.org</a>&gt;; Deucher, Alexander<br>&gt; &gt; &gt; &lt;<a href=
=3D"mailto:Alexander.Deucher@amd.com">Alexander.Deucher@amd.com</a>&gt;; Da=
niel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch">daniel.vetter@ffw=
ll.ch</a>&gt;;<br>&gt; &gt; &gt; Kazlauskas, Nicholas &lt;<a href=3D"mailto=
:Nicholas.Kazlauskas@amd.com">Nicholas.Kazlauskas@amd.com</a>&gt;; Ville Sy=
rj=C3=A4l=C3=A4<br>&gt; &gt; &gt; &lt;<a href=3D"mailto:ville.syrjala@linux=
.intel.com">ville.syrjala@linux.intel.com</a>&gt;<br>&gt; &gt; &gt; Subject=
: Re: [PATCH] drm: Check actual format for legacy pageflip.<br>&gt; &gt; &g=
t;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; + Ville<br>&gt; &g=
t; &gt;<br>&gt; &gt; &gt; On Sat, Jan 2, 2021 at 4:31 PM Mario Kleiner<br>&=
gt; &gt; &gt; &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com">mario.klein=
er.de@gmail.com</a>&gt;<br>&gt; &gt; &gt; wrote:<br>&gt; &gt; &gt; &gt;<br>=
&gt; &gt; &gt; &gt; On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen<br>&gt=
; &gt; &gt; &gt; &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl">bas@basnieu=
wenhuizen.nl</a>&gt; wrote:<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &=
gt; &gt; With modifiers one can actually have different format_info structs=
<br>&gt; &gt; &gt; &gt; &gt; for the same format, which now matters for AMD=
GPU since we convert<br>&gt; &gt; &gt; &gt; &gt; implicit modifiers to expl=
icit modifiers with multiple planes.<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &g=
t; &gt; &gt; &gt; I checked other drivers and it doesn&#39;t look like they=
 end up<br>&gt; &gt; &gt; &gt; &gt; triggering this case so I think this is=
 safe to relax.<br>&gt; &gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; Sig=
ned-off-by: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl=
">bas@basnieuwenhuizen.nl</a>&gt;<br>&gt; &gt; &gt; &gt; &gt; Fixes: 816853=
f9dc40 (&quot;drm/amd/display: Set new format info for<br>&gt; &gt; &gt; &g=
t; &gt;converted metadata.&quot;)<br>&gt; &gt; &gt; &gt; &gt; ---<br>&gt; &=
gt; &gt; &gt; &gt; =C2=A0drivers/gpu/drm/drm_plane.c | 2 +-<br>&gt; &gt; &g=
t; &gt; &gt; =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>&gt; &g=
t; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; diff --git a/drivers/gpu/drm/=
drm_plane.c<br>&gt; &gt; &gt; &gt; &gt; b/drivers/gpu/drm/drm_plane.c index=
 e6231947f987..f5085990cfac<br>&gt; &gt; &gt; &gt; &gt; 100644<br>&gt; &gt;=
 &gt; &gt; &gt; --- a/drivers/gpu/drm/drm_plane.c<br>&gt; &gt; &gt; &gt; &g=
t; +++ b/drivers/gpu/drm/drm_plane.c<br>&gt; &gt; &gt; &gt; &gt; @@ -1163,7=
 +1163,7 @@ int drm_mode_page_flip_ioctl(struct<br>&gt; &gt; &gt; drm_devic=
e<br>&gt; &gt; &gt; &gt; &gt;*dev,<br>&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if (ret)<br>&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>&gt; &gt; &gt; &gt; &gt;<b=
r>&gt; &gt; &gt; &gt; &gt; - =C2=A0 =C2=A0 =C2=A0 if (old_fb-&gt;format !=
=3D fb-&gt;format) {<br>&gt; &gt; &gt; &gt; &gt; + =C2=A0 =C2=A0 =C2=A0 if =
(old_fb-&gt;format-&gt;format !=3D fb-&gt;format-&gt;format) {<br>&gt; &gt;=
 &gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; I agree with this patch, tho=
ugh considering the original way was made<br>&gt; &gt; &gt; by Ville, I wil=
l wait for Ville&#39;s input first. Adding my &quot;Acked-by&quot; here.<br=
>&gt; &gt; &gt;<br>&gt; &gt; &gt; This patch is:<br>&gt; &gt; &gt; Acked-by=
: Zhan Liu &lt;<a href=3D"mailto:zhan.liu@amd.com">zhan.liu@amd.com</a>&gt;=
<br>&gt;<br>&gt; Since there is no objection from the community on this pat=
ch over the past few days, and this patch totally makes sense to me, this p=
atch is:<br>&gt;<br>&gt; Reviewed-by: Zhan Liu &lt;<a href=3D"mailto:zhan.l=
iu@amd.com">zhan.liu@amd.com</a>&gt;<br>&gt;<br><br>Well, there is my alter=
native one-line patch, which is equally simple and solves the problem in a =
similar way that doesn&#39;t undo Ville&#39;s stricter checks, but it doesn=
&#39;t seem to get any attention:<br><div><br></div><div><a href=3D"https:/=
/lists.freedesktop.org/archives/dri-devel/2021-January/292763.html">https:/=
/lists.freedesktop.org/archives/dri-devel/2021-January/292763.html</a><br><=
/div><div><br></div><div>Mine keeps the check as strict as before for non-a=
tomic drivers, but removes the check for atomic drivers, given the assumpti=
on that they should be able to do without it.</div><div><br></div>In the en=
d both patches solve the problem in the short term, also satisfying my (use=
rs) needs, and the future is unknown. But it would be nice to get an opinio=
n from an atomic expert which one is the more future proof / elegant / fina=
l solution to stick to in the face of potential future atomic kms drivers<b=
r><br>With that said, i will add to Bas patch a<br><br>Reported-by: Mario K=
leiner &lt;<a href=3D"mailto:mario.kleiner.de@gmail.com">mario.kleiner.de@g=
mail.com</a>&gt;<br>Acked-by: Mario Kleiner &lt;<a href=3D"mailto:mario.kle=
iner.de@gmail.com">mario.kleiner.de@gmail.com</a>&gt;<br><br></div><div>tha=
nks,</div><div>-mario<br></div><div><br>&gt; &gt;<br>&gt; &gt; Ping...<br>&=
gt; &gt;<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; This was btw. the origina=
l way before Ville made it more strict<br>&gt; &gt; &gt; &gt; about<br>&gt;=
 &gt; &gt; &gt; 4 years ago, to catch issues related to tiling, and more co=
mplex<br>&gt; &gt; &gt; &gt; layouts, like the dcc tiling/retiling introduc=
ed by your modifier<br>&gt; &gt; &gt; &gt; patches. That&#39;s why I hope m=
y alternative patch is a good solution<br>&gt; &gt; &gt; &gt; for atomic dr=
ivers while keeping the strictness for potential legacy<br>&gt; &gt; &gt; &=
gt; drivers.<br>&gt; &gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; -mario<br>&gt; &=
gt; &gt; &gt;<br>&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 DRM_DEBUG_KMS(&quot;Page flip is not allowed to ch=
ange<br>&gt; &gt; &gt; &gt; &gt;frame buffer format.\n&quot;);<br>&gt; &gt;=
 &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret=
 =3D -EINVAL;<br>&gt; &gt; &gt; &gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>&gt; &gt; &gt; &gt; &gt; --<br>&gt; &=
gt; &gt; &gt; &gt; 2.29.2<br>&gt; &gt; &gt; &gt; &gt;</div></div>

--000000000000b6d42005b8532d2a--

--===============1026362548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1026362548==--
