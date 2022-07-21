Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111E57CE8F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 17:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEA111AB87;
	Thu, 21 Jul 2022 15:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F51D11AB87;
 Thu, 21 Jul 2022 15:06:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7302E6110F;
 Thu, 21 Jul 2022 15:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6E0CC341C6;
 Thu, 21 Jul 2022 15:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658415967;
 bh=iEmEa1bghQME4Urn4Btl4Eo1lTevDlz0kqraFSy09hc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=riv6ZOqYjXfsw3vz7TWUc+dE1jas5CVrJ8sM2kOqp3U0S+3rILBVwGJEo/nSyix36
 KWA0iV/BZqHlzRcHiXqgn82fZPCspGJgHraeJu1rNdrHvkYClIxqU6NjVto/Z7BVZT
 bHRbsgAC2WbhotfT7/ppHJ5UQhl8ETOwfsy1nua1i2ML9X1kUPRuBMnoP8xl1NrGBj
 MjZTvhH9XQetIPDNb2Drsq2GF3jMWRh4cUCOrkriRXVyGLS6ya4iSIQYfnVQpaH6Ft
 CqHGnI/PFVFDvksibRC4kwK6tmOZeGyKpDs6LcgeDp5mXlMemkstH16TNSYJMSQ5kh
 ZyFAhyc0Xjg1Q==
Date: Thu, 21 Jul 2022 16:05:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v16 0/3] eDP/DP Phy vdda realted function
Message-ID: <YtlrV5R+JMxb7Dlu@sirena.org.uk>
References: <1657038556-2231-1-git-send-email-quic_khsieh@quicinc.com>
 <YtkrDcjTGhpaU1e0@hovoldconsulting.com>
 <CAA8EJprQnnWjDZJy9+zUBsVQCi3jtc0Ngtzzk9MXpwOvuAS68g@mail.gmail.com>
 <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4+965gYIfqnlK5HS"
Content-Disposition: inline
In-Reply-To: <CAD=FV=W0m-x9JC=5hQ3urSNmUp8sY-u8YkNd66yrKfRNAH4rcg@mail.gmail.com>
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
 Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4+965gYIfqnlK5HS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 21, 2022 at 07:49:55AM -0700, Doug Anderson wrote:

> Every single LDO on Qualcomm's PMICs seems to be able to be set in
> "high power mode" and "low power mode", but I think the majority of
> clients only really care about two things: on and in high power mode
> vs. off. I think the amount of stuff peripherals can do in low power
> mode is super limited, so you have to be _really_ sure that the
> peripheral won't draw too much current without you having a chance to
> reconfigure the regulator.

*Generally* a low power mode would be mainly useful for low power
retention type states, not active use.

--4+965gYIfqnlK5HS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLZa1YACgkQJNaLcl1U
h9C/YwgAggSqJZzhNITYTlghSm/AWQaIAIVhEGIeegfsi2pZcxO5KOqw/xYl+q4A
D2JtlyMbsXW5ca0/fk45/87qmjXS5UfIBQliyfda4upNtQ2lPbAUe9fpltwGmOPY
f3xRGPlyKZNXAtNya9RCUJwYcG9zi4QIplBvRF0rvNdd+hkvfsOqVUcD8f7xB+GN
aW67ivRaseeGqFewmetRGUj4QC8Gr8cZgkc1YYSAAHHFlKToY3G8WiF4v2Y2tfNh
I2DK6ADm/mkXCqqqNXcozM9994DU8jR0GK1Be1PGoxOFnYpwxR57CuP0NB+9v+n8
4sW5BhjQndCZ6vsuX8fHcwaH5PIU+Q==
=auZa
-----END PGP SIGNATURE-----

--4+965gYIfqnlK5HS--
