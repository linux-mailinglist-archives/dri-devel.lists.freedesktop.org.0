Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F3CB4A0F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:07:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F346EB7C;
	Tue, 17 Sep 2019 09:07:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197B16EB7C;
 Tue, 17 Sep 2019 09:07:28 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y19so2281966wrd.3;
 Tue, 17 Sep 2019 02:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Myp8c7xdfUh2NRdRe4++S0OHZO+UeY8WkfM8nzajTxA=;
 b=a3hn/BivQ+Y1t7hUuDfGNaTNv4Vwgdp1f49d0q7POcF6MF2HwjKB/kyV8ImpVZCepA
 ozRgZZBD519kepjpjq0draP+xo0YW34H6ll9KDpsk71qrZ9BCfuSOt12KsGVH3hdAvJ/
 t4oErD4c0Gq9KfKJe7ZjbapwEfvu/qWaqdAeTv6uv3pENpahFYNHvP9n0qjyItwNYpaE
 Th5ZIACMSwviEh8hwGqPsZ/dBrdtj6Zb455lPn17y8xIJu/kS7o3Dosy+EoAy8dvVdZF
 txPOuehVsMBLhc4N7ab20ZLBMka1OpuOVZVAIkT0R3tcrGr8X0Nbh6JxvcndI9eeEJMQ
 IhwQ==
X-Gm-Message-State: APjAAAWRUeFZ6l85xHX8deIgUhOwUl3igy0kSjx/X41PuIIDxBYYbNIJ
 EPrViL5EJjDPHVQXmaXsFOk=
X-Google-Smtp-Source: APXvYqw994+uSxX/15wsRGkzvQt9WMz7rExqke1d0V7c5HE1BCA2cawhxhXBqey5yELZu9y8s1iyYA==
X-Received: by 2002:adf:f607:: with SMTP id t7mr1974671wrp.60.1568711246587;
 Tue, 17 Sep 2019 02:07:26 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id j1sm2292233wrg.24.2019.09.17.02.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 02:07:24 -0700 (PDT)
Date: Tue, 17 Sep 2019 11:07:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 0/2] drm/nouveau: Two more fixes
Message-ID: <20190917090723.GF17854@ulmo>
References: <20190916143606.9272-1-thierry.reding@gmail.com>
 <CACAvsv6jXCLm-3Y1yOAUpHk6pXFUN0_hSrUQeMrmqPc1hfpHAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACAvsv6jXCLm-3Y1yOAUpHk6pXFUN0_hSrUQeMrmqPc1hfpHAQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Myp8c7xdfUh2NRdRe4++S0OHZO+UeY8WkfM8nzajTxA=;
 b=iQjywJPVW9mzhnMzvznpAI90reEpU2MS4QafTd/rHmeTzUqSHYGnxKv5k5iBZfLMNd
 CHmtlV1vYxuu5G+C4ETtQy68DDZdyL6/5n9glFgkMGU22YiCQdAzxrjxhoWnNzZqZH0v
 clg1JM7U022lkrrVfuvy5XKGXVLURxiPTzJvGCznMGMZAQBeSnGqpFWGSjAdaEjTM9ir
 RTmoGyj6HbuiEIj+ClH7XD4GW/yTcEU3BkF6ve2x5kr5OlkU6cSDtPOvj7gOgh2fsnap
 Nn/YQd2dYO/TBMRdqguoypLix0WfE4c1dEmGtGHgFC5g1an0SSFGJh0By1ikoB2o6iUd
 Zjhg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1108655279=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1108655279==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/aVve/J9H4Wl5yVO"
Content-Disposition: inline


--/aVve/J9H4Wl5yVO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 04:07:54PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 00:36, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > Hi Ben,
> >
> > I messed up the ordering of patches in my tree a bit, so these two fixes
> > got separated from the others. I don't consider these particularily
> > urgent because the crash that the first one fixes only happens on gp10b
> > which we don't enable by default yet and the second patch fixes a crash
> > that only happens on module unload (or driver unbind, more accurately),
> > which isn't a terribly common thing to do.
> >
> > I'll be sending out fixes shortly to make the GP10B work more properly
> > on a wider range of Jetson TX2 devices and enable it by default.
> >
> > One thing to mention is that I'm not exactly sure if the first patch is
> > the right thing to do. I haven't seen any issues after that change, but
> > I'm also not exactly sure I understand what BAR2 is used for, so I don't
> > know if I would've even covered those code paths (other than the one
> > causing the crash at probe time) in my tests.
> BAR2 on dGPUs is used to map kernel-level GPU objects in VRAM so they
> can be accessed by the driver.  It's pretty much a smaller version of
> BAR1, but intended for a different purpose.
>=20
> On dGPUs, there's a couple of places (fault buffer address, and fault
> method buffer on volta) where the GPU wants PRI regs to be poked with
> an offset within BAR2 rather than an aperture+offset combination.  I'm
> not 100% sure what Tegra parts do here, but presumably if it's working
> for you, they're happy to just accept a system memory address instead.
>=20
> I guess this would be the right thing to do here in that situation.
> The more obvious (from a "reading the code" POV) thing to do would be
> to write Tegra-specific versions of the functions that use
> nvkm_memory_bar2() to perform this mapping, and use nvkm_memory_addr()
> instead but I'm not sure if we need/want to go to that effort.  It's
> conceivable it could be required at some point.

Yeah, that sounds slightly more correct. I'll look into it and see if I
can come up with something.

Thierry

>=20
> Ben.
>=20
> >
> > It'd be great to get Lyude's feedback on the second patch, since that
> > call to pci_disable_device() was rather oddly placed and I'm not sure if
> > that was essential for things to work or whether the slightly different
> > point in time where it's called after this patch is also okay. It looks
> > to me like it should work fine, but I don't currently have a way to test
> > this on desktop GPUs.
> >
> > Thierry
> >
> > Thierry Reding (2):
> >   drm/nouveau: tegra: Fix NULL pointer dereference
> >   drm/nouveau: tegra: Do not try to disable PCI device
> >
> >  drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
> >  .../drm/nouveau/nvkm/subdev/instmem/gk20a.c   | 30 +++++++++++++++++++
> >  2 files changed, 31 insertions(+), 2 deletions(-)
> >
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--/aVve/J9H4Wl5yVO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AoksACgkQ3SOs138+
s6Helw/+KI0FKZ1U90BhXdwqJ1GP1Fqq5tl1Z3nPoXwObI1A5ZXjZnTp+v3kL9Pt
i0wQXX83nfyzrHk5H0lHeJlq6rFmMdclUPDw6/HwM///C13Nnh5uIXPSUSBExTDv
B534yrqaNJiazOamS9TsKJo8ptDZzddax2wHjbqBdlp1Ck6NTbOkFGlHMtTerhhl
Lo4mEydA+w4RkX2bB2CEQaUD0g2HwUI+hkNXmi+5vZk2ZtbTx9leBWRR2kXqgP4I
PygMUE65qwth19oUuxsWgLtyVyV2hRUjsxYLw/dE90qyCREvtxIw2RcF9i2lRR/8
pxx3shMMPqHoJIC3A3nsIGELQJWkEFb0hrkQ81MlPwS9APJjKClSi2tP2HU6EFV0
IWmF6zHaA10tLalWaQlX7dIiXx6otL5rdf+vbQ7HUZdx3LMxnvLBqrJoIMoDWROa
8QNiiEb72Zem+LRvpCRB7cxmLW5j5ZvBdMryu+t8FuFEGIK1zDTIyhpFX5wfRdYK
nsT7kTVTcyR8WCLPcW3EV0eg6kchSiZCnLAAvblVV0Nm1UKNw0LNVlVe2IeaNBl8
PyETTORh9uKu22FI/hdcN787lUzH6l4CDQ7Xer0VHp4GHMDEVIqb05q+JDHk0Zo+
x3/KYLuLgeMGJ1aGgFezg1bl82y7QqGd64eRCf62Q1sZSlF8BuM=
=HuNe
-----END PGP SIGNATURE-----

--/aVve/J9H4Wl5yVO--

--===============1108655279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1108655279==--
