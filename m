Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CF2358567
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 15:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAA16EB07;
	Thu,  8 Apr 2021 13:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43A90892B4
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 13:58:03 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id o16so2393661ljp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 06:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=HtfmfhWo1jzDuhXtD5E/xbHDbBxI7FLvaOhFGok4gok=;
 b=L21ARQBtmWY+oxm3fB+yxtJ/q+e9y529qjD5Y0I5XhpK0z/Ve0T74Nzs6P1MyYPpzB
 uJniLTZI7xkesEQNLWWNQAH34BQRQn37MMYdxtUm0i8TQgWxF+y0hMTO9zwcPgvkJ2+a
 OuH12UITckJAtJq1lQt4Wtl+TwbtwK7mKYUYyDcTMqwvwNiRrJ2+4aWeQzYWiboo8DWp
 ApVJicCeR5oi/Gb4kCzKf+8T1ImGt/xcbzLSQjwKU+mdJ9JB3chqRR+FJdhYjIUjVqRB
 V5ZzmLspWC1yhNa6HRbO7qPvdBGRhENCfoVXdesicXuNOBBqHP1YuZzF5PNCnD3zST5o
 DyxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=HtfmfhWo1jzDuhXtD5E/xbHDbBxI7FLvaOhFGok4gok=;
 b=GNGMqrbIYGr9OkMGYv1ShPr3tC7dJGIUKnRKPmkTPzdavmD+WMjFqVI6wChyK7FTen
 vTQUMCfpAD7L7vUE+m21B29Zqgk0MleHdUf0jyQnW4WUd5ouNqHR/vAjkSidHUJjpaOH
 VBlwc2r7p5XvffBQzG3ka+2DDlJFyFri9M9daYwUstSKIdymUd7CVcxWWoTQ7IW+e413
 l3uS86+GqXQw425T7HBl791xDb3K+drQEGuHXY6KtiBkktUQYPoS91x/TkAqjyMq5WRD
 BOiybOuEzC91oLoyNUTSlks0/ZeD2Xm65mfYQDBtBZt5CXkQ/VTpZw+jvjJr55jBaOyg
 NCRg==
X-Gm-Message-State: AOAM530Wp4o+Tk5HeRYYb2BcqMUh1aCskp4s8BK19hiiRco0xnJ/gdC9
 1RcKT7WNe6/WqoSDdUlGtus=
X-Google-Smtp-Source: ABdhPJxWxIP9ssT4YTF39vhOgMtRmuecsMEupa7vMuSjJfl294xymHseQx4BCkUGhJtEYJoT2+QhAw==
X-Received: by 2002:a2e:88ca:: with SMTP id a10mr5774327ljk.55.1617890281686; 
 Thu, 08 Apr 2021 06:58:01 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id m27sm2831741lfc.222.2021.04.08.06.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 06:58:01 -0700 (PDT)
Date: Thu, 8 Apr 2021 16:57:51 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/doc: emphasize difference between plane formats
 and IN_FORMATS blob
Message-ID: <20210408165751.7488e793@eldfell>
In-Reply-To: <YG7pSJHe6gKDJ6Hh@phenom.ffwll.local>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
 <20210406192118.12313-3-leandro.ribeiro@collabora.com>
 <YG24z2oeHVtzvkXy@intel.com>
 <RW8-e8gSvP1pTckh_2alh-dqd3OR_bdl8e5PYdZVWBL4VnBMh0_ZWEfdlRmoQvzI0lGVH62Fp83MCaPqLZxlCE5pjntUhq-zW0v4-S_4Vos=@emersion.fr>
 <20210408125919.4a83119c@eldfell>
 <YG7pSJHe6gKDJ6Hh@phenom.ffwll.local>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>, kernel@collabora.com
Content-Type: multipart/mixed; boundary="===============0922344471=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0922344471==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LdnqqpoWPaGUQTG9_bhSVhs"; protocol="application/pgp-signature"

--Sig_/LdnqqpoWPaGUQTG9_bhSVhs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 8 Apr 2021 13:30:16 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Thu, Apr 08, 2021 at 12:59:19PM +0300, Pekka Paalanen wrote:

> > The point of these documentation patches is to establish the convention
> > that:
> >=20
> > - drm_mode_get_plane::format_type_ptr is the list of pixel formats that
> >   can work via the no-modifiers uAPI, but says nothing about the
> >   explicit modifiers uAPI.
> >=20
> > - IN_FORMATS is a list of format-modifier pairs that can work via the
> >   explicit modifiers API, but says nothing about the no-modifiers uAPI.
> >=20
> > Is that a reasonable expectation? =20
>=20
> I'm not sure. I thought they're the same list underneath in the kernel, at
> least for drivers that do support modifiers. The current wording I think
> suggests more meaning than is actually there.

They may be the same list in the kernel today, but do you want to force
all future drivers and future formats-modifiers to have that too?
Or did the boat sail already?

The existing uAPI considers these two to be independent lists, no
documentation saying otherwise, is there?

Should a kernel driver not have a way to say "this format won't work
via the no-modifiers uAPI"?

The practical consequence in userspace is how should userspace collect
the lists of supported format-modifier pairs, when the kernel has two
independent format lists, one carries modifiers explicitly and the
other does not. The one that carries explicit modifiers cannot denote
"no modifier" AFAIU.

So the "obvious" interpretation in userspace is that:
- the format list that does not carry any modifier information should
  be used with the no-modifiers uAPI, and
- the format list that does carry explicit modifiers should be used
  with the explicit modifiers uAPI.

If you were to say, that if IN_FORMATS exists, use it and ignore the
old no-modifiers format list, then the conclusion in userspace when
IN_FORMATS exists is that you cannot use the no-modifiers uAPI, because
all formats that are listed as supported carry an explicit modifier.

I understand that the format or format-modifier lists are not
authoritative. Formats outside of the lists *could* work. But why would
anyone bother trying something that is not suggested to work?

Or, is the intention such, that all formats in IN_FORMATS list imply
some support through the no-modifiers uAPI too, iff buffer
allocation does not give you an explicit modifier?

Or, should there be an i-g-t test to ensure that both the old and
IN_FORMATS lists have the exact same pixel formats always, carving that
fact into stone and resolving all this ambiguity?

> > Is it also so that passing MOD_INVALID to the explicit modifier uAPI
> > (ADDFB2) is invalid argument? Do we have that documented? =20
>=20
> We'd need to check that, currently it's an out-of-band flag in the struct.
> Atm DRM_FORMAT_MOD_INVALID is entirely an internal sentinel value to
> denote end-of-array entries.
>=20
> In practice it wont pass because we validate the modifiers against the
> advertised list.

Right, so while at it, would be good to document that one cannot
substitute no-modifiers uAPI with explicit modifier uAPI using
MOD_INVALID. This should be documented, because other userspace APIs
have tendency to gravitate towards having just one explicit modifiers
function allowing MOD_INVALID, meaning "no modifier".


Thanks,
pq

--Sig_/LdnqqpoWPaGUQTG9_bhSVhs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmBvC98ACgkQI1/ltBGq
qqey8BAAmPJEFkCKTfo7VAGObP0YxfUG9BYn8NBNiwjTvYaU/YjFc6kwgRWGDK3w
FHyk0MsTw/CTpraJ2ZlzkgUbzYi+mQ92KQAlmKYZt87E5wvqe3qi8TR0ORK5g9NW
kSIqQI+FWer80an92nrOwBfcOCKRFb3GBaqCxn9OwrSBp/sYjFLCcuNR14VxiX1+
BY0YYivJElORa8hy0gBLVTC7PfyhjLB5IH60HtzIYxwb72WQPYAnL9LvWq6TN990
vshgD3jj7UAZGs/5DcIxZLPJVUu6F3jdfYWGQgTtp6MXK3mW8K782ADD4llT9ySp
EuQPmlq4hBtAg4UUK9W6jdmrQ3oqr6Cd2c1ozePeSva0e7gN3bPfGJaiGwf8Sv4z
tAJrhKcqc3DVOxeaiCB3ozEKzjDNyLwzxZ4C1ihTMGQqkWgocuagWnYGHZST4Uaw
jvUR9c7Vq/iyOoyFhmIFI+lItMH3J+uqvV+VIWB4MYuvISudVj/4wSwGaNjoMV+j
/TH7EIwABqBQ5dP7SR/e6LhXDWMInBkqtrYTzT0zdgQaCYsQ4S9GKCHWuTz4+46/
yL5kpmVb9+jwtK1AHrJ1/MOjfiMQRq/vRkhRx+mA87G4b6uBy4VmwSA7Ll/ijOBU
rE6lVDPiZA8TV0KBz/BQcH3ywkhQgadQJ7XWIFjkwsktKRk4Bb0=
=pENr
-----END PGP SIGNATURE-----

--Sig_/LdnqqpoWPaGUQTG9_bhSVhs--

--===============0922344471==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0922344471==--
