Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A15061006BC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 14:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D49F6E0D9;
	Mon, 18 Nov 2019 13:44:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D4689A9F;
 Mon, 18 Nov 2019 13:44:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l7so19534518wrp.6;
 Mon, 18 Nov 2019 05:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cBlN/1h/n1C4xNknMXrlM2nqMCgsNCA9mbBICWETfGM=;
 b=iS4VnBJCPwwEz5CAoN4AqW6S02hptipL+seyWXvP3Gg8qXT102txhjx6ozCM8ycfLK
 WZ5cjseKabB0gxZ0hbi25XEdS0gdJlA/K6LgMaAszaDVlRfdcaciTMGi7NLZBCcVkZZp
 sE+4OI4UW1P/ihatl6As/ERnZBE6oJlH+xGdCvu+U8SBmT9BhvnMWSqeqvF5Jm3detOP
 BOIj/y2Y2a6CqgoSQthyOR6773nvEeMEcgO/dVFG8s2jASGWhbFma5zZZOe3xs/lzH+d
 lHcS14GoKUbz8KqwXPsTwz6JXa6p5dvrsxc4WhiL7nWddmybCM8E0ZI/yswGfxmx1+hc
 TGwQ==
X-Gm-Message-State: APjAAAVe5cJ4drnTQXUpO5BhSxAM6kRE+TAZT0JLcauPZu/jns57zufY
 69Oz3bXj/dAO6aKRiTWkTZc=
X-Google-Smtp-Source: APXvYqwnquK2v+isw4M56+bea/AVu3mBorW0nFKpuC8zSvWHbMuT7jp415D/N7cw1/hnGLGOKvAp+w==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr29840482wrv.66.1574084692261; 
 Mon, 18 Nov 2019 05:44:52 -0800 (PST)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id x8sm22918316wrm.7.2019.11.18.05.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 05:44:50 -0800 (PST)
Date: Mon, 18 Nov 2019 14:44:49 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>, Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v2 0/9] drm/nouveau: Various fixes for GP10B
Message-ID: <20191118134449.GG2246533@ulmo>
References: <20191102175637.3065-1-thierry.reding@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191102175637.3065-1-thierry.reding@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cBlN/1h/n1C4xNknMXrlM2nqMCgsNCA9mbBICWETfGM=;
 b=EWAmkELza9qd3e3j0aP6pG2OW/RVmw+HtC00qQ1eegqSqJx16UiSrn6bLdKgdKiWI0
 3n5yapOKj/03zOZ1RzRysZIWRFqNikWLYJCvoIuKgEPuJmamx+3CC1eCOEeBoT2alRW+
 KdlN5+ntn9+EUPjAIumZgp7P1f5YcfixT2o/YseLrPHjUyjHWIwZimHJ2RNzGapWJHxM
 ifUHBQnoiM6b8NJol/wVzZXsJTgnJ6bAAA9im+QDecFxhv7pg57IjyRYnFhtieEvf8Ii
 EqM8/Y0bNU3xjECHHTozaRzkZgfz1uJ5bV9QQOOs/3k8FHgjozUoKi0F2IV8I1INc2rl
 ESzQ==
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
Cc: linux-tegra@vger.kernel.org, nouveau@lists.freedesktop.org,
 Ben Dooks <ben.dooks@codethink.co.uk>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0612161237=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0612161237==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FwyhczKCDPOVeYh6"
Content-Disposition: inline


--FwyhczKCDPOVeYh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 02, 2019 at 06:56:28PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi Ben,
>=20
> here's a revised subset of the patches I had sent out a couple of weeks
> ago. I've reworked the BAR2 accesses in the way that you had suggested,
> which at least for GP10B turned out to be fairly trivial to do. I have
> not looked in detail at this for GV11B yet, but a cursory look showed
> that BAR2 is accessed in more places, so the equivalent for GV11B might
> be a bit more involved.
>=20
> Other than that, not a lot has changed since then. I've added a couple
> of precursory patches to add IOMMU helper dummies for the case where
> IOMMU is disabled (as suggested by Ben Dooks).
>=20
> Joerg, it'd be great if you could give an Acked-by on those two patches
> so that Ben can pick them both up into the Nouveau tree. Alternatively I
> can put them both into a stable branch and send a pull request to both
> of you. Or yet another alternative would be for Joerg to apply them now
> and Ben to wait for v5.5-rc1 until he picks up the rest. All of those
> work for me.

Hi Joerg, Ben,

do you guys have any further comments on this series? I've got an
updated patch to silence the warning that the kbuild robot flagged, so
if there are no other comments I can send a final v3 of the series.

Thierry

--FwyhczKCDPOVeYh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3SoFEACgkQ3SOs138+
s6H1sw//TEml9ZrPUemKFYIMfOWf6dFC1MUTYzGiajNIxv4J/7FqdNnBqUm6RT1o
uROgL3iqP7fAoEHg5hVhwzRzxAH/bC75nfn9PD+yiPpVOwhqfY3OTwYXyEj3wBld
G+2TQb5RTHd1HAv14IKsw33fyTMM/P22GGkcRfOuzhu3Q6U1hJCBc7zG3VQWSSN6
u8bWNlYl0VZ8KcDlQJpYgT6QYOFYmagQGNkCRgeAgDUUKRE7rQ8vVZ6BOjtYv+SY
5nTKNujyFp1Yoagp3pv23OcyIVWPg6BKd48rb/uq+QqcsDwTXwqTUOlAfhZhyIwn
CVBDmqpuQL5BJPopvAzVFP/UKZZ0ChE7kuhAPFIOkCO6RVKpKE+1Zvqgb3QXUU4q
5U7U8hrmwPBRSEhAmTYApzDAx7rqSKIWTm5k82Nm1WfzgyqNb+NubwOwkyRr0u7Y
RobfXOEjbUCV5F6IejMN/pnufJs6CDPRTlz09roZ32kn5u+ibJyV0Nsa9L1sIwFm
yJESD3B8y1BA2NCllBwu6semP74zJ5h90Kp4/xvLX/poS+VcY3Owfs7GeO8bDijl
IwV+qD3RYSlGJmxq2ILPa/fuxxMbIsXLudNeZAtC1zmO28x6aUwYvpyDdgvEEu+P
G9k1PiUNR9g/gbTv78dAmw62CrEQoss84ESlY5A+pbjAgQh0bLg=
=74Sg
-----END PGP SIGNATURE-----

--FwyhczKCDPOVeYh6--

--===============0612161237==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0612161237==--
