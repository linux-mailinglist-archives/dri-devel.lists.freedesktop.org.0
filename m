Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2199C9E0317
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 14:17:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F19E10E1B3;
	Mon,  2 Dec 2024 13:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TlUDTiqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2938C10E1B3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 13:16:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DC4EDA40B5F;
 Mon,  2 Dec 2024 13:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CE9C4CED1;
 Mon,  2 Dec 2024 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733145417;
 bh=/VF+nWs6BWtLEi7pKkF8pL4507yNu1NwuQmjk0P5/9g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TlUDTiqGqqVXsTcBbB9DY1Tj4GMlqBKCfLy4MRppqgoZ+hIXX+C1MxEj5vfH9GnPp
 pZzbmEljazX/5Fp15FZzjtyQiV1ARa5cluHtszSCNK+WUICMjsXncH/i800kboib3d
 5yO6V9WPYE2Gw6PKa8jvyRcXDRMhpGkyfykwfGepEd9RLlf9N+2uRYV1kfFkMrn1rb
 va5YB+0NIfOs3QsVhKScTQ1SxXldUT4An8nqBvnsXywUZlmtQRVQHW/x/+juRJpXdN
 +RZehDyE3RB5KB4msJrMpBXmF/iSnIGVeQI0SRdGYab574kPnU8kJRIi+YRG9yp/R8
 u967dyf3w8Lgg==
Date: Mon, 2 Dec 2024 13:16:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>, 
 Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
 Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Prado <nfraprado@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <00d5c728-3eb9-427a-bc60-5828c20fec09@sirena.org.uk>
References: <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
 <Y5ipwqzHKTK8UdlC@sirena.org.uk>
 <a699178dcef540fff5caae6291983a444886bff6.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="NG9fJ4QMkZ8167X3"
Content-Disposition: inline
In-Reply-To: <a699178dcef540fff5caae6291983a444886bff6.camel@mediatek.com>
X-Cookie: (null cookie
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


--NG9fJ4QMkZ8167X3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 01, 2024 at 05:15:45PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:

> So I want to ask if I can do it by just adding
> SOC_DAPM_PIN_SWITCH("Speakers") and SOC_DAPM_PIN_SWITCH("HDMI")?
> Correspondingly, dapm widget and route path need to be added. That is
> "SND_SOC_DAPM_SPK("Speakers", NULL)/ SND_SOC_DAPM_LINE("HDMI1", NULL)"
> and "{"Speakers", NULL, "Speaker"}/ {"HDMI1", NULL, "TX"}".

Yes, that's what I'd expect to see.

--NG9fJ4QMkZ8167X3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdNs0IACgkQJNaLcl1U
h9DGvAf+J3hwEq4x3bF91sZy15VQBvz/0kSF2J0M+KaBQnVVFXj/YCUp9AjHd9Py
svtvltKB2dzk8Cpzti6uG995Vi0ugqWdEFR57tDSFDzyMMEStcr/z+LYr8gmncxg
0kEyoQrLHpnucIqWa+IJ766YUIsU2FvSM5IP2ZDXfWUeSHI5fzUfpc5M9MrgZJut
JfoR0eE91G28dKk46pdE+WRc6xsPWl/jRqlgr492lZe5Qew7l8ZRdnvummrx0iDd
A4z1fW9cZXTepa9GisH8GziS6GP3C+qJWwsAgq+iaKvZ6tBcii8s0sSGVRWbvQQG
a7poRNcQYuwS88Fimgys4lWYbODVVg==
=weMB
-----END PGP SIGNATURE-----

--NG9fJ4QMkZ8167X3--
