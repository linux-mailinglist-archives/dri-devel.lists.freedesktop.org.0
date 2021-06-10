Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3E73A2783
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 10:56:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E646EC8D;
	Thu, 10 Jun 2021 08:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2396EC8D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 08:56:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so5899198wmq.5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 01:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W1G4CqCNStWEWhk/Vyz5SeOif1UfAMFjFQWFAuyKoyM=;
 b=J5H8i+u2GPu/Nn5n0u3gjxJ3Sb/GPN+KKh+tQbROYZlP2lcCSZT5ICezaRxnneRnbl
 8KlL4sPti4uH6aYSSAFiR/rWjw/TE7zYKZVTWtPm9AVljBmGgAbS3WrafnZbYljtw+9z
 QKv+GEHgONidqj8tdy9UOybEEb4ifEdCmMLHrlNbPWWptmUrIEH9QvJ/CWTzzZnp0WLZ
 kAtJPRyDjrJ7B6+CpUkbUY8UHsl5JYB78zy9oSkGKDnSkyS3NXbZdhAdkffVlbyhreIO
 1DJgT+wkvxjGxa8XYx/38RBOwWfqLaHywDvv188KvrAeuMsvduAbO813J3i3myU/JVOy
 6KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W1G4CqCNStWEWhk/Vyz5SeOif1UfAMFjFQWFAuyKoyM=;
 b=ihYgDy9e5U8fyLfahvhYTPFoRQnzx0umEo1fN95RrUy3lqEiMP0O95U5e3Rux6f7lv
 SEH4CHw8ppfVY6ppBy5cA0zQf9DeRhpoiwYOGeoRI7aAcF+n0To0V8raE1L/uQDIh9Kd
 2OoIFUWMhSyqooSnc4iKkLajw0ZfkCGlc5WjOWClvmEPKGX62CxptWmwNiHSlzaWtSUC
 RTIcksGx0Qlu/IvNtbEdnUrOpMxuy4A1yKTPcchghXnD+0lSiPayR3MTdezZNMYutcEu
 UpoT3NHlrctkp4hlRodbZ6Yc7TBO0O5jHnPJCs89GPlZe3RZP2+XraZ6ahE7MNw7ym2C
 QtCQ==
X-Gm-Message-State: AOAM532Om7EF5OK1NGQ2qSKf+KYYj4KIN3Rsh0e8Ps7oW+E912n8Co2G
 uDEMtTbmyNFRX9kW6E8v+Mo=
X-Google-Smtp-Source: ABdhPJxt/2uIC/FjJ5n2uovK1nqmF14UWRIj4LzsJXTSck2vnsZp/zvrPbQZ2hE8NdoaQKadHUz9wQ==
X-Received: by 2002:a05:600c:3514:: with SMTP id
 h20mr1601651wmq.70.1623315382650; 
 Thu, 10 Jun 2021 01:56:22 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id n42sm8470670wms.29.2021.06.10.01.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 01:56:21 -0700 (PDT)
Date: Thu, 10 Jun 2021 10:58:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2 01/10] drm/fourcc: Add macros to determine the
 modifier vendor
Message-ID: <YMHUHGS94zXLshU5@orome.fritz.box>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
 <20210326145139.467072-2-thierry.reding@gmail.com>
 <P6bikxumymMi9GOcPaj_n8vMt5caPR3rWO4Kga8Ud_FNIgytl3ljvnkU6nsyxIwN4VKNmfOfsC4KryzFTObEXjtFDiywRWDtO_ed71g9aj0=@emersion.fr>
 <YF4L3kq9UN6PWh/h@orome.fritz.box>
 <CAPj87rO_RsEPpuC9-DyVEJ=K6OLeknHhOnjvbQ2EEnPPPrq+dg@mail.gmail.com>
 <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="w3UoTUzJreA15LR5"
Content-Disposition: inline
In-Reply-To: <CAPj87rOB8p+WSgVDwRbbLgW-di5qpSTY5Q6cmQYwbwD2Y3wKVA@mail.gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
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
Cc: David Airlie <airlied@linux.ie>, James Jones <jajones@nvidia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-tegra@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w3UoTUzJreA15LR5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 09, 2021 at 05:28:50PM +0100, Daniel Stone wrote:
> Hi Thierry,
>=20
> On Tue, 27 Apr 2021 at 19:40, Daniel Stone <daniel@fooishbar.org> wrote:
> > On Fri, 26 Mar 2021 at 16:29, Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> >> On Fri, Mar 26, 2021 at 02:54:22PM +0000, Simon Ser wrote:
> >> > LGTM, thanks!
> >> >
> >> > Reviewed-by: Simon Ser <contact@emersion.fr>
> >> >
> >> > Let me know if you need me to push this to drm-misc-next.
> >>
> >> I do have commit access for drm-misc-next, but I was thinking that I
> >> could take this through the drm/tegra tree along with the subsequent
> >> patches because of the dependency.
> >>
> >> Anyone willing to provide an Acked-by for that?
> >
> > Yep, no harm if that makes your life easier, so for both the patch itse=
lf and merging through tegra:
> > Acked-by: Daniel Stone <daniels@collabora.com>
>=20
> Is this still in your queue somewhere?

I reverted to an open-coded version at the time because the -rc6 cut-off
was coming up quickly and I wasn't getting a response. But I do have a
set of follow-up patches in a branch somewhere that convert the existing
users to the new helpers.

Let me dig those out and send them out again.

Thierry

--w3UoTUzJreA15LR5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmDB1BkACgkQ3SOs138+
s6Gzzw//TFERJ2BwbZ1fNz8AG003O2xhche0U3nVDc0+ojkvZfsKHBhRvyuexPL+
UwkvBeXVBa/NK7LPKy2Q/HaXhTH4iAZ8pBB0zpfiYBvHvUE/7NQKrNIKgl3zwcjN
1SzRNPj1fTGW5JlOeCJubpRSIfesmYjbTpxzYpomB1XzcBtaeyNelNAvnGPQm2vK
9w76ht908w7B+UrpNaFqdsHwY1s2xG0uOTNrdbJp0YpvFGyQKOeghJ617M95xqVi
uLGi/t/c9rlaqxL6bStlQEBVi0Xi34IjkCD5PEri/VQKL3ALPqXZajx/m/LphLbD
ISGfT9gofVJcaV5UVQ68uFI7BnSYSa2Gwj/cdo25tIELCwiyGcjdf1LGoj2HrCE7
mD1wYjW03DtXZl+9XlpRXdJo5eXXFZx7DnLMEUi+2TxfSylxOW6lTW+hbsE47hHZ
5qeINgsRFP/Rb/DzeoSn4sh4JmpbSDH4XwrRWuEcvovhKUuFSCpVMvNx93ma51hd
a2WOpF5hw0aRadVc8+j0ahR4QmqPGGvUgGJp1MR44h6uiRgxQKA1sjwUBZXV3XST
J25+VEvBGBzgE/4Cp1G6mYy3VrfT2hLRCzqU8lpFreeuNkK8zhjmYyxaGz7U3V4e
varppfO3SGcgm0Os0DZdyzmSPFqnuxfhIZZw4qFt6qshZ51F15o=
=I4ct
-----END PGP SIGNATURE-----

--w3UoTUzJreA15LR5--
