Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E09A86BE7
	for <lists+dri-devel@lfdr.de>; Sat, 12 Apr 2025 11:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9191710E1C2;
	Sat, 12 Apr 2025 09:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="iVzE4vQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Fri, 11 Apr 2025 10:59:52 UTC
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.155.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118B810EB6C;
 Fri, 11 Apr 2025 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1744369174;
 bh=NmDXTK+4Kxgs42S2SDvzBSL3QLhh5lqVdK90DWHJpMQ=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=iVzE4vQU3oWbZgV0Yc0M0Yp+b4D0PTtqV+6PvvChzV9q/15NrBmsfn8kCrguxHn17
 OBbJPpxzPmJOz7s4gtEuy5TFsGf3B7yQTo6TJ6jDEm47ojOdz1QJ2xFiOcXKnVJfVp
 YyibTs1qlsmiYj66F3bQ1UR/iOUpasqEVIoQ3S9g=
X-QQ-mid: bizesmtp23t1744368955tc9900ee
X-QQ-Originating-IP: E+95eiCIMfMVh6UVqQOHgjo4HzQI0WCrSHwCW4L7S7I=
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Fri, 11 Apr 2025 18:55:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 12124381483811632618
EX-QQ-RecipientCnt: 10
From: Chen Linxuan <chenlinxuan@uniontech.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chen Linxuan <chenlinxuan@uniontech.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to
 `intel_pxp_gsccs_is_ready_for_sessions'
Date: Fri, 11 Apr 2025 18:54:52 +0800
Message-ID: <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250411105459.90782-1-chenlinxuan@uniontech.com>
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5a-1
X-QQ-XMAILINFO: NRkWGnbnkwTmyhcwGdrhPHlggXz5G9kgY6MjCZLFNLFGYbQ9q66KdArH
 z0ZhSjyaTMmZItuKTLBSYdP9Rwsu2BeQap5I55i9sbdjjL6o+YhqoEiQDRW58fjBr52jZew
 Xh8/A35JpkeDMZbp0HB2wXhtJ9lDY0YNgUpIFu7mg5AhyC4ZUL+CRgzRRnRdiK8CSoXOM9U
 kvQZAq5rXrMV3m/XhonJZsrFYDQWXIj7qdc6HKzXtznZJfD18UWpORLzdLYry88PkgHi/Ph
 ekDtrZHO4XQ2fnEpSU5/bYsrM4ZT1VjdM5TjOd9A9yznuy9AlGti23SwTiAbhHTcqMObJ6c
 0/iYm/Zlb+bi9RkMJHEHuz6Ei2HZt+s5leeRJHeuim4PQwfLHDj4vvcg41rGuhZCDxxncN1
 lTYWNGuycRJztc0ZQuDFNc1c2eIFd+e1TmL7ZBBtsKNsJOpUUarIoGqVtAODJAvbe/odlpJ
 BQriGyVMmtlkYg/iHAw3GXzb1+UH6E4Ostqkes3NbgDl2xGcHwGSJL2XD2kLvR38R0SNoTN
 gjqqRZryvWXbSOAY8ihI1dna5xbp0vIZh6e7jyAl7CGG3hZTk1JQGCfcS4IDKutsxNz/PJR
 lr20zl9lV+bC8Ei16eORd5lmMRMYMk7+AyPK9ckclARsXc3efyCsLvWiL3GjKGdcGZiUo5r
 8sPeAkBHDWnRV9WwSoEzyOWn6coU4EbOFuIWl9dG9wOHkNkueKz6OTqkvp7ZMa7kxUf2eJk
 mSid14n1CMCk+oz6ZSTcKe3vyq7Xh8TcVGu55o/2BK2sLRX5WarIz2iybpRrWqZ+KAUhuOu
 j83WJ3fHo3iPnD2o2XjiRSxu9gDn0KlbStYIHGJZhyA+B+pX4DSeh/yY36WCFe1DJ/jdG2D
 nOwOpEmnRW+6eITZfilPRmDGQAozRlbaXyLUDV3ua3Dp/5UJPv9gvQNnh6Jogpfj0NthDay
 +V3d1A+8LooM7paJL6D2nKchstPpcRwPdg8aW8uLiv/a3xg==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
X-Mailman-Approved-At: Sat, 12 Apr 2025 09:08:43 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On x86_64 with gcc version 13.3.0, I compile kernel with:

  make defconfig
  ./scripts/kconfig/merge_config.sh .config <(
    echo CONFIG_COMPILE_TEST=y
  )
  make KCFLAGS="-fno-inline-functions -fno-inline-small-functions -fno-inline-functions-called-once"

Then I get a linker error:

  ld: vmlinux.o: in function `pxp_fw_dependencies_completed':
  kintel_pxp.c:(.text+0x95728f): undefined reference to `intel_pxp_gsccs_is_ready_for_sessions'

Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
index 9aae779c4da3..4969d3de2bac 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
@@ -23,6 +23,7 @@ int intel_pxp_gsccs_init(struct intel_pxp *pxp);
 
 int intel_pxp_gsccs_create_session(struct intel_pxp *pxp, int arb_session_id);
 void intel_pxp_gsccs_end_arb_fw_session(struct intel_pxp *pxp, u32 arb_session_id);
+bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
 
 #else
 static inline void intel_pxp_gsccs_fini(struct intel_pxp *pxp)
@@ -34,8 +35,11 @@ static inline int intel_pxp_gsccs_init(struct intel_pxp *pxp)
 	return 0;
 }
 
-#endif
+static inline bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp)
+{
+	return false;
+}
 
-bool intel_pxp_gsccs_is_ready_for_sessions(struct intel_pxp *pxp);
+#endif
 
 #endif /*__INTEL_PXP_GSCCS_H__ */
-- 
2.48.1

