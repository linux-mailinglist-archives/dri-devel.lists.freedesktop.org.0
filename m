Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03707645E63
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 17:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4CF10E3E2;
	Wed,  7 Dec 2022 16:09:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035CE10E3D9
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 16:09:09 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9EBF05C00C5;
 Wed,  7 Dec 2022 11:09:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 07 Dec 2022 11:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1670429346; x=1670515746; bh=ePiFaAZEFR
 enyhut87vXtT1VURQsa6DlTygm+3oJ7/M=; b=e1HMIc87pD384xZByeYqNg/ZAh
 gr65INu4vf4oJrWOZrhFY2Vl0gF80tCztW3+Ffnn8dFwxlBD95gDl1tRs2pKKp1a
 DnGIJd1tZ8e1W1/eA7dzoalAhL8xqhcjy1vi5ejNlbRX5BGnXllSPecU6y1/aZhm
 I1XRh6aAMhYoWIm1vOWrOcNnDuymhJ1Ph2B5G99N0hR4iY3tIBkUQ/5lTVZ+YrQQ
 YE0wwYl5o2tn/IFf91ko0UrxT3TE4ZPk3WIl6TqO/rd19Kliw9IwW0FrjV+cRWwa
 Ujo9EHw70Y1/52SfU2cr1SRtmBRmVrsnO3ehUw5VkhZ6zSfsUfIcW/6doEdg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1670429346; x=1670515746; bh=ePiFaAZEFReny
 hut87vXtT1VURQsa6DlTygm+3oJ7/M=; b=LdzTw4aZ/kt4X6IImJlP3ksCwOVdl
 Ys3MIN8KhN6o2Gk6ojUqb6b/x10F6lrS/UzGlmJtAwza1pjrbOJJZYNClEEljvxO
 5hYhyDtYQNG4FUZytVgXuGL/TFd7wzfbjy/vogUMx4zOoAchxfTEkCkaYyKX3kTa
 +aV4Y9SRgYpgfRCpqwbIzlCadnPQOl/C5ZV8FFadfqxzGwW4hb/2hfgYjJPH0jAE
 Nh+8RkHqg6ldqvbf5k3fDBVUue42DkOxwsPhdnhBHJNOOk/3kduVvXi8YOTRhINg
 ow2eZXqc3prYrxoxVvnOdleKJAH1cW7ajw9xJx/1T65eKroDR52cNOlbA==
X-ME-Sender: <xms:obqQYwiJG-K2QtpKS1RcF7ZUuZLzl4KKVqvuhnp2ZH6kPyyNvTeP-Q>
 <xme:obqQY5CkLI7K-rJxmZXbH2iG-kIJL6HqIScKVSkQf8pAdoVbAFfgPikAZNfVW4hwX
 otMobTSp000sNIAKKc>
X-ME-Received: <xmr:obqQY4HJ-zCrF_BCqFSBdtz0nbP--pHIIOwlm8Eb4vDCa5UkeKLN9RA1YLXGDFlOuW_UbqnS0YUodH6OnmWLI16ARvUMw2nF-exNnfkA0BmYPw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgdekgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefugggtgffhfffkvfevofesthejredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeevgfeiffffhfeugedvvdffgfevhfelgfehueeujeeiffejfffgleelvdffgeek
 keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:obqQYxQeDvhNyt79wzVERZEmyuwqlSwYGpzpnLoB6oMVaO0l-cu0ag>
 <xmx:obqQY9yKvJscHN4ipwBw-VpdSlGPb-gd-bDte33gycSEy7NJM-Ln5w>
 <xmx:obqQY_5jv_-XBv9yIFM4TZBwgS2IFrXDvRp8frmRZiPv4QvoG8w8vA>
 <xmx:orqQYyKIMsHDYpbxxPBlp_2tCyErVI0k3FUI8tGqqGlCT1FvFptsxQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Dec 2022 11:09:05 -0500 (EST)
Subject: [PATCH 0/9] drm/vc4: hdmi: Broadcast RGB, BT601, BT2020
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFC6kGMC/w3LMQrDMAwAwK8EzRXY6lDob2xL1IJYCVKSJeTv9X
 jD3RDiKgHf5QaXS0M3m8ivBVov9hNUngZKRJnSB31X7DwUdey+XTLEjsA3S26JayFuMG8tIVi9WO
 tz27muz/MH/1M6O2wAAAA=
From: Maxime Ripard <maxime@cerno.tech>
Date: Wed, 07 Dec 2022 17:07:44 +0100
Message-Id: <20221207-rpi-hdmi-improvements-v1-0-6b15f774c13a@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.0-dev-8c583
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=+UYnhY/6PaZFnwphH8Un4Aub16IYYcWepXdKpJUFoY4=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkTdgXV/nv/82DLqX1nl7WzSRt/8Fi9yu2Aou2JF3OaW5ew
 lh3w7ChlYRDjYpAVU2SJETZfEndq1utONr55MHNYmUCGMHBxCsBEVjkz/BW+0BgtmPzB6rkra4DF7X
 SD48Y/TvyR+7tet5ptTuIHpyeMDEuyeHMcUmK2fPv83WOTbsxt25lGrqsmPzpgeG2K8Ez5s7wA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Here's a collection of patches that have been in the downstream tree for a
while to add a bunch of new features to the HDMI controller.

Let me know what you think,
Maxime

To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Dave Stevenson (7):
      drm/vc4: hdmi: Add Broadcast RGB property to allow override of RGB range
      drm/vc4: hdmi: Rename full range helper
      drm/vc4: hdmi: Rework the CSC matrices organization
      drm/vc4: hdmi: Swap CSC matrix channels for YUV444
      drm/vc4: hdmi: Add a function to retrieve the CSC matrix
      drm/vc4: hdmi: Add BT.601 Support
      drm/vc4: hdmi: Add BT.2020 Support

Maxime Ripard (2):
      drm/vc4: hdmi: Update all the planes if the TV margins are changed
      drm/vc4: hdmi: Constify container_of wrappers

 drivers/gpu/drm/vc4/vc4_hdmi.c | 326 ++++++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  21 ++-
 2 files changed, 289 insertions(+), 58 deletions(-)
---
base-commit: 99e2d98adc738597abcc5d38b03d0e9858db5c00
change-id: 20221207-rpi-hdmi-improvements-3de1c0dba2dc

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
