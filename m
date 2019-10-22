Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9874DFFB9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6756E45D;
	Tue, 22 Oct 2019 08:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3AC46E45D
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:42:03 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o28so17014731wro.7
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=w7zx6YjrUFBDjmlRgA0qIw68+thnie5ZFOUiXEi4KEg=;
 b=FNEZxfg0EkbLi6MW3C9SIqqL9W8DvTWtM2JGX1FxnoxfVqxJhyh1bb54u+i0Y+plhL
 mK6MhZpBtNfB9Y4O80BKMqv6MTNTCizSZuLFieEs48/RhALrIAkttWvyrmz+IMrLo9fC
 Ux7fL9qOpRyh5OFbYgdY55sV02yUql3JfxoEON5PpF+xV9X4jmoZTawObrKJqbi1FsfH
 BEyQAFw0Jm+TzkFE15WvOs+B2upLLGITHZCrGO5Aebj7eQtGxYFPdWGbe2M2ekc+bhvg
 0nmMIvmwxmjcAZmXpEu5MJ+KZ9NLQsRksrMCy5s0AFWESrrCS3mFPjyO0XK8HP2lqoMV
 3l/w==
X-Gm-Message-State: APjAAAWzCEw4GNhkQEmUBLOy5oxbfIdt2gif3J1nrafK0h+gVneOvvl7
 y+fdyHfFuwMjJqdaO6556Fs=
X-Google-Smtp-Source: APXvYqzcXNrvIwbbzD94/2BLL+deniiP5vjAf4yriWNWreVpt5hFPKkRsiy1oUXhDCUADb2H6/8oBw==
X-Received: by 2002:adf:a157:: with SMTP id r23mr2275618wrr.51.1571733722135; 
 Tue, 22 Oct 2019 01:42:02 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 37sm28155431wrc.96.2019.10.22.01.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:41:59 -0700 (PDT)
Date: Tue, 22 Oct 2019 10:41:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: Re: [PATCH] drm/scdc: Fix typo in bit definition of SCDC_STATUS_FLAGS
Message-ID: <20191022084158.GA1531961@ulmo>
References: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191016123342.19119-1-patrik.r.jakobsson@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=w7zx6YjrUFBDjmlRgA0qIw68+thnie5ZFOUiXEi4KEg=;
 b=IOFsvrWemMIlBx/Id6R7C0FEOjokmQxy2tXXKg2kEaF20aFgrcRucmX08oKRKRGrSB
 sTwb4Z4kje5NuCqNN+LSfX9Tx49KGScFacxoxCg/WzzftVhac/cyFWLCOILy9C2iTMV0
 0WmG2iRDNltXYKRseoabJcOEvthJeWH1pgmCRjR82TW1rHFZ2ipHY3lje6rpeh7OMCfM
 WpQpSlRlaV5A9C1I9FL4eSNpA/uNKnlt3td/2BSVyw8hncaYRMHiT56wZCL2s195qm8Q
 fPkrXm3wQL7PDC/09QwkRlNoJ0EQp1XRVjRFIhOl5f6FXz35Mua/TrRk9J3gvm6bUhDt
 2UCg==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0640795866=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0640795866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yrj/dFKFPuw6o+aM"
Content-Disposition: inline


--yrj/dFKFPuw6o+aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2019 at 02:33:42PM +0200, Patrik Jakobsson wrote:
> Fix typo where bits got compared (x < y) instead of shifted (x << y).
>=20
> Signed-off-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
> ---
>  include/drm/drm_scdc_helper.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Oh my...

Reviewed-by: Thierry Reding <treding@nvidia.com>

--yrj/dFKFPuw6o+aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2uwNQACgkQ3SOs138+
s6HmzQ/+LeJ9cSBWTm8G78GN2R6/IefuOM9gGj8CdAAJJnyL4wEFKkYc86SeiVfk
yNhx4VgC4X6Mv9X/Nt/qDaZRw5gUWYgxw163JntkOMtu4KL8kFkISNURSIR5tlrT
MufD5f+MqSziPl/y4Qr4CIaJyGRc6bwv0tCxZHNQL0jou4j0W8mYtZrm3yksgjd0
1J77t1n1aqcyIqcHtgmnOTmEa2U6RsdM6po1xUAqmJP4DzufvXVkI4fBdDDnvUdu
biuW2fXl0DBd9Hy29qbqO2HJGRxrE4nXEEOGoe7DT4G3gyDji11MV5VvMErWt5Nn
z+PxAOIr45cihflEfZx5Olq6u/1Czyj5WzoPhqTT65HMMe+TTQs+TMh2CNSY009C
jWXfNqpV8IrozTriqf52lNQgP3BJn7wZOW44lBz5iONKLuUrnFd2O5kLqTmOYcuL
MRjUl7ImuH20li2PLZDZha7SLqbcmAfolj06Fnlti+27xydRJ3a56+VZ9Fjv9YaV
/ZfObVrj7MUTjC8agnyqg63OJZwx0cJs30b7VQk0pM2xjLJIwdJCnFu7zcenQtIh
2C4o7Gk3+VnPT+m1F6relGT5eUYHyHZoedu6S5p0mpkUh8YalFWvwN6cBygyZLQ7
1F2AZgpNmfdSC3Fn8tyB6R3AkWepbHvuF2pNJyrQSbzyfnp2SfQ=
=kd/G
-----END PGP SIGNATURE-----

--yrj/dFKFPuw6o+aM--

--===============0640795866==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0640795866==--
