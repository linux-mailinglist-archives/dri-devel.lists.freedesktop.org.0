Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFFE47C39C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 17:17:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D3C112332;
	Tue, 21 Dec 2021 16:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF9B1122E7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 16:17:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t18so27899141wrg.11
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 08:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7IewRmp53obWZA8iAP6xaJB2w/BWeImTIAsfcfYpv8g=;
 b=AEASgYXdrbl5I7eAGu/C4OY3yC4JrWwtu07kmByhbnH9sa8Y8zcJNh99kFTJglj8iq
 MswqN6waZg95LQ+i4phaMjH/5KLqhaz53Y4e5mCpJCqWxRsE7zFarSGIOQVuap9A3r47
 NAPTb03t1Az95yRFYmPyjgdCgoVHDeZo8iJGDxW5l0Dzz7VXtUBfBNdiztHJzD5PQ6Jf
 NfD6ct1ztK1J154aeWcu0yGqfVDZq6zGShmedGYG6t7iBfxvAK46WxylmtBf9hhdC+6L
 9sF5wQR0OMA15csonRkwBspr8/RalDXq++QFAtIeOt2W/k/Bm1rpc6o3d/35UcGVZRu0
 1vyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7IewRmp53obWZA8iAP6xaJB2w/BWeImTIAsfcfYpv8g=;
 b=6Sbgbbcyq+s/LG4JydZ9Jg8KrpdCDvMm45Yq+SGJpQcu8GnlVPh7dNgCjnRgOyGtmv
 qwUSB4rQOoPFh3rocLOZHwBwiKwI/3svlhTTve2jYzPcQPjGhwJC2y82wT5TWYXLF1Vh
 80FFXzUxW5uijHJes3OnJH9sMV8BlhI/ZEnP63fT8R/UIzBCsBElblCH498pEcD8wG/r
 3rpQgqXNTt2OJ4RBOZ660oxAcPiVkeV8Dd7ii8/c/k1FEJsmfzg8MC1p2IceDIqfmv6h
 8+ceXILquyDURIMInijYI2QqNX3525ZBCorLYHf+8Kweng59K4oYqMOyN+NkZlE8FA+p
 1q1A==
X-Gm-Message-State: AOAM531YyIM64MPsdtkQsMOsldF0PSxk1VWMJv8GF83mW1Jzl6ZH9e6v
 64Gxcc3wuZIKSMbSwV8kp90=
X-Google-Smtp-Source: ABdhPJxngmVd4FHdBfUzeGW1NnGbzDP69JK+k042IQfNoYnfCVLJGVApuoeQu0W8UWfxddLI04p8RQ==
X-Received: by 2002:adf:eb52:: with SMTP id u18mr3155117wrn.90.1640103450872; 
 Tue, 21 Dec 2021 08:17:30 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id g12sm1982532wrd.71.2021.12.21.08.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 08:17:29 -0800 (PST)
Date: Tue, 21 Dec 2021 17:17:27 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
Message-ID: <YcH+Fw9sCzCIzFIx@orome>
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com>
 <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com>
 <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zNj/pFIeYgZazjXy"
Content-Disposition: inline
In-Reply-To: <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
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


--zNj/pFIeYgZazjXy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
> 21.12.2021 13:58, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ..
> >>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
> >>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() sho=
uld
> >>>> either fail or crash for a such "edp-panel" since panel->ddc isn't f=
ully
> >>>> instantiated, AFAICS.
> >>>
> >>> I've tested this and it works fine on Venice 2. Since that was the
> >>> reference design for Nyan, I suspect that Nyan's will also work.
> >>>
> >>> It'd be great if Thomas or anyone else with access to a Nyan could
> >>> test this to verify that.
> >>
> >> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
> >> 2023, hence we need to either use:
> >=20
> > All the (at least relevant) functionality that is in panel-edp was in
> > panel-simple before it was moved to panel-edp. I've backported this set
> > of patches to v5.15 and it works just fine there.
>=20
> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
> Nyan to keep the older DTBs working?

I don't see why we would want to do that. It's quite clear that the DTB
is buggy in this case and we have a more accurate way to describe what's
really there in hardware. In addition that more accurate representation
also gets rid of a bug. Obviously because the bug is caused by the
previous representation that was not accurate.

Given that we can easily replace the DTBs on these devices there's no
reason to make this any more complicated than it has to be.

Thierry

--zNj/pFIeYgZazjXy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmHB/hQACgkQ3SOs138+
s6E8gxAAp5vXAjYM/y42lfK/x7apM+FhGL+7LJFqEx3w5fSUwEsfMgiD8t7KhxVf
s1+a7ap/eV2nl32K/hl0K+n8DmFiujH6P5/ugRDyCGG1dX8Z49QG4QlIhgIXqYRo
V2gbCSOmGggSpiBu8wcd1ZI8U1S/JOU6np0T8bnnwuGdkoZv3h8POPQbQ5CfTp3b
kTPmPMsiFobUSzdRZgOoBicKfbP18E7SzdDb4NEdPoP9QjZp/ITppMS7dEdGOBp6
OnF1sVU03uKcMYyTOTRcanvnSgmPKWWy3JTXzOrsuMbbxGt7/IQVvLylskcmJ8Ns
FM3vW7RkB2Bj43TYW/YYIjslTt6YYJHd64C7oFXoZLGDV2CvXIvXoI/GC5+UljEX
Y94DljOetL/wAkSNWWWkvUpCTDfXdhIUiB9IHmeE5CUgdB3LkxebIsNGQ08ZB/o4
KR5c0TtqhDqKNiR4MOtudDDtE19WrQjDoIVt75v6tsXK0Xm5p05TQ8SKv3dwxpAI
tqaqDEX1H98jMIoI+B1vB/6ZtdlVHz5GvS7QpCiwPxd5Y3L7v2U5G6GkrzQEUL0H
n0rCvFVNmEfBeyW0wLd8uyzPiOsVpoJGK2o5lZVGe2tmvLMZQ38TbMTeAXLY3RNz
Unn4dALuFwowU/H7R3eXsDFoLje4A2xK3d31bI95VNbCN9jvhS0=
=mKlq
-----END PGP SIGNATURE-----

--zNj/pFIeYgZazjXy--
