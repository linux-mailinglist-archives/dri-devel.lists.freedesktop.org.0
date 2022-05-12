Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B6F5247A3
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 10:08:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F5A10E0AC;
	Thu, 12 May 2022 08:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C27010E215;
 Thu, 12 May 2022 08:08:38 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A01F05C018B;
 Thu, 12 May 2022 04:08:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 12 May 2022 04:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1652342917; x=1652429317; bh=e3zvtlZZgp
 P3opYYwBrzo7Xj3xYhujuBf/aC3yTsqys=; b=P1EzjwR/vkjKjkQ2qG2EVZq1ps
 iYP4H3kDUIBkOzetX56Gj2zriFor9Y/xn4WcxrNwnoozQRQr2jYAXDEECXtHmzgr
 i3nYQoeZf7B8i603P5nBhEGet9KMZOxg3KirHIoiyf2galSEeJmUtC9KFSPez6l5
 sd4kX/LAhY6dz/t0DK/kInBMjyx48fsASE8/0+J/g8CIimEZIoA1FkICuSag8exY
 9KsFrPhCR9eonBM+VefYfmhgGA2grwkiqwPSpJ6TpAroF4cJOlCxctRNBm10D98F
 hGZh6wDW8Xj7F+XC9jqOD+0Zg27BFNj3KVB5wBlYtFUKaK2y76fHYpTa6Hxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1652342917; x=
 1652429317; bh=e3zvtlZZgpP3opYYwBrzo7Xj3xYhujuBf/aC3yTsqys=; b=j
 RiXl7v9yzuLZEJqYL5Yt/hzaUhpT8nN3dhYgeib1GuTcBKf6unDXATd1Ccog8+w+
 y2B3/ey+n9KzM7csukde3KvhrhVMI2cLS0zG8zP1pmgHAaWN36pM2/X9PToZpgEk
 S+CO47tStv6cQHQQ6Z6emMdOPtaTcwrY5xaZlyVYRa0LB/2J/P3kWhkVFMFCaI/Q
 buJTsErKIMtWkQ0JsmKc4hQy/8seuyc1w3TaOqRLF18G+PoAyGv+WLkdWUYQaUX0
 drfnndqFmTvl8DrjqEVZ1wXNEMpgr5GY/201wwDXuBH1dBb7DjI0linYc20j9ZQE
 AIW91sxKIiAnkjO4uK2HQ==
X-ME-Sender: <xms:hcB8YkMnge9q0Ajqs2vvaa01rHt-OHo_T1Kwt7NQBeBesuoX4sDyfw>
 <xme:hcB8Yq8F_paOZmSIZ12MpD0KjBqn9xSn2o4pmQzLqmf6_XuUk6JrDdbvoyzgfhRnG
 OJlMKOjdLuEuBcv3cM>
X-ME-Received: <xmr:hcB8YrT993mFa5HAouLZMaR-aSMNd9Njh8L0HRMNW06LYhmedHa-XEM-m8bXHgbCcEuoceuVGGbuMyZkofxGDyPIyBOmpgyqe-wPRzc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeeigdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpefhkeehfedthfejfeejtdfhvddvueeigeejjeeuteegveffhfffgeffieeu
 ueduvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:hcB8YsspWvsNT5ADsCN5mJzInbUUcC_gypndMg0FmzcxPOnKrwdG4Q>
 <xmx:hcB8YsfxV9QgZN5txg6agV66Ehmgx7U0IUPBhIusEEYwjsSN43UBRg>
 <xmx:hcB8Yg1YBWPsXRteoeVV8Ho5EdWsZa_Si6m5YzmWzvDuZKaU3E5t1Q>
 <xmx:hcB8Yi0f3YJzpJ-Oyh_pbFsityuautnOSyQlIZ37vXgI-j0nzzyayA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 04:08:36 -0400 (EDT)
Date: Thu, 12 May 2022 10:08:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <20220512080835.oy6cvqycgsfsjcly@houat>
References: <20220331152021.2671937-1-daniel.vetter@ffwll.ch>
 <823b3f2c-b624-f7a3-8bdc-4c069571c810@quicinc.com>
 <CAF6AEGvLY-+v0ZCvtoZDsW-0z5a8UH8suN9cp22m_ec=Ggb9Mw@mail.gmail.com>
 <ec74f2f6-488f-bc34-3d9a-3e1cec68aedc@quicinc.com>
 <CAF6AEGsoXYRB_sTMAp92ph_DetGfSaHwv+2xMS-CT3rgixN4fg@mail.gmail.com>
 <0e957a37-87ad-4981-01c5-287c4b06afa3@quicinc.com>
 <03186a69-0ade-7f8d-4b8b-46f525bc0cb4@quicinc.com>
 <CAKMK7uE2APz6ow+qSZ4xfLTmZdHZJe06X1_4SqWXdMOWByckyA@mail.gmail.com>
 <20220428080847.nbolnkxemblz5qer@houat>
 <YmqEBB1m6W3XMwsR@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="pyaxx6vcdg2jdru4"
Content-Disposition: inline
In-Reply-To: <YmqEBB1m6W3XMwsR@phenom.ffwll.local>
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
Cc: Rob Clark <robdclark@chromium.org>, Kalyan Thota <quic_kalyant@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel@daenzer.net>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--pyaxx6vcdg2jdru4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

An update on this

On Thu, Apr 28, 2022 at 02:09:40PM +0200, Daniel Vetter wrote:
> > We integrated this in the (downstream) RaspberryPi kernel, and it seems
> > to trigger some weird regressions:
> >=20
> >   - If we move the cursor under X, the primary plane update is stuck:
> >     https://github.com/raspberrypi/linux/issues/4988

So it turns out the upstream driver doesn't seem affected by this, but
only a downstream alternative.

> >   - Switching back and forth between VT gets the kernel stuck (with a
> >     locking issue in fb_release?)
> >     https://github.com/raspberrypi/linux/issues/5011

And this one turned out to be a separate issue fixed by Javier already.

So as far as I'm concerned, this patch seems to be working fine on vc4

Maxime

--pyaxx6vcdg2jdru4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnzAgwAKCRDj7w1vZxhR
xRmUAP9gyrp/Aj/5NDiw5nVrmVFu4wFB72A3XdKVeMaXaZ2msQD9H3kP2u/U8cP6
igZxLkbJY3X7qhMosmVoTGdZyFwEzQo=
=mOcg
-----END PGP SIGNATURE-----

--pyaxx6vcdg2jdru4--
