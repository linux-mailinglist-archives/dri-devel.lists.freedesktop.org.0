Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA93534C3B
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 11:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0151F10EF0B;
	Thu, 26 May 2022 09:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B434610EAC8;
 Thu, 26 May 2022 09:05:38 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 2492E5C00E0;
 Thu, 26 May 2022 05:05:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 26 May 2022 05:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1653555936; x=1653642336; bh=pFj+7WO1SOJz0ZXjigSsoFbHLjS7TjhY+yv
 REBYg6J8=; b=fYqBH5IfvkB3qu1T0bzOyOP+miDiSriLbrNGHjncVzoO+/ECh31
 bgY2nWPPdKyt0RmO6hAT5X9x5y6/PDc8L+/Pvtj1zhk9ctXCDtmo4gjCQgT5aMZJ
 mlcpe2c6VI+YnyyOKCEnjheHfopE62SKErm0LHI7dMJl3ejdXsBk7cmzU15dNHdc
 e7P+IXDcGUfJpPQcU12m/ewSXq4qTrdcK2yE0urHt154JyZl6Cd+lTIb/fM/Ritw
 N3CNPA5MECOTT2CbctGqGN06l9FTpltnssdkMis74RQmvlfhfR9GunoIa8YjEsyb
 CotTNySuCBTyTFOs30r/kWHhtcz13fcDAzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:message-id:mime-version
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653555936; x=
 1653642336; bh=pFj+7WO1SOJz0ZXjigSsoFbHLjS7TjhY+yvREBYg6J8=; b=e
 /3rr5Gjy/Bycch+dvWMi1X8ikNEoQX7etjr0T46ypxXr8c0I/cnXWbL2nxja1O2M
 8fv3P3/fKb6NJVAAdmeWBPR0aiWpQ9VtZKgPtFxdUIg02Rbm6dBz38ho77nEicAt
 yi3QQCgVAmLw+LoHnMF/md/8n9WV7UQG86fFPYGT2Gd5fDvXZ+IvAiOz16Knr/eP
 cqApw/kelWDzOMKPRkBL989bk+Sr31w0/eScikiB4f9eTCH1fd493zaZ/Y1lkW4q
 4JD1uKPpojj++BdedsMu0JY14kpApEYqiCVFj1Fm3aMbwgoK68z6A/kH1hi+NgYm
 rJT9zIGms5C4DhctAcukQ==
X-ME-Sender: <xms:30KPYjYOs-0RXxDqQE41tlNMnjPPFD5ukmn8um-1FLnyISrQlgeQ4w>
 <xme:30KPYiatv0nGajRW2vDKHDV-KjBY3iR7olp187erdkgLrHTtobjQqj0we2FFkuWkU
 IG0AFJYhEk2fJNiQtk>
X-ME-Received: <xmr:30KPYl81lSZNS2JjnNv-a78yDXAFZuWnpgVmxJK_k02QEUsC1ng10tbhpsUzswhngHjW_Z_MwP7unWLkea53azqgOB1mqMP53YLkDiY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeejgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepueeiheejhfeivedtheduffdttefgtdeuvddvueegtefgveegvedugeffudevjeei
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
 vggthh
X-ME-Proxy: <xmx:30KPYpp_8lWNcaMff_mfPmwXvvbTHtj_MWRSXBe93BbIWrV0YL8vhg>
 <xmx:30KPYup0IOEGjA5spiwUuuEeoYi2KhBmhesXaWU8fmRKx0zxQOuVCw>
 <xmx:30KPYvSfejj8asWvKNonopByLu5-nElj_Ryc3ujEcSG6bo6fIJ3KjQ>
 <xmx:4EKPYrgVlrTLX6t5GXT_HCp72soRjZ_8GRAY3ZtalCG1ljiF0UdKSw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 May 2022 05:05:35 -0400 (EDT)
Date: Thu, 26 May 2022 11:05:32 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20220526090532.nvhlmwev5qgln3nb@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="32d6m4fojbj5xljq"
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--32d6m4fojbj5xljq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel, Dave,

Here's this week drm-misc-fixes PR.

Maxime

drm-misc-fixes-2022-05-26:
A use-after-free fix for panfrost, and a DT invalid configuration fix for
ti-sn65dsi83
The following changes since commit 6e03b13cc7d9427c2c77feed1549191015615202:

  drm/dp/mst: fix a possible memory leak in fetch_monitor_name() (2022-05-17 15:56:18 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2022-05-26

for you to fetch changes up to 6e516faf04317db2c46cbec4e3b78b4653a5b109:

  drm/panfrost: Job should reference MMU not file_priv (2022-05-25 09:14:22 +0100)

----------------------------------------------------------------
A use-after-free fix for panfrost, and a DT invalid configuration fix for
ti-sn65dsi83

----------------------------------------------------------------
Marek Vasut (1):
      drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid

Steven Price (1):
      drm/panfrost: Job should reference MMU not file_priv

 drivers/gpu/drm/bridge/ti-sn65dsi83.c   | 2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c | 5 +++--
 drivers/gpu/drm/panfrost/panfrost_job.c | 6 +++---
 drivers/gpu/drm/panfrost/panfrost_job.h | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)

--32d6m4fojbj5xljq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYo9C2wAKCRDj7w1vZxhR
xc3zAQCNGP7xktDmUynaCW84jLAqAQlvKYnXqVxXEwDhq6iM9gD6Ar0h9oD5O+Sv
lniSFuPd2MnqHp0khJmKYZgTbEdRnwI=
=K1ck
-----END PGP SIGNATURE-----

--32d6m4fojbj5xljq--
