Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E0244C32
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 17:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F30E6EB65;
	Fri, 14 Aug 2020 15:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6558D6EB65
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 15:34:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id k20so8265452wmi.5
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gz3Q1EofLQxkhtnE7oqG68KwP+xGsEuIDwCIIxyJz/s=;
 b=pzhWI1ZTXjSzIhhF0kycPLTTD7XYKxKlAbaG7VnQrIX8dmXtTpVbHe6bJPAW13UF70
 g61HZWWwwzK7qFq0V8IEnWKW/NjaoEV/loEVsDAM8F0OzpYZZ7zuz0k7UDStB4Op4P6x
 7IQ7ZVZBW+zzjtrf1tevfshjrD22UV6uE/xDJcTrwAhfTuS8fbrlVf9TA9EAQ83RDGn4
 7c1D1EC69z9Ka1hLpV9K1v/lwkDnsrR9eSECoD07jz8NZOAqh5XBfToiKXJqMi6vZ+Wd
 +cAy0HDBtUqXLaqWG7wiEOI+mK5NjitYCvVOIQnS08a70GhHJBH7WnohAU65g660zVA3
 6C+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gz3Q1EofLQxkhtnE7oqG68KwP+xGsEuIDwCIIxyJz/s=;
 b=rt27Doz3SeJT6U8fye7PPy2yskXaFHOzQQXPfz/UndGvXe77prsfUXMJqcOFsnoJ8C
 V1AwsPB9lEvsc2DhKkb0wHOabRJseGy/+8IdNx4XNXcqp34aXrse7wERUfR/ckIA4fim
 SPKDhzJu+ERD4Y5UlaETaGfz3lb8CLDbGE0OpGoyzN1y4MCcuGNGIlrZ2q3XXQaqDeLg
 e6/QnMhkP2i3JCAAgwNz1dMIEciAPNDMUZQ9RenKl9e0GSt+BYNjKU8ZrZzV5RQUnvkl
 mYBSKZboEl11bm47/kgWjgJa0NwcvaJ5ISF2OSMOz78jIl5yx5VKBfF3tvfscyJW10m7
 Mdcw==
X-Gm-Message-State: AOAM5336R4J46MA61W5NjkjtqymXHTfgVBXro7XJ3m15Ndd5Y2W8O0Vl
 7GYxulcw0eD2HIXPGNp7hmAVX0ERCo0=
X-Google-Smtp-Source: ABdhPJy6xf9rSSsrcw+628+axkRfMoYj2XvJ2s3YQMYkPtQSdnqXWgQ1ua6eJFMcpBuHcybe+0TC3w==
X-Received: by 2002:a05:600c:414e:: with SMTP id
 h14mr2959535wmm.41.1597419292025; 
 Fri, 14 Aug 2020 08:34:52 -0700 (PDT)
Received: from localhost
 (p200300e41f10ca00f451c56750ebc625.dip0.t-ipconnect.de.
 [2003:e4:1f10:ca00:f451:c567:50eb:c625])
 by smtp.gmail.com with ESMTPSA id v11sm15697865wrr.10.2020.08.14.08.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 08:34:50 -0700 (PDT)
Date: Fri, 14 Aug 2020 17:34:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [git pull] drm for 5.8-rc1
Message-ID: <20200814153449.GH556087@ulmo>
References: <785eb70c-d9e7-dbdf-b044-337618fcea1a@nvidia.com>
 <20200812174005.GA1705@kevin>
 <2c5cf2e8-afd2-446d-1f27-2c225c65d447@nvidia.com>
 <CACO55tto89kT-_QKGjQ50Ht8U-4Dop6sTjNsbr1qHXhgNuDHEA@mail.gmail.com>
 <CACO55tu1RWZ0ZGcMcrU-snT3CkJtwxawwJ9990-5a+hpByh-Hw@mail.gmail.com>
 <CACO55tsfV9pGijOF5F=dLqFhpXgPSArGHXa44Mt3eRBk7z-X=g@mail.gmail.com>
 <CACO55tsEjGUhfrBdbcpT9xLa8N-T0JR-t7xFBA5pxDZ5+NiQhg@mail.gmail.com>
 <efb830fe-9ded-f5d3-6944-45adbb2a1f80@nvidia.com>
 <20200814140527.GD556087@ulmo>
 <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tsr9hTd6mkaKfnnEWUz-7X=Sx7EY5sr1BVz-O2ftr98ww@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: James Jones <jajones@nvidia.com>, Thierry Reding <treding@nvidia.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1868148075=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1868148075==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="54u2kuW9sGWg/X+X"
Content-Disposition: inline


--54u2kuW9sGWg/X+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2020 at 04:44:43PM +0200, Karol Herbst wrote:
> On Fri, Aug 14, 2020 at 4:05 PM Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >
> > On Thu, Aug 13, 2020 at 10:45:34AM -0700, James Jones wrote:
> > > I'll defer to Thierry, but I think that may be by design.  Tegra form=
at
> > > modifiers were added to get things like this working in the first pla=
ce,
> > > right?  It's not a regression, is it?
> >
> > I recall that things used to work with or without modifiers at some
> > point. That was basically the point of the "pitch-linear by default"
> > patch, see:
> >
> >     https://gitlab.freedesktop.org/mesa/mesa/-/commit/9603d81df05105857=
b676f20dff964ef3ab0ecff
> >
> > If we don't force pitch-linear for cases where we don't have modifiers,
> > there's no way we can properly display these as framebuffers because we
> > lack the modifier information at the kernel level.
> >
>=20
> I suspect that's related to
> https://gitlab.freedesktop.org/mesa/mesa/commit/c56fe4118a2dd991ff1b2a532=
c0f234eddd435e9

But we're checking the the PIPE_USAGE_SCANOUT flag specifically for that
type of case, so this should work. On the other hand, it does sound like
that logic might actually work, but for some reason Nouveau then ends up
allocating a linear render buffer and a tiled depth buffer, and that's
the combination that doesn't work. Did I understand that correctly?

So it sounds like there's a few options:

  a) Make Nouveau render without a depth buffer in these cases (not sure
     if that's even possible).

  b) Allocate a linear buffer *in addition* to the normal buffer that
     Nouveau allocates (with whatever it selects as the default layout)
     and then blit from the tiled buffer to the linear buffer everytime
     we need to. I think that'd be basically reproducing the code that
     is controlled by the DRI_PRIME environment variable.

  c) Accept that modifiers are the way to go and rely on them for proper
     functionality. This is obviously a really bad solution because not
     everyone has transitioned to framebuffer modifiers yet. On the
     other hand, this is precisely the kind of use-case that framebuffer
     modifiers were meant to address, so it isn't all that far-fetched
     to make them a requirement.

None of those are really great options... does anyone have any other
ideas?

Thierry

--54u2kuW9sGWg/X+X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl82rxcACgkQ3SOs138+
s6FOew//dUJZvX5e7FN8/s64t3JR6FuNiiB5NBCtgp3s7o4vvdjg2cWyq+k37I1T
kukeYuFyr4WdYpv8NItOKOxHt3eBoiv3j1iomczp5XcY1M+Jhv2wuhO753XA4HGj
/7PcZCX+ww336pnDkhZlq5GcR5D97V0unhRh4nczyBc1NBujepgs4w9tWgbRiUZq
hFhYGlyF4J9VilZWWopGbtSELxMxL149JobVnyhgnv74xxEI/siqe1T43i2Nzzrm
HljKdovqZprctBNuOqQ7Y6cm4C51b/0SyJMrU0WePGynotaO9j+bwhU3Ksv/Ssqu
jq51Yw5YDa3G90XKV+NVPzTXW5/ainuKQxkGkO2s00E6ddZ0aZgNyM08KY16c8yh
jLlr+0dnE/1H5RjnAw/Wis2/qZ9lBd40DK0exOoW5hPlZFTsZpEiz/8Vw1rgh4pP
qZzoKw/iRyZmN5N7sOkNkLm0x4YplxkqWuFIUuAw8h/K7f8uffFv8C20gndOwrDm
qFzLOgHqS5YRTXLs7diFySnZJBNmN/ideJw/y9oMpt9P1UNF0a8+WAQtx2/XCmin
XqdDU7YrZf9k/yN+GwFgcM/0QBWqY96XhPY5qwmeOc68HKW0RQVP5JKDyqX3o1tz
Ekg+nEchxZ1OIH74bPMfjrWPY3CUpFgrDGNITj2x1hzayi5x5p4=
=1GpT
-----END PGP SIGNATURE-----

--54u2kuW9sGWg/X+X--

--===============1868148075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1868148075==--
