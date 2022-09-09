Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E95B3034
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B2910EC1B;
	Fri,  9 Sep 2022 07:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DEB10EC02;
 Fri,  9 Sep 2022 07:35:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C08A5B82387;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32F47C4FF07;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708895;
 bh=hQa2qB2CeTyw3GAgYwyhVj1XTZmgIzZSunChiyTazuM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z+phLD5baNAwxItQcI1si4W3MWaifXIx3QrVpzQO1eXR8RIJjaf2ss7uWaV0HGNwJ
 fAwWRHAYqx726AcPnwCMLKn84RKM3XRPRcDr+AbDcLskCuEy7KqKHDh/R2JfYhg+D3
 iKKBEL0aFUdzMs7XF3LJFL4A+k05MusdODNW6jIVoUiHkFxZ3irzCJkYG60JJfCrcj
 NfX9Sf32DaASb+DUqGndSVmUdPJXeuPs0MZEm1mc4apXN0VkBHFXgOSqSn8v8Oe8kw
 IXntVwQxwy6Zy7kMccovBKxcJaHvFLtAhzAEdWCFpGpVmGoEsU4ofe+znF7tdhKAJ2
 GLIWH3wRnks5w==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXH-007FHP-76;
 Fri, 09 Sep 2022 09:34:47 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 28/37] docs: gpu: i915.rst: GuC: add more kernel-doc markups
Date: Fri,  9 Sep 2022 09:34:35 +0200
Message-Id: <1b5cf28c08c5b9f5786ace0bb77de1f6558f6639.1662708705.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662708705.git.mchehab@kernel.org>
References: <cover.1662708705.git.mchehab@kernel.org>
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

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index b668f36fb0a3..7f2daa1b4a8b 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -593,6 +593,28 @@ GuC
 
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
2.37.3

