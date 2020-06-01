Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB021EA04E
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 10:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68A2D6E1F6;
	Mon,  1 Jun 2020 08:49:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67886E1F6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 08:49:48 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id q2so7093452ljm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 01:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Ecc5j9Vespt6uQfpqm8Onhw3xOKttVnPa1xzWTaH/fs=;
 b=of0hK6X99IPnx0Mi68MjqCACzpy1efPOa4HdT95hJKUY2xwnF+2tcLLJznV3QxDfG0
 BWX37Egldp4Ieau2FOTjAR2T/SLOk1IboOAt5XrsRrCc4R5CvlF7m5A+FOojre1M4183
 8GWv8IlnAigFYySHtH7Sm3CXqnU9APusA8VQ6QUa8/q7NTfwXrCrJlS5lAyczOEslrAa
 nHCilFmh9GjpQV3CKGvHZuwfq1hp015smnKXME4Jx7+9p1fV74VjqRVLpiqgomHkLYLr
 CHMxqBeHbR0HArrDAZBNsmVDNHP1sNXOv8g9uza6MbeENj9UhbcHpl9g+uOh7Hb7tFmZ
 HdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Ecc5j9Vespt6uQfpqm8Onhw3xOKttVnPa1xzWTaH/fs=;
 b=d3ibCz7BgzCXc9L7o7nWyvBbPwmldYq7i5dG+r21/X89hj8CjPETpfj7y8/XFosl4q
 793b3W/jgT0orot7goi3lfW3I4N8Rk07Ss8raEiOZGyjYmIqJyEqVSvw+Iay1mHUaLXh
 cQ2KJQcTa3yarqkO1EXeQf7KmQvonIc0q/w5tN9EJDYlZrekm6cpB8gn3dVYglcnoSv4
 JfLF0pWkGRhrv+DC1m3+0fGa4+KnSQP1Ry/fvf/17kIWfHBaErbI3dM2G2t01dmAZnQz
 +H9WplYKTUjLEjfGOuz+NwKNIE65EMa4WT7ceQnEM+BVCamCpDaf6JO/Lk4BMSV8vmC9
 cj0A==
X-Gm-Message-State: AOAM530f7z3QSeJwOmahfH1o/xC8o+OuhzBf8TNaGT3OJrl++rh9+JAF
 Ios3t5Jb41J8lxzz9yWkeUU=
X-Google-Smtp-Source: ABdhPJwqklQfdyZTKgO2ENGwylVzNtApprd4i/sbHWHQGSOpR2H3NL6SlJhHb4oZamaEZOr97IMJaw==
X-Received: by 2002:a05:651c:304:: with SMTP id
 a4mr10232958ljp.46.1591001386948; 
 Mon, 01 Jun 2020 01:49:46 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f18sm4583304lfh.49.2020.06.01.01.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 01:49:46 -0700 (PDT)
Date: Mon, 1 Jun 2020 11:49:42 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Yogish Kulkarni <yogishkulkarni@gmail.com>
Subject: Re: Dynamically change enumeration list of DRM enumeration property
Message-ID: <20200601114942.5ae2d3ad@eldfell.localdomain>
In-Reply-To: <CAL3Fm-Jspwx7=famPO5nOzPwL2wrBnMtZj0FTDjypvwdWZXPiA@mail.gmail.com>
References: <CAL3Fm-JJbjCby5_HojTf9dWKurw+CECN7LDqamtf53c9L-0jtw@mail.gmail.com>
 <20200526103921.0817ee0b@eldfell.localdomain>
 <CAKMK7uHG1P9hwT1CBqWUfL6sBwZwyS7q0scXSUuXNiJMmRz-+g@mail.gmail.com>
 <CAL3Fm-L-iwGu60Zf15aYf9Xm9201sT2vU888Fv46Tv7x37Aq6Q@mail.gmail.com>
 <20200528082445.GR206103@phenom.ffwll.local>
 <CAL3Fm-+G0MJoYLb2CJKTW5w6Qk4K=j5if+6hLDE_ustW=e933Q@mail.gmail.com>
 <20200528154804.02fb8901@eldfell.localdomain>
 <CAL3Fm-Jspwx7=famPO5nOzPwL2wrBnMtZj0FTDjypvwdWZXPiA@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1450388945=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1450388945==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_7AxQhkmjeqH4nxw=883bav"; protocol="application/pgp-signature"

--Sig_/_7AxQhkmjeqH4nxw=883bav
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Jun 2020 09:22:27 +0530
Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:

> Hi,
>=20
> For letting DRM clients to select output encoding:
> Sink can support certain display timings with high output bit-depths using
> multiple output encodings, e.g. sink can support a particular timing with
> RGB 10-bit, YCbCr422 10-bit and YCbCr420 10-bit. So DRM client may want to
> select YCbCr422 10-bit over RBG 10-bit output to reduce the link bandwidth
> (and in turn reduce power/voltage). If DRM driver automatically selects
> output encoding then we are restricting DRM clients from making appropria=
te
> choice.

Hi,

right, that seems to be another reason.

> For selectable output color range:
> Certain applications (typically graphics) usually rendered in full range
> while some applications (typically video) have limited range content. Sin=
ce
> content can change dynamically, DRM driver does not have enough informati=
on
> to choose correct quantization. Only DRM client can correctly select which
> quantization to set (to preserve artist's intent).

Now this is an interesting topic for me. As far as I know, there is no
window system protocol to tell the display server whether the
application provided content is using full or limited range. This means
that the display server cannot tell DRM about full vs. limited range
either. It also means that when not fullscreen, the display server
cannot show the limited range video content correctly, because it would
have to be converted to full-range (or vice versa).

But why would an application produce limited range pixels anyway? Is it
common that hardware video decoders are unable to produce full-range
pixels?

I am asking, because I have a request to add limited vs. full range
information to Wayland.

What about video sinks, including monitors? Are there devices that
accept limited-range only, full-range only, or switchable?

Why not just always use full-range everywhere?

Or if a sink supports only limited-range, have the display chip
automatically convert from full-range, so that software doesn't have to
convert in software.

If you actually have a DRM KMS property for the range, does it mean that:
- the sink is configured to accept that range, and the pixels in the
  framebuffer need to comply, or
- the display chip converts to that range while framebuffer remains in
  full-range?

If we look at I915 driver's "Broadcast RGB" property, it seems to say
to me that the framebuffer is always primarily assumed to be in
full-range, and the conversion to limited-range happens in the scanout
circuitry. So that property would not help with video content that is
already in limited-range.

To recap, there are two orthogonal things: application content or
framebuffer range, and video sink / monitor range. The display server
between the two, at last if it is a Wayland compositor, would be able to
convert as necessary.

> For how to use selectable output encoding with Weston:
> I was thinking that DRM should have separate property to list the encodin=
gs
> supported by sink and Weston will present this list to its client. Your

Not client. A configuration tool perhaps, but not generically to all
Wayland clients, not as a directly settable knob at least.

> idea to validate encodings using TEST_ONLY commit and present a list of
> timings along with encodings supported by particular timing seems better.
> Instead of validating all possible encodings, does it make sense to
> validate  only those supported by sink? Irrespective of this we would

Yes, having a list of what the sink actually supports would be nice.

As for Wayland clients, there is an extension brewing at
https://gitlab.freedesktop.org/wayland/wayland-protocols/-/merge_requests/8
that would allow suggesting the optimal encoding (pixel format and
modifier really) in flight.

That said, we are talking about the two different things here:
framebuffer format vs. encoding on the wire. Whether making them match
has benefits is another matter.

> anyway need some mechanism which will allow user to select particular
> encoding for a particular mode. I was thinking to allow this using new DRM
> property "Encoding". Do you have anything better in mind?

I think that is a reasonable and useful goal and idea. Just remember to
document it when proposing, even if it seems obvious. The details on
how to formulate that into UAPI is up for debate.

As said, changing KMS properties after they have been exposed to
userspace won't really work from either kernel or userspace point of
view. So you'd probably need to expose one blob type property listing
the encodings that may work as an array, and another property for
setting the one to use. IN_FORMATS property is somewhat similar,
although more complicated because it is the combination of format and
modifier.

> (Since I am using my Gmail Id, I feel I should mention that I work at
> Nvidia)

Nice to know the source of interest. :-)


Thanks,
pq

>=20
> Thanks,
> -Yogish
>=20
> On Thu, May 28, 2020 at 6:18 PM Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
>=20
> > On Thu, 28 May 2020 17:38:59 +0530
> > Yogish Kulkarni <yogishkulkarni@gmail.com> wrote:
> > =20
> > > I am trying to find a way through Weston which will allow setting =20
> > specific =20
> > > encoding at display output. =20
> >
> > Hi,
> >
> > why do *you* want to control that?
> >
> > Why not let the driver always choose the highest possible encoding
> > given the video mode and hardware capability?
> >
> > I can understand userspace wanting to know what it got, but why should
> > userspace be able to control it?
> >
> > Would people want to pick the encoding first, and then go for the
> > highest possible video mode?
> > =20
> > > Could you please elaborate on  why it is best
> > > to let DRM driver automatically configure which encoding to choose ra=
ther
> > > than making it selectable by DRM client ? I am not able to find refer=
ence
> > > to past discussion about this. I was only able to find a proposed cha=
nge =20
> > - =20
> > > https://lists.freedesktop.org/archives/intel-gfx/2017-April/125451.ht=
ml =20
> > but =20
> > > am not able to find why it got rejected.
> > >
> > > Alternatively, is there existing way through which DRM clients can =20
> > specify =20
> > > preference for output encoding ? Or currently it's all up to the DRM =
=20
> > driver =20
> > > to choose what output encoding to use. =20
> >
> > There must be some reason why userspace needs to be able to control it.
> > I'm also asking as a Weston maintainer, since I'm interested in how
> > this affects e.g. color reproduction or HDR support.
> >
> > One thing that comes to my mind is using atomic TEST_ONLY commits to
> > probe all the possible video modes =C3=97 encodings for presenting a li=
st to
> > the user to choose from, if you have a display configuration GUI. E.g
> > with some TV use cases, maybe the user wants to avoid sub-sampling, use
> > the native resolution, but limit refresh rate to what's actually
> > possible. Or any other combination of the three.
> >
> >
> > Thanks,
> > pq
> > =20
> > >
> > > Thanks,
> > > -Yogish
> > >
> > > On Thu, May 28, 2020 at 1:54 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > =20
> > > > On Thu, May 28, 2020 at 12:29:43PM +0530, Yogish Kulkarni wrote: =20
> > > > > For creating new source property, is it good to follow
> > > > > "drm_mode_create_hdmi_colorspace_property()"  as an example ? It =
=20
> > seems =20
> > > > that =20
> > > > > currently there is no standard DRM property which allows DRM clie=
nt =20
> > to =20
> > > > set =20
> > > > > a specific output encoding (like YUV420, YUV422 etc). Also, there=
 is =20
> > no =20
> > > > > standard property for letting client select YUV/RGB color range. =
I =20
> > see =20
> > > > > there are two ways to introduce new properties, 1. do something l=
ike
> > > > > drm_mode_create_hdmi_colorspace_property 2. create custom propert=
y =20
> > > > similar =20
> > > > > to "Broadcast RGB". Is there opinion on which is a preferable way=
 =20
> > to =20
> > > > expose =20
> > > > > encoding and color rage selection property ? =20
> > > >
> > > > I guess first question is "why?" Thus far we've gone with the opini=
on =20
> > that =20
> > > > automatically configuring output stuff as much as possible is best.=
 =20
> > What's =20
> > > > the use-case where the driver can't select this?
> > > > -Daniel =20
> > =20


--Sig_/_7AxQhkmjeqH4nxw=883bav
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl7UwSYACgkQI1/ltBGq
qqewWA//UX1GKhhQzY5q2xsYuWofvo7Thy7NigVcaiw9g+lOEjGYcv0FxIJM0aJZ
+Lyl2VxnVBdH5Qg+fhLnxgSzBuP0MWtgLz4mAvd6bF+wT2cx94hMPW0EfYthOnWR
hcMYcigMYplDxoIZJaXx9iXBWakLrCF5pvhy2egO6jEhyqJGM6afzV2eEy33Ash+
V9nYJf/WnX3GFsOuwYQL6/vn2mqWbZt+haYgVYveONgGLjV9gCKu2P58M39GVyuG
ADcrBlm8nqRHb2+fgTEQi4WdXRZpnuBll5/8T0V4NSE6jrt18TqtlqQVqKYnmNcl
a9m+s0rqa3BoyQfATNOd8rDX81pa6lUpQK4fYXmFBWPMbCLUrpyn7MQqIkBRepX3
bD2cOIhhKhRE6L4TxPgCTuD8tDcrkbOrqnnyUv1s+xoxkI7yvUZwJlwPcydlWgXc
JP8volxHfRSHP11nkbNq0R2kKKYuV/A7uS68oQ0kMjUoKQhV3Gf12hX+ZGPuU3ZE
B5NQVnXe1qn54C6DowW+/OXzXRTXrlVRhbDnF66GRVdhxX9AiIdmwv6NDYYZh7Yi
UNi6uh13rlgve6LxCLXj2xvEzXBwjyE34XIhPEYk5Ep0IWzckYIfD31qHvVyXzkJ
isxf3bkZjtiBTgRJrLCH24JbOxx6zvL/C4cG4Fq1NUZZK5xJrSU=
=z+SW
-----END PGP SIGNATURE-----

--Sig_/_7AxQhkmjeqH4nxw=883bav--

--===============1450388945==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1450388945==--
