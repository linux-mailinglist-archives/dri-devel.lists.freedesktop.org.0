Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784523BC861
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 11:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD00389D02;
	Tue,  6 Jul 2021 09:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEEEC89D02
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 09:15:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6AFA45C015E;
 Tue,  6 Jul 2021 05:15:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 06 Jul 2021 05:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=48vfVUC0kax3M2am+zLH+pUycfW
 DdICUD8aQ9fF4L6o=; b=aVHqpnJ1+5By/6nnWox6m+pTsSy/MY8Y6f2ZOjRLKZX
 1Nv7dqrhClG1bmZgeRxRkAIb5Zp3GDhQykyG1dAFpzrZs0jo1aUp2L3GgXw+Vs/p
 CPV19bOFcq1J5S5O+EYrKnx4uyL6kocIGPk0BN49lFyYDNzLUhaCDjO5XEQZaJN5
 ddw1TTUmjNYztjxUrKzX5ev3Xd4hwVZFmY6cHuMFuqJiFQKxMlgDiaddT8cFLb7p
 kk595jXJsmYXa9UJjeJFIY1ZAxol6AiNv30939EDn2s2RNZUVxoNG1sA06hIkxhx
 byUcrBSEQbOyIi+U1Hh7CvgNMQQmkF2l2+mxuT64RLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=48vfVU
 C0kax3M2am+zLH+pUycfWDdICUD8aQ9fF4L6o=; b=ff1+7Iz+J36EiOzgMJPfth
 duJzJ24FuEMCaGcwm+/t75epGmkuQmcLRolbVQYydJFyYtbLqM3l8YchX5c3IBcP
 PCHqIldStLjUa2KfFmzx61zfFsPFiOIzmGxXZTRdNTBTU7xqlRE1OE1vEpS9iBQZ
 DGu+zr7WOdCfpupiEGAhefniFxbljaJZVImNBgIJMVf6w16OkTYHMQ1JGTi/N5ZG
 gWw5qiL1gaqdaV2XtQvfJF8qZqlBE4SxJ1VRS5tYrc/uE6rpRdQALwOq3b4FgG7b
 s26CdAOb/ARIBttlXAEwGPSKexXN6rQdbGSJKcy789oUED+WCpKXaoHxQ7xnazlw
 ==
X-ME-Sender: <xms:OR_kYD3C98irnpTSJZogm39l6GRREOl2pnvadsiHWekihbcB1TJQug>
 <xme:OR_kYCGeMmgsO59vLdcSC6B8sGypuDq56gXdigKnLFiNjqGAwOUUAPqxkYo94P_Ib
 ff1cdI9EHNHf29KQTI>
X-ME-Received: <xmr:OR_kYD5SazNhB--FiuF7Bq6udRZxv1Felkkwx0QhWqWIOtunUanGuyD7-FovnPSsGBr27PspsUj5c5Dv7ZON0TNafE8m1I-4mhYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejiedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtvdenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvgestggv
 rhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeelkeeghefhuddtleejgfeljeffhe
 ffgfeijefhgfeufefhtdevteegheeiheegudenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OR_kYI0koSq-GldDyWYV_n5gTtbyVIqpNy-x7-OtsKu7Dxw76qrYrQ>
 <xmx:OR_kYGECsyE-NZu9d6ZPPsxnRCHqRsJKTlEtOZ04ZgUAmAFvlG-Zdw>
 <xmx:OR_kYJ_Frf2j23PV6vr9n5RthLuMaM6Ejex7Vm4JVkyLTFw5Nmu7ag>
 <xmx:Oh_kYDMA-ubPTmPS3euDhXImj7YCK-KpyrYlSKSwLhCQ0NJZXut54w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Jul 2021 05:15:37 -0400 (EDT)
Date: Tue, 6 Jul 2021 11:15:35 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>
Subject: Re: [PATCH] drm/vc4: hdmi: Limit noise when deferring snd card
 registration
Message-ID: <20210706091535.vstqragvgj7upspg@gilmour>
References: <20210629121723.11523-1-nsaenzju@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lkfucjtgrfhp3gma"
Content-Disposition: inline
In-Reply-To: <20210629121723.11523-1-nsaenzju@redhat.com>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--lkfucjtgrfhp3gma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 29, 2021 at 02:17:23PM +0200, Nicolas Saenz Julienne wrote:
> We don't want to print an error message each time
> devm_snd_soc_register_card() returns -EPROBE_DEFER, the function will
> most likely succeed some time in the future, once the missing resources
> are available. So use dev_err_probe(), which will redirect the messages
> to the debug log level in such case.
>=20
> Signed-off-by: Nicolas Saenz Julienne <nsaenzju@redhat.com>

Applied, thanks
Maxime

--lkfucjtgrfhp3gma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYOQfNwAKCRDj7w1vZxhR
xWMuAP4r6Wvi1HAnDqMSYIt0qoz1TV1NnQxzcM7Dl2gpIi8sKgEAwYd6ZGeDAvhT
haavcV61qlzcNE/nqiUsJxh7CMCS4Qg=
=guzd
-----END PGP SIGNATURE-----

--lkfucjtgrfhp3gma--
