Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDBF388ABE
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 11:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFCA6ECF6;
	Wed, 19 May 2021 09:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4D26E243;
 Wed, 19 May 2021 09:34:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id e11so14790337ljn.13;
 Wed, 19 May 2021 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=M4/CJdize/QPrExYkYoO17mX9iuO/FeUCuYX4ZYy1Eg=;
 b=ctT/5/xc2v60tfVBuU70gynhEus2tJ7LfF9eRAMDp4bVW23Cr0l+KtN+5BqZP9MDJ4
 nhFID3wbcOoaTIuqXJhDPpKEdteb8QGiPnlr9VVU3PRP88NgwKd5xrphibllssFumL5B
 lbarigZtnY7bBYjDsn4CHr+fsE0C1xS0PMwZ9+Ru+bw4u0yFzfxLIVwUEFb/xTfGzaVR
 dHLdX8oKXAyKrv8ZzE4BU7zttHSXAT5Q4x0nue05f3FbMts075JF2zrA9otR/UGAsfry
 Ntuj5MKev/hi78YRQFiwRcON0VVHn3tMUCBmgLzquPEAs+WHanljz02CsKwNDN9xbFa2
 Xqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=M4/CJdize/QPrExYkYoO17mX9iuO/FeUCuYX4ZYy1Eg=;
 b=jCNSGBSEB6VJSkSTi+FDlAs/DQxyVYdx9wKdvE4TWzQhCIy6B/oFlUWibQqWasqHCG
 ptc2shoeP0EViGbUrY/AiuFP0uinFJsScxXVO0c01s+i4rEHi2H42b9xbllDcqr0BvMj
 YyFUYhrWN6a6nZYNxroE+qHk4VQqIHKgOux/LvVunDcO1VmnWiH3yLJJKCbG3BnipfRm
 YtQNjdY6f5Z8MsKceR0rfXmS9y2KNhRGmFEeqeLqIUpQgYp0XuRsIUB8Ju3OxpAUXjfu
 fuCzWEHdYiVjwqGl4nYsCTu9k4oEhL/o301W8YJFsnCqxVIc1cskRaUNM36QZxCWbW0R
 8EbQ==
X-Gm-Message-State: AOAM5309yh03kAvDSY0WtfSSZHtrEy2rNmf0kvbLQxGMH15zy0Zat1ZB
 RRUd0tTgvkiUcs6Y0qpOrEw=
X-Google-Smtp-Source: ABdhPJyRQECAfrcbN5v3yeUw8aJU5JkoSFeNQDtliwjRgoR1Spo74K9d5cjC0Neq19S1JoMcJAUfkA==
X-Received: by 2002:a2e:a7c7:: with SMTP id x7mr7907151ljp.417.1621416849423; 
 Wed, 19 May 2021 02:34:09 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id n8sm450380lfi.60.2021.05.19.02.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 02:34:09 -0700 (PDT)
Date: Wed, 19 May 2021 12:34:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: New uAPI for color management proposal and feedback request
Message-ID: <20210519123405.4d3218a7@eldfell>
In-Reply-To: <YJvSUCCPvWz7y/r7@intel.com>
References: <8c0d7ad8-7ade-bf8a-0414-cc795fbb6aa2@tuxedocomputers.com>
 <YJvSUCCPvWz7y/r7@intel.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/AozgflNR6L4c7UMgl=YE5w="; protocol="application/pgp-signature"
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
 intel-gfx@lists.freedesktop.org, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/AozgflNR6L4c7UMgl=YE5w=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 12 May 2021 16:04:16 +0300
Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com> wrote:

> On Wed, May 12, 2021 at 02:06:56PM +0200, Werner Sembach wrote:
> > Hello,
> >=20
> > In addition to the existing "max bpc", and "Broadcast RGB/output_csc" d=
rm properties I propose 4 new properties:
> > "preferred pixel encoding", "active color depth", "active color range",=
 and "active pixel encoding"
> >=20
> >=20
> > Motivation:
> >=20
> > Current monitors have a variety pixel encodings available: RGB, YCbCr 4=
:4:4, YCbCr 4:2:2, YCbCr 4:2:0.
> >=20
> > In addition they might be full or limited RGB range and the monitors ac=
cept different bit depths.
> >=20
> > Currently the kernel driver for AMD and Intel GPUs automatically config=
ure the color settings automatically with little
> > to no influence of the user. However there are several real world scena=
rios where the user might disagree with the
> > default chosen by the drivers and wants to set his or her own preferenc=
e.
> >=20
> > Some examples:
> >=20
> > 1. While RGB and YCbCr 4:4:4 in theory carry the same amount of color i=
nformation, some screens might look better on one
> > than the other because of bad internal conversion. The driver currently=
 however has a fixed default that is chosen if
> > available (RGB for Intel and YCbCr 4:4:4 for AMD). The only way to chan=
ge this currently is by editing and overloading
> > the edid reported by the monitor to the kernel.
> >=20
> > 2. RGB and YCbCr 4:4:4 need a higher port clock then YCbCr 4:2:0. Some =
hardware might report that it supports the higher
> > port clock, but because of bad shielding on the PC, the cable, or the m=
onitor the screen cuts out every few seconds when
> > RGB or YCbCr 4:4:4 encoding is used, while YCbCr 4:2:0 might just work =
fine without changing hardware. The drivers
> > currently however always default to the "best available" option even if=
 it might be broken.
> >=20
> > 3. Some screens natively only supporting 8-bit color, simulate 10-Bit c=
olor by rapidly switching between 2 adjacent
> > colors. They advertise themselves to the kernel as 10-bit monitors but =
the user might not like the "fake" 10-bit effect
> > and prefer running at the native 8-bit per color.
> >=20
> > 4. Some screens are falsely classified as full RGB range wile they actu=
ally use limited RGB range. This results in
> > washed out colors in dark and bright scenes. A user override can be hel=
pful to manually fix this issue when it occurs.
> >=20
> > There already exist several requests, discussion, and patches regarding=
 the thematic:
> >=20
> > - https://gitlab.freedesktop.org/drm/amd/-/issues/476
> >=20
> > - https://gitlab.freedesktop.org/drm/amd/-/issues/1548
> >=20
> > - https://lkml.org/lkml/2021/5/7/695
> >=20
> > - https://lkml.org/lkml/2021/5/11/416
> >=20

...

> > Adoption:
> >=20
> > A KDE dev wants to implement the settings in the KDE settings GUI:
> > https://gitlab.freedesktop.org/drm/amd/-/issues/476#note_912370
> >=20
> > Tuxedo Computers (my employer) wants to implement the settings desktop =
environment agnostic in Tuxedo Control Center. I
> > will start work on this in parallel to implementing the new kernel code=
. =20
>=20
> I suspect everyone would be happier to accept new uapi if we had
> multiple compositors signed up to implement it.

I think having Weston support for these would be good, but for now it
won't be much of an UI: just weston.ini to set, and the log to see what
happened.

However, knowing what happened is going to be important for color
calibration auditing:
https://gitlab.freedesktop.org/wayland/weston/-/issues/467

Yes, please, very much for read-only properties for the feedback part.
Properties that both userspace and kernel will write are hard to deal
with in general.

Btw. "max bpc" I can kind of guess that conversion from framebuffer
format to the wire bpc happens automatically and only as the final
step, but "Broadcast RGB" is more complicated: is the output from the
abstract pixel pipeline sent as-is and "Broadcast RGB" is just another
inforframe bit to the monitor, or does "Broadcast RGB" setting actually
change what happens in the pixel pipeline *and* set infoframe bits?

My vague recollection is that framebuffer was always assumed to be in
full range, and then if "Broadcast RGB" was set to limited range, the
driver would mangle the pixel pipeline to convert from full to limited
range. This means that it would be impossible to have limited range
data in a framebuffer, or there might be a double-conversion by
userspace programming a LUT for limited->full and then the driver
adding full->limited. I'm also confused how full/limited works when
framebuffer is in RGB/YCbCr and the monitor wire format is in RGB/YCbCr
and there may be RGB->YCbCR or YCbCR->RGB conversions going on - or
maybe even FB YCbCR -> RGB -> DEGAMMA -> CTM -> GAMMA -> YCbCR.

I wish someone drew a picture of the KMS abstract pixel pipeline with
all the existing KMS properties in it. :-)


Thanks,
pq

--Sig_/AozgflNR6L4c7UMgl=YE5w=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCk240ACgkQI1/ltBGq
qqevjxAAhqOqJwTNqTH43n9o45nT828CVJEhixDW68u5frawVH93+7DA2UqiTLVL
cmwFOF+9mH2H2qOI0rCGZuPlUzeWhLFgKWTiKbjApRw69Jc+IVZo10Odm49tdcnI
068nF/02vvO7jrCTZ/F1wjHXSBg6vwBATrefIhjS7h4QP/6IaDI/5F1xqwPehsnz
p+FDG5Vh4cIqSkgFSbzNAl+r3nyiiaYbfVaZpbJwYpXC9Jzse2J9kSuaa03WPnSR
OsbhhQV//nj9z2YWIvpAAYQg6RXQMeVrmNP3F/V3woByZ/1SHj+0upYtYFY/gCMz
aNiWfv+ryD03k4HmZCcu4bQX5/X6neOUMVyo2zBSLORhRiFdIO6+hpzRLhW3JZN5
URbJmnms+XXFB+6L5iOpBvZnUn5Nn9RYZqdq+84Hu4qA35Q7Q7VNPz59OUJpK+ew
SvylMv3Ryt5WyRC7bIYxrNNIVHScXhu7et4S4euE2frnz+ef+wIHAQU/ufKnj7mt
0dctUeYdngW5ks9Jdt/e+jz0W9wAYNW5gkcR5MtdWHh/mI3V5eKNo0v0q22VHi7z
dflGuJNgy6wTL+vvIkoA0d+4Fs193Mm8rlXQScZxEzTFwlIGjrKfOAibq2rbifOh
T8fF0EdwePkbiaa4yNuo0TGrQYRvi6HyfjIzxmwUK84EwA6F6Jg=
=RQOw
-----END PGP SIGNATURE-----

--Sig_/AozgflNR6L4c7UMgl=YE5w=--
