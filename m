Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DD78304F7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 13:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA69D10E1DF;
	Wed, 17 Jan 2024 12:09:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554B810E1DF
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1705493382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=eAUPGmwVUxQVs8BO6mc3v/3UdbiY25Zj8A255TdtQdY=;
 b=U8AlA84klRlnjcH59h4TKcN/vh5m4kHbbeoDnBPlx4SFfSyO2UfAU8givJIif68KKEnB4e
 joC7uWn1VXtL5cOXBoBjAjnfw111Gh4nkicSLgOpJKGRjsWEdUF/crtYEr7ENZpZ+0+6Rr
 Ic0eHnXR6ZrOLPJHWAuVm9krBvdohdo=
Message-ID: <35a9d8ae152deea8a79392bb4b2a9b2053daae92.camel@crapouillou.net>
Subject: Re: [PATCH v3 4/4] Documentation: usb: Document FunctionFS DMABUF API
From: Paul Cercueil <paul@crapouillou.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Jonathan Corbet <corbet@lwn.net>
Date: Wed, 17 Jan 2024 13:09:40 +0100
In-Reply-To: <9712abdd-cbca-4ad6-b1e9-ff9bf054b278@oracle.com>
References: <20240108120056.22165-1-paul@crapouillou.net>
 <20240108120056.22165-5-paul@crapouillou.net>
 <9712abdd-cbca-4ad6-b1e9-ff9bf054b278@oracle.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZMLQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5UzFZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtNz8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe+rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIPdlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7Urf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KFlBwgAhlGy6nqP7O3u7q23hRW5AQ0EXQqFwQEIAMo+MgvYHsyjX3Ja4Oolg1Txzm8woj30ch2nACFCqaO0R/1kLj2VVeLrDyQUOlXx9PD6IQI4M8wy8m0sR4wV2p/g/paw7k65cjzYYLh+FdLNyO7IW
 YXndJO+wDPi3aK/YKUYepqlP+QsmaHNYNdXEQDRKqNfJg8t0f5rfzp9ryxd1tCnbV+tG8VHQWiZXNqN7062DygSNXFUfQ0vZ3J2D4oAcIAEXTymRQ2+hr3Hf7I61KMHWeSkCvCG2decTYsHlw5Erix/jYWqVOtX0roOOLqWkqpQQJWtU+biWrAksmFmCp5fXIg1Nlg39v21xCXBGxJkxyTYuhdWyu1yDQ+LSIUAEQEAAYkBNgQYAQoAIBYhBNdHYd8OeCBwpMuVxnPua9InSr1BBQJdCoXBAhsMAAoJEHPua9InSr1B4wsH/Az767YCT0FSsMNt1jkkdLCBi7nY0GTW+PLP1a4zvVqFMo/vD6uz1ZflVTUAEvcTi3VHYZrlgjcxmcGu239oruqUS8Qy/xgZBp9KF0NTWQSl1iBfVbIU5VV1vHS6r77W5x0qXgfvAUWOH4gmN3MnF01SH2zMcLiaUGF+mcwl15rHbjnT3Nu2399aSE6cep86igfCAyFUOXjYEGlJy+c6UyT+DUylpjQg0nl8MlZ/7Whg2fAU9+FALIbQYQzGlT4c71SibR9T741jnegHhlmV4WXXUD6roFt54t0MSAFSVxzG8mLcSjR2cLUJ3NIPXixYUSEn3tQhfZj07xIIjWxAYZo=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, linux-doc@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 linaro-mm-sig@lists.linaro.org,
 Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Vegard,

Le mardi 09 janvier 2024 =C3=A0 14:08 +0100, Vegard Nossum a =C3=A9crit=C2=
=A0:
> On 08/01/2024 13:00, Paul Cercueil wrote:
> > Add documentation for the three ioctls used to attach or detach
> > externally-created DMABUFs, and to request transfers from/to
> > previously
> > attached DMABUFs.
> >=20
> > Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> >=20
> > ---
> > v3: New patch
> > ---
> > =C2=A0 Documentation/usb/functionfs.rst | 36
> > ++++++++++++++++++++++++++++++++
> > =C2=A0 1 file changed, 36 insertions(+)
>=20
> Hi,
>=20
> I'd like to point out that this file (usb/functionfs.rst) is
> currently
> included by Documentation/subsystem-apis.rst, the top-level file for
> the
> "Kernel subsystem documentation" set of books, which describe
> internal
> APIs: "These books get into the details of how specific kernel
> subsystems work from the point of view of a kernel developer".
>=20
> However, functionfs.rst (and especially your new additions) are
> documenting a userspace API, so it really belongs somewhere in
> Documentation/userspace-api/ -- that's where /proc, /sys, /dev and
> ioctl
> descriptions for userspace programmers belong.

Agreed. Even the original content prior to my additions describe a
userspace API.

>=20
> I'm not NAKing the patch -- I just want to draw attention to this
> discrepancy. Maybe we can separate the kernel-implementation details
> (stuff about __init sections and stuff) from the new ioctl() info?
>=20
> Looking at <https://docs.kernel.org/usb/> I see that there are many
> other adjacent documents that are also not really documenting kernel
> implementation details, rough categorization as follows:
>=20
> USB support
> -----------
>=20
> - Linux ACM driver v0.16 =3D=3D> admin/user info
> - Authorizing (or not) your USB devices to connect to the system =3D=3D>=
=20
> admin/user info
> - ChipIdea Highspeed Dual Role Controller Driver =3D> admin/user info
> - DWC3 driver =3D=3D> driver TODOs (can be moved into source code?)
> - EHCI driver =3D=3D> technical info + driver details
> - How FunctionFS works
> - Linux USB gadget configured through configfs =3D=3D> userspace API +=
=20
> implementation
> - Linux USB HID gadget driver =3D=3D> implementation + userspace API
> - Multifunction Composite Gadget =3D=3D> technical + user info
> - Linux USB Printer Gadget Driver =3D=3D> userspace API
> - Linux Gadget Serial Driver v2.0 =3D=3D> user/admin + userspace API
> - Linux UVC Gadget Driver =3D=3D> user/admin + userspace API
> - Gadget Testing =3D=3D> user/admin + userspace API
> - Infinity Usb Unlimited Readme =3D=3D> user/admin
> - Mass Storage Gadget (MSG) =3D=3D> user/admin
> - USB 7-Segment Numeric Display =3D=3D> user/admin
> - mtouchusb driver =3D=3D> user/admin
> - OHCI =3D=3D> technical info
> - USB Raw Gadget =3D=3D> userspace API
> - USB/IP protocol =3D=3D> technical info
> - usbmon =3D=3D> user/admin + userspace API
> - USB serial =3D=3D> user/admin + technical info
> - USB references
> - Linux CDC ACM inf
> - Linux inf
> - USB devfs drop permissions source
> - Credits
>=20
> By "admin/user info", I mean things that a user would have to do or
> run
> (e.g. modprobe + flags) to make use of a driver; "technical info" is
> more like device specifications (transfer speeds, modes of operation,
> etc.); "userspace API" is stuff like configfs and ioctls; "driver
> details" is really implementation details and internal
> considerations.
>=20
> The last ones I don't even really know how to categorize.
>=20
> I'm guessing nobody is really enthralled by the idea of splitting
> Documentation/usb/ up like this?
>=20
> =C2=A0=C2=A0 Documentation/admin-guide/usb/
> =C2=A0=C2=A0 Documentation/driver-api/usb/ (this one actually exists alre=
ady)
> =C2=A0=C2=A0 Documentation/userspace-api/usb/
>=20
> For the stuff that is _actually_ internal to a specific driver (so
> not
> useful for end users, not useful for admins, not generic USB info,
> and
> not useful for userspace programmers), I would honestly propose to
> just
> move it directly into the driver's source code, or, if the text is
> obsolete, just get rid of it completely.
>=20
> The distinction between user/admin and userspace API is pretty clear
> (one is for end users, the other is for userspace _programmers_), but
> it
> can sometimes be hard to determine whether something falls in one or
> the
> other category.
>=20
> In any case -- it looks like almost all of the usb/ directory does
> not
> document "how specific kernel subsystems work from the point of view
> of
> a kernel developer" so maybe we should just move the include to
> userspace-api/ for now as an obvious improvement (if still not 100%
> correct):
>=20
> diff --git a/Documentation/subsystem-apis.rst=20
> b/Documentation/subsystem-apis.rst
> index 2d353fb8ea26..fe972f57bf4c 100644
> --- a/Documentation/subsystem-apis.rst
> +++ b/Documentation/subsystem-apis.rst
> @@ -81,7 +81,6 @@ Storage interfaces
> =C2=A0=C2=A0=C2=A0=C2=A0 security/index
> =C2=A0=C2=A0=C2=A0=C2=A0 crypto/index
> =C2=A0=C2=A0=C2=A0=C2=A0 bpf/index
> -=C2=A0=C2=A0 usb/index
> =C2=A0=C2=A0=C2=A0=C2=A0 PCI/index
> =C2=A0=C2=A0=C2=A0=C2=A0 misc-devices/index
> =C2=A0=C2=A0=C2=A0=C2=A0 peci/index
> diff --git a/Documentation/userspace-api/index.rst=20
> b/Documentation/userspace-api/index.rst
> index 82f9dbd228f5..e60cd9174ada 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -41,6 +41,7 @@ Subsystem-specific documentation:
> =C2=A0=C2=A0=C2=A0=C2=A0 tee
> =C2=A0=C2=A0=C2=A0=C2=A0 isapnp
> =C2=A0=C2=A0=C2=A0=C2=A0 dcdbas
> +=C2=A0=C2=A0 ../usb/index
>=20
> =C2=A0 Kernel ABIs: These documents describe the the ABI between the Linu=
x
> =C2=A0 kernel and userspace, and the relative stability of these
> interfaces.
>=20
>=20
> Thoughts?

Makes sense to me. There's definitely some cleanup to be done in the
USB documentation.

> Vegard

Cheers,
-Paul
