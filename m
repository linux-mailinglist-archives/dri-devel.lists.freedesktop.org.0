Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FE25B303F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 09:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9E610EC31;
	Fri,  9 Sep 2022 07:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2083210EC04;
 Fri,  9 Sep 2022 07:35:02 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A327061EE2;
 Fri,  9 Sep 2022 07:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73D5BC43140;
 Fri,  9 Sep 2022 07:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662708901;
 bh=9fXBrTMJ1wXXR0UrdCCLpV7JpHoOhB0DFcPSM5RzJGE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BPX44/kJhMGXyeX8jeg/B9rw3SMukb3f5M9SvlDX9Xdjr0PGhg2YO/rd0rrJPrjdf
 MHjNF5zUFycId8EgEphiYrLRlmCgnftn+1o74S70IJ63p2S4ZUxCnh2iDZ9XEbSYjp
 AN8bbyOhwNybXuXo3y08iFs2DgOQ1v+nGQgAEnRYWnru+CRtl8tsgEm+1mV15l5wId
 Z3vqrLREoV0TJyt4c2o3kAA7X59qq3GUO4jOcxTzs2zK+4iHbw/y4YRWXC+OyjqyUK
 T2OIc+CGO+Bao7BwaGVgt9gsq6k8WJVyMZPPwWyM/gKcYUDZeJf0b9Cy+4ogbxToR4
 wNrKJoj9+boXQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oWYXH-007FHv-Mh;
 Fri, 09 Sep 2022 09:34:47 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v3 36/37] drm/i915: add GuC functions to the documentation
Date: Fri,  9 Sep 2022 09:34:43 +0200
Message-Id: <c65f75ea7aee177a2df93add4138240cf2f529da.1662708705.git.mchehab@kernel.org>
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

Currently, functions inside GuC aren't presented as part of the
GuC documentation.

Add them.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v3 00/37] at: https://lore.kernel.org/all/cover.1662708705.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 59c532fe0332..b71e9720a1ac 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -759,6 +759,9 @@ GuC
 
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.h
 
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc.c
+   :internal:
+
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
 
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c
-- 
2.37.3

