Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FBF4159B2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 10:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FCBE6ECF9;
	Thu, 23 Sep 2021 08:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985706ECF7;
 Thu, 23 Sep 2021 08:01:35 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id b15so22676857lfe.7;
 Thu, 23 Sep 2021 01:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=W58bQYCiGhRBD3/68MNvqc8I7i8N/bbc7IpEgttWBqY=;
 b=BiAfuJD6VZetd9keBXxVdAw8zP5x3EZEQq4MbMYFqxvW1vetPRC4AfqRdno5vYQujz
 RzFjIKWgLhRawAoCU5dBVISjUxdw7eBPz6qWEhzEa1lHwep/hstMrpIxBecCfwbnDlLE
 OSm4i00zPJlZb9H+oqzX94zKh2YN6AbOSTdmQDEDlw4jB4sFlLULgzShKs33o87QCRu/
 MF3vBykO7UDP8RNQgq18A52uXbxt0HDmDMom+gkC4/J2jUlODNBvrZH3WBp/crNAKSdR
 g20GKdvAxVGw+lezg7g4rUHXCLui17aatOomgk516fbglRfkzW9EBC6pHAEidPprhbHj
 2Jgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=W58bQYCiGhRBD3/68MNvqc8I7i8N/bbc7IpEgttWBqY=;
 b=zJ35R3FzsbqUG8iD788Gfm7Or6Jt8C5QIJnc00ysdLoQNis3pGtzsqlfg48WxEJYke
 xgiGzqHn8pC7x6mLi55/I+LfpxCWvDl3/A2J0BUFQvKtO+rqLtnKc0DisBiH/qLVLwWK
 YchQgYxPXVydxoiUmJAN+xqT9Rc+R5vYNwUs3r1PtlBCaK6QWbf8YnvOkf9g5/CoE8Tq
 EFgZ9Ywjgw8hzXZt2vas9+BT6KIDjXz93fdIzsR7wPUXKwsFXgHjOLFaz8Iufn57tX27
 3BFAyHvvC8FkOero1DAVHzVtgqgTJVyPoxBHOmRmS2VnQ3CSxaLHjoHWGd7Ztw6PkPOf
 Xkdw==
X-Gm-Message-State: AOAM5331u7h+/SX1nc+qezv/sDZW/+41D/LyRI+H6m+LacwJ4k/2Y+sn
 2R7rldMvEKMK2tLhwNefgpA=
X-Google-Smtp-Source: ABdhPJwqS4uXgRmEpfbv73qmVurm8Ys5MqdJU31TaF7GARzVfXU25EBmCpm41aJgMh0hHO4mbCPjcg==
X-Received: by 2002:a2e:a78d:: with SMTP id c13mr3701929ljf.314.1632384093819; 
 Thu, 23 Sep 2021 01:01:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v28sm387443lfi.22.2021.09.23.01.01.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Sep 2021 01:01:33 -0700 (PDT)
Date: Thu, 23 Sep 2021 11:01:30 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 sebastian@sebastianwick.net, mcasas@google.com, jshargo@google.com,
 Shashank.Sharma@amd.com, Deepak.Sharma@amd.com, Shirish.S@amd.com,
 Vitaly.Prosyak@amd.com, aric.cyr@amd.com, Bhawanpreet.Lakha@amd.com,
 Krunoslav.Kovac@amd.com, hersenxs.wu@amd.com, Nicholas.Kazlauskas@amd.com,
 laurentiu.palcu@oss.nxp.com, ville.syrjala@linux.intel.com,
 jeremy@jcline.org, Brian Starkey <brian.starkey@arm.com>
Subject: Re: [RFC PATCH v3 1/6] drm/doc: Color Management and HDR10 RFC
Message-ID: <20210923110130.1928d8bf@eldfell>
In-Reply-To: <a13d64b1-7b24-5fd5-41d3-b55d2bd388e0@amd.com>
References: <20210730204134.21769-1-harry.wentland@amd.com>
 <20210730204134.21769-2-harry.wentland@amd.com>
 <20210915170127.31377385@eldfell>
 <4ed51ca0-ca98-cf84-33ed-ab172e3548d3@amd.com>
 <a13d64b1-7b24-5fd5-41d3-b55d2bd388e0@amd.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f8kn+CdAE5nyzAWtsZGPeV5";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/f8kn+CdAE5nyzAWtsZGPeV5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 22 Sep 2021 11:06:53 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-09-20 20:14, Harry Wentland wrote:
> > On 2021-09-15 10:01, Pekka Paalanen wrote:> On Fri, 30 Jul 2021 16:41:2=
9 -0400 =20
> >> Harry Wentland <harry.wentland@amd.com> wrote:
> >> =20
>=20
> <snip>
>=20
> >>> +If a display's maximum HDR white level is correctly reported it is t=
rivial
> >>> +to convert between all of the above representations of SDR white lev=
el. If
> >>> +it is not, defining SDR luminance as a nits value, or a ratio vs a f=
ixed
> >>> +nits value is preferred, assuming we are blending in linear space.
> >>> +
> >>> +It is our experience that many HDR displays do not report maximum wh=
ite
> >>> +level correctly =20
> >>
> >> Which value do you refer to as "maximum white", and how did you measure
> >> it?
> >> =20
> > Good question. I haven't played with those displays myself but I'll try=
 to
> > find out a bit more background behind this statement.
> >  =20
>=20
>=20
> Some TVs report the EOTF but not the luminance values.
> For an example edid-code capture of my eDP HDR panel:
>=20
>   HDR Static Metadata Data Block:
>     Electro optical transfer functions:
>       Traditional gamma - SDR luminance range
>       SMPTE ST2084
>     Supported static metadata descriptors:
>       Static metadata type 1
>     Desired content max luminance: 115 (603.666 cd/m^2)
>     Desired content max frame-average luminance: 109 (530.095 cd/m^2)
>     Desired content min luminance: 7 (0.005 cd/m^2)
>=20

I forget where I heard (you, Vitaly, someone?) that integrated panels
may not have the magic gamut and tone mapping hardware, which means
that software (or display engine) must do the full correct thing.

That's another reason to not rely on magic display functionality, which
suits my plans perfectly.

> I suspect on those TVs it looks like this:
>=20
>   HDR Static Metadata Data Block:
>     Electro optical transfer functions:
>       Traditional gamma - SDR luminance range
>       SMPTE ST2084
>     Supported static metadata descriptors:
>       Static metadata type 1
>=20
> Windows has some defaults in this case and our Windows driver also has
> some defaults.

Oh, missing information. Yay.

> Using defaults in the 1000-2000 nits range would yield much better
> tone-mapping results than assuming the monitor can support a full
> 10k nits.

Obviously.

> As an aside, recently we've come across displays where the max
> average luminance is higher than the max peak luminance. This is
> not a mistake but due to how the display's dimming zones work.

IOW, the actual max peak luminance in absolute units depends on the
current image average luminance. Wonderful, but what am I (the content
producer, the display server) supposed to do with that information...

> Not sure what impact this might have on tone-mapping, other than
> to keep in mind that we can assume that max_avg < max_peak.

*cannot

Seems like it would lead to a very different tone mapping algorithm
which needs to compute the image average luminance before it can
account for max peak luminance (which I wouldn't know how to infer). So
either a two-pass algorithm, or taking the average from the previous
frame.

I imagine that is going to be fun considering one needs to composite
different types of input images together, and the final tone mapping
might need to differ for each. Strictly thinking that might lead to an
iterative optimisation algorithm which would be quite intractable in
practise to complete for a single frame at a time.


Thanks,
pq

--Sig_/f8kn+CdAE5nyzAWtsZGPeV5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmFMNFoACgkQI1/ltBGq
qqdJ/w/7B6O0HE64NZidI6jqgduz7e1oCBkU6i0gDC7nQEBMswNf0IHHc/OlHEzE
2tMmOI6aQl6f9HSyXNSyV+wqUg5WLZwrpQwqDTUr2Ztb9dcuv2OTWCWjE9zxfcJR
RgpDPqP1zLo5WrRdjXNhTvujp5CSvIxpRmRHxNFX+VQtJIzn/hd1kLcDAKi8KRoG
Ee6cw/C1Vs+3gzeywU5amDgT2cg7ZOjXb2X0l60lxWT+tlaNr2kwNiEGukCJ0NVK
sGozUabuCeEcMJdL7QPZRrCWWsOTYVGosuuo9mUp1M/Y7YnrWkKd7LblHu35A6Pt
Bsg9kKCH14lFY6q+tFylKoEz4iECTt2kOQqSSVkfcj1tNhPwe/MrdwXbCx1mne6P
/zkMyORFguRhgRB1JKzw72ZwJ3RTv7xhbfXHFRPK5RtLOdm4KjkF0jueLP6f+boV
WPnhPwRQVkpLxnw2HuJirDBc+wc8XlrBy8HI0azBWoAltYHJyOyw8BvYnR7iV6pG
b5m/D/9g1AQKMnhu5gvBAJPnO1wnjfDA4e4M6yFDwoNbbxPZ8Iowo0Q7Iy2k781W
TiWdOp2AS62/+e5W81wlcLL+dDuJixj73R14Ygsz9rkREe/mxjpaGWJtms+6jYYF
PD5pyOT0PuSqJUemmhE2HJUm6/sfEZac/QjtJLQySLsTuut7PTg=
=mX7L
-----END PGP SIGNATURE-----

--Sig_/f8kn+CdAE5nyzAWtsZGPeV5--
