Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA044192A63
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 14:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE826E129;
	Wed, 25 Mar 2020 13:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7E66E129
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 13:49:34 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f20so2555688ljm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 06:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=YDd4psw77+TjgR3LErHqB45pC2hCTAbwI5y4bLpGMCk=;
 b=ue53poOk145/0Go2c3Fb090mulEi4KObzB4Gg55MF1CvN6x6lHk2Qf8lPZ5p5R3+G2
 VP63zmjrCzKb82gf8jqzE7LJCcY3foHxfMdEijJbHSCvcWJLb0An2KtlnlYKqoF8gBtu
 ZM2ZexiOVhdnZg2Q8ll4+pRAHMR+Ez1aKDwmBNYhe6Nvsy5yNRJPt/igDUFQngqQ230s
 7FxB2+dbcgoOMjaWWt/4YXpHnhCdt+5z1W+vDSn3fbKYHcojeMuflvme0hVgs/EFyIqc
 gbWuWSFjkBuKobaUJ4xQCX8QcyxxNW29g1kVgr4YR3BYFqnKx39KEE+s3zCzKixeZeWO
 yEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=YDd4psw77+TjgR3LErHqB45pC2hCTAbwI5y4bLpGMCk=;
 b=RIU4i8Wr7pEG0h878+sxLvfX8+v3IxjvLEHFYQ7AzFQpS9Q+KbEqEyxHMOWZFfSkSF
 P5G3Lrs57Xsqn/Lvn4QnUzFGmvQ6xzMPH5NRkxHXF7HoLvgsSvpaCG2ctq/l9e/Gs2hz
 UzYrruV0sbJfZGYMH4j68QGrTFtJ/uzrrRsQF8HqEGLBnX5yzN9iNsrWeSHYzbsvCo+v
 JASroxfXsjeSX59hSYizXKk2MulG2pi99lpVLsVipAQTxZyAYk4VBqKuK3e01ylqnF8o
 3xy8OlXZcd9WrQmYn8Z0nYAY1ouvYySFE4Roj//y+YuDieyxZVAq9wM4PRFMBRyuc+Tv
 ekxQ==
X-Gm-Message-State: AGi0PubpLEgJd75mexHX/YRPx8bOMCK6jzSoqlF+GtUpm0fmcSHR043b
 GkonFtVKW1cwsL36scFARLQ=
X-Google-Smtp-Source: APiQypIVWnohCBw6Laxl+KFUeZrUWln3GLJRYstirHtutpXWykkoScXzvviRjE1iqzvOz4cwkSo1ww==
X-Received: by 2002:a2e:a362:: with SMTP id i2mr2084950ljn.52.1585144172471;
 Wed, 25 Mar 2020 06:49:32 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f2sm6420123ljn.101.2020.03.25.06.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2020 06:49:31 -0700 (PDT)
Date: Wed, 25 Mar 2020 15:49:21 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 7/8] drm/fourcc: amlogic: Add modifier definitions
 for the Scatter layout
Message-ID: <20200325154921.2a87930c@eldfell.localdomain>
In-Reply-To: <b1386ef5-c3e3-c07b-5982-e3f02441b431@baylibre.com>
References: <20200325085025.30631-1-narmstrong@baylibre.com>
 <20200325085025.30631-8-narmstrong@baylibre.com>
 <JgBZ7eZYMgXRNu_-E4ItS1bud9mEe15xptZEX_XhsM_h8_iIZTOmPokEVxPJYwX0wP0pmb5p-ymubyyZP3kVbcfuDNdmM0__L8wBR5IykfE=@emersion.fr>
 <b1386ef5-c3e3-c07b-5982-e3f02441b431@baylibre.com>
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
Cc: "mjourdan@baylibre.com" <mjourdan@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0858414042=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0858414042==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e3_VDQSNvzbMkOgJtm//89P"; protocol="application/pgp-signature"

--Sig_/e3_VDQSNvzbMkOgJtm//89P
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 25 Mar 2020 11:24:15 +0100
Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>=20
> On 25/03/2020 10:04, Simon Ser wrote:
> > On Wednesday, March 25, 2020 9:50 AM, Neil Armstrong <narmstrong@baylib=
re.com> wrote:
> >  =20
> >> Amlogic uses a proprietary lossless image compression protocol and for=
mat
> >> for their hardware video codec accelerators, either video decoders or
> >> video input encoders.
> >>
> >> This introduces the Scatter Memory layout, means the header contains I=
OMMU
> >> references to the compressed frames content to optimize memory access
> >> and layout.
> >>
> >> In this mode, only the header memory address is needed, thus the conte=
nt
> >> memory organization is tied to the current producer execution and cann=
ot
> >> be saved/dumped neither transferrable between Amlogic SoCs supporting =
this
> >> modifier. =20
> >=20
> > I don't think this is suitable for modifiers. User-space relies on
> > being able to copy a buffer from one machine to another over the
> > network. It would be pretty annoying for user-space to have a blacklist
> > of modifiers that don't work this way.
> >=20
> > Example of such user-space:
> > https://gitlab.freedesktop.org/mstoeckl/waypipe/
> >  =20
>=20
> I really understand your point, but this is one of the use-cases we need =
solve.
> This is why I split the fourcc patch and added an explicit comment.
>=20
> Please point me a way to display such buffer, the HW exists, works like t=
hat and
> it's a fact and can't change.
>=20
> It will be the same for secure zero-copy buffers we can't map from usersp=
ace, but
> only the HW decoder can read/write and HW display can read.

The comparison to secure buffers is a good one.

Are buffers with the DRM_FORMAT_MOD_AMLOGIC_FBC_LAYOUT_SCATTER modifier
meaningfully mmappable to CPU always / sometimes / never /
varies-and-cannot-know?

Maybe this type should be handled similar to secure buffers, with the
exception that they are not actually secured but only mostly
inaccessible. Then again, I haven't looked at any of the secure buffer
proposals.


Thanks,
pq

--Sig_/e3_VDQSNvzbMkOgJtm//89P
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl57YWEACgkQI1/ltBGq
qqdFJQ//cD3K85nsCGKhXDmSyQzaQzhmiNbd/rn5U392CpaELlvtHKVFtGggN5zp
l5MIb/EjYgZUHG220KklqCiZAzk+RLTmZnQPZmXPAnKobeeJLIGwHhKFBTozKG8t
9NLG8Gp1brFA7xVz63SSmZTUWFw4LP+HnMRIPPEGEpx6J4J3MJ8ikC+Utcvcs8yZ
1Be4E8s6cLRxcJPt4Q8PwhTNXtwdPxBL8aGhYB93Ptu30fGACCmUKCCtNyEo7PN+
qK2+eyZh3kB6Ktujsi+QqWgxtzIWtRH67ezkp3TlrqfFDQ8kH5guzfFfjb6coXW9
evJLwTgHoU/WZaOve3WVajKqfJdCbzzKFqBjaIeeA8RTWyWwHeBDpFA/G859H1OQ
zd03sTrUz+uOl/k9ZpyG7dvReAijUA450FQe+c59lDWwWV94tRwbrFbjI3yh7R5q
pl1bpuCFj5BVA74GEc8VzSNuqmqnqDltkiVAJ2BDi2heB5+2Pt+xZQlXz4rY4Ynl
y9VLeSXlDxS7eJwsYjN9i3ra182eddULpxbdbdxPF7OVhpG2Wdhr7BFzdiNakBCM
V7P7YUwFTOoNhiotZEKVpAnCQ7tIQgDxWRD/va+m6EmMhnjh0jDzb7nKz2a9y1FN
UTiMucJoHEe0bxz94KaioKsNKAZQf7cNK1aUPkPF5qH+ORGgdVc=
=oJGl
-----END PGP SIGNATURE-----

--Sig_/e3_VDQSNvzbMkOgJtm//89P--

--===============0858414042==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0858414042==--
