Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631A876953E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jul 2023 13:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E8FB10E269;
	Mon, 31 Jul 2023 11:50:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C4510E269
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jul 2023 11:50:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C64776105A;
 Mon, 31 Jul 2023 11:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE103C433C8;
 Mon, 31 Jul 2023 11:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690804255;
 bh=AOWwhYv+t8CDvyhND2LxS4NNrNKJuWikV9QiBFJH92s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uL2XhCM5GgiizRO+1NueJqOprVve9jG9ZNiTVFaZmlT0Q/zpwS7OIGkH1wOpYJzo7
 qRZ3NRfxvT0zTMbGLyJBm8HEDAzDE1VXzpskPjW9Z6koCwUQOj5yZKHR+1uBw6j1rn
 mqu+TreQdXB+3DlMYLWHSARGlScVJQ5XQf3CG4lN2fqdQjsYkmtsO0n1jAABoOItNk
 yTG4BJbMlq8NUZhH6CTPE2kfSEIYlVlVwkzKKeY73KOAAHsw1WyQH8K/e84e2ePbqv
 RtzsDIHhnQ3Ulw1hrtEaBMOf8RZPDpmzuEN04Y89w3ZWgWgoU4pF2vlmlUFYS+g80n
 kWNXkGQ/y6fjg==
Date: Mon, 31 Jul 2023 12:50:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Message-ID: <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="m510aG4cVtaJEGRZ"
Content-Disposition: inline
In-Reply-To: <20230730180803.22570-3-jiaxin.yu@mediatek.com>
X-Cookie: Single tasking: Just Say No.
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
Cc: neil.armstrong@linaro.org, alsa-devel@alsa-project.org,
 chunxu.li@mediatek.com, nfraprado@collabora.com,
 kuninori.morimoto.gx@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, allen-kh.cheng@mediatek.com,
 ajye_huang@compal.corp-partner.google.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--m510aG4cVtaJEGRZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 31, 2023 at 02:08:02AM +0800, Jiaxin Yu wrote:

> Use SND_SOC_DAPM_LINE instead of SND_SOC_DAPM_OUTPUT to trigger
> DAPM events to hdmi-codec when userspace control the DPAM pin.

Why?

--m510aG4cVtaJEGRZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTHoBcACgkQJNaLcl1U
h9DXVgf9HxthKv6tquZ80eqHswbBmda73YJgF+PneFtfjX5EUD8siEFTvhlHJOPb
itkNuLs0xwuvU/ocou1TJ3JVkd4SlhXF2AQUB2MKqUJlOMYiEthVhAj2RWNMEMWb
M6hNPAHydcz2O6rmMD0wknYpUUHLE+1Xv3EXeMZEKYLh8qZlrfstrqI1s/fhuQaJ
TmQTCMTZ8AmSRgZ9ENPYon30oN6/7qeEvKbyW+PnOTCqSv/Zhz1pOVf21YoY2nhO
94QnTgSNXrSZINA/rfNDUwEvG2W/OY4N/hb+gKf6qbraNOVxbw1o//Cc2tfTTWlL
P2wCPNxJJXNDAizWmcN9zeH3ZZ4Iqg==
=H16t
-----END PGP SIGNATURE-----

--m510aG4cVtaJEGRZ--
