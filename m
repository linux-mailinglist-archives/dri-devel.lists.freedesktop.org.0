Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D915964280E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 13:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22C410E1E6;
	Mon,  5 Dec 2022 12:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE0DF10E1CB
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 12:07:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 95371B80F91;
 Mon,  5 Dec 2022 12:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08C2C433C1;
 Mon,  5 Dec 2022 12:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670242050;
 bh=K+Dd7xGXTDkGOUmFSn+Tmrppo1MrzYY2Lk+azYRrNIg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m1gkj5247+U4OLnyaCx2lbX33R9pdpFcyuxaNcBbQzKrA1hlMuZw7xpg76kPEO27x
 kUm7v+2SXEaVcuxFuOz86wLmKDzu8jfpk5jdqtYWWkq/1y7iJm+ITBsy+uOXINE5gg
 D/IlOVOJUaYUQqS9NqMbjywD7kVo4V0mpp0VNEChvkZSJhIffAXsFnv/ZjJ1haKzM9
 xB9L/3UcEy78yD/SaFiHTyYNCWOhT+r1FIFXZsC54p7ttrL5HoYvAjVP1FUBxLIid3
 K9TQjW0zvBmMidab5XPUhSr1LVM/uw0Gh5Vounv45TXpabRWy0RSWfyiqpbjOyX1cI
 LMBCv/rdqg6ww==
Date: Mon, 5 Dec 2022 12:07:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu =?utf-8?B?KOS/nuWutumRqyk=?= <Jiaxin.Yu@mediatek.com>
Subject: Re: [PATCH v2 1/3] ASoC: hdmi-codec: Add event handler for hdmi TX
Message-ID: <Y43e+EsNCrCpZSIH@sirena.org.uk>
References: <20221125094413.4940-1-jiaxin.yu@mediatek.com>
 <20221125094413.4940-2-jiaxin.yu@mediatek.com>
 <Y4Cysgk5Gic5ae9B@sirena.org.uk>
 <18c82f6f723cd97a9d6b9a7ff16c6ed62fd005d6.camel@mediatek.com>
 <Y4Y/vEWe3dw0FPQH@sirena.org.uk>
 <cf9ea98a3263ffb8fc8b542888ad0ad680facfc7.camel@mediatek.com>
 <Y4jHAJgmz/P58Q/C@sirena.org.uk>
 <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2Zxw/Hvoq9IhDAxu"
Content-Disposition: inline
In-Reply-To: <7023a2c7b471d6888d9079563a6c01f22599201f.camel@mediatek.com>
X-Cookie: If it ain't broke, don't fix it.
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


--2Zxw/Hvoq9IhDAxu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 09:34:17AM +0000, Jiaxin Yu (=E4=BF=9E=E5=AE=B6=E9=
=91=AB) wrote:

> 1. I have added a DAPM widget that is "SDB", when we open or close HDMI
> PIN_SWITCH, the callback 'hdmi_tx_event' registered in the widget will
> be triggered. Maybe you mean I shouldn't use SNDRV_PCM_TRIGGER_START
> and SNDRV_PCM_TRIGGER_STOP?

No, I mean that if you want to control the enable and disable of the
output path you should implement a DAPM widget.

> 2. If I don't use hcd.ops->trigger notifies the bridge ic driver to
> switch the audio, which ops should I use?
> I actually want to know hdmi-codec.c and it6505.c except
> hdmi_codec_ops, is there any other way to communicate?

Like I said you should use the event on the DAPM widget.  This will
require providing operations for the events to the drivers.

--2Zxw/Hvoq9IhDAxu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmON3vcACgkQJNaLcl1U
h9Cbhgf+LMvcJgTpZwsDot1swl9dxC4R5KoASnnVtW3qUnTy6RJishGkt+FKlLX8
aw/XM5uZSMX1WA040KY4LRSrz/jSPdW2esD5PxtNo7+z87LmRi/AL9539cd8zu89
jNhbtBAQDyiNp1Y5mNKjEoL6wCbFS7Zt8XMnXHxddRKZClHNgn1q5/ZbfkbNP++Y
zsXuNSRUT4lzbBlfe2tRMJ1mPdz2R1Is+7sbNZIPIU4t741icrKukcCYPOuYfQeb
38OZ3gVyERI/AIfp7P0X5SLklXuTFFxAhbg617Bp254suyarICucIyvSvp7iTNxq
hg3akba+kzI36lZ6YuhE4NvJC589kQ==
=lrjL
-----END PGP SIGNATURE-----

--2Zxw/Hvoq9IhDAxu--
