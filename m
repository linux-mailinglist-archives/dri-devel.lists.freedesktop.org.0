Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F864A4075
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 11:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE9310E2FA;
	Mon, 31 Jan 2022 10:48:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C0010E2FA
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:48:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AA1905C0050;
 Mon, 31 Jan 2022 05:48:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 31 Jan 2022 05:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=cB0UdAZLA+Ryz57KzkoCiOSoqqVgKLnfbj9QjK
 VynrI=; b=OHd4hyvZz6q63zzT7slzk+mtayAolizArKYwZSaUXz0PhxexT2Elsn
 ecgRr79agomL4Gd5IidWFdKMGRJ7chgIX3RTNP0rFIF8GxbiMSBsjwZQh03GK0L3
 S/omj2JxZubsR7cWsOxCOJ91Kn7gjBKzWMcMpY84tlryS64d4fr4I32YHNKS5m6v
 uPt1jODxdw2EZNO+OZhtRR7hnOEhZS0WHcUYBqvuOxbymlwO06jl7HqqPmlr6lAE
 /uFO8gkNXVicwe48AxSoWSVdhVwm23VGj2+KrTc+kIKzIGXyOKftmSXjf/+van0E
 KEAwE9i58fHTNKq0QVmCvhQUBwEvECqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cB0UdAZLA+Ryz57Kz
 koCiOSoqqVgKLnfbj9QjKVynrI=; b=UGuJXokRWD0pu8GTMISI09GvpqBO2Pi3V
 lMI67VSC0HAuirObZ0vk12T7YA2uOIhla5jPyFGMJQkqSbcqmv8DR6gzWwGr5c5g
 ddMqr5pUIrMzvX8izjAEr6IXjA94TbcjmorCPJ5RjOc2SnolnOWOfO6CnySvUNs2
 uCsCwiUS6IJTgoX/pkLTxOsgIedaFuWIJvQML7S/ujn/XI056qI09ZmmjqXanL7v
 uxAW3n8DWMNPAYIg4Ci1JJFvqA6135CfknbkNoeDg6XVIa/+TsMZeHbWH7jVpdEF
 xFJuCO/baeMsdfc3XT+H/LLcLVOn90CDpF/H9wl+6nshOaVTEejAQ==
X-ME-Sender: <xms:hL73YX2mu9W3pwmTZg0ZUi6pE5IC1AYFl7p6FDvVU-60XOfOguInkQ>
 <xme:hL73YWFNrMGdObuLLvvP7KxxBqnWhw6D6WhyY8-fE0-hhENVCvw2fFc4ySyn_W58L
 pbhnkocjFCvD9gOUPw>
X-ME-Received: <xmr:hL73YX5wrq7FIpcCVtDaOqHDAJrTTgo9u1nzwLnwczziFI4ACdWQ7vE5bmM4lqIek0Q0ytAj0DptJQtCYFUTBeaSIeb716jgfVhFxwk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgedugddvtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefgleduffdufeeuhfeltdekteduvdefheegvdejgeehvdevtdeuteehlefgudek
 vdenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpkhgvrhhnvghlrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hL73Yc2FYlYWh9FKrWSupuXLlB5ZCnU-ATq35otHJ2WxTvIx50urNw>
 <xmx:hL73YaHqaKdKgDXbiB186t5zZM-abM8n421J7f1nXjUc4Y3X_xsgiw>
 <xmx:hL73Yd8oy_UxGm3h4tTwtir5td_jaBXCT5RLsikfsIExnseWAZV5pQ>
 <xmx:hL73YWhXXC4xxRa2rtGIKgzgU8KsUuBcbnUDj5r6lIiqVojWfZrRDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 31 Jan 2022 05:48:35 -0500 (EST)
Date: Mon, 31 Jan 2022 11:48:33 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Michael Stapelberg <michael+drm@stapelberg.ch>
Subject: Re: Linux 5.16.3 breaks headless Raspberry Pi 3 boot, again
Message-ID: <20220131104833.n7lr6u2idk66dcko@houat>
References: <CANnVG6=ERdWhbEsNKY4r=QNmaUWPeqcQ9fwWa05SyuT8ETeFHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7mqiuic3effc4p7d"
Content-Disposition: inline
In-Reply-To: <CANnVG6=ERdWhbEsNKY4r=QNmaUWPeqcQ9fwWa05SyuT8ETeFHw@mail.gmail.com>
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
Cc: Felix Kuehling <felix.kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Emma Anholt <emma@anholt.net>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7mqiuic3effc4p7d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Jan 30, 2022 at 03:57:07PM +0100, Michael Stapelberg wrote:
> Hello again,
>=20
> I am facing the exact same symptoms as last September:
> https://lists.freedesktop.org/archives/dri-devel/2021-September/324008.ht=
ml
>=20
> =E2=80=A6meaning my (headless) Raspberry Pi 3 B and Raspberry Pi 3 B+ no =
longer
> boot with Linux 5.16.3, while the (headless) Raspberry Pi 4 still boots.

I'm not entirely sure what you expect by insisting on things getting
broken *again*, but we got it, thanks.

> This issue is not fixed with the latest Linux 5.16.4 either.
>=20
> If needed, I can git-bisect it, but perhaps you have a hunch already?
>=20
> With 5.16.2 (working), I see the following serial console output:
> [    2.493456] fb0: switching to vc4 from simple
> [    2.500306] Console: switching to colour dummy device 80x25
> [    2.507204] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
> [    2.517617] vc4-drm soc:gpu: [drm] Cannot find any crtc or sizes
> [   12.517962] vc4-drm soc:gpu: [drm] Cannot find any crtc or sizes
>=20
> With 5.16.3 (broken), I see:
> [    2.485311] fb0: switching to vc4 from simple
> [    2.492167] Console: switching to colour dummy device 80x25
> [    2.499148] [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
> <boot hangs>

I bisected it, and it looks like it's because of a bad conflict
resolution in stable.

The original commit is here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D20b0dfa86bef0e80b41b0e5ac38b92f23b6f27f9

And the stable commit is here:
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=
=3D9b0d360fd783c711fc1cafa51f3e03bdf8ca5518

For some reason, in the stable commit, pm_runtime_put ended up in
vc4_hdmi_cec_init while it should have been at the end of
vc4_hdmi_cec_adap_enable.

I'll send a patch to fix it.

Maxime

--7mqiuic3effc4p7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYfe+dgAKCRDj7w1vZxhR
xYliAP40k9IdKqyfV65pNYM/TwBJNmJ4wY5v/QhMxsaFFPOXFAD+N02xH6U/Uqv7
I+26orEjs/xy6npuHysRlAPgG0XO7Q0=
=DQic
-----END PGP SIGNATURE-----

--7mqiuic3effc4p7d--
