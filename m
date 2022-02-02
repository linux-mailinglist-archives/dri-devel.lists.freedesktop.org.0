Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0FF4A6FFF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:31:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541FB10E304;
	Wed,  2 Feb 2022 11:31:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE3F10E2BF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:31:35 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 168362B00949;
 Wed,  2 Feb 2022 06:31:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 02 Feb 2022 06:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=s+xzvHlh5mml7Y
 epjnQMHIC86SIHC20vVql/uYjQsSI=; b=HqO5YJBpXUdEVM3OC0JD7cnoQXtL2U
 5XYV6/ILtpYHhITzZwjyg/6oPIh201uveyOhRfsEfx6XvTcK4WZXb05D6Dm7IqhG
 YICSWmdEI+E2A5ft1Xw6KI8FwB00OckhAQR0nvny/jGo+0EfQf87maHxqL6Oe6At
 JUcAOxnDqYZvBblBII/EVgxMFsht700O0qLrh5426vb26idMF5w+Xrd2dG9ky+mN
 YumA+XVZpgMtbwVlCJ+0bnMEVbsd0+RdOr95eSQqp74puKvTaT/zKhW5DCFAYMRf
 9pSDB7rM4pXsjon6e/GHvpy/EpQtWudxtRY/NoJM0PdHk2SqqpDpCHcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=s+xzvHlh5mml7YepjnQMHIC86SIHC20vVql/uYjQs
 SI=; b=m41hyTiTMtqWUuyooz2/wKDf5xEh5yyJ7z8sS14WmLgr9RSghA/TnciXE
 6U5lLeKUgCacrmwt4mUBmoJwncqu+kPhkjh5aQOuWfCJsaAjhzEitWK3ljeSbGmp
 82wsuNvqgan+hMOmYn4h/m0R/XZGW8r/HetnB3dTy6Mt0nplBT7shHFx6CS79mY+
 54bA9w0IVw4rTYppwt3Hy+8Zhkx8+tFbFXYXABpd4paQq4jWYGXV61W+Uwx3WYml
 +u5fnuvNnDGjHLwNRdWGOGdQiP8croahNGvM/Zhb9fRsLUYLx7WtZOBa9JbKz4FJ
 TavDjimST4Jg/OJ77aslL5TtmfklQ==
X-ME-Sender: <xms:kWv6YbCpOWwbjo2fEEuZPQXR6fWs8WJ1txn3dnI23fPvR_jEq6BtYA>
 <xme:kWv6YRh8NznxWsAQ0qT2a5VakvdP6rhEGxnbBiBpTPUyyd_ed0xtLh1qh1gWdi2o1
 RYsPJ-ST-5zYXxEbzE>
X-ME-Received: <xmr:kWv6YWm-nWM_bt1-HKUi0q0IXtnpvYgFdHhaqec5bvACze8gY3lsuD44_1voiOzGykZEhEfStHDo6MwtJ9AIE_N6Uz7gG4w6BdAI5Lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeehgddvlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepgfejtedtjefggfffvdetuedthedtheegheeuteekfeeghfdtteejkeeludeg
 vddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:kWv6YdzU6_6XRI4ekXyhAC8YzPWi1m1xNUunpLwP_xM4f5se8A8_VQ>
 <xmx:kWv6YQQOu6pQ-o8B5aZQ677z9Y2qiH_PDo09C_Wv5_V5NMXjRAbgAA>
 <xmx:kWv6YQYs06Q3gCfuX_p_bffS9DRDIzXjyoge9q2TNCQJjM_hV0gSyQ>
 <xmx:kmv6Ydj-2Ue1nKfs8umtoxrCpvUcJB1846mQ3s7l53Sz1eZ2oWHDrrYys-k>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Feb 2022 06:31:28 -0500 (EST)
Date: Wed, 2 Feb 2022 12:31:26 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 01/21] MAINTAINERS: Add entry for fbdev core
Message-ID: <20220202113126.3rgzqkhnorrbfj6b@houat>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
 <20220131210552.482606-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220131210552.482606-2-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
 Sven Schnelle <svens@stackframe.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Claudio Suarez <cssk@net-c.es>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 31, 2022 at 10:05:32PM +0100, Daniel Vetter wrote:
> Ever since Tomi extracted the core code in 2014 it's been defacto me
> maintaining this, with help from others from dri-devel and sometimes
> Linus (but those are mostly merge conflicts):
>=20
> $ git shortlog -ns  drivers/video/fbdev/core/ | head -n5
>     35  Daniel Vetter
>     23  Linus Torvalds
>     10  Hans de Goede
>      9  Dave Airlie
>      6  Peter Rosin
>=20
> I think ideally we'd also record that the various firmware fb drivers
> (efifb, vesafb, ...) are also maintained in drm-misc because for the
> past few years the patches have either been to fix handover issues
> with drm drivers, or caused handover issues with drm drivers. So any
> other tree just doesn't make sense. But also, there's plenty of
> outdated MAINTAINER entries for these with people and git trees that
> haven't been active in years, so maybe let's just leave them alone.
> And furthermore distros are now adopting simpledrm as the firmware fb
> driver, so hopefully the need to care about the fbdev firmware drivers
> will go down going forward.
>=20
> Note that drm-misc is group maintained, I expect that to continue like
> we've done before, so no new expectations that patches all go through
> my hands. That would be silly. This also means I'm happy to put any
> other volunteer's name in the M: line, but otherwise git log says I'm
> the one who's stuck with this.
>=20
> Cc: Dave Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: DRI Development <dri-devel@lists.freedesktop.org>
> Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
> Cc: Claudio Suarez <cssk@net-c.es>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sven Schnelle <svens@stackframe.org>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

Acked-by: Maxime Ripard <maxime@cerno.tech>

Maxime
