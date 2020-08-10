Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 407142402EF
	for <lists+dri-devel@lfdr.de>; Mon, 10 Aug 2020 09:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3DB6E395;
	Mon, 10 Aug 2020 07:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C386E083
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 07:44:12 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id i10so8507141ljn.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Aug 2020 00:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=NovQ265dYhuSdvy0UDlMK2Yq8bdWvc8jjr+ylGlqUs0=;
 b=jJgKkmX5n9D0qfk0t7Xns7KUgpVgTerxQNKDeI9n/rIsdgT90OJ88dmypkM5osijPq
 i1VAmXFzs1xe+v1TvfA0ysQLrzxgiSkHuIGLpbLX3SvXzWwxoMojQTxX9+zMAG8zeGTj
 ohZw7vLtGZkWuVzld48tv7UdXvrsUFFJgTbyXyRQxLAzR9zQwBZhkF386WMMIJX3jCrN
 K1QWFM64owFNNAuUvbz5dLvWr7UZ3i9RXrDNNvkca3ggnn+Ycfu4zURJqO3q7Dv52WgB
 WtHyxWMWxtD6h6CeHkjDeQMd67NIGWEPTfTpFgTi0yS/yT8GVIOtKwirt1EvLWYUTACQ
 Xy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=NovQ265dYhuSdvy0UDlMK2Yq8bdWvc8jjr+ylGlqUs0=;
 b=EvvTvq2eJ3LTXZEPDwP/j6nbWuoZL9qEUhSwzposZp+EGJbueEqop06TgOfFlTKPSR
 GqLwTy1fUj6pIK2vhu7i8dBi318r77ulVBeCGbxkRBjdHquEDWl42pd0W8EMj8E4zUOl
 egfY43q+FiRUOE+gfkagYRFo/Va53BSOU3MEEXcppvZ7bMRU8VWnNS2rKT+ot5vNgRPg
 hdyQay6CQhCHQavXzvAzHMtdzEa81QEstfV6Ep/7HJQz1OY4NBvxLYIJqLFDlSQBqA4i
 tVOomaVztDpTHftCepIB2rKrfalqD+N4SK/Hxh/A6FpUN1xxLuKVuhtax83+8mNs22S4
 suKQ==
X-Gm-Message-State: AOAM532pCYtP379aeuFPi5Jy/xwvSRPaVIgICDNFkNEk9s+XYsEEk8rN
 CV8klVddwGVjOxXTukKoxwI=
X-Google-Smtp-Source: ABdhPJwjwGqZ8HNTl37zeyXnNJegVLEYIR7e3zNDRthvSKuehsHKJ8AloLnc8KeAuG2bzWuPQo6HMA==
X-Received: by 2002:a2e:88d4:: with SMTP id a20mr12088594ljk.326.1597045450344; 
 Mon, 10 Aug 2020 00:44:10 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id d6sm9102198ljg.25.2020.08.10.00.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 00:44:09 -0700 (PDT)
Date: Mon, 10 Aug 2020 10:43:58 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Merlijn Wajer <merlijn@wizzup.org>
Subject: Re: How to prevent input devices from unblanking the X screen when
 DPMS is on?
Message-ID: <20200810104358.1d28e355@eldfell>
In-Reply-To: <12302ae3-901f-7a13-975e-273fbda4e7b4@wizzup.org>
References: <12302ae3-901f-7a13-975e-273fbda4e7b4@wizzup.org>
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, xorg-devel@lists.x.org,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0801986912=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0801986912==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/YY.RExmeh7+QNZRgfm49+so"; protocol="application/pgp-signature"

--Sig_/YY.RExmeh7+QNZRgfm49+so
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 7 Aug 2020 16:07:35 +0200
Merlijn Wajer <merlijn@wizzup.org> wrote:

> Hi,
>=20
> Is it possible to have X handle input events, but not actually unblank
> the screen upon input events when dpms is enabled?

Hi,

by "blanking", do you mean that the CRTC turns off (as opposed to the
display turning off) so that it no longer produces a video stream
regardless of whether the display is actually receiving it or not?

> Our use case (in Maemo Leste, GNU/Linux+Debian smartphone OS) is
> reporting physical volume buttons to X clients when the device is
> locked. When the device is locked, the screen is blanked / turned off
> (via DPMS), but pressing a volume button causes the screen to unblank,
> leading to significant power drain.
>=20
> I am aware that one can tell X to close certain/all input devices, but
> then the volume buttons (and others: like 'next') would not be sent to X
> applications.
>=20
> I have not tested this, but I assume the same would apply for "headphone
> buttons": play, stop, pause, etc. Or if someone has a phone in their
> pocket: pressing a button by accident shouldn't cause the screen to
> unblank and cause significant battery drain. By design, the DPMS timeout
> is set to 0, and an external program will dim the screen brightness, and
> tell X when to blank and unblank.
>=20
> Turning off the screen with DPMS, and then disabling DPMS in an attempt
> to keep the screen blanked (and have input not affect it) also does not
> work - then the screen doesn't stay blanked - this is with the
> modesetting driver.

What does "disabling DPMS" mean?

> Due to the way DRM works, X is the master of the screen, so it is my
> understanding that there also cannot be another helper tool that blanks
> the display via DRM, because X is still the master, even when DPMS is
> disabled.

There can be only one DRM master having access to KMS functionality at a
time, yes. This is deliberately designed to prevent any "rogue"
applications from touching the display state without going through the
display server in charge.

DRM is the wrong layer to look at. DRM only does what a display server
tells it to, and has no connection to any input side at all. Your
problem has to be solved in co-operation with the display server.

> On older versions of Maemo, where DRM was not used (10+ years ago),
> external tools can just blank the fb and everything works as expected.
> Then DPMS is simply disabled, and external tools control the blanking
> behaviour, but it looks like with DRM, this is no longer possible.

Have you tried using X11 RandR protocol to turn the output off? I'm
not sure it fits your use case, but maybe worth a try.

The ultimate solution in my opinion though is to ditch X11 and go for a
Wayland architecture. There you provide the display server yourself
(with the help from any Wayland compositor libraries you may want)
which means you are fully in control of the behaviour. Obviously that
would be a huge change.


Thanks,
pq

--Sig_/YY.RExmeh7+QNZRgfm49+so
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl8w+r4ACgkQI1/ltBGq
qqdGFw/8CSclOhr2v7HcTxZt4SkpW+lrFOaOkJkyMvHlc/6Y1wrsS7FKFUWNTEMi
X7KGazWV427jCUKbY0Qf2I+tm7ox0gc0itcU8hPCPQMAWC5alNV0oUz5E2U62WpP
bOGUNc4DV3P5QnCoNS17N4KCF1WX4Rw1RexAw3coKAQwksleEMYl7FAgujvKOGB6
5DbcvAY/KQUhiU7E1oTXAMQ1eMFWfwOaG8xMwtHC8Q+CCL7Ns2YLImTrcXy8HSrv
mb/88dmcJXVQkKYOGga6shJckiaPgz727KrUFtOCTy+Pjnchh1Q7jihO5D1VSzpo
WN/pod9PgYqRWs7i43e5Y84a7i6WrnMvqcmmHySXZcDVeM4UlzJpoYR029dCrQ4B
qKn7JrwTSCbWi78otMcYtx43uY8JABY8pSZCUNCOW/MVb1N7MJA1leGD+gUkYIr9
pCRLl3r3Hi1xddezAdVdfPTGFf5A/XS6kjj4e3eR00TCVYfXSjXgTOem+dN2u8uJ
1bkkMdFMsVaMy8b6e/Hpzyjr2L+rlORo/rTGdtCPd8k3YtKoa/knKSqyYfJLoQYj
pSrt7GpV4Qhg8juq5ZFjGUnCGN9eL4BhCM92g90E81sKa37AWkiIXhh9kOmJ1CY6
ha5fongILgucbsgpbn1Y4lmw+Gx2Rv5IWYxP1kfOTx3t5tU7Mww=
=X5Jw
-----END PGP SIGNATURE-----

--Sig_/YY.RExmeh7+QNZRgfm49+so--

--===============0801986912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0801986912==--
