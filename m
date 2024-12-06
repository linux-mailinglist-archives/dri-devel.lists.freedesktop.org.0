Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C939E751D
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 17:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD17510E3FD;
	Fri,  6 Dec 2024 16:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rUZhriGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9911E10E3FD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 16:06:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 056675C6946;
 Fri,  6 Dec 2024 16:06:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403D8C4CED1;
 Fri,  6 Dec 2024 16:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733501211;
 bh=gToIYM+37jkKtK/Sbu0IwPGwvwqDSaBXiHsgZA/gUAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rUZhriGHwCOGUtnZPn6FC7saJhs6BKSmHqVG5AS+E0JB1T7WxDfeMpEbolQahWmV4
 +/IvsXta9NDAgw02+PN2UCwNsn9gZ7EcEzwPrENYs2Vv191ztYUHRjTXw+lBe+c9Ic
 odbaoVofPbb+z6qo3uRJPlLjvHkpPXpFKIIvFaH5hbkzMAoRG89g854UUjG8fG127a
 4I04DzE5/U6OQjK/qkdEVVwAPxTAKAB2LS0I9ttpCOLbB7M9AkUDMA1KcR+1H7deLu
 TFv1mG8eIAAlXUdkyPJgcjkxdssShLZNDvFIYmCLWfTfQ3uccoPRQtkhT+hkSm5eNH
 lTXQ1kBPWpADw==
Date: Fri, 6 Dec 2024 16:06:45 +0000
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
Message-ID: <6456e0b7-08ae-4515-a7c9-734f50c9130a@sirena.org.uk>
References: <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
 <Y5ipwqzHKTK8UdlC@sirena.org.uk>
 <a699178dcef540fff5caae6291983a444886bff6.camel@mediatek.com>
 <00d5c728-3eb9-427a-bc60-5828c20fec09@sirena.org.uk>
 <b44319c9fabbea2e8c333191a0005ef5c4ec6b2c.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="0Q96+HlCP5jtbeOt"
Content-Disposition: inline
In-Reply-To: <b44319c9fabbea2e8c333191a0005ef5c4ec6b2c.camel@mediatek.com>
X-Cookie: Sales tax applies.
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


--0Q96+HlCP5jtbeOt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2024 at 03:39:15PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Mon, 2024-12-02 at 13:16 +0000, Mark Brown wrote:
> > On Sun, Dec 01, 2024 at 05:15:45PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=
=E9=91=AB) wrote:

> > > So I want to ask if I can do it by just adding
> > > SOC_DAPM_PIN_SWITCH("Speakers") and SOC_DAPM_PIN_SWITCH("HDMI")?
> > > Correspondingly, dapm widget and route path need to be added. That
> > > is
> > > "SND_SOC_DAPM_SPK("Speakers", NULL)/ SND_SOC_DAPM_LINE("HDMI1",
> > > NULL)"
> > > and "{"Speakers", NULL, "Speaker"}/ {"HDMI1", NULL, "TX"}".

> > Yes, that's what I'd expect to see.

> So if I open the "HDMI Switch" amixer control, it will call
> 'hdmi_codec_startup', which in turn calls "audio_startup()"  in
> 'hdmi_codec_ops'. Conversely, if I close it, it will call
> 'hdmi_codec_shutdown', which in turn calls 'audio_shutdown' in
> 'hdmi_codec_ops'. Is this understanding correct?

The audio stream will still run, the DAPM path attached to it will get
shut down.

--0Q96+HlCP5jtbeOt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdTIRQACgkQJNaLcl1U
h9AR8gf9Hfqv5O8hW1VoO/+oNPx5CkfRkyZFsfXQTS4FYXeTZ9zcxTzV8bdgREIe
WVUSi00ehS2CCupQkffrSFfZHqk88wxKrrMFNQYcoDrekq/kUtbseBayFJgB6mQY
4NUYT/0mnejbXDk+qeiHI1f0UzygswelfRVu+TZ7exCG2UI7GJO2RYdL6fpItNpQ
F7ISvK9ldljmyAmqAbZ8Ol6tg2eNfbhESwdEGsGrx58UpFAWH/0Qb6G+T4tzPxQ+
3rMJvvwahR0VMHmVglGFRUneunLknVaycWRVne7jYBilbaRlWMGQQ4FVs8XLY45q
OE7ZqGZc2+b4p2bOuAcnSLIiQPRSsg==
=/TNF
-----END PGP SIGNATURE-----

--0Q96+HlCP5jtbeOt--
