Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E966570BAD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D20B8D033;
	Mon, 11 Jul 2022 20:26:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD2414B8ED;
 Mon, 11 Jul 2022 20:25:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2DA9261635;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412B1C341DD;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=OSO6ejWnnUoc5otDMF/W0MkHHWHT3ycWD8ycMnZEBb0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z1Pg+upYwFWFjLPEZvT4GDwufhDwhW95VBaCZK9Xb2t8xv3+E9qwZjc/vlgWLm6lp
 kbL0bzUuafivfNQ/73KLxUmZ3jb51dHabYYyG1b9JBqHqfdYpoW+y8Sp1SaEigeBSM
 bzpjzibRmkt22NDcZftWnyaZ3LK6h8FCO55fiN/qF4XnVedXv3hRrAp0TsVfTWwbuS
 GvmVmmLZa9ghioKMISpM3Z67vNSGr0jm94wLsYU7H36/YsENjq7UNlkr+zjv5Jy7Du
 Y80L2NFddxYLQGLeLqydyh0j5SceT4M1D5AkzseOhZwmo7l33oMFTwS/pitkTxExwM
 ckASa52gqkLQw==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e9B-Tk;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 29/32] docs: gpu: i915.rst: GVT: add more kernel-doc markups
Date: Mon, 11 Jul 2022 21:25:14 +0100
Message-Id: <fc356e3a7b9cb51391afca3dad3ffb06dc0b5741.1657565224.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657565224.git.mchehab@kernel.org>
References: <cover.1657565224.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several documented GVT kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 41 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 70f2f4826eba..3ee121a0ea62 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -58,6 +58,47 @@ Intel GVT-g Host Support(vGPU device model)
 .. kernel-doc:: drivers/gpu/drm/i915/intel_gvt.c
    :internal:
 
+Other Intel GVT-g interfaces
+----------------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/gvt.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/aperture_gm.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/cfg_space.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/debugfs.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/display.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/edid.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/fb_decoder.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/firmware.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/gtt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/handlers.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/interrupt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/kvmgt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_gvt_mmio_table.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/mmio.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/mmio_context.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/opregion.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/page_track.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/scheduler.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gvt/vgpu.c
+
 Workarounds
 -----------
 
-- 
2.36.1

