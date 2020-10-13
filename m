Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D34B28CCD6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 13:54:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FEEE6E3D0;
	Tue, 13 Oct 2020 11:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C656E2ED;
 Tue, 13 Oct 2020 11:54:45 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C68B22519;
 Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602590081;
 bh=M1VGTHk8BLaW4v48n5cCYFm+g0FFa67u3wYgBuflCQw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RUycu8Vwl07BvKE8uEi8KRUuDO79Nu50ZplgRqQ3GRQWoao1YJRJt6EemVh8ePJO1
 SXFUX3L3quLHSvrjc4MLlvABbEL4YlWAZBhum3eGfATbB1fn9PBhRC//BJeiDvdawy
 NNJ7/P2EQQO8bMW6JsjVihpUDeHscX7/KqrwFpSU=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSIt4-006CV9-UU; Tue, 13 Oct 2020 13:54:38 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v6 44/80] docs: gpu: i915.rst: Fix several C duplication
 warnings
Date: Tue, 13 Oct 2020 13:53:59 +0200
Message-Id: <52a0dd42d3730d35b3ecd00d20a0601793e443e6.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As reported by Sphinx:

	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1147: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_oa_wait_unlocked'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1169: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_oa_poll_wait'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:1189: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_oa_read'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2669: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_oa_stream_enable'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2734: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_oa_stream_disable'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:2820: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_oa_stream_init'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3010: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_read'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3098: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_poll_locked'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3129: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_poll'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3152: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_enable_locked'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3181: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_disable_locked'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3273: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_ioctl'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3296: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_destroy_locked'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3321: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_release'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3379: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_open_ioctl_locked'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3534: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'read_properties_unlocked'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3717: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_open_ioctl'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3760: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_register'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:3789: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_unregister'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4009: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_add_config_ioctl'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4162: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_remove_config_ioctl'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4260: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_init'.
	./Documentation/gpu/i915:646: ./drivers/gpu/drm/i915/i915_perf.c:4423: WARNING: Duplicate C declaration, also defined in 'gpu/i915'.
	Declaration is 'i915_perf_fini'.

With Sphinx 3, C declarations can't be duplicated anymore,
so let's exclude those from the other internals found on
i915_perf.c file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/gpu/i915.rst | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 33cc6ddf8f64..cff1f154b473 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -636,15 +636,36 @@ i915 Perf Observation Architecture Stream
 .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
    :functions: i915_oa_poll_wait
 
-All i915 Perf Internals
------------------------
+Other i915 Perf Internals
+-------------------------
 
-This section simply includes all currently documented i915 perf internals, in
-no particular order, but may include some more minor utilities or platform
+This section simply includes all other currently documented i915 perf internals,
+in no particular order, but may include some more minor utilities or platform
 specific details than found in the more high-level sections.
 
 .. kernel-doc:: drivers/gpu/drm/i915/i915_perf.c
    :internal:
+   :no-identifiers:
+       i915_perf_init
+       i915_perf_fini
+       i915_perf_register
+       i915_perf_unregister
+       i915_perf_open_ioctl
+       i915_perf_release
+       i915_perf_add_config_ioctl
+       i915_perf_remove_config_ioctl
+       read_properties_unlocked
+       i915_perf_open_ioctl_locked
+       i915_perf_destroy_locked
+       i915_perf_read i915_perf_ioctl
+       i915_perf_enable_locked
+       i915_perf_disable_locked
+       i915_perf_poll i915_perf_poll_locked
+       i915_oa_stream_init i915_oa_read
+       i915_oa_stream_enable
+       i915_oa_stream_disable
+       i915_oa_wait_unlocked
+       i915_oa_poll_wait
 
 Style
 =====
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
