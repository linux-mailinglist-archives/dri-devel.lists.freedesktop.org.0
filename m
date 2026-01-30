Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ItUL1ILfWkAQAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:49:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE08BE426
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 20:49:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274B510E208;
	Fri, 30 Jan 2026 19:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vc5OcNWp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D269210E208;
 Fri, 30 Jan 2026 19:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769802574; x=1801338574;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UNPg2k9NCGEdxs2Ipcka7zeqB3c3EOb19DQvc5BI038=;
 b=Vc5OcNWpTRWatkjYqPHLOi3CoV3aRI07Q04RBMch+YmdzVcrXKIZ8io5
 hlgARCzzRKAskO3ZJkw8nNsoGcBhnVpFup6j6MY3NxNl2SWnQcuQEhFFj
 ArbLUJp7CV/Jmiwx4hdHv5kaxHl9nlYT99FnLD1YBVUFRcehl1qSpBguc
 AG1TOJF/AeeiPhx9D9nV0BVaNzgw+fdO/bb39Q9wjLQyqNlrmikBMofO7
 Ahvm7Iu9Xibg8iwqlQLlkwXGOx2i99xVyP+RfZgGPZb80W9ZZNLh8LxRa
 Mnp7ptT4fGBFLxCMuFjdTCUKFx+RND/GrCUte3j02tMcUm7rXukJp+WW1 w==;
X-CSE-ConnectionGUID: /5BPUUBIRHyCtAyNK1cv2g==
X-CSE-MsgGUID: yCBVFDZpTbiFNrmdKtUE+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70260318"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="70260318"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:33 -0800
X-CSE-ConnectionGUID: yQbk8/K5ShqCDQNFUh54eQ==
X-CSE-MsgGUID: t7Pfqs7CTjC5GyQ22p+tdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="240202394"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 11:49:33 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: francois.dugast@intel.com, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [PATCH 0/2] Small GPUSVM fixes 
Date: Fri, 30 Jan 2026 11:49:26 -0800
Message-Id: <20260130194928.3255613-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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
X-Spamd-Result: default: False [0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	SUBJECT_ENDS_SPACES(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[matthew.brost@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 4EE08BE426
X-Rspamd-Action: no action

Noticed a couple of small GPUSVM issues which need fixing.

Matt

Matthew Brost (2):
  drm/gpusvm: Force unmapping on error in drm_gpusvm_get_pages
  drm/gpusvm: Allow device pages to be mapped in mixed mappings after
    system pages

 drivers/gpu/drm/drm_gpusvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.34.1

