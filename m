Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D210371262
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 10:20:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A1C6E882;
	Mon,  3 May 2021 08:20:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574186E882
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 08:20:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.nyi.internal (Postfix) with ESMTP id B6EB0580BBD;
 Mon,  3 May 2021 04:20:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 03 May 2021 04:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=ZZbw4zaMizJrDrM1TjO6/6x5vgu
 yIVzvER1Undjdu/I=; b=Bcsr3W3Gqk0ypd8Zdc6LIqxdAWqQOLoyBNDbhzPyPFT
 ivyPg0TCCln1kmTpGoENRBweah8m8UXclRPTCbznej572MsSINCFpqWXQExHntvg
 z3rptIh7re/fAPEUOKOwnjI9sHflXVrtegVx7hsdSdh3aMJlHgtDBOOrQbSlqEpa
 VUASdwwGySbA/lGmV/4PpBNGWDrmEtHGt+zHXAfW9fC+PpvT6+N/DDVjv8IsSzhu
 EHqd3j5KG0ZlbvWzWcedMZwlkMqdLmiPuU6W9P2s4VwzyEvEZMliWjyNyEhjjUWk
 UXrcUdsGIjPlgIw/Pikh9O4sFfc1LAWNSkQqLEfY+Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZZbw4z
 aMizJrDrM1TjO6/6x5vguyIVzvER1Undjdu/I=; b=e0zX+A4VgmfixaP+9SwceH
 8dWHq/maRcArZax5k5Mu7N4copJnf/CGXeu3DFZHRBtcXd6RnLgxIdbzGmE33/HI
 a/sjlcm07J2oapmvhp6yjbSEyARNUHfVpAN8oaTVKD9BuW9t3ENZGaWJp/287vC3
 HYWWU5X8lyqkhIU8Gb8lkganCI+Qn8vDvCkrB7M7LJ3iXo6UiLaV61dcI47s6ubQ
 nEh9+k1JtU4wUEniqOUUsY66WAOqjNotLHxRZ0IaiNINjHVVKGN9C6bzeprl/Yoc
 4v04r3mRV3ml8VFwZOwpFCIp7Yx31LcgJioKeIdvOpP28Qa+AYDvQqAqZp3lVxOQ
 ==
X-ME-Sender: <xms:MLKPYOBVzmY1SV1QLZroe0AUdjwebPxv5VGN0FThQfbGgx5_09aISA>
 <xme:MLKPYIjsd9keR74cb3dzO0CUjnhiPexLLJKb1RwgxyqS7td0UXBHB3eZO-Zo0B1bp
 U180Do29T0Ni9JWlP0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedgtdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:MLKPYBk-Uku8MnewArZF-5vCOoIIuHYeRZ124Zkq_GhZm7a6I1_ECA>
 <xmx:MLKPYMxSviduytGs5zKnNdieSu66vVjUjtPbSWkPWDUWDO0uwa2dQQ>
 <xmx:MLKPYDRNwGJnpWcTnLesrE6tHMyRIb3I2dNKbPZ-xQ7kJnX9pdkl_w>
 <xmx:MrKPYEDkFe29yEP2v37YHxsY7jHufsiPt4mR8AR5m74xGSYrvMG3mA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon,  3 May 2021 04:20:00 -0400 (EDT)
Date: Mon, 3 May 2021 10:19:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH] drm/msm/dpu: Delete bonkers code
Message-ID: <20210503081957.qj5kdbrk7y4dnhid@gilmour>
References: <20210430171744.1721408-1-robdclark@gmail.com>
 <CAE-0n513cwqs1c89PZpn0ojuDQ44nwxbRfaYssKHcGwKxK8JdA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE-0n513cwqs1c89PZpn0ojuDQ44nwxbRfaYssKHcGwKxK8JdA@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-msm@vger.kernel.org,
 Hongbo Yao <yaohongbo@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Qinglang Miao <miaoqinglang@huawei.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: multipart/mixed; boundary="===============0121502207=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0121502207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="33yimouztyqtinrp"
Content-Disposition: inline


--33yimouztyqtinrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Apr 30, 2021 at 10:44:53AM -0700, Stephen Boyd wrote:
> Quoting Rob Clark (2021-04-30 10:17:39)
> > From: Rob Clark <robdclark@chromium.org>
> >
> > dpu_crtc_atomic_flush() was directly poking it's attached planes in a
> > code path that ended up in dpu_plane_atomic_update(), even if the plane
> > was not involved in the current atomic update.  While a bit dubious,
> > this worked before because plane->state would always point to something
> > valid.  But now using drm_atomic_get_new_plane_state() we could get a
> > NULL state pointer instead, leading to:
> >
> >    [   20.873273] Call trace:
> >    [   20.875740]  dpu_plane_atomic_update+0x5c/0xed0
> >    [   20.880311]  dpu_plane_restore+0x40/0x88
> >    [   20.884266]  dpu_crtc_atomic_flush+0xf4/0x208
> >    [   20.888660]  drm_atomic_helper_commit_planes+0x150/0x238
> >    [   20.894014]  msm_atomic_commit_tail+0x1d4/0x7a0
> >    [   20.898579]  commit_tail+0xa4/0x168
> >    [   20.902102]  drm_atomic_helper_commit+0x164/0x178
> >    [   20.906841]  drm_atomic_commit+0x54/0x60
> >    [   20.910798]  drm_atomic_connector_commit_dpms+0x10c/0x118
> >    [   20.916236]  drm_mode_obj_set_property_ioctl+0x1e4/0x440
> >    [   20.921588]  drm_connector_property_set_ioctl+0x60/0x88
> >    [   20.926852]  drm_ioctl_kernel+0xd0/0x120
> >    [   20.930807]  drm_ioctl+0x21c/0x478
> >    [   20.934235]  __arm64_sys_ioctl+0xa8/0xe0
> >    [   20.938193]  invoke_syscall+0x64/0x130
> >    [   20.941977]  el0_svc_common.constprop.3+0x5c/0xe0
> >    [   20.946716]  do_el0_svc+0x80/0xa0
> >    [   20.950058]  el0_svc+0x20/0x30
> >    [   20.953145]  el0_sync_handler+0x88/0xb0
> >    [   20.957014]  el0_sync+0x13c/0x140
> >
> > The reason for the codepath seems dubious, the atomic suspend/resume
> > heplers should handle the power-collapse case.  If not, the CRTC's
> > atomic_check() should be adding the planes to the atomic update.
> >
> > Reported-by: Stephen Boyd <sboyd@kernel.org>
>=20
> Maybe better to use swboyd@chromium.org for this one.
>=20
> > Reported-by: John Stultz <john.stultz@linaro.org>
> > Fixes: 37418bf14c13 drm: Use state helper instead of the plane state po=
inter
>=20
> Should be
>=20
> Fixes: 37418bf14c13 ("drm: Use state helper instead of the plane state po=
inter")
>=20
> to match the preferred format.
>=20
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
>=20
> Otherwise looks good, thanks.

Thanks for figuring this out, I've applied it with your chromium address
and the proper fixes format.

Maxime

--33yimouztyqtinrp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYI+yLQAKCRDj7w1vZxhR
xZRaAQDTPjjiUQFAFWgbNS7oRz3zrty/Iml8Ny6hby1mPZ/NFAEA3T3YH0IJPL4s
Nx3/uC0n+0PWb2Dr5NHA3d2sPNWRwQU=
=D+EX
-----END PGP SIGNATURE-----

--33yimouztyqtinrp--

--===============0121502207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0121502207==--
