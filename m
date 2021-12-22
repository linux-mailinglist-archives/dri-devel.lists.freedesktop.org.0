Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4630447D155
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 12:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B3D10EA35;
	Wed, 22 Dec 2021 11:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE7110EA35
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 11:53:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g191-20020a1c9dc8000000b0032fbf912885so1322072wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vLFn0Jl1fD/MmtJEIdbCwJtQJ6RE0SG32P1necJwoJk=;
 b=ETkmr6ymtrA9Cj7nHU0jilQtFFvpvueJ500EpnjaAGZeeNazwE1hxsqg9JNINlNC+8
 kgEVVzfbENNCA3byA8yCnRglukAt1uzggVdXpozkFsgS1ZK7NeX0BfIr9SIM0sdoX0h0
 pC2ZXMS+c5NlqME474zF+cc7efSuAAzr+Vat20sZgbnDr4IJJoONX2OfyCQNVkSJj8EE
 Dbnwdxv9thuczNbYLXjBBux50iw9ST1uzkhN66HGeif+VTs299xLQqc+MA6YWZWm6+s6
 mGpui5CWcKIT3N34R/o3qdQ+DeOVZUWXD5C0UvoWQ2dQf3wOqjerT563cdo+DQEeSXmY
 na7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vLFn0Jl1fD/MmtJEIdbCwJtQJ6RE0SG32P1necJwoJk=;
 b=LDM+jJJNHK+lZf3EyuEdKJ5Vyc0LXK7We6/3YGa76uQESrASta6IJlRW/HH8Loik9Y
 Mu/m8tLd7DQItxmJ8LorBH/WJEg83Z/qjn9vRNT0MUUaZouLDG2KyB2KbSY39R60gGCF
 D+8r5hpStdY9njYtDJ3cvh1EOdFx67jYAlF+ndw4Prt48Hq3ye3Sw+yuRRMcO9SeCL+K
 CmKCjrg8c9Y4heY8XbuXKctCpweKNLmz32Zgg1y7iUnt09mOntYn35kIZc71CeE3nSt6
 rG5xp1NaJwYcHJAfswRickt5+J6L3rLaFKMr7rehBTmEb13VOSX5BMSPnQ9MU4SUY/0N
 1w7Q==
X-Gm-Message-State: AOAM530Alm/crvL1ridyk49XZRPrkmWftpDWGKUeeNB+Nc7dQpKBy75V
 BmzzOBNPpHxCQKu/T0gMAaTB/T8JdzUSDg==
X-Google-Smtp-Source: ABdhPJwXHyKpD8mXbODuOI9SiFl83YgiQnchoSGjzoEIqXVcjYNuFMK6FwJ+mHuy7tlSmmTZnFVOgg==
X-Received: by 2002:a7b:cb98:: with SMTP id m24mr715651wmi.188.1640174013177; 
 Wed, 22 Dec 2021 03:53:33 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id u10sm1748523wrs.28.2021.12.22.03.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 03:53:32 -0800 (PST)
Date: Wed, 22 Dec 2021 12:53:28 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Message-ID: <YcMRuE0oVinpJPMq@orome>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
 <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
 <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
 <YcH+Fw9sCzCIzFIx@orome>
 <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com>
 <YcIWlOoER16wUyQ/@orome>
 <f8c50f22-ddeb-1805-bfcd-410aa46f869a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ZZJhJ297FDoG6euy"
Content-Disposition: inline
In-Reply-To: <f8c50f22-ddeb-1805-bfcd-410aa46f869a@gmail.com>
User-Agent: Mutt/2.1.4 (93ef06ae) (2021-12-11)
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
Cc: Thomas Graichen <thomas.graichen@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ZZJhJ297FDoG6euy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 22, 2021 at 06:01:26AM +0300, Dmitry Osipenko wrote:
> 21.12.2021 21:01, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Dec 21, 2021 at 07:45:31PM +0300, Dmitry Osipenko wrote:
> >> 21.12.2021 19:17, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
> >>>> 21.12.2021 13:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>>> ..
> >>>>>>>> The panel->ddc isn't used by the new panel-edp driver unless pan=
el is
> >>>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe()=
 should
> >>>>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn=
't fully
> >>>>>>>> instantiated, AFAICS.
> >>>>>>>
> >>>>>>> I've tested this and it works fine on Venice 2. Since that was the
> >>>>>>> reference design for Nyan, I suspect that Nyan's will also work.
> >>>>>>>
> >>>>>>> It'd be great if Thomas or anyone else with access to a Nyan could
> >>>>>>> test this to verify that.
> >>>>>>
> >>>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
> >>>>>> 2023, hence we need to either use:
> >>>>>
> >>>>> All the (at least relevant) functionality that is in panel-edp was =
in
> >>>>> panel-simple before it was moved to panel-edp. I've backported this=
 set
> >>>>> of patches to v5.15 and it works just fine there.
> >>>>
> >>>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
> >>>> Nyan to keep the older DTBs working?
> >>>
> >>> I don't see why we would want to do that. It's quite clear that the D=
TB
> >>> is buggy in this case and we have a more accurate way to describe wha=
t's
> >>> really there in hardware. In addition that more accurate representati=
on
> >>> also gets rid of a bug. Obviously because the bug is caused by the
> >>> previous representation that was not accurate.
> >>>
> >>> Given that we can easily replace the DTBs on these devices there's no
> >>> reason to make this any more complicated than it has to be.
> >>
> >> Don't you care about normal people at all? Do you assume that everyone
> >> must to be a kernel developer to be able to use Tegra devices? :/
> >=20
> > If you know how to install a custom kernel you also know how to replace
> > the DTB on these devices.
> >=20
> > For everyone else, once these patches are merged upstream and
> > distributions start shipping the new version, they will get this
> > automatically by updating their kernel package since most distributions
> > actually ship the DTB files as part of that.
> >=20
> >> It's not a problem for you to figure out why display is broken, for
> >> other people it's a problem. Usually nobody will update DTB without a
> >> well known reason, instead device will be dusted on a shelf. In the end
> >> you won't have any users at all.
> >=20
> > Most "normal" people aren't even going to notice that their DTB is going
> > to be updated. They would actually have to do extra work *not* to update
> > it.
>=20
> My past experience tells that your assumption is incorrect. There are
> quite a lot of people who will update kernel, but not DTB.

People that do this will have to do it manually because most
distributions I know of will actually ship the DTBs. If they know how to
update the kernel separately, I'm sure they will manage to update the
DTB as well. It's really not more complicated that updating the kernel
image.

> ARM devices have endless variations of bootloaders and individual quirks
> required for a successful installation of a kernel. Kernel update by
> distro usually isn't a thing on ARM.

I'm not sure what distribution you have been using, but the ones that
I'm familiar with all install the DTBs along with the kernel. Most Tegra
devices (newer ones at least) do also support booting with U-Boot which
supports standard ways to boot a system (which were co-developed with
distributions precisely so that it would become easier for users to keep
their systems up-to-date), so there's really nothing magical anyone
should need to do in order to get an updated DTB along with the updated
kernel.

It's a simple fact that sometimes a DTB contains a bug and we have to
fix it.

In general we try to fix things up in the driver code when reasonable so
that people don't have to update the DTB. This is for the (mostly hypo-
thetical) case where updating the DTB is not possible or very
complicated.

However, that's not the case on the Venice 2 or Nyan boards. And looking
at the alternative in this case, I don't think it's reasonable compared
to just fixing the problem at the root, which is in the DTB.

Thierry

--ZZJhJ297FDoG6euy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHDEbUACgkQ3SOs138+
s6HVgw//Sxd4r3/cemPXVd8aYQcS0QrD/ryFwmOPLyovsWIhif2tplgW8g8/x/dA
70EnK8rLAv/bGzfmcMUtWCOIyZJhhahLVuy7D3kXbpathcpgg+JUPTtww1ynl0Ea
XJgU98Vyxe+LZIYBcOF3kjYLiaC1HNRBDB1kgPym3H1jNTG1mZOT+s1GzOiC0KzC
HIC5nVkJVNoL3970YlXkGRVNF9Zimu4pW1ilFPqleh6UGqUFMkUPYbhWQ7az5lJK
5HHSuGIVAx075hynddHJzu07oVuOgIGdvO/Pa1HUGU6Pni75bdyoAaCN9sD3Udm6
aHQQjMApBUWAGCiklmMhEk0kG1mJrv0MP0MxRxaHjU7O6amZc+W2pBO3QVvbeEpn
mSY5JkmvzLk1sg05nnhjqeIGnV4N9vuP+G5iL7GnX12MS6ofr+i28n0GFQzQG3kV
slrg9Lh/ZfUELrmHLk8FQnlKGL3Hikxj+QhXEMwokv35RyrQNjMxtHyYtV332q74
zdFaxo18L/YbkTh9XpssyTAjfraAdAVniNN606EknbCsXCE1VoNj+f0EMUWKTEp5
G5xzl5WOXEXaOAeL1vNU6kYRG8rN5MyzASHiSAaOOgszrmOwc1MMGxtHFKBXWTh/
10pCA1ccJ77eE/ate+wfdy8j+lX9pjpJ2Oydwkm0DYpmJIQU4r4=
=UiFP
-----END PGP SIGNATURE-----

--ZZJhJ297FDoG6euy--
