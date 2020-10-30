Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1A29FF6E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B856E970;
	Fri, 30 Oct 2020 08:09:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61F4C6E96A;
 Fri, 30 Oct 2020 08:09:13 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h6so6738679lfj.3;
 Fri, 30 Oct 2020 01:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=koe8TNhnzuU4pWHdrNlMnfhL4E1rEAC03gC7QIAp28k=;
 b=CAIzEa09yOnBuObzrjdQ2Gakmywg8t9n+DZ4JcPmwHaw3rvEHPKGzmE3aalby5JWI9
 /ooZHQLrrTOG+Y1N11i5qrYKq7E2ht2FD+pQhDysnqPbJh+NA1iF9EHZEmCV20kw6XFu
 VbQmahCgoh9sLaivC8apaRfIhOwEdrM/aLLAvhZU1QqhupRNT1RtQP8d9v+hleVFyb+M
 3tDf3S0TjRzFPNaZkPmqFxQlZBO4okk5oFEBX2H7mIw9wyplYZaszXy4QGK0F3tqjpjn
 xUQFWIrmOzGIghPv/QjEg6UWdqPeGF7+5TLvLPZ5ky041fdw/UQ1XZap8bsFf3E/54NM
 tDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=koe8TNhnzuU4pWHdrNlMnfhL4E1rEAC03gC7QIAp28k=;
 b=ibFyn6PKVIwEy5tRcr8LtW9Ny2yIf+Kai9T2fa5owYsSOZFPRP4b1KlcAPRrfuf47Q
 SJqMQyeSn1yFBUz+vMwlbqn4gZoyhwLJ3gLdDdxITiDm/+KgHXcBdp22d+3sDYSbUhis
 5mbOlzU0jzbnWJH8QezSp+IhVgqlvI7J890KOhtBkxzMuT/FKnOaXQnyyTqrwV61Ga0Y
 LbDK9RcDskAd8qZxckvNOI7QzMIB0I1fpy75N4NrpKYiQU1IAoWPZewHHt/C8mqRRdP9
 QXEKLfH4lgcuUWSbHpl8fhSVD/ucFjdjhW/+b4zRINkENOqi+wYC1k29Kc4Sr5vjDQkr
 mqDg==
X-Gm-Message-State: AOAM531kpYvCEJKw9ohdv5FeVsCRlshDu0ERpa+7XmBoNNo4f07+Qg2U
 e2M5CqOQGibl/mY8A9rmUV4=
X-Google-Smtp-Source: ABdhPJzfHetFkfpTR48Kax99lTlXmK2MVJlDnLAl101ZtpWOimKCO46xMGNQYUKFelxity2YFLW0Qw==
X-Received: by 2002:a19:6453:: with SMTP id b19mr453466lfj.527.1604045351676; 
 Fri, 30 Oct 2020 01:09:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k13sm538335lfe.179.2020.10.30.01.09.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 01:09:11 -0700 (PDT)
Date: Fri, 30 Oct 2020 10:09:01 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Marcin Kocur <marcin2006@gmail.com>
Subject: Re: [systemd-devel] DisplayPort display non-persistent device naming
Message-ID: <20201030100901.51272cd9@eldfell>
In-Reply-To: <d23c3db1-1ae9-3f23-23a9-4d5d912c5108@gmail.com>
References: <d23c3db1-1ae9-3f23-23a9-4d5d912c5108@gmail.com>
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
Cc: systemd-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1022711559=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1022711559==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/VBOkj9Letn/LYt6yCXbf_1i"; protocol="application/pgp-signature"

--Sig_/VBOkj9Letn/LYt6yCXbf_1i
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2020 21:53:34 +0100
Marcin Kocur <marcin2006@gmail.com> wrote:

> Hello,
>=20
> this is the output of turning off and on my display (using power button):

...

> The monitor was visible in xrandr as DP-2, after power off and on it's=20
> visible as DP-3 (DP-2 is still there "disconnected").
>=20
> It's troublesome for:
>=20
> - GUI display configurators
>=20
> - scripting
>=20
> - for Xorg configuration which stops to work:
>=20
> Section "Monitor"
>  =C2=A0=C2=A0=C2=A0 Identifier=C2=A0 "DP-2"
>  =C2=A0=C2=A0=C2=A0 Option=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Primary" "true"
> EndSection
>=20
> Is this a bug or a feature?

Hi,

this is how the kernel DRM sub-system works. The connector names are
not persistent in general, just like you can't expect that the same gfx
card appears always at the same /dev/dri/cardN node if you have
several. By default, cardN nodes are assigned in the order of which
driver instance happens to initialize first and it can be random.

Usually hard-wired (in hardware) connectors just happen to always be
discovered in the same order, and if you only have a single gfx card in
your machine, the connector naming is practically persistent. This is
an accident. It is not guaranteed if you have multiple cards or you
have MST connectors.

MST connectors can appear and disappear dynamically. There is a KMS
property that attempts to reflect something about the MST topology so
that you might have some hope to match a "connector", but this is not
in the connector name. The concept of a persistent connector is
problematic if the connector is in a MST monitor for daisy-chaining
more monitors - you can always unplug the first monitor making the
connector disappear (not just become disconnected).

If you want reliable monitor matching, monitor serial number (if
present) would be a more reliable method. I'm not sure Xorg config has
matching rules for that though, but I suppose RandR based configuration
utilities could do it.

If you want to discuss this further, dri-devel mailing list is the
place - Cc'd. Nothing to do with systemd here, nor even with udev.


Thanks,
pq

--Sig_/VBOkj9Letn/LYt6yCXbf_1i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+byh0ACgkQI1/ltBGq
qqe98g/+JX6hMW+Yn4UUycgaiycNe5jrSuYvScaITVVjJNxcOAkTKoQ/dI6qRnZJ
MmvKrvzA52VVoAfo3vafJZlqDKnsg92DhMl37t2ZvhRviKXu18D0IHaHuq8sN9Nk
nO9EonMzW8Xjh4WjeJZRXEv80axDpyTjrLHY7mOQMJLdl9Q9r0skBkpxLo8QbeIZ
sMQ7LVtCvHPiWw3qDhhE5gAJD9kciniXsNhMAVy6WFluAyS0QUytj0kF8r0/RVuY
40lWviC7kVwwISHZzOhUiF0sce3TDoILAirnXVQJRC8UJoB+ONpJJqMO4c66enAO
2QsCDXB6TZvEQofScFprNJMzzCSxCluUZiToFj/aEQ5d9UC8ZNSe9IBlarnBHsZY
QIHg12v8wor3BGCvqb4Mov6FFgIGdaTNeZ/P1WQ0ZrPSXjIDJTqbQDP4pRIqMOj1
8IdH5u+rLSayWX0uydFj0SpEZHCB0novgjhZXdkqHKbw5tsyEq6uGD/XVM3QmOq0
TcNCmC8ovn49bET7CGLx+ELZvdBFmegq1YX/WwEDhu4CrNM3IOscuODlXp+G4EGv
Cq+TcIfWIMurI74WGKdYm2qYlT01G/7Jjc/DFsZnyFJu6KqM3GSWuPepZFCamyrR
J5jc/o1s7GwO1XdtuH7xsHswkHKkRld8x5zX6vKZ4rrZEITjY9g=
=DdOX
-----END PGP SIGNATURE-----

--Sig_/VBOkj9Letn/LYt6yCXbf_1i--

--===============1022711559==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1022711559==--
