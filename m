Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B75618D0
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 13:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A814C10F940;
	Thu, 30 Jun 2022 11:12:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCD710F940;
 Thu, 30 Jun 2022 11:11:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C951FB82A2A;
 Thu, 30 Jun 2022 11:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5634C34115;
 Thu, 30 Jun 2022 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656587516;
 bh=gY2GwuIoEENdxG1SB1lnnV49S2t2kuQ/2lN1uJIHe7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fVrcb0+6182VKbB5+5bvi1s47yAwFfK8wb6zyFp/VYh39jS8CJX26v7VDJPXvmt6m
 Sq2aO1HVesfnXCRoOn7xIDqeid4zMoKig2AFowAiyxupDRcEhytjTmgOOHIFxtLXlw
 WnQGX/rMorDO05WZfM2GdvgCHMyaE58VmvJkvF/xcXat99lPVXYetwLQ6IeXcy6B6f
 JUK0/znx1WjGYVUCDVrm+wdH0I0gZjJYAJ33E/C25y9dFkfwom6jJpMDF2fXuNb3lL
 IRkA55V7usztN7WA1+/7khpvE/IZDERTGKcml1CeNR8YLLfUFjZrTIDolXBotPH1oW
 I7lLsShPC8ArA==
Date: Thu, 30 Jun 2022 12:11:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 5/5] ASoC: amd: enable machine driver build for Jadeite
 platform
Message-ID: <Yr2E9SQCtk1u6V+i@sirena.org.uk>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
 <20220630031755.1055413-6-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="KL9cDJfR2Dto7H+U"
Content-Disposition: inline
In-Reply-To: <20220630031755.1055413-6-Vijendar.Mukunda@amd.com>
X-Cookie: Today is what happened to yesterday.
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
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Sunil-kumar.Dommati@amd.com,
 Lucas Tanure <tanureal@opensource.cirrus.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 amd-gfx@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 dri-devel@lists.freedesktop.org, Alexander.Deucher@amd.com,
 zhuning@everest-semi.com, Julian Braha <julianbraha@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--KL9cDJfR2Dto7H+U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 30, 2022 at 08:47:55AM +0530, Vijendar Mukunda wrote:

> +	depends on SND_SOC_AMD_ACP && I2C && ACPI

The code treated ACPI as optional so you could relax the ACPI dependency
ot be "ACPI || COMPILE_TEST" (I think the same applies to I2C).

--KL9cDJfR2Dto7H+U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmK9hPQACgkQJNaLcl1U
h9Dsnwf/ceuWdmQ1YUNUCt6hr1dWc8w8GCz8hT5Wl9l1lyRROuKUldbDQWBk2+Ye
7cCxrDYlIRL09GtZbdu+Ct5uWqDgBEZ6K6RT4eDMrYVTlpRbKe8uCBSQem7NXmqD
jfIU9Z5b1gpqJsSWuFRY3I48SjN5UM6NclGCfUPv+XMr3QWw6jcSzIAvReP/GX/r
3VczbScE+g1wZ2jIzEjAkiIdK53sb2+C0Z4PmrI0B4KvLvCSZOXFLIlydLtsTnsG
OZRUjPW2Lb7mxEksPzmMuUAMQ3bwd4iHK6rqcw1WZ9VvLXJwBcP55U8blR/bNlVE
MvRRSDyctG4b+sAJy5gA+gwjPQYjOg==
=Eu76
-----END PGP SIGNATURE-----

--KL9cDJfR2Dto7H+U--
