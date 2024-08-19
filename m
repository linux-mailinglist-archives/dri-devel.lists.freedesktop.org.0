Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3130E95649E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 09:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14A510E1CF;
	Mon, 19 Aug 2024 07:26:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="ZjqXSSKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF9E10E1CD;
 Mon, 19 Aug 2024 07:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1724052399; x=1724657199; i=friedrich.vock@gmx.de;
 bh=c1sF4ndnmCaZCdtKLnjrI2lhixESGVTdKbzNRWmRr5k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZjqXSSKCoZTAxZpntRsEpYLZSGaPjqeLGQJgDaaGoXG1tBcDz3UuvG5ix3N2fAfp
 C9fTLkSFN9GjVfdUtAQDNR+dbbMFXoDvInjlO3jiEDP03VmtX/4VF00ODnk2ZFy9U
 YYPQW9Le6Cv/3RizsTSwDBjXRjbjh8aHshbGbQ59YTBW5YYipJiSpvezEMpuB15pO
 szm/fa/w0+wthmWTf0XQTdgyfq+zER2MawEv/9RgOj/oyAt7amx9KBf1e1fwfns4Q
 ZVqtJIZaIHL7KxiF1wHo03UJzsB+fVsgqmR8ehnpiarQ26/ekHlFh6JBP4JJxC8t/
 f+dW5sC2uBUYexLa3g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from rizzler.fritz.box ([213.152.114.245]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1skKPy16nY-000DeM; Mon, 19
 Aug 2024 09:21:30 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
Subject: [PATCH v3 3/3] drm/amdgpu: Bump amdgpu driver version.
Date: Mon, 19 Aug 2024 09:21:10 +0200
Message-ID: <20240819072110.108715-4-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819072110.108715-1-friedrich.vock@gmx.de>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6ZsNFelE5kPKkAv/c74ore6LzsR1emwrfsZX+CzTKkqTMQ6YhuR
 9cSfg+Q7xdGfRDXQPXj9SkK7HSbxAAem3HjwLgtQ0gJETymP0BS2Y66vqQG0fGojUss4kXU
 1ZnsPO9qZPQEo5BBfoCYPgJzkS8nZun/MYGHFBkJIqirpb8ky+nJ6dg6IooQHprOPF6qFqn
 JqORL/eTFv/3YkkfeMjAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/idKLCl6FC8=;7osojkf0rnUunH22F+4G7YLSKr/
 zs7FUzbHe/KOuMeqGc4JurNUcLmSlHKiNqMx9FaWaRR/Gr1nCUB1jdVRgVZ7sjqDCx/C0p+1r
 dbyZ2TLuGwrIvkHLsbsbxSIqDFVfvHZCWF+1s5vzvExRH3vK10mVfgc9yodLud9nXs7ueEyK9
 ChiJN6X7LsSoS2obw2coeJXDwCzObwAR0TnEgDgFwkqBXG3ACvUVcSAUEFuW4Tdxl9snq3cyG
 4EKzMRf/KxuuKg/SRgH2uvXScxTdAFwEr3dcatzNSw9LibyX+9Y+LZuImoZFACsj/hi5f1c4j
 vHaDZ1x9MvdglxG+BzaJto1HvALu+H0lwHrIABj01pXGB35fikah/KKkwt/ewIL4Yg3BzoNNd
 ON7bnC61PemHNze6zOTRM804q9odUdWdRyeoom6wETenJiubkOgDOGmP2lJc9kNb0r2qRwif9
 Ta9CohJ8ZMq1K09jmCJgCH7q/sL+Pjy5Io+1ozAIENYRz8+5kMq5JFqgn+kiutoBOpHSFzFEQ
 etMYqMWsNUlb2conrADQJDxoezniT2j3KZkNSXmFPY27tpywyF9cMhiyRURVO3MYqOJUVXRP1
 snaMyRhbyTncmfI6XsHl77730Jc0WXy5mpk6PnPE2U4y0f1Xm8Uy3X9B5yZyznbNPCh6itkvj
 Jo4YNkbOMuKsG9XjXS3hhphgFkfg6cFdu3ATDn1fQyn+mu2A0lhP4eLbt2AcVUW1ViJKMPgku
 72XM7WxL84z4WgOhNQGtvi+B7W1Z2Bm/Ns5hd4u2hRNMvMWnVojOj0kkxKBKyi7oAO2NZ6vcJ
 8ncl7ncNrRIptSm0Cp9WUFzYc0FXvXEPUef3vsvx+V2bs=
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

From: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>

For detection of the new explicit sync functionality without having to try
the ioctl.

Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_drv.c
index b9529948f2b2..7fdd73be0a87 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -118,9 +118,10 @@
  * - 3.57.0 - Compute tunneling on GFX10+
  * - 3.58.0 - Add GFX12 DCC support
  * - 3.59.0 - Add AMDGPU_IDS_FLAGS_MODE_PF, AMDGPU_IDS_FLAGS_MODE_VF & AM=
DGPU_IDS_FLAGS_MODE_PT
+ * - 3.60.0 - Add AMDGPU_VM_EXPLICIT_SYNC flag for GEM operations.
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	59
+#define KMS_DRIVER_MINOR	60
 #define KMS_DRIVER_PATCHLEVEL	0

 /*
=2D-
2.46.0

