Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B0D72788A
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 09:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A9710E591;
	Thu,  8 Jun 2023 07:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CBC10E591
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jun 2023 07:17:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 375AE60DDB;
 Thu,  8 Jun 2023 07:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DEEC433EF;
 Thu,  8 Jun 2023 07:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686208649;
 bh=DgNy7Z0KKn8MMOgxNGldNvVHSpHtF7LqXA6FiWXacwU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KS66tAZlXQrUKAebbEfqLOkWE5Pz7Q2p9tPKdNpc1SniYL0900czyqPb2TaiYL7Ye
 DEwwMeIHAFnTj3cuw0BHO6UhjnLImLhIn2eACfmDVwIugq4cLOt2rL4KNLPyATWDs4
 T241J5sSwtzNEssZf8WdI7orYGadgjn/4DOibGpQoAnMl2tdxT1niTSxkyln1UeY52
 vRl3eimY0u7D4eKKGd+Sh78Dd1OujFDZsoLARWFlVlw1+PYKmz9FF/UGSEfz5TkjTh
 bC2AboPTkpyqXTixmVaorks6BN2QLX7MmtpaHyVSW+LV0jcCIpXqR7elwdjGHU6pKz
 O9NmFP7cxLMTQ==
Date: Thu, 8 Jun 2023 09:17:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 00/10] drm/panel and i2c-hid: Allow panels and
 touchscreens to power sequence together
Message-ID: <jehxiy3z4aieop5qgzmlon4u76n7gvt3kc6knxhb5yqkiz3rsp@mx27m75sx43r>
References: <20230607215224.2067679-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dfmbtdcuvmsnsbt5"
Content-Disposition: inline
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 linux-arm-msm@vger.kernel.org, yangcong5@huaqin.corp-partner.google.com,
 Jiri Kosina <jikos@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dfmbtdcuvmsnsbt5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Douglas,

On Wed, Jun 07, 2023 at 02:49:22PM -0700, Douglas Anderson wrote:
>=20
> The big motivation for this patch series is mostly described in the patch
> ("drm/panel: Add a way for other devices to follow panel state"), but to
> quickly summarize here: for touchscreens that are connected to a panel we
> need the ability to power sequence the two device together. This is not a
> new need, but so far we've managed to get by through a combination of
> inefficiency, added costs, or perhaps just a little bit of brokenness.
> It's time to do better. This patch series allows us to do better.
>=20
> Assuming that people think this patch series looks OK, we'll have to
> figure out the right way to land it. The panel patches and i2c-hid
> patches will go through very different trees and so either we'll need
> an Ack from one side or the other or someone to create a tag for the
> other tree to pull in. This will _probably_ require the true drm-misc
> maintainers to get involved, not a lowly committer. ;-)
>=20
> Version 2 of this patch series doesn't change too much. At a high level:
> * I added all the forgotten "static" to functions.
> * I've hopefully made the bindings better.
> * I've integrated into fw_devlink.
> * I cleaned up a few descriptions / comments.
>=20
> This still needs someone to say that the idea looks OK or to suggest
> an alternative that solves the problems. ;-)

Thanks for working on this.

I haven't seen in any of your commit messages how the panels were
actually "packaged" together?

Do a panel model typically come together with the i2c-hid support, or is
it added at manufacture time?

If it's the latter, it's indeed a fairly loose connection and we need
your work.

If it's the former though and we don't expect a given panel reference to
always (or never) come with a touchscreen attached, I guess we can have
something much simpler with a bunch of helpers that would register a
i2c-hid device and would be called by the panel driver itself.

And then, since everything is self-contained managing the power state
becomes easier as well.

Maxime

--dfmbtdcuvmsnsbt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZIGAhgAKCRDj7w1vZxhR
xXYWAP9FSFylcQPn7fz6xgDKld7G4GeHoOUOkRIHq74ilGrD7QEA/4Zn/Rzcqgwa
aYb2ySZimrrn0J5IOURj78PWDxWA7QY=
=aUVL
-----END PGP SIGNATURE-----

--dfmbtdcuvmsnsbt5--
