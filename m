Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4881C7F1E39
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 21:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADEDF10E11A;
	Mon, 20 Nov 2023 20:53:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89BA10E11E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 20:53:53 +0000 (UTC)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
 id 7E54A1C0050; Mon, 20 Nov 2023 21:53:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
 t=1700513632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T6LfoMY/Fvp0UXzBZ+W7X81hPAVnp3D1vcRIVa9CydA=;
 b=eLNR+DfutupDoKP3c+C0DbY1+lXsFmpXNqcRY2eGyyJiC+LFIxjZecUl6vD1nvFUkbTnB2
 YmqpbfQNE0HH5kFd/oyl997swsjsEr5veurdUfW7I5FcrEMyOV3zJH200Dv6srV1ymkYhb
 YI7sDEE4i1X6oCwkGwaPtFw5K209GFU=
Date: Mon, 20 Nov 2023 21:53:52 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, jikos@kernel.org
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Message-ID: <ZVvHYAsM1p8O7J8r@duo.ucw.cz>
References: <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com>
 <CANiq72kvZcNp2ocXoqBae9q2UW+RPQy3dXUr+QS-izKpM1yyoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="9jeVF7q2cF6LMKnm"
Content-Disposition: inline
In-Reply-To: <CANiq72kvZcNp2ocXoqBae9q2UW+RPQy3dXUr+QS-izKpM1yyoA@mail.gmail.com>
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Werner Sembach <wse@tuxedocomputers.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--9jeVF7q2cF6LMKnm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon 2023-10-23 13:44:46, Miguel Ojeda wrote:
> On Mon, Oct 23, 2023 at 1:40=E2=80=AFPM Jani Nikula <jani.nikula@linux.in=
tel.com> wrote:
> >
> > One could also reasonably make the argument that controlling the
> > individual keyboard key backlights should be part of the input
> > subsystem. It's not a display per se. (Unless you actually have small
> > displays on the keycaps, and I think that's a thing too.)
> >
> > There's force feedback, there could be light feedback? There's also
> > drivers/input/input-leds.c for the keycaps that have leds, like caps
> > lock, num lock, etc.
> >
> > Anyway, just throwing ideas around, no strong opinions, really.
>=20
> Yeah, sounds quite reasonable too, in fact it may make more sense
> there given the LEDs are associated per-key rather than being an
> uniform matrix in a rectangle if I understand correctly. If the input
> subsystem wants to take it, that would be great.

Unfortunately we are getting no input from input subsystem. Question
seems to be more of "is auxdisplay willing to take it if it is done
properly"?

Best regards,
								Pavel

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--9jeVF7q2cF6LMKnm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZVvHYAAKCRAw5/Bqldv6
8tamAJ9ay6bqjz3WKWY0hzcjA1oaf0rrFACghHK4/NlmCVR1KurSm8xzJvVcKSs=
=1Jqp
-----END PGP SIGNATURE-----

--9jeVF7q2cF6LMKnm--
