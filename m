Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C48298D9
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 12:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 635D610E5B9;
	Wed, 10 Jan 2024 11:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1142510E5B9
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 11:23:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 62112B81675;
 Wed, 10 Jan 2024 11:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C84AC433F1;
 Wed, 10 Jan 2024 11:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704885804;
 bh=RCE2y0eor3dKdkA/sjI7c35eXtYn52uyvFYjl/ELECE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fFbdmt5JAETnqcBpMj304al9iIy+OKopuhuAL8TSGKC17wOLB3U0RnSvhLpcQhvOV
 h38dNnVcUhYxNo+DMqTDLF/dhvo7rHfjz31dEGPUzs+/Vg102gdxl3dUOLPha3LEsq
 8EYdNAiLk3uL/OqKann72I2YA9wS3jMA2echwuEDJFsk0bUktIhhg1rrLTckS9yx9H
 DiVZZdFLcWb7t5qNNugp0MRoLjJcu3B/T3SHnkcQs/TOWdNOD5U4q+/yHcki1VwEsY
 htIA2SwfsDx8kktKtv6xIZelEmNchGn0sJLkR0H4eDdXu259z40QNc1TZyAllcEqDY
 yAUWl+yCsKUVw==
Date: Wed, 10 Jan 2024 12:23:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Enable
 display and GPU
Message-ID: <2zkiop7xg7w4vkpjpol25qna5wwbq4ja5o6iwuqh25m34k6mgd@aemrbzqgx2oe>
References: <20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com>
 <20240105-fp4-panel-v1-3-1afbabc55276@fairphone.com>
 <3fdc6e74-d817-4341-bf64-9096608990d6@linaro.org>
 <CYAZ37LBKG4E.2096GKVUXN8Y2@fairphone.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="rxtk5satlzcpouxq"
Content-Disposition: inline
In-Reply-To: <CYAZ37LBKG4E.2096GKVUXN8Y2@fairphone.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 phone-devel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--rxtk5satlzcpouxq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 10, 2024 at 12:00:23PM +0100, Luca Weiss wrote:
> On Wed Jan 10, 2024 at 11:58 AM CET, Konrad Dybcio wrote:
> >
> >
> > On 1/5/24 15:29, Luca Weiss wrote:
> > > Add the description for the display panel found on this phone and rem=
ove
> > > the simple-framebuffer that was in place until now
> >
> > Why? They should be able to coexist with a smooth-ish handoff
>=20
> Does that work upstream? I'm aware that downstream can do this but
> thought this was still missing upstream.

It depends what you call smooth-ish I guess, but KMS handles the
handover just fine. You're likely to get a flicker during the transition
though.

Either way, the DT isn't the right place to choose, you should enable
both, and the distro will choose its policy through configuration.

Maxime

--rxtk5satlzcpouxq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZZ5+KQAKCRDj7w1vZxhR
xVOLAQDvZ9TCy7oTZ8R3ORWkJYRiOzes6hRevRhddXAk7aj6JAD5ARIiiJFNSXvY
jIoRZnBI9TvNc0CDDCeZEGZ2XFkj2AI=
=AWk3
-----END PGP SIGNATURE-----

--rxtk5satlzcpouxq--
