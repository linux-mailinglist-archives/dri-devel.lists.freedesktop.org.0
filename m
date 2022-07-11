Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49333570B6A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 22:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D9552B467;
	Mon, 11 Jul 2022 20:26:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A7214BF68;
 Mon, 11 Jul 2022 20:25:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 65D9E61648;
 Mon, 11 Jul 2022 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 949C5C36AE7;
 Mon, 11 Jul 2022 20:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657571123;
 bh=bR0yhGu5WvC7zefrnQ6yqqocI0KUntnxFR+VGDvW1MU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SIJyFe6bX+w5HSUPB9kfik8rd9yokK3GhkwVdd4MVvBErWyOZKryj87k6q1jkhz7R
 MvJ4Cy5eL1SbY9xIgj7SFgAMQoCGxkxZg5Uq/hH7Im/3hmYcj+VOsQMsF7Eko3+mKt
 I2lck27qFxFaEmfaIGrJAVDZ3EjPG86t5ip8IE6HaHlUvNyFZOGnSQBM7lQZVs9yAZ
 RyDdSQa+VjGG/SkonLfDgY7I4DiUwY/2WqjRzsNDBCsBrVSWFLS7iCvy88G4TrBed6
 0nyXtn8695SN6G/tqD4VmsgbwC/42/JMS8w2wXXWufxjFTPYgi3uq7qZWBti5txmVj
 Xk+BjRZ8b7ZzQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oAzy3-004e9G-UN;
 Mon, 11 Jul 2022 21:25:19 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH 30/32] docs: gpu: i915.rst: PM: add more kernel-doc markups
Date: Mon, 11 Jul 2022 21:25:15 +0100
Message-Id: <e00781a424ff91c62b11e2595bfaab5bfd3ae564.1657565224.git.mchehab@kernel.org>
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

Both intel_runtime_pm.h and intel_pm.c contains kAPI for
runtime PM. So, add them to the documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 00/32] at: https://lore.kernel.org/all/cover.1657565224.git.mchehab@kernel.org/

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

