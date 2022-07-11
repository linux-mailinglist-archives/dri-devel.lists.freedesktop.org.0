Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEFC570B9B
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE8B90FC1;
	Mon, 11 Jul 2022 20:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C262B467;
 Mon, 11 Jul 2022 20:25:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0B9B2B8122C;
 Mon, 11 Jul 2022 20:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8912C341C0;
 Mon, 11 Jul 2022 20:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571125;
 bh=68mGlwaA0EtgA4nJuAvhd7iYXVxtW3CSXJug597Q8rA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBSTj4IN8j0qXmrjuDC6FgYUE8xR3y7Un/6+x7oa4EOA9god2bnLQgJKxUJPeY8Y+
 IB17n0LDvBK20uIn65DOpGMlBIOn8RAPMpCNIoJdjTqb7RaPn7BqlQvp0uJh/k33wO
 w4n8TlW2nUAl4WRnI41fuEifCDVPrVYQJmJU6VZU9vJhht8fid9zVxnL/ODiPdHasK
 tAJn91z7P32HnXIwOpTI0HTIjHh5ml50ayvvcTvSUCd+hEwOOht9BMx1I3a8+uByYg
 Rbsu6unLS2GpfhvkdgiQCpj/e6AfGtiQUdYa9sizfAe10VOUtQQD9uqsAS6mN9lX39
 NVSx4TrPIY0Mg==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e96-T1;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 28/32] docs: gpu: i915.rst: GuC: add more kernel-doc markups
Date: Mon, 11 Jul 2022 21:25:13 +0100
Message-Id: <a22fbe2ea7ca57099f2aadf29fbce6b896fc53c5.1657565224.git.mchehab@kernel.org>
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

There are several documented GuC kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index afd8c0e3c689..70f2f4826eba 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -596,6 +596,28 @@ GuC
 
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.h
 
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_uc.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+
 GuC Firmware Layout
 ~~~~~~~~~~~~~~~~~~~
 
-- 
2.36.1

