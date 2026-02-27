Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGu6Mps1oWnRrAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:11:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF291B30C1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC83910E0A2;
	Fri, 27 Feb 2026 06:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q20p0KBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4710A10E0A2;
 Fri, 27 Feb 2026 06:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772172696; x=1803708696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HE7WFOO+if4CnWeu+N+g+R69md1HoRSv+PPaWXPzDWg=;
 b=Q20p0KBdlMfUhrOypVLB5sdKakslfTtN/c3grpc5mnuAmpchOz4u7tim
 07WzXFnQ7UmfoksWHrvv62D08oWBv9fOdflOkHyjwi5GjAxjN/XBVnNua
 YBBD9zHv+1Mos2avpD6GYsHClIGzUdIS048zNc4GR1NvBkw0uE+fEU+c/
 zBt70H5I0SPpGqK9QFdZLoSZyM3MsHjYGMOCQV2Y187nEuv+IyNAdSurn
 RYJ9baHM4OrIXmFdIe8CbOcANBEoXu2NQoUO65hEJgLkxtN2iZsGqKIn+
 OK6t+zX4rMqn94tB+6yB+UQfFU5WjzWZ4nqKyQnKbWvuRtSknUSVqMZZB A==;
X-CSE-ConnectionGUID: RedHPOaFQ8q2KUCJdOvPFA==
X-CSE-MsgGUID: KW20RYqCT5unHoiH3mx0og==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="90829436"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="90829436"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:11:34 -0800
X-CSE-ConnectionGUID: lGUFxR3RToKy09vfk+EqdA==
X-CSE-MsgGUID: t2EhB/wVRPmvYtVCtmhbZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="247324176"
Received: from x299.sh.intel.com ([10.239.159.77])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:11:32 -0800
From: Yujie Liu <yujie.liu@intel.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>, amd-gfx@lists.freedesktop.org
Cc: Luben Tuikov <luben.tuikov@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/scheduler: fix kernel-doc warning for
 drm_sched_job_done()
Date: Fri, 27 Feb 2026 14:10:52 +0800
Message-ID: <20260227061052.1752354-1-yujie.liu@intel.com>
X-Mailer: git-send-email 2.43.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yujie.liu@intel.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Queue-Id: 5DF291B30C1
X-Rspamd-Action: no action

Warning: drivers/gpu/drm/scheduler/sched_main.c:367 function parameter 'result' not described in 'drm_sched_job_done'

Fixes: 539f9ee4b52a ("drm/scheduler: properly forward fence errors")
Signed-off-by: Yujie Liu <yujie.liu@intel.com>
---
Changes in v2:
- Split from the original patch set
  https://lore.kernel.org/all/20260226030038.1182961-1-yujie.liu@intel.com/
- Rebase onto latest drm-tip

 drivers/gpu/drm/scheduler/sched_main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index e6ee35406165..fe4c1017734b 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -361,6 +361,7 @@ static void drm_sched_run_free_queue(struct drm_gpu_scheduler *sched)
 /**
  * drm_sched_job_done - complete a job
  * @s_job: pointer to the job which is done
+ * @result: 0 on success; -errno on failure
  *
  * Finish the job's fence and resubmit the work items.
  */

base-commit: 1abdcb654ffbb08bbc96a9806fee60ef65fdad77
-- 
2.43.0

