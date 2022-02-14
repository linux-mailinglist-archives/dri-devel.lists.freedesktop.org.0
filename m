Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8084B4569
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EA110E2AA;
	Mon, 14 Feb 2022 09:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6B510E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:17:16 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id g39so6043361lfv.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=l9h0FTYLGGXap1dzR54tfKoCeVF0BWZXnPqUVsNDnPk=;
 b=DkvwKpBhCufekGCIS5SQfzSw8JRCD5NCeSGrPcE9I6Po6jAmlGlUzZTeRka4A91X60
 WnIiBro4xCKDtdUeNalV6JEU2KSM7JzyWIDz4kmSW0BYHi87Aqj7vd+2tIfxTxbPI8/g
 05+r82GG9u8cYov5oGUZfMDtob2UsCFFcMsK6emvgWvxIF6P/dZ6LeVk8X0xOxPSHI2H
 Pmy9A0dKDxP2VvsVsUl1WxfxR1xUqhPN3W4dcIGjgB11vReOpgnFmr52Ykl7CtJUhJSU
 wJ/pXLQ0Qerjqyqj8Adelkp0i1Fe2B3PmlXGpgQ6RgBaa0P8LA2jh0FKg9c1VcymaSUL
 0OZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=l9h0FTYLGGXap1dzR54tfKoCeVF0BWZXnPqUVsNDnPk=;
 b=fBtIcWyB+irvGlff1XbYSNey/+thjRPYijyPXcVZ9IobLo0MxlNZoVzee5R7YcA+gJ
 SWih3P/qxhXYoTPPTKw/+T+BqJZB9aW0yiqnKUbEUu2wA4vs+Qz8Ib0H8TxyD3A3p33Q
 UM3/ci7RKEKzjKvO6syzakVcekqflaymA+EqxJhswb7+5j3gqX7eXxlgEVEMx6MxsPDu
 AXKFMzFb613ks9+TtZu6CCwlqXO+Q0ctMWDeT2zabKtB/43a2e5r2o6XXqU0KzF4IZpY
 5ZzXalU0CP13XcJv0rzyqlAX/cyaTFhmWokglo8lUpzK6XV6OqL3X6Lho6n9zXzYYE70
 UvHw==
X-Gm-Message-State: AOAM532ZHqBYo9/wfJBSI8gWDTWb5Er830AV+TduQKDl4g9bdrcElQci
 v35c4xFbXrqv7wymjWzXrjY=
X-Google-Smtp-Source: ABdhPJzY8VlEHMbQ0UPAMjV8gwTcFMkOtUQgC/50Zjpwrr8X7TpLyvwll4U+DinwVSe89ZzzHh+MWw==
X-Received: by 2002:a05:6512:39c4:: with SMTP id
 k4mr10352957lfu.69.1644830234620; 
 Mon, 14 Feb 2022 01:17:14 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id v6sm4049956lfq.181.2022.02.14.01.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:17:14 -0800 (PST)
Date: Mon, 14 Feb 2022 11:17:11 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 1/6] drm/format-helper: Add
 drm_fb_xrgb8888_to_gray8_line()
Message-ID: <20220214111711.6536b4b6@eldfell>
In-Reply-To: <YgaccFjPfJO0Mj6a@smile.fi.intel.com>
References: <20220211091927.2988283-1-javierm@redhat.com>
 <20220211091927.2988283-2-javierm@redhat.com>
 <YgY6OqN+guBlt/ED@smile.fi.intel.com>
 <4fa465d9-4fac-4199-9a04-d8e09d164308@redhat.com>
 <YgZEuXvJ2ZiOyNS+@smile.fi.intel.com>
 <7560cd10-0a7c-3fda-da83-9008833e3901@suse.de>
 <87pmnt7gm3.fsf@intel.com> <YgaDj6Wld4b7S6DF@smile.fi.intel.com>
 <87fsop74lu.fsf@intel.com> <YgaccFjPfJO0Mj6a@smile.fi.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4exzfizoYWTXAR0xVEcWx0+";
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/4exzfizoYWTXAR0xVEcWx0+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Feb 2022 19:27:12 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Fri, Feb 11, 2022 at 06:25:17PM +0200, Jani Nikula wrote:
> > On Fri, 11 Feb 2022, Andy Shevchenko <andriy.shevchenko@linux.intel.com=
> wrote: =20
> > > On Fri, Feb 11, 2022 at 02:05:56PM +0200, Jani Nikula wrote: =20
> > >> On Fri, 11 Feb 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote: =
=20
> > >> > Am 11.02.22 um 12:12 schrieb Andy Shevchenko: =20
> > >> >> On Fri, Feb 11, 2022 at 11:40:13AM +0100, Javier Martinez Canilla=
s wrote: =20
> > >> >>> On 2/11/22 11:28, Andy Shevchenko wrote: =20
> > >> >>>> On Fri, Feb 11, 2022 at 10:19:22AM +0100, Javier Martinez Canil=
las wrote: =20
> > >
> > > ...
> > > =20
> > >> >>>>> +static void drm_fb_xrgb8888_to_gray8_line(u8 *dst, const u32 =
*src, unsigned int pixels)
> > >> >>>>> +{
> > >> >>>>> +	unsigned int x;
> > >> >>>>> +
> > >> >>>>> +	for (x =3D 0; x < pixels; x++) {
> > >> >>>>> +		u8 r =3D (*src & 0x00ff0000) >> 16;
> > >> >>>>> +		u8 g =3D (*src & 0x0000ff00) >> 8;
> > >> >>>>> +		u8 b =3D  *src & 0x000000ff;
> > >> >>>>> +
> > >> >>>>> +		/* ITU BT.601: Y =3D 0.299 R + 0.587 G + 0.114 B */
> > >> >>>>> +		*dst++ =3D (3 * r + 6 * g + b) / 10;
> > >> >>>>> +		src++;
> > >> >>>>> +	} =20
> > >> >>>>
> > >> >>>> Can be done as
> > >> >>>>
> > >> >>>> 	while (pixels--) {
> > >> >>>> 		...
> > >> >>>> 	}
> > >> >>>>
> > >> >>>> or
> > >> >>>>
> > >> >>>> 	do {
> > >> >>>> 		...
> > >> >>>> 	} while (--pixels);
> > >> >>>> =20
> > >> >>>
> > >> >>> I don't see why a while loop would be an improvement here TBH. =
=20
> > >> >>=20
> > >> >> Less letters to parse when reading the code. =20
> > >> >
> > >> > It's a simple refactoring of code that has worked well so far. Let=
's=20
> > >> > leave it as-is for now. =20
> > >>=20
> > >> IMO *always* prefer a for loop over while or do-while.
> > >>=20
> > >> The for (i =3D 0; i < N; i++) is such a strong paradigm in C. You
> > >> instantly know how many times you're going to loop, at a glance. Not=
 so
> > >> with with the alternatives, which should be used sparingly. =20
> > >
> > > while () {}  _is_ a paradigm, for-loop is syntax sugar on top of it. =
=20
> >=20
> > And while() is just syntax sugar for goto. :p
> >=20
> > The for loop written as for (i =3D 0; i < N; i++) is hands down the most
> > obvious counting loop pattern there is in C.
> >  =20
> > >> And yes, the do-while suggested above is buggy, and you actually nee=
d to
> > >> stop and think to see why. =20
> > >
> > > It depends if pixels can be 0 or not and if it's not, then does it co=
ntain last
> > > or number.
> > >
> > > The do {} while (--pixels); might be buggy iff pixels may be 0. =20
> >=20
> > Yeah. And how long does it take to figure that out? =20
>=20
> Okay, I made a mistake to drop the explanation. So, I (mistakenly) assumed
> that people know this difference between post-decrement and pre-decrement
> (note, while-loop here is not what is problematic).

That was not the question.

The question was, how long does it take to figure out if pixels can or
cannot be zero?

Code is styled for humans other than the author, not for compilers.

Having to stop to think about the difference between post- and
pre-decrement to figure out when the while-loop runs does take me a few
more brain cycles to understand, even though I know the rules very well.

I would call that brain cycle optimization, and leave the CPU cycle
optimization for the compiler in these cases.


Thanks,
pq

--Sig_/4exzfizoYWTXAR0xVEcWx0+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIKHhcACgkQI1/ltBGq
qqdGXQ/8Ce5+VDdFo8ZqWQRABxsfdcoBZkUB3cRRRD8YTXpIMW1qCfd4hY4Pc/XL
JacypoitZ/9Oy9pctixUmmle4U9J9e1mXtkS5IGbCaZpGq/TkeGBHBQ8IuObt00r
PzjKU7dkAsGHrWqKfozMegK/h/upIaGrO3Q24TtRu6mlKGQGMq2eeIJ1bl9XI36C
DEgHzqM6vWkYk6nIDNNSiQmltdHlzWm2CfTsqe5tVTNvYKTO/zqKkOfJ21PY3LNX
bl8IO+E7RPGGzBs0VV1W+AbgF8ZPX8YmHLjfRjYAk5jWARcMr2Cz4cKqB5GIo/sw
YUabXM4dsnxBrPXDMyHgg+nwZXbQrdW0Vizn6JwPTUxQJWQ0arjewgUJv5YLygB+
eDO/PoBaKU7rbh/ybaTmF06wVan7nDxD8sw8spNrAqb5+u7Lwt2v9ZwMenqrAC0s
z/wrKFN91apZcuVMPWnskdktdl0dJJ2ZeyqDOXHdXa9mkIrqZ1cM5wBgfStonlbg
d4g9I0Tmct/S4WuphGO4NCLm7vPahH0UtKqvWiK2K3DZVJf8rAOp6ePu4zKKMu80
0pnrdhbzTtDiDJb0RGPGDQQ1Y08BS213Uc0gI11TQu2MEMaofvpptUsxXqqcr41H
aSvDOqtOg42lKNTjHTfKOpObwScIrtRB7zPkr0kmOQxg3WZ00hc=
=NCW9
-----END PGP SIGNATURE-----

--Sig_/4exzfizoYWTXAR0xVEcWx0+--
