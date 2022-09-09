Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC885B3023
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:37:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2527010EC0B;
	Fri,  9 Sep 2022 07:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D316E10EBED;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9522761F1C;
 Fri,  9 Sep 2022 07:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25CD5C43165;
 Fri,  9 Sep 2022 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708895;
 bh=hMbCpBcT2vFUAUJkRSUmrCoccfdseZPeZQleafPjwmo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gI6htIKsXFDNpNE4e3TBpBlAm3K38T+orpddKU8nqv5tjPsUhrvD3lHKiFYy58KbL
 1Jd4TKu1Dau2XQiCeoJvXrwaUJ7H1Sbg7sjF1UVQ28KWrGOfqC0rwlKTFVB81Ztryf
 MUh9d3fZbpQopYPFIo6taBfLBDXUrP84/97KzY3pOt9JOoZ1HeC1ihPSNgvjt7tCSQ
 hiiE6VE5csG4uKYFDT8Pi15ZxJ/EF4gEk2FWb0PoFIT1kBtfwDHI28TtX+8HaRSQaS
 JeqfvF0FkkBIIF7QarRLbtM3fSvw0FCehb9ae1xxSPl4UOnC84PYguXzp3LQxchJ23
 NzOrFHe/satUQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXH-007FHL-4n;
 Fri, 09 Sep 2022 09:34:47 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 27/37] docs: gpu: i915.rst: gt: add more kernel-doc markups
Date: Fri,  9 Sep 2022 09:34:34 +0200
Message-Id: <6d31414391976615b5c1818cafba066132c24e85.1662708705.git.mchehab@kernel.org>
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

There are several documented GT kAPI that aren't currently part
of the docs. Add them, as this allows identifying issues with
badly-formatted tags.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 40 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 2ad7941a79f2..b668f36fb0a3 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -149,7 +149,6 @@ Misc display functions
 
 .. kernel-doc:: drivers/gpu/drm/i915/display/skl_scaler.c
 
-
 Plane Configuration
 -------------------
 
@@ -308,6 +307,45 @@ Multicast/Replicated (MCR) Registers
 .. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gt_mcr.c
    :internal:
 
+GT engine
+---------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_types.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_cs.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_engine_pm.c
+
+Graphics Translation Tables
+---------------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_ggtt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gtt.h
+
+Other GT functionality
+----------------------
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_context.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_gsc.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_migrate.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_mocs.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rc6.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_reset.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps_types.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_rps.c
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/intel_sseu.c
+
 Memory Management and Command Submission
 ========================================
 
-- 
2.37.3

