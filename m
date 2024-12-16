Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC80A9F3D24
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 22:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1CD10E7B5;
	Mon, 16 Dec 2024 21:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KOoWtM2e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E28A10E7B5;
 Mon, 16 Dec 2024 21:58:58 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5d3d69e5b63so521188a12.1; 
 Mon, 16 Dec 2024 13:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734386336; x=1734991136; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=inFtp2zBU4xLUzv5jcR1+e6FyFA1ZEqlF7DqnuaRfss=;
 b=KOoWtM2eXtoi8s/CKIJhFbcK81QMQd+WNrF4QD/pHmR6xUPKRy9AFCw5s2emu8pAHe
 NVp9cS+n/EtcUDZXBSEN1gjommkxqbbyQZj7pt9rqXIb9TEr6AhVRAh+C9o0wS0kbNSZ
 96cbAxcFkERk8gyteqlOQQorf5eADGzTu/BB2mZJ6rUd1BHKJmzQNMkXZsyS8B5iWMfd
 es4lhYcWUIIZCU/ng3eQv20EysVsLstV01d/dbWPVLwJVW8/n8FX4I8+ncwjKGrwOEs0
 POLs03f/Pd4ihcY1wbBHeM+MUcKfpAeJd4b9swEMHPRWiLxYQMHqf2H8+UMPRihc9OsK
 yOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734386336; x=1734991136;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=inFtp2zBU4xLUzv5jcR1+e6FyFA1ZEqlF7DqnuaRfss=;
 b=DiX0yP8mIE2oizxWxrfdCoat5vhcBn8yCVWOUGQA29XKLt6u0gtwKX4TaTcxvvIGz8
 Y5SFSyvqRsClcKjTtreqNdM6/wsGFwtB9NBMXZDpyzQO+hbTpUQd8fWtOUhU6W3mo9yE
 W1SB5PfO92lcZC9zpT+P4uGN5wjEvzRvN71zOupbBo5G2iFaZt4TbsbcXmbqeXIpamji
 gZbllPskBwHTnl6cWkKvZtnyqqjxiqm1jf6rv5FrN9vqV1i++Gra0I67oDRuobZbfh/0
 9saz5hk5QgHDGocdrnbx+NKBt7nCXtByXB0j5Qt/s667o+kwdGWfqGOFg1vZ9z6QLADj
 8FrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDIvBhO8Dv+1RPywHMA7IlqbLm9TZ6R8svQSq387NdJVdMPj3Q7mduF5ATc06NdOuGT3xJlnzS@lists.freedesktop.org,
 AJvYcCUdyeuz9J2e6qRdHITsB07uHi2r540QxzaArp/S5TE8+2/J2EsmoxMY0XyuafJJt4kNQDmYlgpqoX0=@lists.freedesktop.org,
 AJvYcCX9XnnI6561A4POmqD3XeJXmv+m137H2KkruLBxLmqe9uOHn3NrShwIqNxImo0pTps0xdNGxJtvC+7V@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqXrd8y/S9CVsE5Brj5okBU3JAp0o8TxGbMuOI5Akpw6jBb8jx
 THHbOwEyERLTQUXWH8nx/7O8cu30TrIcHbxgJUhYHe2HiFKQMvw7xrzPldlKUVANsUT7SDpmUu6
 pK3VG1XTfF4cxLPVP0c3w0WRtz5bBAQ==
X-Gm-Gg: ASbGncvIW7PkfIdq11I7DfY3nFT6I7VcnILAd5KPWfa6loYydctz3bAzx3Hmxm19hH3
 REsbnnrprmq4ouVwGHQDEBTR60whBCtnMFK4lrJA=
X-Google-Smtp-Source: AGHT+IHIMaETs5Yi9FBw9DxNQN8Rlw2irkgGkjE/EWKSMqr3RR/x9MKkXY3uHiRjbNUTTANzXjVOMZ0l8iQFmplm4lg=
X-Received: by 2002:a05:6402:35d2:b0:5d0:ccec:8518 with SMTP id
 4fb4d7f45d1cf-5d63c3e9a86mr4213111a12.8.1734386336295; Mon, 16 Dec 2024
 13:58:56 -0800 (PST)
MIME-Version: 1.0
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <340ed70a-a576-43c6-86ff-9b58ed513c72@mailbox.org>
 <a42981617e880d48e9614c9ab5a8892f7ae0a315.camel@pengutronix.de>
 <Z2A-1i6YiPSjdUnP@phenom.ffwll.local>
In-Reply-To: <Z2A-1i6YiPSjdUnP@phenom.ffwll.local>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Mon, 16 Dec 2024 16:58:20 -0500
Message-ID: <CAAxE2A7BnDR4LafUzS-JofF7=jvnMU6osiKx14Ce7mwFjynGbA@mail.gmail.com>
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>
Content-Type: multipart/alternative; boundary="0000000000007a72b106296a49f8"
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

--0000000000007a72b106296a49f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 9:53=E2=80=AFAM Simona Vetter <simona.vetter@ffwll.=
ch>
wrote:

> On Mon, Dec 16, 2024 at 11:46:13AM +0100, Lucas Stach wrote:
> > Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel D=C3=A4nzer:
> > > On 2024-12-15 21:53, Marek Ol=C5=A1=C3=A1k wrote:
> > > > The comment explains the problem with DRM_FORMAT_MOD_LINEAR.
> > > >
> > > > Signed-off-by: Marek Ol=C5=A1=C3=A1k <marek.olsak@amd.com <mailto:
> marek.olsak@amd.com>>
> > > >
> > > > diff --git a/include/uapi/drm/drm_fourcc.h
> b/include/uapi/drm/drm_fourcc.h
> > > > index 78abd819fd62e..8ec4163429014 100644
> > > > --- a/include/uapi/drm/drm_fourcc.h
> > > > +++ b/include/uapi/drm/drm_fourcc.h
> > > > @@ -484,9 +484,27 @@ extern "C" {
> > > >   * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in the
> DRM_ADDFB2 ioctl),
> > > >   * which tells the driver to also take driver-internal information
> into account
> > > >   * and so might actually result in a tiled framebuffer.
> > > > + *
> > > > + * WARNING:
> > > > + * There are drivers out there that expose DRM_FORMAT_MOD_LINEAR,
> but only
> > > > + * support a certain pitch alignment and can't import images with
> this modifier
> > > > + * if the pitch alignment isn't exactly the one supported. They ca=
n
> however
> > > > + * allocate images with this modifier and other drivers can import
> them only
> > > > + * if they support the same pitch alignment. Thus,
> DRM_FORMAT_MOD_LINEAR is
> > > > + * fundamentically incompatible across devices and is the only
> modifier that
> > > > + * has a chance of not working. The PITCH_ALIGN modifiers should b=
e
> used
> > > > + * instead.
> > > >   */
> > > >  #define DRM_FORMAT_MOD_LINEAR  fourcc_mod_code(NONE, 0)
> > > >
> > > > +/* Linear layout modifiers with an explicit pitch alignment in
> bytes.
> > > > + * Exposing this modifier requires that the pitch alignment is
> exactly
> > > > + * the number in the definition.
> > > > + */
> > > > +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_code(NONE=
,
> 1)
> > >
> > > It's not clear what you mean by "requires that the pitch alignment is
> exactly
> > > the number in the definition", since a pitch which is aligned to 256
> bytes is
> > > also aligned to 128 & 64 bytes. Do you mean the pitch must be exactly
> the width
> > > rounded up to the next / smallest possible multiple of the specified
> number of bytes?
> >
> > I guess that's the intention here, as some AMD GPUs apparently have
> > this limitation that they need an exact aligned pitch.
> >
> > If we open the can of worms to overhaul the linear modifier, I think it
> > would make sense to also add modifiers for the more common restriction,
> > where the pitch needs to be aligned to a specific granule, but the
> > engine doesn't care if things get overaligned to a multiple of the
> > granule. Having both sets would probably make it easier for the reader
> > to see the difference to the exact pitch modifiers proposed in this
> > patch.
>
> Yeah I think with linear modifiers that sepcificy alignment limitations w=
e
> need to be _extremely_ precise in what exactly is required, and what not.
> There's all kinds of hilarious stuff that might be incompatible, and if w=
e
> don't mind those we're right back to the "everyone agrees on what linear
> means" falacy.
>
> So if pitch must be a multiple of 64, but cannot be a multiple of 128
> (because the hw does not cope with the padding, then that's important).
> Other things are alignment constraints on the starting point, and any
> padding you need to add at the bottom (yeah some hw overscans and gets
> pissed if there's not memory there). So I think it's best to go overboard
> here with verbosity.
>
> There's also really funny stuff like power-of-two alignment and things
> like that, but I guess we'll get there if that's ever needed. That's also
> why I think we don't need to add all possible linear modifiers from the
> start, unless there's maybe too much confusion with stuff like "exactly
> 64b aligned pitch" and "at least 64b aligned pitch, but you can add lots
> of padding if you feel like".
>

Would it be possible and acceptable to require that the offset alignment is
always 4K and the slice padding is also always 4K to simplify those
constraints?

Marek

--0000000000007a72b106296a49f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Dec 16, 2024 at 9:53=E2=80=AFAM Simon=
a Vetter &lt;<a href=3D"mailto:simona.vetter@ffwll.ch">simona.vetter@ffwll.=
ch</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Mon, Dec 16, 2024 at 11:46:13AM +0100, Lucas Stach wrote:<br>
&gt; Am Montag, dem 16.12.2024 um 10:27 +0100 schrieb Michel D=C3=A4nzer:<b=
r>
&gt; &gt; On 2024-12-15 21:53, Marek Ol=C5=A1=C3=A1k wrote:<br>
&gt; &gt; &gt; The comment explains the problem with DRM_FORMAT_MOD_LINEAR.=
<br>
&gt; &gt; &gt; =C2=A0 =C2=A0<br>
&gt; &gt; &gt; Signed-off-by: Marek Ol=C5=A1=C3=A1k &lt;<a href=3D"mailto:m=
arek.olsak@amd.com" target=3D"_blank">marek.olsak@amd.com</a> &lt;mailto:<a=
 href=3D"mailto:marek.olsak@amd.com" target=3D"_blank">marek.olsak@amd.com<=
/a>&gt;&gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/dr=
m/drm_fourcc.h<br>
&gt; &gt; &gt; index 78abd819fd62e..8ec4163429014 100644<br>
&gt; &gt; &gt; --- a/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; &gt; +++ b/include/uapi/drm/drm_fourcc.h<br>
&gt; &gt; &gt; @@ -484,9 +484,27 @@ extern &quot;C&quot; {<br>
&gt; &gt; &gt; =C2=A0 * modifier (e.g. not setting DRM_MODE_FB_MODIFIERS in=
 the DRM_ADDFB2 ioctl),<br>
&gt; &gt; &gt; =C2=A0 * which tells the driver to also take driver-internal=
 information into account<br>
&gt; &gt; &gt; =C2=A0 * and so might actually result in a tiled framebuffer=
.<br>
&gt; &gt; &gt; + *<br>
&gt; &gt; &gt; + * WARNING:<br>
&gt; &gt; &gt; + * There are drivers out there that expose DRM_FORMAT_MOD_L=
INEAR, but only<br>
&gt; &gt; &gt; + * support a certain pitch alignment and can&#39;t import i=
mages with this modifier<br>
&gt; &gt; &gt; + * if the pitch alignment isn&#39;t exactly the one support=
ed. They can however<br>
&gt; &gt; &gt; + * allocate images with this modifier and other drivers can=
 import them only<br>
&gt; &gt; &gt; + * if they support the same pitch alignment. Thus, DRM_FORM=
AT_MOD_LINEAR is<br>
&gt; &gt; &gt; + * fundamentically incompatible across devices and is the o=
nly modifier that<br>
&gt; &gt; &gt; + * has a chance of not working. The PITCH_ALIGN modifiers s=
hould be used<br>
&gt; &gt; &gt; + * instead.<br>
&gt; &gt; &gt; =C2=A0 */<br>
&gt; &gt; &gt; =C2=A0#define DRM_FORMAT_MOD_LINEAR =C2=A0fourcc_mod_code(NO=
NE, 0)<br>
&gt; &gt; &gt; =C2=A0<br>
&gt; &gt; &gt; +/* Linear layout modifiers with an explicit pitch alignment=
 in bytes.<br>
&gt; &gt; &gt; + * Exposing this modifier requires that the pitch alignment=
 is exactly<br>
&gt; &gt; &gt; + * the number in the definition.<br>
&gt; &gt; &gt; + */<br>
&gt; &gt; &gt; +#define DRM_FORMAT_MOD_LINEAR_PITCH_ALIGN_64B fourcc_mod_co=
de(NONE, 1)<br>
&gt; &gt; <br>
&gt; &gt; It&#39;s not clear what you mean by &quot;requires that the pitch=
 alignment is exactly<br>
&gt; &gt; the number in the definition&quot;, since a pitch which is aligne=
d to 256 bytes is<br>
&gt; &gt; also aligned to 128 &amp; 64 bytes. Do you mean the pitch must be=
 exactly the width<br>
&gt; &gt; rounded up to the next / smallest possible multiple of the specif=
ied number of bytes?<br>
&gt; <br>
&gt; I guess that&#39;s the intention here, as some AMD GPUs apparently hav=
e<br>
&gt; this limitation that they need an exact aligned pitch.<br>
&gt; <br>
&gt; If we open the can of worms to overhaul the linear modifier, I think i=
t<br>
&gt; would make sense to also add modifiers for the more common restriction=
,<br>
&gt; where the pitch needs to be aligned to a specific granule, but the<br>
&gt; engine doesn&#39;t care if things get overaligned to a multiple of the=
<br>
&gt; granule. Having both sets would probably make it easier for the reader=
<br>
&gt; to see the difference to the exact pitch modifiers proposed in this<br=
>
&gt; patch.<br>
<br>
Yeah I think with linear modifiers that sepcificy alignment limitations we<=
br>
need to be _extremely_ precise in what exactly is required, and what not.<b=
r>
There&#39;s all kinds of hilarious stuff that might be incompatible, and if=
 we<br>
don&#39;t mind those we&#39;re right back to the &quot;everyone agrees on w=
hat linear<br>
means&quot; falacy.<br>
<br>
So if pitch must be a multiple of 64, but cannot be a multiple of 128<br>
(because the hw does not cope with the padding, then that&#39;s important).=
<br>
Other things are alignment constraints on the starting point, and any<br>
padding you need to add at the bottom (yeah some hw overscans and gets<br>
pissed if there&#39;s not memory there). So I think it&#39;s best to go ove=
rboard<br>
here with verbosity.<br>
<br>
There&#39;s also really funny stuff like power-of-two alignment and things<=
br>
like that, but I guess we&#39;ll get there if that&#39;s ever needed. That&=
#39;s also<br>
why I think we don&#39;t need to add all possible linear modifiers from the=
<br>
start, unless there&#39;s maybe too much confusion with stuff like &quot;ex=
actly<br>
64b aligned pitch&quot; and &quot;at least 64b aligned pitch, but you can a=
dd lots<br>
of padding if you feel like&quot;.<br></blockquote><div><br></div>Would it =
be possible and acceptable to require that the offset alignment is always 4=
K and the slice padding is also always 4K to simplify those constraints?<br=
></div><div class=3D"gmail_quote gmail_quote_container"><br></div><div clas=
s=3D"gmail_quote gmail_quote_container">Marek<br></div></div>

--0000000000007a72b106296a49f8--
