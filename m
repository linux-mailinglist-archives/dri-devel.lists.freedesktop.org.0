Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F70164B9DE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 17:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF3510E0F0;
	Tue, 13 Dec 2022 16:35:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589F910E0F0
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 16:35:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE640615E6;
 Tue, 13 Dec 2022 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82E0C433D2;
 Tue, 13 Dec 2022 16:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670949321;
 bh=qihIQCMPrJTCAef4qkglbnoZxzlmXFeUf906h3WI2bE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fO1G6bGV/KeloymJW66oTo+yy+4yiT37YGEdNR/LT98AlF2QyOlkQ4lyIzmmC9Yja
 YOMMnFWSG203NY/ONt2prT6lxOZ7dDs76fJ4cV9KlRU9lNIMTFQqee3CuTxvGGo5NQ
 dx9q+nHopU1j+ic41SEa4x8AxO5czV+M4yY/zXLn32x4e9JwgBEkZAg9Aho7/3SDye
 MCUA7Lg5uMvgdGaHcRZaFOpW+bWxkcnTVNd1eKn+ATVb1Vww+u+adQt9TcwZ4L0ox1
 Gu2W+dwVSoudhK9Qx6pFfylt/zuhILMN/mvj9FPRYb4BGTMcbiN5PU6HASzBE7Z7Od
 8cbCBwqUtCjnQ==
Date: Tue, 13 Dec 2022 16:35:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y5ipwqzHKTK8UdlC@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
 <Y43e+EsNCrCpZSIH@sirena.org.uk>
 <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="/zKtWsydBRDCvDgl"
Content-Disposition: inline
In-Reply-To: <dc50d0b21795acbcc44c77e5fd81e7cb92c65c67.camel@mediatek.com>
X-Cookie: Edwin Meese made me wear CORDOVANS!!
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 Chunxu Li =?utf-8?B?KOadjuaYpeaXrSk=?= <Chunxu.Li@mediatek.com>,
 Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsyk=?= <Allen-KH.Cheng@mediatek.com>,
 "kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "ajye_huang@compal.corp-partner.google.com"
 <ajye_huang@compal.corp-partner.google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--/zKtWsydBRDCvDgl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2022 at 02:23:32PM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:
> On Mon, 2022-12-05 at 12:07 +0000, Mark Brown wrote:
> > On Mon, Dec 05, 2022 at 09:34:17AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=
=E9=91=AB) wrote:

> > No, I mean that if you want to control the enable and disable of the
> > output path you should implement a DAPM widget.

> May I ask which driver file to add a new DAPM widget? Is it the bridge
> ic driver like it6505.c? Or is it linke the "SDB" added in this patch?

I would expect this to follow a similar pattern to everything else with
hdmi-codec.c and have the actual ASoC stuff in there with a callback
exposed to the rest of the world.

> Yes, I should add a new set of events, such as:

> enum {
>     HDMI_CODEC_TRIGGER_EVENT_STOP,
>     HDMI_CODEC_TRIGGER_EVENT_START,
>     HDMI_CODEC_TRIGGER_EVENT_SUSPEND,
>     HDMI_CODEC_TRIGGER_EVENT_RESUME,
> }

> Then provide handles for these events in the it6505 driver. Am I right?

I'd expect more like on/off for a DAPM widget (the DAPM callbacks are
pre/post on/off) but yes.

--/zKtWsydBRDCvDgl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmOYqcEACgkQJNaLcl1U
h9BIcwf+IZPAQvqXRw2Cg6HsT7fk7Rmm2c4pKUU8NYJA7vobVG315cVSIGTIXIqD
ImaHqf5kMeCNdt5eX5Hox3j5q3b2drkrcyHP6rj44Bb7lzqhHadpfXi9XaX7DT4d
FrmlVfM2gwCXMSKbsKKPHXdqABIi86R5bN79MxoAhgbfisu5OmIrm6ZvYYvLXSlC
nAXcEMeIKZGzhSQIEZCAQ0koNeKZAdmHz435pKjqYWCMbzCsTvXDOJq5GBB8rsiH
lsuMIxHbyBoPUZdhuPj0WAzBMgAY9Kir3RQ1+Xd3epA9LYpWHn+bqotaAqEIlP7Y
1c1+QoUZgnbL7M8UCa5+mryUEIhzGA==
=uzkH
-----END PGP SIGNATURE-----

--/zKtWsydBRDCvDgl--
