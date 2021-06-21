Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F237A3AE7C8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 12:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3529089E35;
	Mon, 21 Jun 2021 10:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8508389E35
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:59:34 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c7so17370456edn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mQxqixLK5rjqMvfwNndLJU9kpq2UUMss0IdRDqE4Nyc=;
 b=YxZQAdUUkLMQ2M2mYkUfSjDJ+SB9P+64CPFg3uK5hM1E/C6K8NmCvjI6fxDHBrBoe5
 Lq7cJ78pC6eJoQL/iMslWnzhkAluJRJRKlpXrcHJnAUBY4LLp/MkPZU7sYhkLRFqBEPl
 0uRZq36q9MKx0pTNYdZeSNZVZbFJ3t7QfDM1AYpc6XcFG9PqXhyyIxdCa5GYj1KE51gX
 CERelqx0rdtwMVSq94UjUjpVTG8H0AvhhKV8qm464N8P+VLib7JBniwt5Gxc5ZaGVkw8
 lQDzEpiPMwHEZaSZ1PmHvgWOeshz1XWPFZ9zBPPsG67Jh3+Her1tkKd/DUdiLjAtUvJM
 joSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mQxqixLK5rjqMvfwNndLJU9kpq2UUMss0IdRDqE4Nyc=;
 b=W8arFMMzShHVj6If6tvWk0MjSK3gYN+Ub8fFv+gjFs9efIKXbmTVeCn0w/ppDI82RD
 ay6VfFlvXmF+NAbTwEZCB5cLboSuDwR41FNZVrTMd7UnPUHojJUG5BxZOX1C/FF4umZW
 6BMBdu+p92RAY1E8RtpPtLJCB9s+g7aDuvicEeZETaZS6nItalJAHFCNiONZZde6DcTR
 w/i2LjZCPnFkorOrVcxAgr1iFliPRxrEova8hCXVyV6vudB7bzhFBPD2PHLDVhB7kpa+
 ZRNODGRZ84BLRVWHGTPeqjnB1ZuqlJcyJr6UBGUYD3cwbVd6jf4PNDQkSDBiNa2EdWGU
 Pr7Q==
X-Gm-Message-State: AOAM532hCqAnpREgvSIp0MJ2qER7NBezDY5v+trlONSFXenRgj05JKOV
 ycdOPs3REVkfEQ969pnEQ5U=
X-Google-Smtp-Source: ABdhPJygm2GSM+8x1mA8AMigPK6YI6mwpzcBwg47WwZ0gmXyzshqwUTK6KliNuLXNpTFL6h27g8Z5Q==
X-Received: by 2002:a50:fd1a:: with SMTP id i26mr6912086eds.181.1624273173262; 
 Mon, 21 Jun 2021 03:59:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id c15sm7817001edu.19.2021.06.21.03.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 03:59:32 -0700 (PDT)
Date: Mon, 21 Jun 2021 13:01:28 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v18 0/2] Add memory bandwidth management to NVIDIA Tegra
 DRM driver
Message-ID: <YNBxiFXMS9rfT93c@orome.fritz.box>
References: <20210601042108.1942-1-digetx@gmail.com>
 <8accfe1e-fc48-21ca-f7c6-bd2d60162e6d@gmail.com>
 <50912a57-aa43-58b0-02d2-6928578d6286@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="hHIGeTg/3zFQR6Mt"
Content-Disposition: inline
In-Reply-To: <50912a57-aa43-58b0-02d2-6928578d6286@gmail.com>
User-Agent: Mutt/2.0.7 (481f3800) (2021-05-04)
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
Cc: linux-pm@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matt Merhar <mattmerhar@protonmail.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hHIGeTg/3zFQR6Mt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 07:19:15AM +0300, Dmitry Osipenko wrote:
> 07.06.2021 01:40, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > 01.06.2021 07:21, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> This series adds memory bandwidth management to the NVIDIA Tegra DRM d=
river,
> >> which is done using interconnect framework. It fixes display corruptio=
n that
> >> happens due to insufficient memory bandwidth.
> >>
> >> Changelog:
> >>
> >> v18: - Moved total peak bandwidth from CRTC state to plane state and r=
emoved
> >>        dummy plane bandwidth state initialization from T186+ plane hub=
=2E This
> >>        was suggested by Thierry Reding to v17.
> >>
> >>      - I haven't done anything about the cursor's plane bandwidth which
> >>        doesn't contribute to overlapping bandwidths for a small sized
> >>        window because it works okay as-is.
> >=20
> > Thierry, will you take these patches for 5.14?
> >=20
>=20
> The display controller does _NOT_WORK_ properly without bandwidth
> management.

That's surprising. So either it has never worked before (which I think
I'd know) or something has caused this regression recently. In the
latter case we need to identify what that was and revert (or fix) it.

> Can we get this patch into 5.14? What is the problem?

There was not enough time to review and test this, so I didn't feel
comfortable picking it up so close to the -rc6 cut-off. I plan to pick
this up early in the v5.14 release cycle and target v5.15.

Thierry

--hHIGeTg/3zFQR6Mt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDQcYQACgkQ3SOs138+
s6HM5Q//eNrrfdv1Eha+kmKoOay07IzXHohR56bITStHor3M0uzvNVZaSCcADjl4
FpHEAIfe2FuS41Y81iUZqV3PmRNXloneCz4vzgFVkmz8poeq5aPwiQlsSPEzRawt
UJbyYSGTUhtM8GvqxW6TL47M8wYCYND7bTp+GIh45nGPSuZlGIhT4Qp9zqfxARn7
AmuA/lUkHxT5krTo1Sx9PfTENLPxMikM4MdahTnro0S1WAOqWaudqnWidV81jA2j
pAektGCfs5uanFq8nOjpO4/AkHmYfq1FSOS0ZpYn2eyhDDK9BDPLuW4L3ithBl1o
r+vqwedj/xAPeOWxha6JwEvMwhRReZHN0/uZTlWDnqvAVgVFrptefGKo7V355Brw
NRgJrJFCdoCW8m2FntrRCoxTqDy0v9h+607vD3myk9pyD94IZ7SeKEwyh31vKls3
OwIGQEVPgyDXoSolj/rG7xwF2vDN+OaW+hidqmuM3p5xpjOqwToJ996s0F0XuUc1
x0uKQ5+jnuRH132Nn2K73OBFzBS6Le/h1N/DLtxOhq1L3VcZczRx9MYDR5aT6p5r
Pug+Byyy3Qx0TRDUq6P+bJGTHu3di+ty0Rvrd/LdbTCXHNNctN/N95ZUseeUsG1E
RnN2FwphYn08qZ5QKGWesnLj4+RJHVjH+c8PpXjyaj2FNXyvsZU=
=NJyS
-----END PGP SIGNATURE-----

--hHIGeTg/3zFQR6Mt--
