Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61121454418
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 10:45:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 620466E92D;
	Wed, 17 Nov 2021 09:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914896E9AE
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 09:45:41 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id EABB258082C;
 Wed, 17 Nov 2021 04:45:40 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 17 Nov 2021 04:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=fXxmxjVhepE3q
 cmVUCO3YDZGl3sBQb+VLzlC1ueEruI=; b=aV7TsN/agM/Qts4UAGFskyaoBOsl+
 qpM+Pr7NF2zPCrOR6LE4lTdBDtPDenq/3YZu41bgwb3rwVnso4pBi38fdqAs9fbf
 ozV04fYANr4Ox5Sqwvig717Z7IcAYnAuGuG29KDS4PW7rc1nlp6IoHIxmrkvqd2h
 Ip04J7Qdqz5JS0EqNlW97NNf5lZnBt4bxrifAtNOW4kgvPZlbZJdUsz5sv66TTKt
 BaH8yt7X80nwUQm0yG+lhzbJZ7OL/VSZdsZoJlwRhDL8f6gKAZgBfug7z7fTe7K/
 efn8sM24xCBvjxXP8IYKfSXGP8nLFbrqlfafX7gynTZv32cIuPevjMjHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=fXxmxjVhepE3qcmVUCO3YDZGl3sBQb+VLzlC1ueEruI=; b=V8vFjbmb
 +QeklnjJp1n9iY08MqJVMi6a4CW2Sx6U9wnq3oHhHorx4U9RS9m5b6vYTWzDPHQb
 kw6S5HsKWIkdp/lDM2Ue8vHrnmLtiBv4VW6SgpIA1x0YK5aACCerPsjLNBjlB0MM
 /+Ns8p3Wm6wfPkvM/KN56qpRXSAg55nBqebD1+5REjEXCMmvVFxBpXpagYjFJv9j
 dcd/7mi9Ve44bJ5HL6yLGk9T8wCTRtIVEmNXJ4X1juDbZ1x2ugWCpB2dP5iFIvvz
 iVbfpGM+T0Mr6+z065NtGKaR+ATEVy9TE3DF1e1Kthw0AYuDosklL8EywxrzXgks
 kAER1tm3bB5O8A==
X-ME-Sender: <xms:RM-UYVr5YuSxVmhWbUG9zfMBUFQ969n2BDEaSH-Megr4AhYQDqhbGg>
 <xme:RM-UYXojGV0pkznfScvDqXZxiNFquq10m2g-b3bmenpdfjQF8IdVS1f5GYndHmju4
 Kr0sV247itOBYBkGfA>
X-ME-Received: <xmr:RM-UYSMPbLGSJ3BSILLehRi3XrPYeMdvNJMH5J0GiMTFG86o921TtYhSCZPNUwVr4oj5ASIdFpLcHJd30oj04m3KwzEg8mT9JELztC5KwsY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfeeggddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:RM-UYQ5QwzNkHQFld2SerWPzqc7KYV7LPcz6P2rqGy2D0eJtR5j96g>
 <xmx:RM-UYU5uQbHrZk82ALS-OhoVak2IaDhzAuwRGu8HL_EQE-C631eIfw>
 <xmx:RM-UYYinxBYFXHA5T9JqfU4qp8LapXt-uC2mYoa8tBQETnqgvlDxqw>
 <xmx:RM-UYVGQpE4F7OENBxW8Nm_Ve3LDgQrHCmanxHoM2ZXxU2fRYwPEKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Nov 2021 04:45:40 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 4/6] drm/vc4: kms: Clear the HVS FIFO commit pointer once
 done
Date: Wed, 17 Nov 2021 10:45:25 +0100
Message-Id: <20211117094527.146275-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211117094527.146275-1-maxime@cerno.tech>
References: <20211117094527.146275-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jian-Hong Pan <jhp@endlessos.org>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a
commit") introduced a wait on the previous commit done on a given HVS
FIFO.

However, we never cleared that pointer once done. Since
drm_crtc_commit_put can free the drm_crtc_commit structure directly if
we were the last user, this means that it can lead to a use-after free
if we were to duplicate the state, and that stale pointer would even be
copied to the new state.

Set the pointer to NULL once we're done with the wait so that we don't
carry over a pointer to a free'd structure.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 7c1d0c3beba2..f80370e87e98 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -379,6 +379,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 			drm_err(dev, "Timed out waiting for commit\n");
 
 		drm_crtc_commit_put(commit);
+		old_hvs_state->fifo_state[channel].pending_commit = NULL;
 	}
 
 	if (vc4->hvs->hvs5)
-- 
2.33.1

