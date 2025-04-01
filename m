Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2DA783E5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 23:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5D510E66E;
	Tue,  1 Apr 2025 21:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="FoUhMXTZ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+GH2ZSeq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 541 seconds by postgrey-1.36 at gabe;
 Tue, 01 Apr 2025 18:52:34 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5983310E0F0;
 Tue,  1 Apr 2025 18:52:34 +0000 (UTC)
Date: Tue, 01 Apr 2025 18:43:08 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1743532998;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2Q2L/7rj3cxpaE4j8vthf2ql42MJVGYI7kIRx6ocME=;
 b=FoUhMXTZbUiOhY0VHQPoFysfCgG3Xllk/+Q0XfPVi5kf9cn3RzmKd8sHf2ivjW2xq/mDG2
 Clg/QYRQsRYL9XN/A9L/6FnXIl6tOAGpXRPqfOKiOs0JXj9XLL86i2L+BBUig47YViCrf4
 PxZHjcToej7UC77sX/CIN94w01HbeU3JJudQC4rL7JoKWXSdSRj2qOjiti0xRciNoQZAw0
 Trlko38JPkIgRKQz35oDNAE5NeThZFZg6ujKtDFoXrbl4vR5tP/uOuUsTzVEdyLaNYK8/P
 YJZSB9/rwzUuHNePa5BeLdMXrE1Hsx+eLNaAr5ms0LVOfuecKQcza1HJer3QGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1743532998;
 h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b2Q2L/7rj3cxpaE4j8vthf2ql42MJVGYI7kIRx6ocME=;
 b=+GH2ZSeqiwFfyrkQ/RSVLF7sH4K5kMrG82hu57BCMr9pNgYZWriN0Tdc2WeiaWW4AtQhj4
 QvPT1HuxsrGxN3CQ==
From: "tip-bot2 for Dr. David Alan Gilbert" <tip-bot2@linutronix.de>
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] x86/platform/iosf_mbi: Remove unused
 iosf_mbi_unregister_pmic_bus_access_notifier()
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>,
 Ingo Molnar <mingo@kernel.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241225175010.91783-1-linux@treblig.org>
References: <20241225175010.91783-1-linux@treblig.org>
MIME-Version: 1.0
Message-ID: <174353299389.14745.950743351956667262.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe: Contact <mailto:tglx@linutronix.de> to get blacklisted from
 these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 01 Apr 2025 21:20:30 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     d0ebf4c7eb91fe73981d5250b50e9d22db8fb946
Gitweb:        https://git.kernel.org/tip/d0ebf4c7eb91fe73981d5250b50e9d22db8fb946
Author:        Dr. David Alan Gilbert <linux@treblig.org>
AuthorDate:    Wed, 25 Dec 2024 17:50:10 
Committer:     Ingo Molnar <mingo@kernel.org>
CommitterDate: Tue, 01 Apr 2025 20:31:39 +02:00

x86/platform/iosf_mbi: Remove unused iosf_mbi_unregister_pmic_bus_access_notifier()

The last use of iosf_mbi_unregister_pmic_bus_access_notifier() was
removed in 2017 by:

  a5266db4d314 ("drm/i915: Acquire PUNIT->PMIC bus for intel_uncore_forcewake_reset()")

Remove it.

(Note that the '_unlocked' version is still used.)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/r/20241225175010.91783-1-linux@treblig.org
---
 arch/x86/include/asm/iosf_mbi.h      |  7 -------
 arch/x86/platform/intel/iosf_mbi.c   | 13 -------------
 drivers/gpu/drm/i915/i915_iosf_mbi.h |  6 ------
 3 files changed, 26 deletions(-)

diff --git a/arch/x86/include/asm/iosf_mbi.h b/arch/x86/include/asm/iosf_mbi.h
index af7541c..8ace655 100644
--- a/arch/x86/include/asm/iosf_mbi.h
+++ b/arch/x86/include/asm/iosf_mbi.h
@@ -168,13 +168,6 @@ void iosf_mbi_unblock_punit_i2c_access(void);
 int iosf_mbi_register_pmic_bus_access_notifier(struct notifier_block *nb);
 
 /**
- * iosf_mbi_register_pmic_bus_access_notifier - Unregister PMIC bus notifier
- *
- * @nb: notifier_block to unregister
- */
-int iosf_mbi_unregister_pmic_bus_access_notifier(struct notifier_block *nb);
-
-/**
  * iosf_mbi_unregister_pmic_bus_access_notifier_unlocked - Unregister PMIC bus
  *                                                         notifier, unlocked
  *
diff --git a/arch/x86/platform/intel/iosf_mbi.c b/arch/x86/platform/intel/iosf_mbi.c
index c81cea2..40ae94d 100644
--- a/arch/x86/platform/intel/iosf_mbi.c
+++ b/arch/x86/platform/intel/iosf_mbi.c
@@ -422,19 +422,6 @@ int iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(
 }
 EXPORT_SYMBOL(iosf_mbi_unregister_pmic_bus_access_notifier_unlocked);
 
-int iosf_mbi_unregister_pmic_bus_access_notifier(struct notifier_block *nb)
-{
-	int ret;
-
-	/* Wait for the bus to go inactive before unregistering */
-	iosf_mbi_punit_acquire();
-	ret = iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(nb);
-	iosf_mbi_punit_release();
-
-	return ret;
-}
-EXPORT_SYMBOL(iosf_mbi_unregister_pmic_bus_access_notifier);
-
 void iosf_mbi_assert_punit_acquired(void)
 {
 	WARN_ON(iosf_mbi_pmic_punit_access_count == 0);
diff --git a/drivers/gpu/drm/i915/i915_iosf_mbi.h b/drivers/gpu/drm/i915/i915_iosf_mbi.h
index 8f81b76..317075d 100644
--- a/drivers/gpu/drm/i915/i915_iosf_mbi.h
+++ b/drivers/gpu/drm/i915/i915_iosf_mbi.h
@@ -31,12 +31,6 @@ iosf_mbi_unregister_pmic_bus_access_notifier_unlocked(struct notifier_block *nb)
 {
 	return 0;
 }
-
-static inline
-int iosf_mbi_unregister_pmic_bus_access_notifier(struct notifier_block *nb)
-{
-	return 0;
-}
 #endif
 
 #endif /* __I915_IOSF_MBI_H__ */
