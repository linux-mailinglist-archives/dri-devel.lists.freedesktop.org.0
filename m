Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA8E371281
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 10:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3477B6E88C;
	Mon,  3 May 2021 08:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984FC6E88C
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 08:38:30 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id E34795C00DB;
 Mon,  3 May 2021 04:38:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 03 May 2021 04:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=XePrDHmVDuQmEnp3YloftgYSyhQ
 NZHp4o4AFNZYrKgY=; b=lrEsUS7bfT5m3JOHIo5645Ys+D5TFeL1OLyJahfxqSv
 hX32gnDcrmE8rGsmbLlhWexz75N/+1wYL/YHZxvW77c144W7CPftMyC7b4XUMm/x
 1gDWaPaFLHNkucW31mozNngSVjQ9IjEK/Ql4HlqvDEpc4rSr9uICFTm6x0O3SvBs
 th/vb2x4btMmGlbLJKx5K3mkg/wbMnWENICx0uad3oHNZZ0DIq+GzkxJi6vd42Fb
 nmHrKu9rQ1QQIIOWnBluHVr2+1yCAhDEs2ImBeDu62ZLjYD2wKXWVE7RsqgpBdB8
 dtQsbzZG80PPnw0oyMG02d3vxsdBH5SFAoLviHh96ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=XePrDH
 mVDuQmEnp3YloftgYSyhQNZHp4o4AFNZYrKgY=; b=RpbkTezwGGoHqrIrWmLU8W
 IxCrYFVUgTWBHk+pDzXuUqTx4AQE555cRJQVCJZ8bq/neTk3O/rHZMDuUSVwp/I8
 0x0G6nyVjJQrD1ekcsBHNFSL0BBIEXze97Hx6NvQfcADPvIpbs18mi/HBH6yUR9x
 AIByABCPJmW56bBWdALQksn6GYSW5RzqqLXdqm29FYhc7MQJR7CfROt7vASuuLkX
 o8UstndCsNyIYTDzx/Yto1MyeTuEf/ECbWJznjbG1BeFNCJdhWiL7ixkiDFmKC3B
 JMcbiFdqyLFvAPsDs2PVVXLds1+2wTJkW6No7+g8upWP5NencrqwpiO37LlvhY/Q
 ==
X-ME-Sender: <xms:hLaPYMDQHF_5o1MpccfSDye1tXWYHLNCXYuOOZLcz1_APhBGO_5GeA>
 <xme:hLaPYOh9x5v3bh84D6_2g85WH4-yJkyW5LZvZCzHnjyQcKmN-f-bTh4u0jn4oTRgm
 5v7-IGf7w4FpeJQW7U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdefgedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hLaPYPljT8jgH3k1gOTuuyVyjcdvVgKyXEC8QSu5ruLUz_TknCqzzQ>
 <xmx:hLaPYCyzDvrTyxIrS_k7pagRqnggKU9S-DsiYttnXDvqvWEfxoVlfQ>
 <xmx:hLaPYBSWDz6qVXvF7EAWd1FtzdMW0qBVE2WsZRD74vfbtxafsQvN6g>
 <xmx:hbaPYMfR54dK9MVODyb_7z8NdVHYsOw9NEf02tk5J96M_Am308efpg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Mon,  3 May 2021 04:38:28 -0400 (EDT)
Date: Mon, 3 May 2021 10:38:26 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/7] drm: Completely remove struct drm_device.pdev
Message-ID: <20210503083826.typdxnos5rzz6uff@gilmour>
References: <20210502104953.21768-1-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20210502104953.21768-1-tzimmermann@suse.de>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1956064147=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1956064147==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2pzfvj73aa6zubm3"
Content-Disposition: inline


--2pzfvj73aa6zubm3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 02, 2021 at 12:49:46PM +0200, Thomas Zimmermann wrote:
> The pdev field in struct drm_device was recently moved into the legacy
> section. Remove it entirely. References are replaced with upcasts from
> the structure's dev field. This change only affects legacy drivers for
> userspace modesetting.

Reviewed-by: Maxime Ripard <maxime@cerno.tech>

Thanks!
Maxime

--2pzfvj73aa6zubm3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYI+2ggAKCRDj7w1vZxhR
xed4AP0ZKHCcGMyoVr6h0UPaoMpYuM2BEoFScTl0n8MQO3xX3AEAnJj1MwUQ6kN9
c8ctJAp2wVuDS1xccCWJY4224r27xwY=
=H3K6
-----END PGP SIGNATURE-----

--2pzfvj73aa6zubm3--

--===============1956064147==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1956064147==--
