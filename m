Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E649F3D1B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 22:55:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5531510E7BC;
	Mon, 16 Dec 2024 21:55:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtkC9tkO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619F210E7BC;
 Mon, 16 Dec 2024 21:55:04 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3cd8e59fdso523439a12.3; 
 Mon, 16 Dec 2024 13:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734386103; x=1734990903; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7g3tDEPdEdGCybIEXwQPrCHeb6NOr4ZMTNOYXdBj46w=;
 b=JtkC9tkO1VEcuklvUvx08aCdxXQp5PdjSaqfHvP+JDj25d2HAUaMGu6j2oPjoygbGH
 q2FfxeuZL31wBGVAzRn3BqbDhHd1Ph/QNzDBhmvXk4zd26xYfKPQPxteruG4AIXs1i9n
 bRDzH59M22I/4m9UdPm7zbzoiqhw7tgtkcXyQSCt9ayLTHCZFuFgLzrMpGUDPR/bzj88
 XeqVLnWBuhO8P9IFUuEDFUNu9Q8Tqj+itMNxRlp1affXOgLrmsHphNSKa4oXfUeR0nj2
 at8DWYClcPk2wi1oN7vg1ReAlPCDSNUihZA7k66EPUpBuTqLdD18o0cflh9jDwaGl6O4
 Yv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734386103; x=1734990903;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7g3tDEPdEdGCybIEXwQPrCHeb6NOr4ZMTNOYXdBj46w=;
 b=fhMsa1Daq3CujhygFbW1plwZe5LGD9K5MiNcIWWJf9TjpupLCgkzlb9F8w0lNFSuPE
 ucyx8mWbPlgOhUqFJ0bx5zxwxILZgWsc5+qi/eEUqmrjNsTIrxdeV+8DFQu6ezsCKDoz
 zF+/28/5h2F6I1wy3SAbfZoA7pn7AfCFgaX6qIu61NiWJiIUsPTyOLTy0jRecCu8FPkE
 ik8fChaJI/PhLwf9dNyS7TP5tP5a7H98jYOxV+jfZ0lLZG9egePgyvIz7xtwaGq1Tu45
 JQdy7io3C4QjAz1dfY3T8G22eSYlLDyAygYBe/3TaO/ZxWwaq3iEhj4tfQ3WUOhnny3r
 T/lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDMMVBhdpJFJ8vQtRHZslUyctmIJEa2Bd8nF19gWju9dd6ZeX9kCT4FxlTfi065VnuRcP0IRWAYqOR@lists.freedesktop.org,
 AJvYcCUFnRPjjDxe+Jtk+b403mOOvN61dWkUXr7brP46FfB58NfB1IjwFWSzS29pi2+qfu65SfLwqyUX@lists.freedesktop.org,
 AJvYcCUNKas5uvKbEXa1T9Pbhi5OXPJr70Z+BnLmzUB5KUUoCA0Lek1tw0F//finwND8856zJxRygPpyUF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9DMD+AZEoQjtvnrDpWVIwNHJOr7Ba4e2e0iRZJvEf1FLoDjz5
 jM5KdNnxbj5DQRchLYqmDyknK9NG2ApGopsDSdhLgyThjPVdV5Lq8A+qJcG2H1pvducyUCp5lOL
 pVn20vUDIoJKmRrIFe3gA5e/yA8s=
X-Gm-Gg: ASbGncsPtA/XZU2j5grRHo+Uiw91kicUw4GOjYLRAWcgakyGpwb/K+JNyENjrgJFDKb
 rYkugCsGPR6O9bVYhghc8L1N3his0Rqio8zikjt4=
X-Google-Smtp-Source: AGHT+IFKfN/bXsKg0G+nB5Tq+KneDyQMoRqtpNMcckJbG/3ZFzuNQQLKkqs1Po9i1zEEb69nAFSeHgo2ITCkGXRjM+Q=
X-Received: by 2002:a05:6402:1e89:b0:5d0:b87c:3eb6 with SMTP id
 4fb4d7f45d1cf-5d63c3eb62fmr3684633a12.10.1734386102559; Mon, 16 Dec 2024
 13:55:02 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
 <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
In-Reply-To: <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 16 Dec 2024 16:54:26 -0500
Message-ID: <CAAxE2A6WVzkfeG-yU8QzM=V4qrWWKw7N1i2Ado=iNQMn5v4gGQ@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Lucas Stach <l.stach@pengutronix.de>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000008bed2906296a3b12"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000008bed2906296a3b12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 5:46=E2=80=AFAM Lucas Stach <l.stach@pengutronix.de=
> wrote:

> Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel D=C3=A4nzer:
> > On 2024-12-15 21:53, Marek Ol=C5=A1=C3=A1k wrote:
> > > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> > >
> > > Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com <mailto:
> marek.olsak@amd.com>>
> > >
> > > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > > index 78abd819fd62e..8ec4163429014 100644
> > > --- a/include/uapi/drm/drm_fourcc.h
> > > +++ b/include/uapi/drm/drm_fourcc.h
> > > @@ -484,9 +484,27 @@ extern "C" {
> > >   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the DRM_ADDFB=
2
> ioctl),
> > >   * which tells the driver to also take driver-internal information
> into account
> > >   * and so might actually result in a tiled framebuffer.
> > > + *
> > > + * WARNING:
> > > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR, bu=
t
> only
> > > + * support a certain pitch alignment and can't import images with
> this modifier
> > > + * if the pitch alignment isn't exactly the one supported. They can
> however
> > > + * allocate images with this modifier and other drivers can import
> them only
> > > + * if they support the same pitch alignment. Thus,
> DRM_FORMAT_MOD_LINEAR is
> > > + * fundamentically incompatible across devices and is the only
> modifier that
> > > + * has a chance of not working. The PITCH_ALIGN modifiers should be
> used
> > > + * instead.
> > >   */
> > >  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> > >
> > > +/* Linear layout modifiers with an explicit pitch alignment in bytes=
.
> > > + * Exposing this modifier requires that the pitch alignment is exact=
ly
> > > + * the number in the definition.
> > > + */
> > > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE, =
1)
> >
> > It's not clear what you mean by "requires that the pitch alignment is
> exactly
> > the number in the definition", since a pitch which is aligned to 256
> bytes is
> > also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly
> the width
> > rounded up to the next / smallest possible multiple of the specified
> number of bytes?
>
> I guess that's the intention here, as some AMD GPUs apparently have
> this limitation that they need an exact aligned pitch.
>
> If we open the can of worms to overhaul the linear modifier, I think it
> would make sense to also add modifiers for the more common restriction,
> where the pitch needs to be aligned to a specific granule, but the
> engine doesn't care if things get overaligned to a multiple of the
> granule. Having both sets would probably make it easier for the reader
> to see the difference to the exact pitch modifiers proposed in this
> patch.
>

That's a good point.

It could be:
- LINEAR_PITCH_ALIGN_EXACT_#B
- LINEAR_PITCH_ALIGN_MULTIPLE_#B

Drivers that expose the MULTIPLE ones should also expose the EXACT ones
that are equivalent. Other drivers will only expose the EXACT ones but not
the MULTIPLE ones.

Marek

--0000000000008bed2906296a3b12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 5:46=E2=80=AFAM Lucas=
 Stach &lt;<a href=3D"mailto:l.stach@pengutronix.de">l.stach@pengutronix.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel D=C3=A4nzer:<br>
&gt; On 2024-12-15 21:53, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; &gt; The comment explains the problem with DRM_FORMAT_MOD_LINEAR.<br>
&gt; &gt; =C2=A0 =C2=A0<br>
&gt; &gt; Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:marek.=
olsak@amd.com" target=3D"_blank">marek.olsak@amd.com</a> &lt;mailto:<a href=
=3D"mailto:marek.olsak@amd.com" target=3D"_blank">marek.olsak@amd.com</a>&g=
t;&gt;<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm=
_fourcc.h<br>
&gt; &gt; index 78abd819fd62e..8ec4163429014 100644<br>
&gt; &gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; @@ -484,9 +484,27 @@ extern &quot;C&quot; {<br>
&gt; &gt; =C2=A0 * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the =
DRM_ADDFB2 ioctl),<br>
&gt; &gt; =C2=A0 * which tells the driver to also take driver-internal info=
rmation into account<br>
&gt; &gt; =C2=A0 * and so might actually result in a tiled framebuffer.<br>
&gt; &gt; + *<br>
&gt; &gt; + * WARNING:<br>
&gt; &gt; + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR=
, but only<br>
&gt; &gt; + * support a certain pitch alignment and can&#39;t import images=
 with this modifier<br>
&gt; &gt; + * if the pitch alignment isn&#39;t exactly the one supported. T=
hey can however<br>
&gt; &gt; + * allocate images with this modifier and other drivers can impo=
rt them only<br>
&gt; &gt; + * if they support the same pitch alignment. Thus, DRM_FORMAT_MO=
D_LINEAR is<br>
&gt; &gt; + * fundamentically incompatible across devices and is the only m=
odifier that<br>
&gt; &gt; + * has a chance of not working. The PITCH_ALIGN modifiers should=
 be used<br>
&gt; &gt; + * instead.<br>
&gt; &gt; =C2=A0 */<br>
&gt; &gt; =C2=A0#define DRM_FORMAT_MOD_LINEAR =C2=A0fourcc_mod_code(NONE, 0=
)<br>
&gt; &gt; =C2=A0<br>
&gt; &gt; +/* Linear layout modifiers with an explicit pitch alignment in b=
ytes.<br>
&gt; &gt; + * Exposing this modifier requires that the pitch alignment is e=
xactly<br>
&gt; &gt; + * the number in the definition.<br>
&gt; &gt; + */<br>
&gt; &gt; +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NO=
NE, 1)<br>
&gt; <br>
&gt; It&#39;s not clear what you mean by &quot;requires that the pitch alig=
nment is exactly<br>
&gt; the number in the definition&quot;, since a pitch which is aligned to =
256 bytes is<br>
&gt; also aligned to 128 &amp; 64 bytes. Do you mean the pitch must be exac=
tly the width<br>
&gt; rounded up to the next / smallest possible multiple of the specified n=
umber of bytes?<br>
<br>
I guess that&#39;s the intention here, as some AMD GPUs apparently have<br>
this limitation that they need an exact aligned pitch.<br>
<br>
If we open the can of worms to overhaul the linear modifier, I think it<br>
would make sense to also add modifiers for the more common restriction,<br>
where the pitch needs to be aligned to a specific granule, but the<br>
engine doesn&#39;t care if things get overaligned to a multiple of the<br>
granule. Having both sets would probably make it easier for the reader<br>
to see the difference to the exact pitch modifiers proposed in this<br>
patch.<br></blockquote><div><br></div>That&#39;s a good point.</div><div cl=
ass=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quo=
te gmail_quote_container">It could be:</div><div class=3D"gmail_quote gmail=
_quote_container">- LINEAR_PITCH_ALIGN_EXACT_#B</div><div class=3D"gmail_qu=
ote gmail_quote_container">- LINEAR_PITCH_ALIGN_MULTIPLE_#B</div><div class=
=3D"gmail_quote gmail_quote_container"><br></div><div class=3D"gmail_quote =
gmail_quote_container">Drivers that expose the MULTIPLE ones should also ex=
pose the EXACT ones that are equivalent. Other drivers will only expose the=
 EXACT ones but not the MULTIPLE ones.<br></div><div class=3D"gmail_quote g=
mail_quote_container"><br></div><div class=3D"gmail_quote gmail_quote_conta=
iner">Marek<br></div></div>

--0000000000008bed2906296a3b12--
