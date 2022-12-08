Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503BE646C3F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Dec 2022 10:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C9F10E1B6;
	Thu,  8 Dec 2022 09:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC6910E1B6
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Dec 2022 09:47:33 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B725A5C00E0;
 Thu,  8 Dec 2022 04:47:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 08 Dec 2022 04:47:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1670492852; x=1670579252; bh=BI/UllGEox
 yItVe7QBhTqXfpi62sgWbZHqCEFe7R8/Q=; b=c6IC0RP+i14hDCghf7Xi68fUrJ
 bAheSlqfJya38ABGvj1HFV2nQ/ZjxyxcDIms2XNKNkYav1ppckwUGdVD/yK2Lsty
 nqmL+dzjmJCdpT7tUxrNAzJZsoQWn/k+ZSL+WlNhQL9nj9tNbzmx3ZQJ1+ttd9DC
 vKJokPEEqPe9qPZOL3m/kHubG8hUQe+yze0M0rn3rkIZ0OFGReKQWCpLADR3bNSG
 FxXYdGgC247Lv498E/Srs0cQhBdGdYSWqNVuSb4o4M3oo5KqxZXiG3Kx6KGA0ZpM
 3glO+2i4gphIiHtVV2FTIpVVtwuIA2nOaBmqsWInNWsRa0mwLixvRNayw7KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1670492852; x=1670579252; bh=BI/UllGEoxyIt
 Ve7QBhTqXfpi62sgWbZHqCEFe7R8/Q=; b=RLmL1ipqTQSennvBLhrJgVYWVHWy6
 Q/5YroRDWUlYCFBu5PkodDOGyzoZO9WYBJDv+Gq19QKFI8bDZhTYAtXIrdMER8/l
 TsinxtmR+G6VXDYaHx67BODQfdxxDBxj3uxT5wxYYBi5JvV8YYFEtGtt2f9cV02s
 pl00IJ3ZVBZc07lkbUu0Ld0ll/eb3rvNHl6tZCubaivP4AbYZCz8vOEQc7wJfWVn
 mULDE9yRBnTdQt/qB8O6weVKLuF4vkTFF4NZa9+V2l3oLt/H6hKH2PSSa/4o1Qyh
 Mx0sNSPJRImk/SZc31exNpm5pHNvswQZL2woP88lzFAGslEaVfOo4tPpg==
X-ME-Sender: <xms:tLKRY0cwX9-KdmU2xZ_kKhRqK6xVjiBMQjWuiG8hd0oK1wGCzPb9Yw>
 <xme:tLKRY2N0Ufz7arkmMIEG1iYyBnBjyFsIB7oMBaVyZ2pzxN7xN2MDhJ3CG42y47q3M
 KBVsWWwW-2Syj7_rHc>
X-ME-Received: <xmr:tLKRY1jY47ma62lZ7Zv73kzb3ccKbYQFwzVxRULV0WVdZNUnnEuG3FfmYhBrCFY7c9W1YmSUfFtR1KRZLRNe2n-CxCYuFTXDfnwVDZ6z6x_CXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgddtkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpefggfetiefhieduteelueelteffvdffudfgveekudeulefgteejheejffeftddv
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tLKRY5-ZZeDPSC7iwlTOUpa_NhvGcnKTD4kzwEPGcJdiMPyuLX0MQw>
 <xmx:tLKRYwsHH5Bk8SKl2Y4fgM8-J0xcZVdPRJim22o-eETBq8GMSmJmZQ>
 <xmx:tLKRYwF-lMaJsS6QlGrRYbV1-ZMqAZPxgY83bZWMAZR-ZgPq7ZcyPQ>
 <xmx:tLKRYxGBA7eMlUiAfsn5bcGQvanLbQje3xOKEoAHvmhiP_54CZkIBA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:47:31 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: Improve the KUnit documentation
Date: Thu,  8 Dec 2022 10:47:27 +0100
Message-Id: <20221208094727.2848310-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The command-line can be expressed using a code-block, and we were
missing which architectures were available.

Suggested-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/gpu/vc4.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/gpu/vc4.rst b/Documentation/gpu/vc4.rst
index a2375f1584e6..5e5e92e40919 100644
--- a/Documentation/gpu/vc4.rst
+++ b/Documentation/gpu/vc4.rst
@@ -61,8 +61,11 @@ The VC4 Driver uses KUnit to perform driver-specific unit and
 integration tests.
 
 These tests are using a mock driver and can be ran using the
-command::
-	./tools/testing/kunit/kunit.py run \
+command below, on either arm or arm64 architectures,
+
+.. code-block:: bash
+
+	$ ./tools/testing/kunit/kunit.py run \
 		--kunitconfig=drivers/gpu/drm/vc4/tests/.kunitconfig \
 		--cross_compile aarch64-linux-gnu- --arch arm64
 
-- 
2.38.1

