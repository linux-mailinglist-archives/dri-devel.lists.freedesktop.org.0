Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6331562BE20
	for <lists+dri-devel@lfdr.de>; Wed, 16 Nov 2022 13:34:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E7F10E49F;
	Wed, 16 Nov 2022 12:34:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EEC10E49F;
 Wed, 16 Nov 2022 12:34:13 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id d6so29233894lfs.10;
 Wed, 16 Nov 2022 04:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm/UokDC+MeCjw9LQFvp0eEnSEGom3XN+YydihKg7qE=;
 b=cBn/txYjQ/24+5sM+GIRAHTZoptJ/ATz+NjhNnKS1eV+Q/pnLEayBtrOOKBWGYQSHw
 1XglYJAh8CN24hRQmylUl0GOE5DRLBXAQ2L3X3em/S7cDwATcQAJHzCIzjSeZPih8WoB
 Fx53mCp70AV+LetZMQKbeJPkZsFkns9WjAYbMdJAFpZCzdZJ6Hzj4WGk0biUnjCIaLOg
 rj0xs8/HbN+JNd+FQ1OVDvcYfda8i1eK9TrR3VvvX4qIHtsn/S7AaiP0FLGFjJBRpq2E
 AAAUyqGMNBOco567ax4XJ6nTVRTObgEdPAfTEXXWpPIT2788TfjMkcE54AGGzZKJRfQk
 MPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pm/UokDC+MeCjw9LQFvp0eEnSEGom3XN+YydihKg7qE=;
 b=F38lSK/dxHRyeyhZfzmdPdUSwHl5OBhl/Ts5SanNEafN0W5vZzxUm+YZoufNyokIR1
 H9x1zGxUhl8Gdy/JHCefbSc8b9+QCcUHG603TLkhBAiWbBJBHsvF+16cBg51niSfgy1K
 ReencZoKFNpGwRWzQMHWnvyqA+JybObkQIb1bmYPUj8g2CLSaC+hoOlydmohMxusQsZg
 kvmpCOuF7hTMe5tYFFoA1cXr7cqppn3A2aDegCNzR0/Qt2kh4lavT+w3TZD5T7b/91j6
 +fNV2+j5SmddbMGT/oIFZUJztBeLLcZcGSVg0p0e4xlKWPSDESpsCnMZODnn3+JqDOtR
 t1kg==
X-Gm-Message-State: ANoB5plO87Nt1Q2EIKBlwOVufFNNzv+23QMkeZ6IElbVGng5mdmy7Y/D
 2depn8yMc1rqgTxELEbaCqo=
X-Google-Smtp-Source: AA0mqf6iArDqkPDs1jnU6iVsy7BhmtZ8obpIXFA2HjSgAhc6edQT64E+ME3Og33YjqgceqwX3pUuqA==
X-Received: by 2002:a05:6512:2395:b0:4a2:2dc9:3e0e with SMTP id
 c21-20020a056512239500b004a22dc93e0emr7962593lfv.272.1668602051616; 
 Wed, 16 Nov 2022 04:34:11 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 bi20-20020a05651c231400b0026dcf0cbb97sm2992476ljb.137.2022.11.16.04.34.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Nov 2022 04:34:11 -0800 (PST)
Date: Wed, 16 Nov 2022 14:34:01 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: The state of Quantization Range handling
Message-ID: <20221116143401.3d7621b9@eldfell>
In-Reply-To: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JahevPKqHchiagyONw.iBrL";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/JahevPKqHchiagyONw.iBrL
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Nov 2022 00:11:56 +0100
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> There are still regular bug reports about monitors (sinks) and sources
> disagreeing about the quantization range of the pixel data. In
> particular sources sending full range data when the sink expects
> limited range. From a user space perspective, this is all hidden in
> the kernel. We send full range data to the kernel and then hope it
> does the right thing but as the bug reports show: some combinations of
> displays and drivers result in problems.
>=20
> In general the whole handling of the quantization range on linux is
> not defined or documented at all. User space sends full range data
> because that's what seems to work most of the time but technically
> this is all undefined and user space can not fix those issues. Some
> compositors have resorted to giving users the option to choose the
> quantization range but this really should only be necessary for
> straight up broken hardware.
>=20
> Quantization Range can be explicitly controlled by AVI InfoFrame or
> HDMI General Control Packets. This is the ideal case and when the
> source uses them there is not a lot that can go wrong. Not all
> displays support those explicit controls in which case the chosen
> video format (IT, CE, SD; details in CTA-861-H 5.1) influences which
> quantization range the sink expects.
>=20
> This means that we have to expect that sometimes we have to send
> limited and sometimes full range content. The big question however
> that is not answered in the docs: who is responsible for making sure
> the data is in the correct range? Is it the kernel or user space?
>=20
> If it's the kernel: does user space supply full range or limited range
> content? Each of those has a disadvantage. If we send full range
> content and the driver scales it down to limited range, we can't use
> the out-of-range bits to transfer information. If we send limited
> range content and the driver scales it up we lose information.
>=20
> Either way, this must be documented. My suggestion is to say that the
> kernel always expects full range data as input and is responsible for
> scaling it to limited range data if the sink expects limited range
> data.

Hi Sebastian,

you are proposing the that driver/hardware will do either no range
conversion, or full-to-limited range conversion. Limited-to-full range
conversion would never be supported.

I still wonder if limited-to-full range conversion could be useful with
video content.

> Another problem is that some displays do not behave correctly. It must
> be possible to override the kernel when the user detects such a
> situation. This override then controls if the driver converts the full
> range data coming from the client or not (Default, Force Limited,
> Force Full). It does not try to control what range the sink expects.
> Let's call this the Quantization Range Override property which should
> be implemented by all drivers.

In other words, a CRTC "quantization range conversion" property with
values:
- auto, with the assumption that color pipeline always produces full-range
- identity
- full-to-limited
(- limited-to-full)

If this property was truly independent of the metadata being sent to
the sink, and of the framebuffer format, it would allow us to do four
ways: both full/limited framebuffer on both full/limited sink. It would
allow us to send sub-blacks and super-whites as well.

More precisely, framebuffers would always have *undefined* quantization
range. The configuration of the color pipeline then determines how that
data is manipulated into a video signal.

So I am advocating the same design as with color spaces: do not tell
KMS what your colorspaces are. Instead tell KMS what operations it
needs to do with the pixel data, and what metadata to send to the sink.

> All drivers should make sure their behavior is correct:
>=20
> * check that drivers choose the correct default quantization range for
> the selected mode

Mode implying a quantization range is awkward, but maybe the kernel
established modes should just have a flag for it. Then userspace would
know. Unless the video mode system is extended to communicate
IT/CE/SD/VIC and whatnot to userspace, making the modes better defined.
Then userspace would know too.

> * whenever explicit control is available, use it and set the
> quantization range to full
> * make sure that the hardware converts from full range to limited
> range whenever the sink expects limited range
> * implement the Quantization Range Override property
>=20
> I'm volunteering for the documentation, UAPI and maybe even the drm
> core parts if there is willingness to tackle the issue.

Is it a good idea to put even more automation/magic into configuring
the color pipeline and metadata for a sink, making them even more
intertwined?

I would prefer the opposite direction, making thing more explicit and
orthogonal.


Thanks,
pq

> Appendix A: Broadcast RGB property
>=20
> A few drivers already implement the Broadcast RGB property to control
> the quantization range. However, it is pointless: It can be set to
> Auto, Full and Limited when the sink supports explicitly setting the
> quantization range. The driver expects full range content and converts
> it to limited range content when necessary. Selecting limited range
> never makes any sense: the out-of-range bits can't be used because the
> input is full range. Selecting Default never makes sense: relying on
> the default quantization range is risky because sinks often get it
> wrong and as we established there is no reason to select limited range
> if not necessary. The limited and full options also are not suitable
> as an override because the property is not available if the sink does
> not support explicitly setting the quantization range.
>=20


--Sig_/JahevPKqHchiagyONw.iBrL
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmN02LkACgkQI1/ltBGq
qqdw/Q/+PPsLfqMlwndByVhC0jEA/BL6xh+0PsN/olYzye366AuUQevPcWHehKkL
qB6uqxJyjtOWw8fMSQQoh4WbdBH7hQ3FNmjL14vpeY/3/m5CQfSj+A4cvLuK8PnU
DXwSitUe/Yqyk5m8B4M78qcmnzjhz+9Uv6h2N3Hqax4E4VjbD3lMbHDbThVcQuVJ
5HuVph8dvPlkOp3DpM270l/7mDgUStYwZd9U39YTkCiqbL8jfIo4BlrujZ+MQIOt
4j4ickj6LUTUDNV7e4A5p7LyFjSPN1aWJwab8o1Y15fLZ79wevUQv2N0Ue2Is6JB
smMNr6xt7BVmWbA4rRp1armMyhytX6icbR4vcirVHDHLYU9/CCwv6LaW32WPZoUS
Ay6Vm7a37YgT4gkK1v/B2TbWaPXON5FW2xC3BfJ1LIYxREQhzivU7f8oFCylye05
P3OpEO6FJ55WXWYup8QSJzQsxmjDYtbwm1qcBKxSDcas84ny9DXXgo0Hc9PW7r0j
04KuWvZRCMBCQmrM2VCmtYH1xaEi8KDnMoHL/ayIdH03wSZIXkdhNJVNdkpZO7xS
CfgEKEgoZUo/rDRdOzcmqPeDrrdsqetjyGvNbqn3mdEIMpzDj3GMABEOb6jSxXmH
E1M3c+BtQtU8ptuAj9uB8khJ0vtO66wGqBtj/CNpwWoXO4GUB+0=
=uH/8
-----END PGP SIGNATURE-----

--Sig_/JahevPKqHchiagyONw.iBrL--
