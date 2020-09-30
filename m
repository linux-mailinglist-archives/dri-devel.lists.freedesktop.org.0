Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA05127EA09
	for <lists+dri-devel@lfdr.de>; Wed, 30 Sep 2020 15:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B11E89B65;
	Wed, 30 Sep 2020 13:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AA689BFE;
 Wed, 30 Sep 2020 13:35:31 +0000 (UTC)
Received: from mail.kernel.org (unknown [95.90.213.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A4DC323A69;
 Wed, 30 Sep 2020 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601472321;
 bh=M1VGTHk8BLaW4v48n5cCYFm+g0FFa67u3wYgBuflCQw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qSfGHHIJw6X3wEIno05gneQ4WBYcrHAUngS4AZyihCxenuy7FvkfFU2YTbufAjCSw
 Ui+08ntxMFq4/oIo/u4CZynST+DqPIRlt4j0zADfrcZmYqVCKkl6x1T5AEU+Q8PuZk
 57AQ4W6n5kiSA7AESQqSE4TcyEiQ0x/pevO5MvII=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kNc6h-001XKt-Ml; Wed, 30 Sep 2020 15:25:19 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v4 44/52] docs: gpu: i915.rst: Fix several C duplication
 warnings
Date: Wed, 30 Sep 2020 15:25:07 +0200
Message-Id: <582d22c1ab6f2f6ca19963179dcde182c91d7c8b.1601467849.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
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
