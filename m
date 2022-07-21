Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6241157D133
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 18:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C8910EF25;
	Thu, 21 Jul 2022 16:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF3C10F174;
 Thu, 21 Jul 2022 16:15:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 00AB261D9B;
 Thu, 21 Jul 2022 16:15:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA70C3411E;
 Thu, 21 Jul 2022 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658420143;
 bh=aKwoXurJ8ulRwPNPOsnWs3xQ4UsvWh88KPItgK8MMuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npMkh7m8Oh15DP+rI1DqB9B6lnCWY4QLz0BSHjNzOUiW5cjyCaXHRlEd8Fh9rBVSI
 1J0z4KZBzuDLMtao4Zd3EvoxDszjxkXRiyUK2qW9zw3cG1FqkcC83CcPiL3+VHviGo
 JrFc11zQ+/gZvn+MKNiFpS9U3yVv9ykaSJPFhrjWewCu1Lw93RPgc/yqCtCM+3OzeH
 o4Fpa4nBuq+QoWT6YDkuYYVdlxElEFfhZorA8Ov3DMZJp0/6SKohfmb/jCZb4jyhfd
 JI7KbshgSKgvg2iGH3aBr2HmLKbCpiqBRLWXkUcy3+B+onZ51F8TkUkq0v2/tW6CNw
 7VWqVoa93Elmw==
Date: Thu, 21 Jul 2022 17:15:35 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <Ytl7p1UHidn2yHfv@sirena.org.uk>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <Ytk2dxEC2n/ffNpD@sirena.org.uk>
 <CAD=FV=UQGXqVkew544f3RDtWb3virRHWiafBAxK3ncb5wmVYwQ@mail.gmail.com>
 <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bUeDuiEk6fcD6K16"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WuyKAwLwJ80uv15jBPO=W9F7FGZ4dAci+CncwF0WPfOw@mail.gmail.com>
X-Cookie: Exercise caution in your daily affairs.
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Johan Hovold <johan@kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Liam Girdwood <lgirdwood@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bUeDuiEk6fcD6K16
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 07:52:01AM -0700, Doug Anderson wrote:
> On Thu, Jul 21, 2022 at 7:39 AM Doug Anderson <dianders@chromium.org> wro=
te:

> > vdda-phy-supply =3D <&vdda_mipi_dsi0_1p2>;
> > vdda-phy-supply-base-load =3D <21800>;

> Ah, sorry to respond to my own thread so quickly, but I just thought
> of a reason for the "matching properties" solution instead of the two
> cells. It would allow the SoC "dtsi" file to specify a base load while
> the board "dts" file can then specify the supply. That feels like it
> could be a nice solution.

For a per device thing it probably shouldn't be called a "base load",
it's just the load.  I would question how useful this would be, aside
=66rom the concerns vendors will likely have with disclosing actual power
consumptions if the number never changes then it is immaterial which
device contributes which milliamp of load, you just want to configure a
fixed mode on the regulator and have done with it.

--bUeDuiEk6fcD6K16
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZe6YACgkQJNaLcl1U
h9BkCwf/ZX/ZcVyHzQF89Ws5jgAkSI71g6b+vTVGymg8Q8k62rRqUk7v8t+c6EyS
IbyN2L5dNL+Fs7+aJvGJi9EhHaVxsErDeSKYqEKGnq/RJG0oHdt5lYMPoHOddnZU
c4h8YZoVsFQqKbXwogmK01nG/OVYYID52ALzV6j04F+xAazbjwY5ftLOFcsplQ1z
yqy6qiD5dnu6kYWNS6RgVhCIeY4WaRulldCHqrHz9DV549sxsv/0cDrT19ZpcZkp
HkwgeFUhCd/xRDuhiZp+XTHwgg2AC8txVpqggzA2kXgNVmxzN8rcFLjYVtoOglMz
PWh0O6ZDoxu0TIGGjCudo2nCbYnIdQ==
=Lepm
-----END PGP SIGNATURE-----

--bUeDuiEk6fcD6K16--
