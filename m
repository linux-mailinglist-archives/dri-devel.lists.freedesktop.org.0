Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A43A233C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 06:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26256E827;
	Thu, 10 Jun 2021 04:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1399E6E455;
 Thu, 10 Jun 2021 04:19:01 +0000 (UTC)
IronPort-SDR: Vj0Xqd/dFtjGyIr8g/IioUrgp/z3jgiLqY8nmNp8RRel77xYmLALkDIwJaC8CMk65PoaMIsNw4
 ITN8Cu1KT96Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="203373014"
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="203373014"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:01 -0700
IronPort-SDR: +GXJYM8vMaAz3jPDo0y+hMOfvn6j5rwJIOJC9j7sU5pswHbEbgyMYbvMHEumnBSOZB5W0n09Pf
 iD504Ry9V5Sw==
X-IronPort-AV: E=Sophos;i="5.83,262,1616482800"; d="scan'208";a="485997282"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 21:19:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/13] drm/i915/doc: Include GuC ABI documentation
Date: Wed,  9 Jun 2021 21:36:45 -0700
Message-Id: <20210610043649.144416-10-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210610043649.144416-1-matthew.brost@intel.com>
References: <20210610043649.144416-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michal Wajdeczko <michal.wajdeczko@intel.com>

GuC ABI documentation is now ready to be included in i915.rst

Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 Documentation/gpu/i915.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
index 42ce0196930a..c7846b1d9293 100644
--- a/Documentation/gpu/i915.rst
+++ b/Documentation/gpu/i915.rst
@@ -518,6 +518,14 @@ GuC-based command submission
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
    :doc: GuC-based command submission
 
+GuC ABI
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_messages_abi.h
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_mmio_abi.h
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_communication_ctb_abi.h
+.. kernel-doc:: drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
+
 HuC
 ---
 .. kernel-doc:: drivers/gpu/drm/i915/gt/uc/intel_huc.c
-- 
2.28.0

