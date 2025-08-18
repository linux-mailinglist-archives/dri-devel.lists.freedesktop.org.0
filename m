Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9F8B2A208
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 14:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC9510E443;
	Mon, 18 Aug 2025 12:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="n18g+dpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F7A10E440;
 Mon, 18 Aug 2025 12:48:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 7CED4454D4;
 Mon, 18 Aug 2025 12:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6107C113D0;
 Mon, 18 Aug 2025 12:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755521288;
 bh=RfJbadEG1WXqCbA+L6puR7/SdieeHuzNWBQVsVWP4Us=;
 h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
 b=n18g+dpoNlQYiFSwWCCD/5j0vkRu2KWMp7n30uC9KZm2gl1yoABRwoZu4SWAo1Pnc
 lEOQfrO1cf1h8/JCrZDhODe5if+suJh1egobeJQOCo5F42HylkYGAElk0clbJoJSQt
 JQzWsQP6m54kk6GTaZU0YQW1NzQJacSGW+ZG4rKdlUttOixB335EGnZnyqP/JBsOyJ
 a4SFHZV2vJ8NbR4xJiHSMuYrOCOJ/FWa1EgUZmtjXGSuZPH5z4OaBL9a4Fs2QhpKTP
 Svn6rnvF+/gqVNVcWoE1i/n+G3w/B52a5MD20eEFlZ4pdZwbZBM/Ymz5f8VkHPvqKD
 sPi//gt4b4ftg==
Content-Type: multipart/signed;
 boundary=c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 18 Aug 2025 14:47:55 +0200
Message-Id: <DC5KCSEUZQUJ.3KPENNUQBUFM8@kernel.org>
To: "Stephan Gerhold" <stephan.gerhold@linaro.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Stephen Boyd" <sboyd@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Dmitry Baryshkov"
 <lumag@kernel.org>
Subject: Re: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay
 applying clock defaults
Cc: "Rob Clark" <robin.clark@oss.qualcomm.com>, "Abhinav Kumar"
 <abhinav.kumar@linux.dev>, "Jessica Zhang"
 <jessica.zhang@oss.qualcomm.com>, "Sean Paul" <sean@poorly.run>, "Marijn
 Suijten" <marijn.suijten@somainline.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Abel Vesa"
 <abel.vesa@linaro.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konradybcio@kernel.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Nishanth Menon" <nm@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
In-Reply-To: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Aug 14, 2025 at 11:18 AM CEST, Stephan Gerhold wrote:
> Michael had a somewhat related problem in the PVR driver recently [1],
> where of_clk_set_defaults() needs to be called a second time from the PVR
> driver (after the GPU has been powered on) to make the assigned-clock-rat=
es
> work correctly.

I've come back to this and just noticed that the
assigned-clock-rates do actually work. What doesn't work is the
caching of the clock rate. That bug was then masked by calling
of_clk_set_defaults() again in the driver.

Here is what the driver is doing:
 (1) driver gets handle to the clock with clk_get().
 (2) driver enables clock with clk_enable()
 (3) driver does a clk_get_rate() which returns 0, although there is
     already a hardware default in my case. That got me curious
     again..

Now on the k3 platforms the clocking is handled by a firmware and it
appears that the firmware is reporting a clock rate of 0 unless the
clock is actually enabled. After the clock is enabled it will report
the correct rate. (FWIW, I can modify the hardware/firmware default
rate with the assigned-clock-rates DT property).

I've hacked the clock driver to register all clocks with
CLK_GET_RATE_NO_CACHE and then everything is working as expected.

I'm no expert for the clocking framework, but it seems that
clk_get() will ask the HW for the clk rate and caches it early on.

-michael

--c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaKMg/RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iUoAF+J3OaVC3IxUeIFloGDoJ8dv5T/iTrFSoA
+swW8sUuXrerXJYNsOz5CEpkMw5MWCHhAYD/qVKeufcrPpXb/T8mC9Q7mY7menjZ
YTiG9V2kBLg2wK8UiF2WoE+54Vcry3zejqc=
=y5fA
-----END PGP SIGNATURE-----

--c7999e395d5ad658028f60c4d5da8e05c74a2c659f013cb8ab28620f2f20--
