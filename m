Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C506C2142
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 20:23:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E242310E2F0;
	Mon, 20 Mar 2023 19:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090A210E318
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 19:23:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84053614D7;
 Mon, 20 Mar 2023 19:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA516C4339C;
 Mon, 20 Mar 2023 19:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679340218;
 bh=ViTQxxdOJRkEYRhUQiCnCSf76pBDaRupx7wAVZ5N4kU=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=mNHEkg4rI8+eTJxg8xl9tYA1okQDoNFYyWIwPQuZepEMna7anDcr175IR+jDPqNF6
 x0h7Uq16GME3vP5BTK0jEACnpsAr+lj//BrzlRJ5ZxbIRLP6XzYG8rDrSpdne8eD5Q
 plKubbDmXKWoMdtBJoUaLWw3btAOMJuyi/zx4jldli8jJGl9yMmWGaULWBIc/TEuwb
 KQ2WOOr74x5coeADDgqXJOHYH4OkhxSMOCIUiRKsu/m55ZXHIHAONQbNp2FVRfXBl5
 4Rpk4Dz3BFW62mnIWYReuuY3A40clwUJI9iezi7zKntIm8dUBn1haD31ci3xZl3q2J
 NGvIoFw831Emw==
Message-ID: <5ace543cae7a54db399750a1b330c3ae.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e8f50fe8-bad3-e59e-4d80-e2f7db9c9933@gmail.com>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
 <20230317150916.a3xrh25ywe5k77yp@houat>
 <e8f50fe8-bad3-e59e-4d80-e2f7db9c9933@gmail.com>
Subject: Re: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
From: Stephen Boyd <sboyd@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>
Date: Mon, 20 Mar 2023 12:23:36 -0700
User-Agent: alot/0.10
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Matti Vaittinen (2023-03-18 23:36:20)
> >=20
> > I think you would have an easier time if you just copied and renamed
> > them into the kunit folder as an preparation series.
>=20
> Yes. That would simplify the syncing between the trees. It slightly bugs =

> me to add dublicate code in kernel-but the clean-up series for DRM users =

> could be prepared at the same time. It would be even possible to just=20
> change the drm-helper to be a wrapper for the generic one - and leave=20
> the callers intact - although it leaves some seemingly unnecessary=20
> "onion code" there.
>=20
> > That way, you wouldn't have to coordinate DRM, CCF and IIO, you'd just
> > create new helpers that can be reused/converted to by everyone eventual=
ly
>=20
> Yes. Thanks - I think I may go with this approach for the v5 :)

Which kunit directory? I imagine if there are conflicts they will be
trivial so it probably doesn't matter. Have you Cced kunit folks and the
list on the kunit patches? They may have some opinion.
