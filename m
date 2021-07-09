Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 386023C1FFD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 09:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 623B56E9C0;
	Fri,  9 Jul 2021 07:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBE0C6E9C0
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 07:24:59 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z9so6571954ljm.2
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 00:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=v4Y7Y75b+/zQ8ONB6CRkPYT3gGf1WHJZwOXDaMU12sk=;
 b=p/bXWXucPYAL/B+DZNp/e0edv7FtSuLM+NS5FvPFDmYVqLtj+efSXs3H4hnUYNFcpt
 8PndW042WIJLTTmB3J6sfcZWdFDm96SfYe9dbTh8t3NN3aAXI2Xi8VE/SCMSYzeUkyhO
 haAwiTM2gKo9IStRt1oyvW7RP3qcxJ+Q1Gi+auFlQDTwy+1+FvuYy1NXBsRcNC+LAQi3
 JOhve92NzMo8RFhgFEmRV97Ex+5EXOB6lo9tGYB0iuv0KWDXPiSSNokyB6O2bEM1tLz1
 iO1x0w4tFHxxQ58ApuhnHsTrhtcyugG0pievveuZpqi/q7PEqfu9g5fokOX8OAchNIz1
 KkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=v4Y7Y75b+/zQ8ONB6CRkPYT3gGf1WHJZwOXDaMU12sk=;
 b=czalOZXSsYHD3MdIlat6ki9T1hj7WJM+UrTq4Z0fy77EDf3H1oAZL6GyObt2N9Ga1y
 h7erCx7s7iYaKbiFG4ySKQjTEfvlDz2XjrgNr0qDbaBhnB47YcHEWpaXQY3bdLJxi3uT
 7hf86ov66zF8Qa1FRbyKAA0Oc7f7aZC4xKnvoSQJmPBB2mGXJgR2NyUOSdMO7um7FCjN
 vQyRXCZ/QLTtwwpnXn4DtHYW2BLLyshpTnyt3YHzfYnwLBSnhMfHlMUSqpXV5s332PA5
 SPauIdQ4ddCw1ts73kDeOEgf/xOAkZdl2wu6Giuy7Szlj/djAfarX9JXTiIBELBaLtmY
 b86g==
X-Gm-Message-State: AOAM531R14RDdfkaOnTfqkPRzKN/5UXUlnVQsezyVMXJW/4i7tIVhPip
 CtVnpcLWjVhplKmZ2eatVGo=
X-Google-Smtp-Source: ABdhPJwO/A77CTQzPMUiuTwiQpVIM+Rmyeo+tKs4S4dSAtBHSDqtNraWwbosLoQe5DKXX1SURNFeRA==
X-Received: by 2002:a2e:1447:: with SMTP id 7mr18760431lju.104.1625815498188; 
 Fri, 09 Jul 2021 00:24:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f2sm392068lft.225.2021.07.09.00.24.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 00:24:57 -0700 (PDT)
Date: Fri, 9 Jul 2021 10:24:44 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v5] Documentation: gpu: Mention the requirements for new
 properties
Message-ID: <20210709102444.7a72a029@eldfell>
In-Reply-To: <20210706161244.1038592-1-maxime@cerno.tech>
References: <20210706161244.1038592-1-maxime@cerno.tech>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/lKQpGfP3g_qZ9ySMVoNCeNX";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Edmund Dea <edmund.j.dea@intel.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Russell King <linux@armlinux.org.uk>,
 Melissa Wen <melissa.srw@gmail.com>, Eric Anholt <eric@anholt.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Steven Price <steven.price@arm.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Jerome Brunet <jbrunet@baylibre.com>, Paul Cercueil <paul@crapouillou.net>,
 Marek Vasut <marex@denx.de>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Qiang Yu <yuq825@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kevin Hilman <khilman@baylibre.com>, Tomi Valkeinen <tomba@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 NXP Linux Team <linux-imx@nxp.com>, Chen Feng <puck.chen@hisilicon.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Ben Skeggs <bskeggs@redhat.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Roland Scheidegger <sroland@vmware.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Alison Wang <alison.wang@nxp.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Chen-Yu Tsai <wens@csie.org>,
 Sean Paul <sean@poorly.run>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Huang Rui <ray.huang@amd.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>, Jonathan Corbet <corbet@lwn.net>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Robert Foss <robert.foss@linaro.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Tian Tao <tiantao6@hisilicon.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/lKQpGfP3g_qZ9ySMVoNCeNX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue,  6 Jul 2021 18:12:44 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> New KMS properties come with a bunch of requirements to avoid each
> driver from running their own, inconsistent, set of properties,
> eventually leading to issues like property conflicts, inconsistencies
> between drivers and semantics, etc.
>=20
> Let's document what we expect.

...

> Changes from v4:
>   - Changes suggested by Pekka
>=20
> Changes from v3:
>   - Roll back to the v2
>   - Add Simon and Pekka in Cc
>=20
> Changes from v2:
>   - Take into account the feedback from Laurent and Lidiu to no longer
>     force generic properties, but prefix vendor-specific properties with
>     the vendor name
>=20
> Changes from v1:
>   - Typos and wording reported by Daniel and Alex
> ---
>  Documentation/gpu/drm-kms.rst | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 87e5023e3f55..47994890fd1e 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -463,6 +463,36 @@ KMS Properties
>  This section of the documentation is primarily aimed at user-space devel=
opers.
>  For the driver APIs, see the other sections.
> =20
> +Requirements
> +------------
> +
> +KMS drivers might need to add extra properties to support new features.
> +Each new property introduced in a driver need to meet a few
> +requirements, in addition to the one mentioned above:
> +
> +* It must be standardized, documenting:
> +
> +  * The full, exact, name string;
> +  * If the property is an enum, all the valid variants name;

Hi,

"variant" feels a little off to me, I would have used "value name
strings".

> +  * What values are accepted, and what these values mean;
> +  * What the property does and how it can be used;
> +  * How the property might interact with other, existing properties.
> +
> +* It must provide a generic helper in the core code to register that
> +  property on the object it attaches to.
> +
> +* Its content must be decoded by the core and provided in the object's
> +  associated state structure. That includes anything drivers might want
> +  to precompute, like :c:type:`struct drm_clip_rect <drm_clip_rect>` for
> +  planes.
> +
> +* Its initial state must match the behavior prior to the property
> +  introduction. This might be a fixed value matching what the hardware
> +  does, or it may be inherited from the state the firmware left the
> +  system in during boot.

I'd like to point out that this rule should apply also to
properties that already exist in general, but are newly exposed in a
driver for hardware that didn't expose the property before.

> +
> +* An IGT test must be submitted where reasonable.
> +
>  Property Types and Blob Property Support
>  ----------------------------------------
> =20

Regardless of my comments above:

Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/lKQpGfP3g_qZ9ySMVoNCeNX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmDn+bwACgkQI1/ltBGq
qqeUOw/+IJDPAd/pNbohxB+6S5FFsAOYOUdd4tNrxxDrsJVxW8T9QQM2byBOlq2I
8sgo80RlrwjZDFRx+APmsAm+O1CNjjOzkjUaw1Wwd2h5VkRUs6YYOk/M9ma/MnkV
hHAUJyKZDlYpteFZn20CVBXr1oYVVOrSaoUvfHsjBaoIsSu7hgaBuk+K3r7zsxNx
NFiXgdJyeCzTqcbtHZ1M8CLnvkkhV0bWKSoFSfs8jiH4m4SFFN6qx/A+6m0jND47
I5ZYgN2MAroBBjfMdtWiJkLDmlD6rgyFSh/jnjVQTgKilwEaUItFdCxM2dG5q8S7
+Z6p5T2tIxeGurwC5Fpw9K8pWcCzQrgp+xgUgEv3EEnEE0D6+IpxPXz0dpUjdVaX
r1+7e2HTQ6pZ+qnBBnkYIbFzWcVCsNOZJdEUJrNtAfmNKjjmQIodwMBsf+NDkR1Z
Z/4UsKvaOSphp9XDZbsZWz6mIdi9ZESC8yFVXHvzLe64ZAPHgN4jKGWDzTMAwU5V
HUiiWRbE9goFYZVajbth50dAaP1VeWodqImJiiXmGspGRMOBMcwJTumyk7QsSg5e
IWfgtphLG40Dhq1zUJB/TkyHk11L7V231QwbVvrXPmkssmBhbjtJDrRm+M32BsWl
2SgQtsacV0bK35S25pDZZkOs+1zUEqIbX1LI/SSX/epeIyz3oLg=
=BPFa
-----END PGP SIGNATURE-----

--Sig_/lKQpGfP3g_qZ9ySMVoNCeNX--
