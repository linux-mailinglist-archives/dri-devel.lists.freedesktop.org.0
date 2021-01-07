Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC502ED63C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 19:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2EA189E2A;
	Thu,  7 Jan 2021 18:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFE089E05;
 Thu,  7 Jan 2021 18:00:29 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d13so6464878wrc.13;
 Thu, 07 Jan 2021 10:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5nTxCy2Os90uPe5uoyeYjImJZM2/LrSVl4Xxri0U1HA=;
 b=Yl85EHPv4AJST3j0W1sdZo8Ck4PDeZpSojeAJaKxfNkGfA/EbGpWIHkh6RfHyKuD7z
 j1Cf89/OH9QSr1qN9MMMJr5FyqC62T8cHA+QtbqKeh5oBp1IICc4+xCQ8o+T5owN4Xbr
 jlZIxs2TpNHZY8uyD0E6dvRRiOIzl/kibBV25qEPa4bgQCR7Yt8JHxTGPLMfF1NLtVqy
 ruOePLf3iF739KJyKP/b2itQZ9iWrtson8sMO1WPozEcuR5InzDrxCOs4/6K+cFyizZk
 LLBQHmIsiJDckg8q2evDafQsyo1qHTj6rlS11gWKDwBkjj2L9HQUmQYCQVdD98w4wOwE
 wFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5nTxCy2Os90uPe5uoyeYjImJZM2/LrSVl4Xxri0U1HA=;
 b=lEnQjoFd1tOq/Ee7wC6XxnXcOfwq3Jrb9Tn1vA9tlQTnTu2NRMJeaMrghcbgtuQuso
 OwrGxI3ka0EVKIzbFMKT0QxDVH48QOkPnINkG2awUu6nVsQ+MJTVtccmgMPPE7DqY57y
 mXCw08tfMSo9dWPfQ5xAfz4XQ1lNprPn/KZ/dbzOIn+jqUZ1LJohV9GiPJKwaGEUwvsW
 6BZ/wC24lvz6kvmOmCqWsMmYNHYlXus7zZEoOb0znTnHPK9LKCbD5rEokpKNkia41aiY
 k/+SVa4jTmpQ7CT02MR7G8D3M7L+nKw/j6c/1N0nR7Hv/P4Ss3lwM2+TogqwtjCpmb5J
 S6lw==
X-Gm-Message-State: AOAM532qvsg5GHF2ZEdriVGd/PilcdJ0E6pu5uerR29lwqj1XMp1Yd6J
 8SQx0DXR930eVQfq9MhWzKMfGDnzy3aiqnA9ky0=
X-Google-Smtp-Source: ABdhPJxiIbbelq6JUVnz8CHZlnQ3mIto/xldwTFkZlrlj7cmldiEHNswP35jwKccSDPxvomTAPVNbzoBOx01vho9PzU=
X-Received: by 2002:adf:8285:: with SMTP id 5mr9719087wrc.289.1610042427745;
 Thu, 07 Jan 2021 10:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>
 <X/dLdN1z6/Viqy9v@phenom.ffwll.local>
In-Reply-To: <X/dLdN1z6/Viqy9v@phenom.ffwll.local>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Thu, 7 Jan 2021 19:00:15 +0100
Message-ID: <CAEsyxyjaYkBzp_nPifhUpUJ=7vJO7MbeimeZM5H13Cta7bj9Ew@mail.gmail.com>
Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, zhan.liu@amd.com,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: multipart/mixed; boundary="===============1346827878=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1346827878==
Content-Type: multipart/alternative; boundary="000000000000faa90105b8533638"

--000000000000faa90105b8533638
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 7, 2021 at 6:57 PM Daniel Vetter <daniel@ffwll.ch> wrote:

> On Sat, Jan 02, 2021 at 04:31:36PM +0100, Mario Kleiner wrote:
> > On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> > <bas@basnieuwenhuizen.nl> wrote:
> > >
> > > With modifiers one can actually have different format_info structs
> > > for the same format, which now matters for AMDGPU since we convert
> > > implicit modifiers to explicit modifiers with multiple planes.
> > >
> > > I checked other drivers and it doesn't look like they end up triggering
> > > this case so I think this is safe to relax.
> > >
> > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for
> converted metadata.")
> > > ---
> > >  drivers/gpu/drm/drm_plane.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> > > index e6231947f987..f5085990cfac 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_device
> *dev,
> > >         if (ret)
> > >                 goto out;
> > >
> > > -       if (old_fb->format != fb->format) {
> > > +       if (old_fb->format->format != fb->format->format) {
> >
> > This was btw. the original way before Ville made it more strict about
> > 4 years ago, to catch issues related to tiling, and more complex
> > layouts, like the dcc tiling/retiling introduced by your modifier
> > patches. That's why I hope my alternative patch is a good solution for
> > atomic drivers while keeping the strictness for potential legacy
> > drivers.
>
> Yeah this doesn't work in full generality, because hw might need to do a
> full modeset to do a full modeset to reallocate resources (like scanout
> fifo space) if the format changes.
>
> But for atomic drivers that should be caught in ->atomic_check, which
> should result in -EINVAL, so should do the right thing. So it should be
> all good, but imo needs a comment to explain what's going on:
>
>         /*
>          * Only check the FOURCC format code, excluding modifiers. This is
>          * enough for all legacy drivers. Atomic drivers have their own
>          * checks in their ->atomic_check implementation, which will
>          * return -EINVAL if any hw or driver constraint is violated due
>          * to modifier changes.
>          */
>
> Also can you pls cc: intel-gfx to get this vetted by the intel-gfx ci?
>
> With that:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
>
Ah, my "atomic expert", posting simultaneously with myself :). Happy new
year. Opinions on my variant, just replied a minute ago?

thanks,
-mario

>
> > -mario
> >
> > >                 DRM_DEBUG_KMS("Page flip is not allowed to change
> frame buffer format.\n");
> > >                 ret = -EINVAL;
> > >                 goto out;
> > > --
> > > 2.29.2
> > >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
>

--000000000000faa90105b8533638
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Jan 7, 2021 at 6:57 PM Daniel Vet=
ter &lt;<a href=3D"mailto:daniel@ffwll.ch">daniel@ffwll.ch</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sat, Jan 02, 2021 at 04:31:36PM +0100, Mario Kleiner wrote:<b=
r>
&gt; On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen<br>
&gt; &lt;<a href=3D"mailto:bas@basnieuwenhuizen.nl" target=3D"_blank">bas@b=
asnieuwenhuizen.nl</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; With modifiers one can actually have different format_info struct=
s<br>
&gt; &gt; for the same format, which now matters for AMDGPU since we conver=
t<br>
&gt; &gt; implicit modifiers to explicit modifiers with multiple planes.<br=
>
&gt; &gt;<br>
&gt; &gt; I checked other drivers and it doesn&#39;t look like they end up =
triggering<br>
&gt; &gt; this case so I think this is safe to relax.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Bas Nieuwenhuizen &lt;<a href=3D"mailto:bas@basnie=
uwenhuizen.nl" target=3D"_blank">bas@basnieuwenhuizen.nl</a>&gt;<br>
&gt; &gt; Fixes: 816853f9dc40 (&quot;drm/amd/display: Set new format info f=
or converted metadata.&quot;)<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 drivers/gpu/drm/drm_plane.c | 2 +-<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_pl=
ane.c<br>
&gt; &gt; index e6231947f987..f5085990cfac 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/drm_plane.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/drm_plane.c<br>
&gt; &gt; @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct drm_dev=
ice *dev,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto=
 out;<br>
&gt; &gt;<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (old_fb-&gt;format !=3D fb-&gt;for=
mat) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (old_fb-&gt;format-&gt;format !=3D=
 fb-&gt;format-&gt;format) {<br>
&gt; <br>
&gt; This was btw. the original way before Ville made it more strict about<=
br>
&gt; 4 years ago, to catch issues related to tiling, and more complex<br>
&gt; layouts, like the dcc tiling/retiling introduced by your modifier<br>
&gt; patches. That&#39;s why I hope my alternative patch is a good solution=
 for<br>
&gt; atomic drivers while keeping the strictness for potential legacy<br>
&gt; drivers.<br>
<br>
Yeah this doesn&#39;t work in full generality, because hw might need to do =
a<br>
full modeset to do a full modeset to reallocate resources (like scanout<br>
fifo space) if the format changes.<br>
<br>
But for atomic drivers that should be caught in -&gt;atomic_check, which<br=
>
should result in -EINVAL, so should do the right thing. So it should be<br>
all good, but imo needs a comment to explain what&#39;s going on:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Only check the FOURCC format code, excl=
uding modifiers. This is<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* enough for all legacy drivers. Atomic d=
rivers have their own<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* checks in their -&gt;atomic_check imple=
mentation, which will<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* return -EINVAL if any hw or driver cons=
traint is violated due<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* to modifier changes.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
<br>
Also can you pls cc: intel-gfx to get this vetted by the intel-gfx ci?<br>
<br>
With that:<br>
<br>
Reviewed-by: Daniel Vetter &lt;<a href=3D"mailto:daniel.vetter@ffwll.ch" ta=
rget=3D"_blank">daniel.vetter@ffwll.ch</a>&gt;<br>
<br></blockquote><div><br></div><div>Ah, my &quot;atomic expert&quot;, post=
ing simultaneously with myself :). Happy new year. Opinions on my variant, =
just replied a minute ago?</div><div><br></div><div>thanks,<br></div><div>-=
mario</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt; <br>
&gt; -mario<br>
&gt; <br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_=
DEBUG_KMS(&quot;Page flip is not allowed to change frame buffer format.\n&q=
uot;);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D -EINVAL;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto=
 out;<br>
&gt; &gt; --<br>
&gt; &gt; 2.29.2<br>
&gt; &gt;<br>
<br>
-- <br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch" rel=3D"noreferrer" target=3D"_blank">http:=
//blog.ffwll.ch</a><br>
</blockquote></div></div>

--000000000000faa90105b8533638--

--===============1346827878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1346827878==--
