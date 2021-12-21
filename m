Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F0447C5A9
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFB81120FF;
	Tue, 21 Dec 2021 18:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34A810E710
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:02:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e5so28539261wrc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=bVlnofN+ktrt8Y6/bCYRLFzFPt0kEacJybGkkvbNXBI=;
 b=nuq30v3M+1Hu5AxARuulmNIlx/5zEV0AqXlj6gdDz1+L9TccZHkoVp9Ba0SIiyMWI3
 GmLgjc3/lrZYsetCIeSfUkhrOrUFUfBlmskwM5QC4seDWZA1fEqj67Ikv0eW9s7Y7ULB
 MBYUcyXbh2CTLW4Yeu8RXHCSk+Htxe4A7VoMKdnYV/hhb8WhvgiUg6512GOBJLrOldmG
 OBRPqWvf+lwXI7a/xQw2D4pUSyA1n/V61xV7gQL87kZFnwrB7oduy0gA6DXim8zS+hX6
 Nzpp1xo2PtRt1Dkq5wqDk0GUuSiPb8cfyRXfi2u+VtfLI5QskmXINpLl0zjDeC3GWA/3
 glmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=bVlnofN+ktrt8Y6/bCYRLFzFPt0kEacJybGkkvbNXBI=;
 b=iRuMkdafPmnCTGvr6d6IIZGC5n7OWK9d01gCbaMwpVtxVZBFZTMjny0GqLyfFmLUvq
 EWpLyuCeAMMYmkZQs/RVU4YRhBjEyw7stSBZWSMf2hRK+FX9O6Pd1kiK2lnUdgunxtVL
 PcMLC5A+WY878M+52CYeOwQSCcsQcpJvSVEWhz5iTKjEbPLPdYV1KrRwZkv1d8rPjzOC
 CwiPFm0q264dRy9IEFV5v4V0IvVxGewiYw4v8cAhG8KmWuH+AjpsgJWmwDsCexD3DLti
 ga4kq1ESSBNv8oAieejpUz3JSZX54qwkfAPRcoanvOtLs+DXEq2b86XL3rRIM5VAtm3N
 nBeQ==
X-Gm-Message-State: AOAM532pczPA0OuOgp4vvuMWGMAQk90fY5W9yPL+MGDl0dMLNQXMNGoI
 r9KCRJJqzlc2dJ+z2NBMrWc=
X-Google-Smtp-Source: ABdhPJybX/rMHGXH7xPwlC+GhJNYmX0GbjgO4bYsrwuibgtExeLPGd6Gwu0K9HIUV6zDwJPjJf8wkw==
X-Received: by 2002:a5d:51c4:: with SMTP id n4mr3709242wrv.284.1640109720362; 
 Tue, 21 Dec 2021 10:02:00 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id p11sm8288592wru.99.2021.12.21.10.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 10:01:59 -0800 (PST)
Date: Tue, 21 Dec 2021 19:01:56 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Message-ID: <YcIWlOoER16wUyQ/@orome>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
 <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
 <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
 <YcH+Fw9sCzCIzFIx@orome>
 <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fc/qAt5g5kU6Y6vn"
Content-Disposition: inline
In-Reply-To: <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com>
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


--fc/qAt5g5kU6Y6vn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 07:45:31PM +0300, Dmitry Osipenko wrote:
> 21.12.2021 19:17, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
> >> 21.12.2021 13:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> ..
> >>>>>> The panel->ddc isn't used by the new panel-edp driver unless panel=
 is
> >>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() s=
hould
> >>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't=
 fully
> >>>>>> instantiated, AFAICS.
> >>>>>
> >>>>> I've tested this and it works fine on Venice 2. Since that was the
> >>>>> reference design for Nyan, I suspect that Nyan's will also work.
> >>>>>
> >>>>> It'd be great if Thomas or anyone else with access to a Nyan could
> >>>>> test this to verify that.
> >>>>
> >>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
> >>>> 2023, hence we need to either use:
> >>>
> >>> All the (at least relevant) functionality that is in panel-edp was in
> >>> panel-simple before it was moved to panel-edp. I've backported this s=
et
> >>> of patches to v5.15 and it works just fine there.
> >>
> >> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
> >> Nyan to keep the older DTBs working?
> >=20
> > I don't see why we would want to do that. It's quite clear that the DTB
> > is buggy in this case and we have a more accurate way to describe what's
> > really there in hardware. In addition that more accurate representation
> > also gets rid of a bug. Obviously because the bug is caused by the
> > previous representation that was not accurate.
> >=20
> > Given that we can easily replace the DTBs on these devices there's no
> > reason to make this any more complicated than it has to be.
>=20
> Don't you care about normal people at all? Do you assume that everyone
> must to be a kernel developer to be able to use Tegra devices? :/

If you know how to install a custom kernel you also know how to replace
the DTB on these devices.

For everyone else, once these patches are merged upstream and
distributions start shipping the new version, they will get this
automatically by updating their kernel package since most distributions
actually ship the DTB files as part of that.

> It's not a problem for you to figure out why display is broken, for
> other people it's a problem. Usually nobody will update DTB without a
> well known reason, instead device will be dusted on a shelf. In the end
> you won't have any users at all.

Most "normal" people aren't even going to notice that their DTB is going
to be updated. They would actually have to do extra work *not* to update
it.

Thierry

--fc/qAt5g5kU6Y6vn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHCFpIACgkQ3SOs138+
s6GgZA//ffqqBvpvEsIUY4gSyuqDgw5+kWQPt52At4gfiIAkSriiqzGiF2AEcx+F
XxUzk7uwAlvUcVfgfUrxFjDNwwsqqYbVT9o0MdM9L43k3KzKJ1nst1NG1+vIf53y
2ULOntqqU1TEu82QNS7NNo8UnSKYxS1NPhfSiBrNW3x6OVD/Pxe+gJxMKHXoOKAt
bjiPHkp4IvWypxo8y5hosoKoLcwiop+y2TUrVV+or482r2upSGyWCYA95fb9pVSZ
R2lTis+4SjhF3sUuvdLJXmZ83HPFysJERAjv4/LUor1K2FYX5wYiQ6QKd8JzRCKe
OqKJ3dz8nZgTNN6qjz+61Y+wJpwebypkX34m2/+/fffcRAXrCxAYTBAWGfU+1Kh0
K6xaHmNYNYQ/q8NK+FVzoqlLyk47Mwp5W0rq44ulQLGwDsqzhrtdpRGlndrHM3bm
yQ3VmTQSUV0CAslWYSVeGyQ4gu2pHEIl7bsQh+I3VJrgG6PcbvVWR2d8uFIzK1mR
YE5oVuvF/bFQr7sZMdNKKK+VIjAfzlraw2MnWf+4queO38g1JWwhMFh/l2Hr3VUa
YwL2LRfdN5XeJrkrolUyQ9jOKyBZSHl+3CVmhOVuYlDUl8v83MrF09UGgYzVOPsN
JQWx2SjRGzWLU2H7O5WoPio+VrBfd3mEzh60e5XXImaW4EiZrVU=
=Rlx8
-----END PGP SIGNATURE-----

--fc/qAt5g5kU6Y6vn--
