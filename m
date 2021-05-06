Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAA63753CE
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 14:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 321A96E1B6;
	Thu,  6 May 2021 12:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2FB6E1A2;
 Thu,  6 May 2021 12:27:30 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id EFC991348;
 Thu,  6 May 2021 08:27:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 06 May 2021 08:27:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:mime-version:content-type; s=
 fm2; bh=q8B+vZ1RaQwIDXA2UKboHPzi0f7eIEk3tS+3zLZuRRk=; b=IH72N8ob
 oxiW7yD+OXcxDnd+PY+BEzHejaqBFo69toknkjCMu8F0pTr/jujHZiSZ539ZoblH
 NEc4zgGfZxSYDoDIbtOyt++oJKFRPhc20LZTfMKfsZnQcFCtsbQpvqhMQIG8BOrh
 /oNcKP0prQDLMJ4wLi0fATaG82z27SpL6chaNBoMRxly6pWvIIAqECRKPLxj6UWK
 9OI6yBohe0goWkAr+SBXs3Q3M89QFMXJoJKvsYXwgtPbCYp9U0q6m11FaBnNwR2+
 nucRl5d8SnajkulsaA65Q1glt8F8rn9ZBws6Q0slGqVjvaJotazfG5RU9RPog8tX
 twcN6mllJkDVpw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; bh=q8B+vZ1RaQwIDXA2UKboHPzi0f7eI
 Ek3tS+3zLZuRRk=; b=prkb+0rw6S1pnmbiLHOZ24/Wo7YbRHp6t274Bht3QlO+K
 cpo+geJoK2QcTcOg6NAT4rIKABll0+KH1nW8xyuo9n20dcSG6LdRHaQMy5scQeq/
 wLvbhKJ5HxFp6h/ssmIgO+JjOrE0QTPBM8/ptu4tZzwwPoIqN9cIsmnSMkWnCLka
 7jkPvMCHq23nyWob9E3SgrQLmCzSm14S3rzMNskSlWWXNffbnqsgaIsbtTe1dVIm
 VAorHL6IVWyljWOuwYXbnFwzHw05qdxcETPIX4/QWbEDCbJ0oX24UPumaoZTnBYe
 nhYG1nrAU3MC96JG3X9uoxOqnR3r/LshzCShk/c1g==
X-ME-Sender: <xms:ruCTYK1shZVyZe_iB-MfaDfvHWAOWBwUuH36D7z7wu5jCg6aIONgCQ>
 <xme:ruCTYNHP5AYvs3LYgPPnP6pjotYdrT_f3wN2q3INowk77NIOn6iNFaqhvSq3V2LPo
 vRVeOMw3v_iHC9Jl7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdegtddghedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepgeeuvddtheeggeehhfeigeetffeufeelveeggfekveegieevudeljeeugedviefg
 necuffhomhgrihhnpehfrhgvvgguvghskhhtohhprdhorhhgnecukfhppeeltddrkeelrd
 eikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
 mhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ruCTYC6aLkwa4NgUuoWh_LS_sQp_Dquc6OlwqXIe2T94Xl_JWliEaQ>
 <xmx:ruCTYL1lqJkeCiX8fF9cA0-t6uRDTH0qSsYsYO4G3TwhcWKhzXFkJg>
 <xmx:ruCTYNHjmqRZqG-c7Fq5CBvIrT_y4jkF7Vtn1OvGMUMf7Yx1aiVWgg>
 <xmx:r-CTYDZqkAlvp0XxZ_1K1y6IOuLE_toOPsL9IJgVp7EJAYhtEftzSZmKk3s>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu,  6 May 2021 08:27:25 -0400 (EDT)
Date: Thu, 6 May 2021 14:27:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20210506122723.oqadel7oacazywij@gilmour>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ktbagld6jtfqj5ie"
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ktbagld6jtfqj5ie
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave, Daniel,

Here's the drm-misc-next-fixes PR for this week

Thanks!
Maxime

drm-misc-next-fixes-2021-05-06:
Two patches, one to fix a null pointer dereference in msm, and one to
fix an unused warning for in fbdev when PROCFS is disabled.
The following changes since commit 74deef03a44ae77db85dd80e7ef95777a902e0b3:

  efifb: Check efifb_pci_dev before using it (2021-04-26 17:33:03 -0400)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-next-fixes-2021-05-06

for you to fetch changes up to b9d79e4ca4ff23543d6b33c736ba07c1f0a9dcb1:

  fbmem: Mark proc_fb_seq_ops as __maybe_unused (2021-05-04 17:12:37 +0200)

----------------------------------------------------------------
Two patches, one to fix a null pointer dereference in msm, and one to
fix an unused warning for in fbdev when PROCFS is disabled.

----------------------------------------------------------------
Guenter Roeck (1):
      fbmem: Mark proc_fb_seq_ops as __maybe_unused

Rob Clark (1):
      drm/msm/dpu: Delete bonkers code

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 10 ----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 16 ----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h |  6 ------
 drivers/video/fbdev/core/fbmem.c          |  2 +-
 4 files changed, 1 insertion(+), 33 deletions(-)

--ktbagld6jtfqj5ie
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYJPgqwAKCRDj7w1vZxhR
xQpiAP0YIjBiORMdtWazp1SYhKkxfs7L58zH/QGBVl8E0o5MTQD/ZGGbiKw7q7Lw
idapLLprqVCrJ0Nu+u5DibooXTh5igo=
=OAZU
-----END PGP SIGNATURE-----

--ktbagld6jtfqj5ie--
