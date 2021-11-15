Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA3B45037A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 12:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90B96E86B;
	Mon, 15 Nov 2021 11:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA846E8D6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 11:31:27 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 671162B0117B;
 Mon, 15 Nov 2021 06:31:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 15 Nov 2021 06:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=emAg6UBlVNzZP
 hSNA76cyLaGjlis3w532X60JIapIkQ=; b=g0z0TCdSUZrYrv77tLBJzX1c+2u7p
 /2UbkZF9Q/mmSdBi/4we3DcN0Gli3l6+fgRmbd0JnxuL27OylmYwJg53KqgkJBan
 t00xU3jI6rzHt147aS3dFgjtqFEW8X30uArLZyX55IoEqMcTuSuERrmgPKOR0G9X
 Oa3qeX0ViN7W2jda/gI9o1P87hKAdZLsi88eZbfAmI7fSWZnCogB5rxKmoVE3c5P
 M922c81zLpn1GgJjyT9t+QYqlkshaPu+XxrU7mOYlUs3yV160aeDBmwDOykttJFE
 9Ocerp1PfLS7nohopBE6TOZResW1O3nsf1SxEWf570b/5TOXv9mzeKFHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=emAg6UBlVNzZPhSNA76cyLaGjlis3w532X60JIapIkQ=; b=G+lDhbjC
 Fd98apLljwTXdCZhFxoL96cpm2vOQPICEzkSifFExasUvyDvYWWSsCm6F8IexMpZ
 OWoBeYWRn6J9ky2XTVRhdRV5ptbiA0121NKoBBDsoMOCIgIXWiX0eQ7LzMnTOKn5
 IMVBfOMKiJEofuW5UaVQ8zfLsMhMqKjzLHgpRpdkTVV70JvWfE2b++8bPZ7yxIoU
 GIs8E/EZBv43F6Jb33F4OudthnV1j7VKpIlJ6dXVL8bO9t5/7/lFfUbF3dG8CykS
 6wCWNgX0lpnaUGv7+pDAHvXmn31/ZXmx4UFjUkqkNrIb5Rx2GLXpbuCnIoZeKO9x
 bLsFLf6S7//Vfg==
X-ME-Sender: <xms:DUWSYVWWuxlBB552uDm1ghvORxNQsjdaMIHt8OKefC0z1WiCAhlkSg>
 <xme:DUWSYVl8QRJwpngsbAjRn422oGUzJw-p6A207FuQBIHlXpJQSmTSTbIwuwRqgRIS9
 DZ10ZLVDL1C-2L2vOI>
X-ME-Received: <xmr:DUWSYRZABmMRYiDIYuezWxkvl2_qNS6rsbmEwuN7cVkMMpHHNiIIPitCpc8ugtADY6GJLW4bJXINGVgJaqPBDAylQ9vAK6Fbp1ZqK6Aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrfedtgddtfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DUWSYYV5aDSsWQqlI6sTQc-ofWcpGr7qc_bHXkpgDtsPQvuCqVgoyA>
 <xmx:DUWSYfn_iMYl80B6384-23uT0JcPWzttqkRLl0NpRxYovB5hhalVUQ>
 <xmx:DUWSYVdPwQaMfkzm3UUrvIqANisxDznPONlE-0QWUWOIB88BH5Z-oA>
 <xmx:DkWSYYgF0yyxCef-772_MBhhH7WgQrXetVDHiZ5f9fET_mgCxNmIZUJUJf8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Nov 2021 06:31:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH 5/6] drm/vc4: kms: Don't duplicate pending commit
Date: Mon, 15 Nov 2021 12:31:04 +0100
Message-Id: <20211115113105.103275-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211115113105.103275-1-maxime@cerno.tech>
References: <20211115113105.103275-1-maxime@cerno.tech>
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

Our HVS global state, when duplicated, will also copy the pointer to the
drm_crtc_commit (and increase the reference count) for each FIFO if the
pointer is not NULL.

However, our atomic_setup function will overwrite that pointer without
putting the reference back leading to a memory leak.

Since the commit is only relevant during the atomic commit process, it
doesn't make sense to duplicate the reference to the commit anyway.
Let's remove it.

Fixes: 9ec03d7f1ed3 ("drm/vc4: kms: Wait on previous FIFO users before a commit")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 217a2009c651..6533f3360e75 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -671,12 +671,6 @@ vc4_hvs_channels_duplicate_state(struct drm_private_obj *obj)
 
 	for (i = 0; i < HVS_NUM_CHANNELS; i++) {
 		state->fifo_state[i].in_use = old_state->fifo_state[i].in_use;
-
-		if (!old_state->fifo_state[i].pending_commit)
-			continue;
-
-		state->fifo_state[i].pending_commit =
-			drm_crtc_commit_get(old_state->fifo_state[i].pending_commit);
 	}
 
 	return &state->base;
-- 
2.33.1

