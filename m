Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A3957307D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D0C2953AA;
	Wed, 13 Jul 2022 08:12:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F342D952FE;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2220961A91;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E4FC341E0;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=Tv5jQlDqrwIrCFjuoyn+Q4EwW8kYBb3Q/k/uwwca1JQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FhynwmEnJDJqibd0IOdr7s1DgM+3m2wdHag4758oDgJssK6B6IbRMB0hcc883R2XY
 I1TPsHMIeisqf7v4sYxJ2EbQ28J4Q6Sk98WarzPbkVFJyO/AznoZ7WKbm9IvaScKO6
 yERxxKHwJHaBFvFtSvvafFAosr8YlHlTJUTgkIeLbndeWNcqu/ZRkKTuaH+Bl388D+
 k4rNR0tGVX5UEqJdEGw9e0SfAR6BVKza2g6LuZv0D0bKm8aEeIhGQpbZqHVbLOfMC7
 tIGS2dPjv+lEopmZ8YEAl5MdpOLnCNY2e0pAqr6HfUL5eOTz/eod69dZKkwq8n5yh4
 uc+3nU4qLKA6g==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zuK-Ui;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 31/39] docs: gpu: i915.rst: GuC: add more kernel-doc markups
Date: Wed, 13 Jul 2022 09:12:19 +0100
Message-Id: <f8f1475a468bd4c426df62decb45eb8c22a53642.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There are several documented GuC kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

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

