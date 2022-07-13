Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5957057309E
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:14:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB593954C2;
	Wed, 13 Jul 2022 08:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7703695446;
 Wed, 13 Jul 2022 08:12:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB63D61AF8;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DACDC341FE;
 Wed, 13 Jul 2022 08:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=lSje+C8ZwVZQachwhhApn1vW7I0yUu/OGaiqh1MXv64=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=It98rJn2Uq9IPqUbZolIgHfw+UDpVEyqu6SC+WxG6iGH62DYEwiqvJEMtIKD/4XAx
 /o+G9+niTHMaFAVe/FWtLRnQCDdanMRhDoyYYkcMKQLZ0LdyUFPbZjLs1hqNM/kpPb
 n8y7u6EDfVKmgaIYccA2khJWvjNSEE2ue3aa4IPRi1tc7MNYXdIto4M7XrhSLfM64F
 hySlhEfw3mQyGUfhi6kc3h47ydimquUaVFGlD1+yjMv6hqSrx2ZF2ElH3N1+Re/Par
 QnmTsTcrFo3XIs4ba1tkDOvn5G424HOolzl7TXFH2oT2jQmaxT0x+mEsw6mAiVq/f8
 RLsYpOEcA5AAQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004zuQ-W6;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 33/39] docs: gpu: i915.rst: PM: add more kernel-doc markups
Date: Wed, 13 Jul 2022 09:12:21 +0100
Message-Id: <70a08436861741590c53a807a8b69e8f97f029e8.1657699522.git.mchehab@kernel.org>
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

Both intel_runtime_pm.h and intel_pm.c contains kAPI for
runtime PM. So, add them to the documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 Documentation/gpu/i915.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 3ee121a0ea62..c32409c03d32 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -25,6 +25,10 @@ Runtime Power Management
 .. kernel-doc:: drivers/gpu/drm/i915/intel_uncore.c
    :internal:
 
+.. kernel-doc:: drivers/gpu/drm/i915/intel_runtime_pm.h
+
+.. kernel-doc:: drivers/gpu/drm/i915/intel_pm.c
+
 Interrupt Handling
 ------------------
 
-- 
2.36.1

