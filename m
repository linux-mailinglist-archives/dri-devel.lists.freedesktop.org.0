Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 719BE9516EB
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 10:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5C710E42E;
	Wed, 14 Aug 2024 08:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ae6//wum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29D4410E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 08:47:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C1FCFF804;
 Wed, 14 Aug 2024 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723625220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fNuuZuYThGLr8uNfwKyVec7VNOTlprUdjtT+el7yIZE=;
 b=Ae6//wumlWKVkWPtDDX1GcvgaW1dhTHpdjhpqn56RtSiJnYVYf/9V3nXJzru/zYtMU3Uzt
 lsYcouMgk8Bvnv7KBGKxj3z/57M3nTAMDJjPx2SoGq0bHzbCWLeWSkgQFZCPCAnpyW9BKx
 JM1M2pLw20d+vbl4BGUU3zV5HBWu3WtPmyrUsTPCHJXp19+j7bxNZiGsMRD71AcR8OFpN5
 hOrfFqYJKECG6/tR4mVTGRlkTbcojKOU3XyYYOwCJgY/xtuFoxarXUsvsFHGq9muk1R4bP
 vE2rQyDK5EZrwDBEsuMI314i7nDuxm4241aqeWSuuFSe11d55XvEOK9Fy+njow==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/3] drm/vkms: Miscelanious clarifications
Date: Wed, 14 Aug 2024 10:46:57 +0200
Message-Id: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAFvvGYC/43PTW7DIBAF4KtYrDst2PhXVdR7VFEEeOyiGNMAc
 RJFuXuntrroolJX8BDvY7iziMFiZF12ZwEXG62fKYinjJkPNY8ItqfMcp5LXuYcRu/HCcFMKtj
 BGpWoEKHHHpveaCwaxaj7GXCw19V932854OlMfNoOmVaRFO+cTV3WBwfORvPys4EZr+kbchijW
 qfostd1iIa3cDsvsAgOHISqTV1JUVVD/aa9T5Odn4nd/VEWErQk/UJvTz7A4INTKcKSE9boQra
 tGbDl+E/sEuhHWpnjge7iQd/WdeOKqpTC1KIuq/Y3t388vgBfjK1jegEAAA==
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=V2cOUf8bwQK2ya9bk+bxBWz3vR7mG6wL1NlE1cWXOGk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvG8DNIHE9Fej0DxsdSnZou8wTjmZvJKOjU+Vj
 uMHsVSTwD+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZrxvAwAKCRAgrS7GWxAs
 4uNSD/0a9Ml43IpjaHF7e4erJG/5s1kKmWJr/o9PUXk0ShKCxQAxywukEK70PH2RcfxINw8fE7H
 V0UwQrJRCnwFcVC2ZvJLsntWUcHoh4DTc6J6BZ3UNvqB1bqj5RkPiJCQVsz/cPCF/fbtYeixN9k
 e8uVkx2u4kl/G/wf36lyT4wiK8lwbRKT013r6FcZhUPXWCc955Gukph1V+kvXDkEHnMuHD2SVl9
 c/wqQcRMXYGyyPHmplzuz37evY2CY9h4w6TuTWFEpdHI87KotghbA/1zMVSMsF/4y7qJ/syIUQD
 oSlRc2Pu5p2qDjz1ur18j0FnWsBXZuCCLOsT1K4RkRxm5sLNY9KshOLo+IoQkI1tg66zqIo1SE7
 gzF2mXXiccUzLwVVSzTHgUbDMDmYqlUL/huXpGKJrFdS86Q/BVAiF5EX/7hd7VRctZlK9UN6biC
 W/bAhhKPwq8ATy1s2HAJm6HGCA2G/XUh4qV2jl5ZXtyJmmvbDva5FFeeFuJj1IWVi4fvQwrDY0d
 dwWSX5nX+qLa0t5MZPScQwRjbzqZsgN6CflGx4JN2ixf8QSM1LCivSB+zwjFB6RWAiq2CUypj80
 wtqSskCChQVpg3HgMW2OkdJu6OC+ihAhZ4I4mQEnt+hoMcH2awiJ0oosw5ehqnGF7gg9tw+IXPo
 4uHUZbWCobV8m3A==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series does not introduce functionnal changes, only some
documentation and renaming to clarify the code.

This series is based on [1].

[1]: https://lore.kernel.org/all/20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (3):
      drm/vkms: Formatting and typo fix
      drm/vkms: Rename index to possible_crtc
      drm/vkms: Add documentation

 drivers/gpu/drm/vkms/vkms_drv.c    |  6 ++-
 drivers/gpu/drm/vkms/vkms_drv.h    | 85 +++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_output.c | 23 ++++++++---
 drivers/gpu/drm/vkms/vkms_plane.c  |  4 +-
 4 files changed, 94 insertions(+), 24 deletions(-)
---
base-commit: 219b45d023ed0902b05c5902a4f31c2c38bcf68c
change-id: 20240520-google-clarifications-dede8dcbe38a
prerequisite-message-id: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
prerequisite-patch-id: ae2d8b2efbbaa9decce56632c498c87e708288b3
prerequisite-patch-id: c26b6d4867eaf6566195aa0002765357d4f69f8c
prerequisite-patch-id: 8791d34a6f3148dc518da5249453067e40d346e3
prerequisite-patch-id: 26ec7cd5a449004bcfd6ce483671f87655f8635c
prerequisite-patch-id: 2e855ba871f2e99d4b6b7d85da2ddac6bb32262e
prerequisite-patch-id: 82523a917646793deeec7cdcc7ff286bd924fd21
prerequisite-patch-id: 0e355e5316281f53ab5e97ab6e63b0a682f3eb9e
prerequisite-patch-id: 7a63d245a377d5f5283f48e8f52421b912811752
prerequisite-patch-id: dda6bf4692cd1795c489ff58e72c0841ea8ffbc4
prerequisite-patch-id: f70e535b6086cc587975fbfa75741f485f679a32
prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
prerequisite-patch-id: dc61c6d3db73053fc36e115af561e0c42b467de2
prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
prerequisite-patch-id: 18554f49b53cbcfd4a8ca50dc83b17dd3cf96474
prerequisite-patch-id: 5633292e10132d29be2467812e6e2e824cfedb67
prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
prerequisite-message-id: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
prerequisite-patch-id: d10db4cb12a88de2e5f6440e9fcf5ddda191e3cd
prerequisite-patch-id: 16bac0ef1f1dc010a72ce2faae66631797d23d3f
prerequisite-patch-id: 8e0e5cc0727e8fd2d14ebafc5538fd987c2dd38e
prerequisite-patch-id: 32bad3bf3df46d042e9edd4c1259c2e2a3fb8975
prerequisite-patch-id: 4bd9e4cef308abd17b7b274a5575a3de73a1503b
prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d
prerequisite-patch-id: baa8da4871dd90b03a07c6d9ddb45e10929ee70a
prerequisite-message-id: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
prerequisite-patch-id: df699289213021fa202fcdf1b4bdff513d09caa2
prerequisite-patch-id: 59d021ccb166fbe2962de9cda72aceb3caa9cabe
prerequisite-patch-id: 895ace6d58b3776798791705b7b05e26b8d37c7b

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

