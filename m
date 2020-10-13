Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A2028C88F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 08:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACD16E88F;
	Tue, 13 Oct 2020 06:14:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2E06E88F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 06:14:22 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id z2so1955880lfr.1
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 23:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=38PwdFZPi+aQVZpBDJXIDznph4dQq55YvumGeIwrSGg=;
 b=DAVkybXo5VCE16kEuD6a6hYh7OAObDfohk+yVOrvbTPwZj/8IGVEGjNmrMeIf+RwlA
 9/SS7dHQ0sM42Ra8mjIL6pN8ZpSBGRb2KqW7iyW4If8n+aJPjniCZTpqCc5Pus/e3fUB
 ixDsWqO/G9pbn2lb2buV85ZTFtpkSwnTReOAbvBxKSEhcbPkImvszEMq2fzFSeVxKWwJ
 TcnR2LBwgYMTcBirtaqtdZppUN0Lj72EPLKD17VQp68YKO4n/TCnj7v4ZpHY3HXrbBrZ
 gQKjzAzUuaViyM5+VvpLsCzkZQlRC5tEab9Cl4duJL/HHPz5jXFH3qAuYstsZrRaDw2K
 HyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=38PwdFZPi+aQVZpBDJXIDznph4dQq55YvumGeIwrSGg=;
 b=aXE4nM2JI8GSF3l9+k07BtU54IL3XrM9cBHGOJTbeTSKS3nVU7m+x7aqLZCt3hQgO9
 XOqpdcnoM/KVDaTrBpPqh3DPH58If8YhJXzkyGtt8tr47C36alziCOzK+qdEHGpsr/nL
 MtIpvRHEh+pG5SbwGA6PwtDPsqyBo/OEAzG6O9X+hBf6aRfHlbuIgUW+L1k1OKAbSk8l
 3uaMs8GWcq2au94dGQ67gBzR7G/qLc9n9KUaCRH2XSif14pC962g+iyRLG8AcW4/OEUC
 BHPpK3ZdIKggTZZ83QImIZc73p1XLZbQaMtOSSBMnMajAIT1B+nu2hBjiM+3c0WWr2t4
 TZyA==
X-Gm-Message-State: AOAM531JDHkMMqKEB6jgo8kFcLjaKVPMJOWMPh7NoqjW007tT5KXMFY5
 PmsN/Lf0JibUAFYnS+b0OeM=
X-Google-Smtp-Source: ABdhPJz+LL5qQRSAoePNx8pIEUqpsy4mKXMl3zU+c1rrc8ETsuigMc7JA381A/oK37TsDXY8382axg==
X-Received: by 2002:a19:c70f:: with SMTP id x15mr8452818lff.296.1602569661036; 
 Mon, 12 Oct 2020 23:14:21 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id q18sm4109198ljm.23.2020.10.12.23.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 23:14:20 -0700 (PDT)
Date: Tue, 13 Oct 2020 09:14:10 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 3/3] drm/vkms: fbdev emulation support
Message-ID: <20201013091410.06c98a1c@eldfell>
In-Reply-To: <20201012142335.GY438822@phenom.ffwll.local>
References: <20201009232156.3916879-1-daniel.vetter@ffwll.ch>
 <20201009232156.3916879-3-daniel.vetter@ffwll.ch>
 <20201012132452.1241297a@linux-uq9g>
 <9ad2c6dd-9f3e-8b88-e013-dcb0e1fd8005@baylibre.com>
 <20201012142335.GY438822@phenom.ffwll.local>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============1795551547=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1795551547==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mj_kXiQRv3zg+GUUFcX/M6F"; protocol="application/pgp-signature"

--Sig_/mj_kXiQRv3zg+GUUFcX/M6F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 12 Oct 2020 16:23:35 +0200
Daniel Vetter <daniel@ffwll.ch> wrote:

> On Mon, Oct 12, 2020 at 02:40:58PM +0200, Neil Armstrong wrote:
> > Hi,
> >=20

...

> > It's weird because it the kernel is misconfigured and no console is spe=
cified on the cmdline
> > this console could become the main console...
> >=20
> > It's a great feature, but couldn't this be a module parameter ? =20
>=20
> If you have vkms enabled in a distro, you're doing it wrong.

That's really not a great position to take. I would prefer that
if a random contributor writes a Weston patch and runs 'meson test', it
will use VKMS to run Weston's DRM-backend tests on his machine
automatically, maybe save for some seat and device node access
permissions bits which distributions could be delivering as well.

Just put the VKMS device node into a non-default seat, and Xorg etc.
will happily ignore it.

For the fbdev device node, I don't know. Maybe a module parameter
really is a good choice there, defaulting to off. I have no interest in
testing anything against fbdev, but other people might disagree of
course.

Why? Gitlab CI is still not running tests for every commit, just per
MR, and it might even be infeasible too.

I am also hoping for a future where I don't have to build my own kernel
just to be able to run Weston DRM tests with VKMS. That means I want to
be able to run my machine with VKMS loaded and active at all times,
without affecting the normal desktop. I already have such a setup with
an extra AMD card, but you can't run most KMS tests against real
hardware drivers.


Thanks,
pq

--Sig_/mj_kXiQRv3zg+GUUFcX/M6F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl+FRbIACgkQI1/ltBGq
qqekwA//bQySh7EZd2TKI4FmSnLejTBtFhptfMRyQ0ulbHWOlp1XuKaU6OX1iNn+
tE1cKRMr7smvgECaRtHIUphPRa3/d40qu7PFSXxgXgDXdm+0x+10jpTSL0cvChM4
LEBBOmaJKREfAhi7pPsguTMfPPOoDe41GtluYk3Mje7TyjSb80AEV502uCn530GN
soGpnC0ggY4iHGElIO0HfBwVvMxV72SEWJNcXcgt5sjfy8nMrTR/6SaTwoM232uU
r6+CYAZzfmfEDCj2jmxWFOJjSfNmZjmMbfRNo06TnyhUQMaJw2kohk4y6WprXmv0
UdhWh3mQSKydHg2Oy7TxduPXAOxcIxTG0qgWZi3Fu8kkqMoxiMbXZY6sUvGLL3H/
699g6G7Hjwwm5lgwt1dc1oHyEquM/ykFPnsdQ+MGVa/3mBkYdoZQ2CBPQgapWBTM
dPOeZAfQ6ZyCNLfhDPSRKHxARFJ22eM4JQw3GCHLkiUgqngMCj28EoQBgThlA99q
hg9FEDpDOtSPCsxfEDptYxy6HYb+733zwd8avvKdC6T3Tntyf6KgzdTQKC4phfl/
FzDQ6EPup3SjpkqQBBU1CoDqzfRnwjcHF02HxxIfFBsmmdCy8W/QdyV5Xq6xekNo
g41kK4o+7IZQYKNnzTGpR9pMOp9kT3qbPPzi2tAPN5PVqLmVC0M=
=7JA2
-----END PGP SIGNATURE-----

--Sig_/mj_kXiQRv3zg+GUUFcX/M6F--

--===============1795551547==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1795551547==--
