Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAE48B1086
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 19:01:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8BA3113C8F;
	Wed, 24 Apr 2024 17:01:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=friedrich.vock@gmx.de header.b="P4SOMRlk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AF0113CA1;
 Wed, 24 Apr 2024 17:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713978044; x=1714582844; i=friedrich.vock@gmx.de;
 bh=gXJ9sHp9nKx/vHVFcYvw3sYKm1yHpVtdqTJUe8vT2Ww=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=P4SOMRlk9dT/GPQ3j0ootm+K7YWMB3VCbUg50h/53y0Zg0lBNhC3zRA9+OKH/ZAc
 UdETeWb90b2wt14Srkatw9QbdWJVXZBr3QvBZ1W8h75KhFAOYlpRLisNdcHeXHnZp
 SUi4/qBRQd/T3zvUYKeJh/mQP2whjOequOoOo4hI98G5J7yWn+vUnDu4+LJJGrf0j
 6m23P62JuAK+gjHKI1MINKrflYEkguTq7/tTVTHaKgRuuTW65jtd7yMUgcSifn21Z
 LrQ9jORj27IP0dhQ95wudDcIIhutcAqKC0d6jLdaeBUb/hQBezCK24oamc5g/N6n7
 uwnziOt9UgP1yCVkqw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from arch.fritz.box ([213.152.117.111]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5QJD-1s0VSr20XN-000kui; Wed, 24
 Apr 2024 19:00:44 +0200
From: Friedrich Vock <friedrich.vock@gmx.de>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Joshua Ashton <joshua@froggi.es>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [RFC PATCH 18/18] drm/amdgpu: Bump minor version
Date: Wed, 24 Apr 2024 18:57:08 +0200
Message-ID: <20240424165937.54759-19-friedrich.vock@gmx.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ONz5GuGooOxL9QByDhgduUp5y7f/hAvGjazdujSbC1JsDNogNtP
 RztkeEh6BaPdO19GyWrili4w46GmIoJSWovGuQGAq2rvj7xcwUPTPlgK8PopGK9hASnyF0X
 JvBad/kYc77LmIfVM6QDpB2z5qD7DOa0UJC6sMrpYVmz1cVjTeNNO27A4TjKD/aQZ5jE2Gu
 TUBCwpc1rE1b0VbEbTgJA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0nG14xjtdaY=;EFMeFFXXHfet4uOZ1JL75koZKDM
 sC3lZTv7OgRtgIngM/547kgzH4U/8ln2AYhYz0Cwfwqr1IROMpArWAnfATnJ2Fl6eqnbaEf/Z
 Z8UonDE2wtN68deoal7ZtLNAyMk7UkKSb2tpX/2posDDOnI8kT5rnunK5yymIhyaymwGy3mpH
 t7N3v2IYPvnD/OjcCjFd9yz9LhCud1ik37DARagHm77mFlgllEM1K+Kkmr5EHdHDfx+CO/Q1v
 zvOgAE6xDZi5b7ysDPcHz/vUiZML8/mn0p9xI4m243wXwbyF9xC0+a2xKCOqcKdDLdXKvSada
 Yi+fTst0YU9kkbb+Zu0RrcngKO9wX448f6qlTZDE5uH5IUDx8pOxLPwpEeAc6kkMgLn5GYvpR
 8cbdSjE8cmUFq6jO2HXsATRIPmN64IFlTVlS49OqpLhWH7Hmz5TrmGLJFYZZdvww4FirP3xAg
 q7FEL2ow8XdvOt6B0p/AhzFEKf7TiFo1b8/JJmJb0XHjAjKFiKJv+lJU0GH8Zyofb1aH7J7ZH
 tdZ68KwiFrS0jtjC/MZg+1h0n0IhAYuqbtzv/5G+pxJQ6MhqWvbwEGJHBhL27cDvOEMTcP76K
 Qd7rZzyPivSvPhq54sKuZvtPU/HhctfTV+2Fq9opFjZ9ysdN5hxrg8hG3zdp0Nm4l+k9iUHmB
 u0qw5smlBbp6bABHLmg+rCjsieAE4b8xScp35vX6yhlp3po4Sb0j7vhvt/znFfej/DAIWtgD9
 y7INGT2pg/nBT2bJtNKsXiVT6Ylzvt9ylpxDJ/QsLYM7d54lPv+fbJHoorCbLxvJpxP8GEgGI
 lLZZ04uT8smHdJj6uxGgpLwR8+G1+WBP3mmQCEV2a1nXc=
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

Indicates support for EVICTED_VRAM queries and
AMDGPU_GEM_OP_SET_PRIORITY

Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
=2D--
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_drv.c
index ea14f1c8f4304..4f8b62dbba17f 100644
=2D-- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -116,9 +116,10 @@
  * - 3.55.0 - Add AMDGPU_INFO_GPUVM_FAULT query
  * - 3.56.0 - Update IB start address and size alignment for decode and e=
ncode
  * - 3.57.0 - Compute tunneling on GFX10+
+ * - 3.58.0 - Per-BO priorities and evicted memory size queries
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	57
+#define KMS_DRIVER_MINOR	58
 #define KMS_DRIVER_PATCHLEVEL	0

 /*
=2D-
2.44.0

