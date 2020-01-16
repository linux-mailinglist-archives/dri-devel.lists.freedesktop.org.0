Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BA313D574
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 08:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F656E201;
	Thu, 16 Jan 2020 07:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25F206E201
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2020 07:57:57 +0000 (UTC)
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7656D20748;
 Thu, 16 Jan 2020 07:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579161476;
 bh=+wdr6cEgmGtiSw99Y0hFOCcc1LQYqiVMLeSGkwU/s4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M9iTm4AtXcrcAsQ+xYiUDcvYfO9GFbgtTmft/eirrJE65yljufMxS+LJpJH2f34PS
 jAL16wmLPn6XrKtXgb9PnaKkbi98W+SgFKgipNUUAImINR0sq5g762fZzOhopwiNUM
 UV+4avAeSX+pkM37rtywZUmtXJAO9PM/10Wbh/R0=
Date: Thu, 16 Jan 2020 08:57:53 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v2] drm/modes: Apply video parameters with only reflect
 option
Message-ID: <20200116075753.hrqd7wmvbr66cuiz@gilmour.lan>
References: <20191216171017.173326-1-stephan@gerhold.net>
 <20191216172725.GZ1208@intel.com>
 <20191216180811.GB173588@gerhold.net>
 <20200113163039.GA50384@gerhold.net>
MIME-Version: 1.0
In-Reply-To: <20200113163039.GA50384@gerhold.net>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0237180313=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0237180313==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m2be23zarskrxajn"
Content-Disposition: inline


--m2be23zarskrxajn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephan,

On Mon, Jan 13, 2020 at 05:30:39PM +0100, Stephan Gerhold wrote:
> On Mon, Dec 16, 2019 at 07:08:12PM +0100, Stephan Gerhold wrote:
> > On Mon, Dec 16, 2019 at 07:27:25PM +0200, Ville Syrj=E4l=E4 wrote:
> > > On Mon, Dec 16, 2019 at 06:10:17PM +0100, Stephan Gerhold wrote:
> > > > At the moment, video mode parameters like video=3D540x960,reflect_x,
> > > > (without rotation set) are not taken into account when applying the
> > > > mode in drm_client_modeset.c.
> > >
> > > A rotation value without exactly one rotation angle is illegal.
> > > IMO the code should not generate a value like that in the first
> > > place.
> > >
>
> What do you think about Ville's comment?
> Should we change the command line parser to generate ROTATE_0 when no
> rotate option is specified? This would also require updating a few of
> the test cases.

I agree with him :)

Maxime

--m2be23zarskrxajn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXiAXgQAKCRDj7w1vZxhR
xaqZAQDJCqrMAmfDrNRgO5NXJCPfTyth5ruXAx9iZCV2PAmrWwEAoN19ZgrkzbAQ
XuTNJTmppu0RLbPQXaxP1fi5zh4ORwo=
=Oyjt
-----END PGP SIGNATURE-----

--m2be23zarskrxajn--

--===============0237180313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0237180313==--
