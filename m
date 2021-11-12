Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3CB44E621
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 13:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 279D56EB7E;
	Fri, 12 Nov 2021 12:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4546EB7E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 12:10:50 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id e11so18083918ljo.13
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 04:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=dqMUJxuDqznX8iP/0PGGKyRvFuHRtWMHNTIPIxdJC90=;
 b=bcYunbF8BibQPFjxUg8F1GFUgtRvXsArQ1YEP99ALIqFGB2BVjZSh70Fn9colQDXto
 vLDvvJF9+sTYE1p3QmkK0sLWBN4HtfHs2GF36hD0z3uYj4kcMSQh009PyI0Mrl94SCfJ
 ItDgPnCkVVoKImYmhVaeEJ5CI569lrW6n/kYXFKya+wt5TRs0TgZdPLkSIMlTrzcTX9J
 4tcS0HwIbPUkfy53DY0en9X1UipJI189Kuhs2kwJQXGJ5Q38fkEbMfHZtKwaMXFR43NR
 k2b7V82HV0XFHCy9ij6f8Yg4kkCjsnv3S4Sx+pSqmGHjJSSX/U+6IdybeqpdeyuJ02Pa
 5ZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=dqMUJxuDqznX8iP/0PGGKyRvFuHRtWMHNTIPIxdJC90=;
 b=6hhGLsjDn3VgC0weprY5ue7bxFYmnmQOechEPVw98+gcPEzJ8JDNRp3P7/do3iR/K6
 2o+J3d+/ebG9eTnZ2Wd0gLTpqE2jTw1rspgEEayRZvEoN6S29fGeZY1G/IIsK52As0+R
 m0zUOBi42CpvnJNwBO/bcEvJ6RRRPuE+59rTBSXAxHukToYhABkyl5w0nJv3LAWNSUpp
 MUUCJnS030FUDWtsfWZnESg7ILdXzEaXJo9UHrLQXevdb37WzrhmcsdBkNiB6z4oNsFZ
 dqZ0Z8jTUnAAlzWD+xY29RP2WftU27c1mn52GPx2D6GLqg5ZcrICAOUuLpyE9WL+iXk+
 ++jA==
X-Gm-Message-State: AOAM532qbQzhLCelGRxoITWtVxw1fJt838CXnZU9yVppoA1BoLUy+DN1
 Sdnu921jFDnpyyIzl2fdya0=
X-Google-Smtp-Source: ABdhPJxDeO1DXoOEP1oUCmoGqHWB4tlPP6UJrYRsRshU8OWxjZLR8seKGkRbqP0+s3OEmA5124ktZg==
X-Received: by 2002:a2e:3102:: with SMTP id x2mr14417332ljx.276.1636719048742; 
 Fri, 12 Nov 2021 04:10:48 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id x10sm547260lfg.102.2021.11.12.04.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 04:10:48 -0800 (PST)
Date: Fri, 12 Nov 2021 14:10:45 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Message-ID: <20211112141045.55c8dfdf@eldfell>
In-Reply-To: <a6014802-7ec0-0470-2dd1-ef650d995a53@redhat.com>
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
 <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
 <20211112122239.26b3787c@eldfell>
 <5bd4ffa9-f44f-ca34-c346-6c530d31e5ec@suse.de>
 <a6014802-7ec0-0470-2dd1-ef650d995a53@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Kl3x8r8jus8qFhy5fBpdX.X";
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Kl3x8r8jus8qFhy5fBpdX.X
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Nov 2021 12:20:14 +0100
Javier Martinez Canillas <javierm@redhat.com> wrote:

> On 11/12/21 11:57, Thomas Zimmermann wrote:
>=20
> [snip]
>=20
> >>>
> >>> This is what HW-specific drivers want to query in their init/probing
> >>> code. The actual semantics of this decision is hidden from the driver.
> >>> It's also easier to read than the other name IMHO =20
> >>
> >> Ok, but what is a "native driver"? Or a "non-native driver"?
> >> Is that established kernel terminology?
> >>
> >> I'd think a non-native driver is something that e.g. ndiswrapper is
> >> loading. Is simpledrm like ndiswrapper in a sense? IIRC, simpledrm is
> >> the driver that would not consult this function, right? =20
> >=20
> > We use that term for hw-specific drivers. A 'non-native' driver would b=
e=20
> > called generic or firmware driver.
> >=20
> > My concern with the 'modeset' term is that it exposes an implementation=
=20
> > detail, which can mislead a driver to to the wrong thing: a HW-specifc=
=20
> > driver that disables it's modesetting functionality would pass the test=
=20
> > for (!modeset). But that's not what we want, we want to disable all of=
=20
> > the driver and not even load it.
> >=20
> > How about we invert the test function and use something like
> >=20
> >   bool drm_firmware_drivers_only()
> > =20
>=20
> That name I think is more self explanatory, so it works for me.

I'm not going to argue against that. :-)


Thanks,
pq

--Sig_/Kl3x8r8jus8qFhy5fBpdX.X
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGOWcUACgkQI1/ltBGq
qqfjPhAAo7roVsEKzK786CitsoAcpU31AmYgEPC+POqP9Eg6GMAhM1YRRg+1w7nE
1nA8ekOe7G1Z8dzPY57ZOFqdwFuPA8qLgVsZr4EIInxeQZFT2sYy1OiZu/q6FsMQ
hWQ3sA2ow2Mq8j9Bw1Tgkgs/gmvaGLeQoTg9ICp4p0wB/3JOYejR90+WREaN9uvO
jmjTq9ge4s31lO7MTRmS+7P3/Nk7uYnNrwmONdswiwg0JMkEiAx4aJm124GGdWpf
BoTv6gU/78s1v4ym4d5f6U1Ndhrkujf6c37UYdwRblJZ0Rc0wdYPgiY3fgskEXVz
odElcmDe9+DEXuIAoUkzHsw8Up1sDFkFmGagCH6qw/7+7BY6KOw3YTcf/ATGq9z+
nx0Qcd/ufK/Ax4TFo4YYTy5yXM+WqnbMMgN+hRPFPARIIzHmHi/5dW7Nr2IaFE/v
Nmdv05wDx+ggO6/8XOiynel7jAUEWqXthRJvZNQpw9gcllu0W/q+hYd4oTEKCllV
Ifn33SmAxNCAtmM5z4T23WipxF/RCmf5cQu/VkTd1DSeKSjmjdifzc8mIuMMiBML
7ux30EsHJ2x3FGyDzhK+uS8tE/rs60pKZS3HaGqKT8++hIIT0OkRJRps3ZQnPumw
0kmEFgOtmgNezD8zbQcihrOF7eqbjXlv+DUn+p61ZKUXUEv91T0=
=UVDr
-----END PGP SIGNATURE-----

--Sig_/Kl3x8r8jus8qFhy5fBpdX.X--
