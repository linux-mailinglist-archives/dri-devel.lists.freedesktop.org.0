Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B68877727F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 10:13:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78C410E4EC;
	Thu, 10 Aug 2023 08:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8310E4EC;
 Thu, 10 Aug 2023 08:13:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A9D00652F9;
 Thu, 10 Aug 2023 08:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83019C433D9;
 Thu, 10 Aug 2023 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691655210;
 bh=gXVZ68cdpgp0Oc06O+iDMDHFl7uPsJSDhRHvYoDqwWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bSQJ3MDGIPvJ0HMdmJojPNOITtyTnIaObs3s8neo3b0T4ZqDx67kFFQVnWaIlvSq0
 XbT2KMjZ4kRCPECjY9wzhAZIaEpnY8sOrR6YoMMkBhomarPH2yUscPuKDgMwVXygvL
 931+QUJn8LtveKV+Uc+R4qqJYghlHkz7D5jRSTwBFNp5MlKKPGF92rAFNid/YCWjt5
 wdoO/S0kBgRa9gvVkt8X79r5m0kQBttlpf/RvPowbcQWJMqkxTWaUIF7ln+O7O75gx
 +/Z3QFtPJJd7fJuxGaoYpZUxAebuqPOXjPYpPpP2zE6JtAnsUtzsJNw2q7VYEwiMAs
 Rw5p2OsG22CmA==
Date: Thu, 10 Aug 2023 10:13:26 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Subject: Re: [PATCH] video/hdmi: convert *_infoframe_init() functions to void
Message-ID: <ibwl2bpz5bs72co4ivkvjcc35lv5mqyuvj2hbr3p54hliujklm@uje662ldqfdw>
References: <20230808180245.7474-1-n.zhandarovich@fintech.ru>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="syn7hsjtm3zubtz2"
Content-Disposition: inline
In-Reply-To: <20230808180245.7474-1-n.zhandarovich@fintech.ru>
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
Cc: linux-fbdev@vger.kernel.org, lvc-project@linuxtesting.org,
 Emma Anholt <emma@anholt.net>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Helge Deller <deller@gmx.de>,
 amd-gfx@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, intel-gfx@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--syn7hsjtm3zubtz2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 08, 2023 at 11:02:45AM -0700, Nikita Zhandarovich wrote:
> Four hdmi_*_infoframe_init() functions that initialize different
> types of hdmi infoframes only return the default 0 value, contrary to
> their descriptions. Yet these functions are still unnecessarily checked
> against possible errors in case of failure.
>=20
> Remove redundant error checks in calls to following functions:
> - hdmi_spd_infoframe_init
> - hdmi_audio_infoframe_init
> - hdmi_vendor_infoframe_init
> - hdmi_drm_infoframe_init
> Also, convert these functions to 'void' and fix their descriptions.

I'm not sure what value it actually adds. None of them return any
errors, but very well might if we started to be a bit serious about it.

Since the error handling is already there, then I'd rather leave it
there.

> Fixes: 2c676f378edb ("[media] hdmi: added unpack and logging functions fo=
r InfoFrames")

I'm confused about that part. What does it fix exactly?

Maxime

--syn7hsjtm3zubtz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZNScJgAKCRDj7w1vZxhR
xSWxAPkBKpcYa8fvgV9S3h2fxehetHD5UXS8LuBJb/F6EtKr5QEA1tv3DgElGqJD
Vd+9ES535Sb39MjXfvkcbNMyPRxsjQU=
=6V+A
-----END PGP SIGNATURE-----

--syn7hsjtm3zubtz2--
