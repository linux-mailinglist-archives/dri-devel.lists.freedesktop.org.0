Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B34F176F373
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 21:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 916F810E0DD;
	Thu,  3 Aug 2023 19:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAF910E0DD
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 19:33:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D82FE61E58;
 Thu,  3 Aug 2023 19:33:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C3AC433C7;
 Thu,  3 Aug 2023 19:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691091202;
 bh=Na39kC0nP6XiW875V274Re2PU/Nlj2wRY/n4Ot8HLjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vq2BHfXd0gAouZIkgnzf1DfzUa8NZDzU1x8y7+3dNLTFUILMcNkIJvKYBfYJQSzW3
 RYYZmW45VHl7DbGGghUJpfaBpUH7es8pY2cMU1BfFMZQEQ0Iqz4ZnMGRTfEr/XRwBy
 1bvtHux6jRaWV01Q2gCrU44FeWfqiLUgX1Qmj6zGCNRK+gxK98jY1X++g7wIfP24If
 a0E9MgRAXWgIB39M4D8d9tda3B8eJkLwYUhbevvI8+k6Nuu8n7GvRO8ULiKUfic2JV
 G3TZQwTX9hYfUSjPpfhPafGmOTpya0qnfqCkV8UxYslk+fOkc8JquUxObDallXK/R7
 /lKiMhto7KJrg==
Date: Thu, 3 Aug 2023 20:33:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [v3 2/3] ASoC: mediatek: mt8186: correct the HDMI widgets
Message-ID: <9c90185c-9cd4-4a08-9925-be5d460af54d@sirena.org.uk>
References: <20230730180803.22570-1-jiaxin.yu@mediatek.com>
 <20230730180803.22570-3-jiaxin.yu@mediatek.com>
 <25e6ab45-ecad-4bc3-bf4d-983243c939ad@sirena.org.uk>
 <c6ae8630d06138b6d0156c19323afebf0718f522.camel@mediatek.com>
 <089fe457-1c61-4b7b-ad37-a67e7f46cb56@sirena.org.uk>
 <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="+mbNnAHmVhFc8DSv"
Content-Disposition: inline
In-Reply-To: <6aa6947865795fc534b61f5b8a80b3c42fd5a0cd.camel@mediatek.com>
X-Cookie: One Bell System - it works.
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
 Allen-KH Cheng =?utf-8?B?KOeoi+WGoOWLsik=?= <Allen-KH.Cheng@mediatek.com>,
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


--+mbNnAHmVhFc8DSv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 07:20:15AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:

> I agree with you, in fact the speaker is indeed doing this way. But
> about the hdmi that on the board, I did not find a defination link
> snd_soc_dapm_hdmi, so I use snd_soc_dapm_line to replace. The purpose
> is to control it link speaker. Or what do you suggest I should do?=20

I think the sensible thing here is to define a DIGITAL_OUTPUT() which
can be used for HDMI, S/PDIF and anything else that comes up and isn't
clearly wrong like reusing one of the analog descriptions is.

--+mbNnAHmVhFc8DSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmTMAPoACgkQJNaLcl1U
h9CWewf/XtBsII8aM+PvwnIJ4Sr4fN16oOfY1UY32SAMvG5kfv55GzqucnYVEkQW
a1Xs2el6AlSouSelQ12FvpaBAXjHAlQpyUoMwI0BYjncBoJ1aHZEGgwE54710y5H
eRQmJH2oarBgD4MbO5N1pqUVbajjCg4mtU61yWgPhYlniAMILOmzyF5jxcpE7EET
7cd0djgpIZHR/osfIG3EA7WQKjuZyMtB/0YKncA1qRoUP0pqZQfetbeHqtchfqJy
3YvmkidEFoaROm7dSZWbNImhDbRVPNal4iot/8JUghN+yo867eidr/0i1kgzgJ8j
+A+PCUclKZDIDoGbmL2M5hlTe+Ihbg==
=3kqt
-----END PGP SIGNATURE-----

--+mbNnAHmVhFc8DSv--
