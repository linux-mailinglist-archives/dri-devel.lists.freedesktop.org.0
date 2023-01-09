Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBF6662918
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F85810E0EB;
	Mon,  9 Jan 2023 14:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8330B10E0EB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 14:53:47 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B6D3D5C0180;
 Mon,  9 Jan 2023 09:53:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 09 Jan 2023 09:53:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1673276022; x=1673362422; bh=QciqPMt30o
 n90W28hjb2NoTG2mZlRXSPXuQjKaOTVB4=; b=WFfRZOTcYBwENwciHWTcb4Oytr
 5NM28Xvmbk7hvEi4DpaD81PB6RUp8KVsPah+DkRHs3DjENmbv+APFkbj1r9A5gNx
 QjMIskTB2B2t9ANbocJWpybbsjztX87sjxvJTqFiJ/ChrRAj1W5vOs31Z850atBX
 jarm0FBw2di5gjEoqnf9uEbV+jv7eNMdR3REufEtQsCF1NXRF8SwIV6zJbh2P9ww
 5cQd0gj7f7KGhGMOUTXyV3FlKLY+Dj5+UJWWljECnGvkYcnv+u984FextJ7v5Mcy
 4GcLsN8RchJjsS53fnbCXYkIMalGA4UA0W8dYjNfDXijQnLSRril23PqEBvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1673276022; x=1673362422; bh=QciqPMt30on90W28hjb2NoTG2mZl
 RXSPXuQjKaOTVB4=; b=Q4pVF8Mzit3N5aT7pLXywXH8gR70xs1Ii6HKRN3bUifk
 d1btHDXHCWciDNdfMEmVYGQOwx0hRBtRo1MaydaOyalOWfUC33NKGE6p/AjwR+sc
 CeXis2J3FMdeRqEM9U5dldiDUTCVXVyObfvbCG6lAse3iCALQ2bCM32fC94pl/Ee
 nqxihuApt0TQTLANOQrnkKhwfmOrsRj0C0zf9/2kZ1tOCNQetuyjmDCc945xYOuz
 F2lekDjXrVJZmGqFQsW1CcBG8VH2hY5bOZdyt2gWiYGADmg4zkbApzXw1yBRq85Z
 WlszQCGVeHu9cMG1ZZmhiK1QQR6jM3O4ixv2EeHFrg==
X-ME-Sender: <xms:diq8Y74-23zDaE3-4ay_GJOCyi1NTy197BsH7g7YCV42rdokP9hByQ>
 <xme:diq8Yw6H1gbc1FLY6gv1qqliPFU76t25LiNp6unltpQy9pb89Wualc3wIX17sjr67
 -y41mj1HS-4if9B3V4>
X-ME-Received: <xmr:diq8Yydt9kKWzYj6GPUhUj3j_cev6BmbNZU_650w2SbgZXXxKiDPa7sbpio3SzHaKbCkLNwj2XMnirz4CX6KFxcBVInTsobYD22vsaSrHG7mAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrkeeigdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:diq8Y8Lv1J8N1RblKkZYKrpoxZP1wg01Yw-1FdJ1HMjBqHTkjV6bpw>
 <xmx:diq8Y_IlLtxweXvTu_wvnrJ2ikyBML9gbl2J1rojSH6lXLoS99F8Yw>
 <xmx:diq8Y1wwvI2CdJgK_Y4rina2r0ad8sL1G9cqV-0_cBvnkE9iFxjbbA>
 <xmx:diq8YxiIlTn2T51Mo5MmXbBGmiThoWGAil0G8qA0lV_Q4EBOmWfbHA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Jan 2023 09:53:41 -0500 (EST)
Date: Mon, 9 Jan 2023 15:53:39 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Emma Anholt <emma@anholt.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH 00/15] drm/vc4: Misc fixes and improvements for the HVS
 and CRTCs
Message-ID: <20230109145339.jmfudgzeieli4dag@houat>
References: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kcyeoxrcvr7eycnz"
Content-Disposition: inline
In-Reply-To: <20221207-rpi-hvs-crtc-misc-v1-0-1f8e0770798b@cerno.tech>
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
Cc: Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--kcyeoxrcvr7eycnz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Dec 07, 2022 at 12:53:11PM +0100, Maxime Ripard wrote:
> Here's a collection of patches for the HVS and CRTCs that fix a few
> issues (with DMA accesses and timings, mostly), and add a few minor
> features.

Applied to drm-misc-next

Maxime
--kcyeoxrcvr7eycnz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY7wqcwAKCRDj7w1vZxhR
xY+iAQCF9wOT1bkXkvMrl4/WMDrJPj+sYq7J6Kw1fnjG4UCCwwEApT3I83FEal/n
o/LK+MaTALaegveZ12/iozZHPSbxmQg=
=jQ6u
-----END PGP SIGNATURE-----

--kcyeoxrcvr7eycnz--
