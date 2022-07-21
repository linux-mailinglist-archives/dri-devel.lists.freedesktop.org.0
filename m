Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC857CA63
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 14:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DF314AFA1;
	Thu, 21 Jul 2022 12:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F7C414B3B3;
 Thu, 21 Jul 2022 12:12:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3294261D93;
 Thu, 21 Jul 2022 12:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DA86C3411E;
 Thu, 21 Jul 2022 12:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658405544;
 bh=bjLxvlVXamAjASEle08xmCl8qBx04BWEVs5DHeMu8Mw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ns1cEqWMytm09KDRjusjlPxfR1qr267qTII21k/oxK5j4XXiA6BfiZpii70rEUBj1
 +mCEtt83eiFLaUG9g0rpuUn4GhB82MYLJ1WPpWns10eHBLSiEUrhykQuWQTR11ICGi
 4IDZUWNrPIDgRj/Kp2gl4bmvVRzqUpaS2LTw2oZ2ze7xEpSoN59CDBixYSbfBhILJE
 q7amUFr5BW8PvrA6ixfVgHAjUgKEFt8NpCaXeBxfQHadz/DvzIGYxrvV474QB43l9E
 HjtcRtdYD78hXIbO/1lpe37h+fKRUGMGsXB9qmb2RoR2smqtcTSuu9WiSHdF0e7IMF
 Tpf64xF/JT0RQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1oEV2W-0003Na-9F; Thu, 21 Jul 2022 14:12:24 +0200
Date: Thu, 21 Jul 2022 14:12:24 +0200
From: Johan Hovold <johan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <YtlCqPWUCmw01Jon@hovoldconsulting.com>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <Ytk2dxEC2n/ffNpD@sirena.org.uk> <Ytk+9W0Ur1ibqtw8@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="CFA1nl4l5O882w62"
Content-Disposition: inline
In-Reply-To: <Ytk+9W0Ur1ibqtw8@sirena.org.uk>
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
Cc: quic_sbillaka@quicinc.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, Liam Girdwood <lgirdwood@gmail.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 quic_aravindh@quicinc.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com, swboyd@chromium.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, sean@poorly.run,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--CFA1nl4l5O882w62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 12:56:37PM +0100, Mark Brown wrote:
> On Thu, Jul 21, 2022 at 12:20:31PM +0100, Mark Brown wrote:
>=20
> > You could add a way to specify constant base loads in DT on either a per
> > regulator or per consumer basis.
>=20
> ...and also note that this is only an issue if the system gives
> permission to change the mode in the constraints which is pretty rare.

Yeah, apparently only Qualcomm is using regulator-allow-set-load at the
moment, but it seems pretty common there.

We should probably just drop that from the platforms affected by this
particular regression and perhaps later add it back where it makes
sense (e.g. after making sure all consumers specify a load in some way).

Johan

--CFA1nl4l5O882w62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYtlCpAAKCRALxc3C7H1l
CH3VAP0UC9lDdd/fIlxYLQa+xUSFqHJHrap+vbhZ0Co4s/SlkgD+JXqNWLFDmtEF
29yeuk3k7WUrvkX9OIjphqSsYKFRzwo=
=+ChT
-----END PGP SIGNATURE-----

--CFA1nl4l5O882w62--
