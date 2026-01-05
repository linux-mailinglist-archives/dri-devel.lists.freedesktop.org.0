Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3EDCF597B
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 22:04:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FA4110E013;
	Mon,  5 Jan 2026 21:04:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jannau.net header.i=@jannau.net header.b="AbeewUkH";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="O9RFqbFa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5642D10E013
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 21:04:10 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id BA5BF1D00104;
 Mon,  5 Jan 2026 16:04:09 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Mon, 05 Jan 2026 16:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:message-id:mime-version:reply-to
 :subject:subject:to:to; s=fm1; t=1767647049; x=1767733449; bh=Fm
 8K3+5irrckK0MC/V3f6c/1Gi9boQDobZ1i7gbQTQg=; b=AbeewUkHbhpp8HV5OA
 fSyQ+Gf2Yrs4E08XfMlxEjZDhvqQa/tTfdPNnBA3gjRbosZrPlJaNjozzSJ9qUwF
 k5E/FrGtPH7DYtiVGP9AMwZds1P51TNRws1+gMcx4/0HReglbBDoseyFWeIF0v5C
 sHhMovM0kJ54HqRzxQ1K9PxsimErzZfEqACjNV2y7jp4Ys8W/NEFFRJgiJWKWlL3
 FFFdX99MrEhlEcglSZ1v2MfA01GS0I8Q/OeVbA0h0kt/y7HhpIJE4uSr7mnKtViP
 u7kv6gdeREqpzbDkvvmv5sFFRJjs0Yf4sowBARsiLZYe7DzkP9nQgp3MG/j9Z4Cv
 5XAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:message-id:mime-version:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1767647049; x=1767733449; bh=Fm8K3+5irrckK0MC/V3f6c/1Gi9b
 oQDobZ1i7gbQTQg=; b=O9RFqbFaQ/ubMC9/xM1fIBrsJ5SdxwZLoZETfgDCBdeX
 +nB9oMbLrmg9YD8TGptNehU9/rL0bCM+X09Wgbx6eKaxj114OGIkHHBBSaSJ2DU1
 STFqeBucK957JpuDOvFO1yrRMnc0TChkg98gylqqPjAzrBF2wCLc4ghr8THcfoPs
 rF4uvKiQL7TMOLwgBGEYwwsTiBcMX6wEkxhkiqCUFKzP0vNNw1ipHoFCU3u9/P6U
 +nq/U+SgnLVzmKutp1OFNuey5fhNJ+njZepwNmoguJ+oGU8BYCgrMC/914f5yaXf
 9WUjlQ5RZLwKtzsV+06/Wtjr+Ucl4T5Nrh1zgdgyjg==
X-ME-Sender: <xms:SSdcab9ZYD2bUzSAmHl-t5uid1gSdAthmqwyKnWxv7oGYqBMj1FE1g>
 <xme:SSdcaTIeUl_rpskIbyIxOxYIwfSC7dlngS1V73yYbuvcMC5cds5WnTcZ5hQCAuS59
 nMlqBCWbbumyX_9eX8n895kEyyxqMubQ-lV7vZPrERMRoKgfwfLHNg>
X-ME-Received: <xmr:SSdcacjaGhfe9Q8PGuQtsIKnYWymwCdEHZaVLI90cAVBh9lGZ7cs-k9jdxOSBcW66MM_l357sUFkdqm30vCDKhImxldxz4NLqdZn0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelkeeffecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
 ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
 hrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcuifhr
 uhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefhtdeuud
 eljeffuddvheekuedtfefhtddvieeigeehffelfeevvdfhgeeggefffeenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnh
 gvthdpnhgspghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
 rghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegurhhiqdguvg
 hvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhg
 thdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhope
 hjsehjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:SSdcab69izJVJ1QQgWtRiqOThjgAEBSDnMLEceaZv8zjAA5au9YL8Q>
 <xmx:SSdcacYQM2QBPnWjICP12FmFE0uv0n7w2jJEo4rjOG53b2CBJsFQSA>
 <xmx:SSdcaY4y-To7H9FTc6gDSDI1hondH31pioruKeHHzzxvQKfgfwunuQ>
 <xmx:SSdcaXDXg_MiJS3VtnHoZ_WpwFFS-SxosJe6kcYXehKusZOr__5Gyg>
 <xmx:SSdcaZibmaShM8yyhbtFyeMMbU_TlFniapJdwLtImmcV0x20z513LBnb>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jan 2026 16:04:07 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH i-g-t 0/3] Add infrastruture and initial tests for ashi DRM
 render driver
Date: Mon, 05 Jan 2026 22:03:44 +0100
Message-Id: <20260105-asahi-tests-wave1-v1-0-a6c72617e680@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAnXGkC/x3MMQqAMAxA0atIZgOpUBWvIg5BY5tFpSkqiHe3O
 L7h/wdMkorBUD2Q5FTTfStwdQVz5C0I6lIMDTUtOfLIxlExi2XDi09x2HHvaSEhXglKdyRZ9f6
 fIygGzDC97wevvmLKagAAAA==
X-Change-ID: 20260105-asahi-tests-wave1-7a850d0e0af0
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1944; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=1maun1oJjM1Hu8fQx3t6bLB8U8dZwzJKItCNPc8qshE=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswYdfspF8t/bL7pYrB99vbyyfv8fyS2Svye+NPo32amw
 ywil2OjOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAEykeykjw91LhR6sCReCHOL+
 CPWUX3VnFhbn3LtBXCuyN1JyRVvoSkaGDytX60q2eQVqMrz9rtj6Qdj8u+dnB4Xgl4sYP5UeW/6
 YBQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
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

I will start with upstreaming the asahi DRM render driver. The UAPI was
merged in v6.16-rc1 and the downstream Asahi Linux kernel tree has a
driver implementing this fully.
The asahi (OpenGL 4.6 conformant) and honeycomb (Vulkan 1.4 conformant)
user space drivers using this UAPI are available in mesa since 25.2.

This initial submission contains test infrastructure and tests for the
ioctl DRM_IOCTL_ASAHI_GET_PARAMS and DRM_IOCTL_ASAHI_GET_TIME.
These two tests are the only ones the initial version of the initial
upstream submission of the driver will pass.

I have additional tests which the downstream driver passes as well. I
was planning to submit them together with upstream driver patches which
implement the necessary functionality for the tests.

If preferred I could submit all tests and gate them based on the driver
version to avoid expected igt-gpu-tools test failures against
incomplete (as in not implementing the full UAPI) upstream driver
versions.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (3):
      drm-uapi/asahi: Initial import of asahi_drm.h
      asahi: Add test infrastruture for asahi DRM render driver
      tests/asahi: Add test for DRM_IOCTL_ASAHI_GET_TIME

 include/drm-uapi/asahi_drm.h   | 1194 ++++++++++++++++++++++++++++++++++++++++
 lib/drmtest.c                  |    1 +
 lib/drmtest.h                  |    1 +
 lib/igt_asahi.c                |   58 ++
 lib/igt_asahi.h                |   15 +
 lib/meson.build                |    1 +
 meson.build                    |    8 +
 tests/asahi/asahi_get_params.c |   55 ++
 tests/asahi/asahi_get_time.c   |   63 +++
 tests/asahi/meson.build        |   14 +
 tests/meson.build              |    2 +
 11 files changed, 1412 insertions(+)
---
base-commit: cef45b995557367ba082bc460fbab2190af943fd
change-id: 20260105-asahi-tests-wave1-7a850d0e0af0

Best regards,
-- 
Janne Grunau <j@jannau.net>

