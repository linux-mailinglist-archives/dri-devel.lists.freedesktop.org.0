Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261625F0410
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 07:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2851110EB56;
	Fri, 30 Sep 2022 05:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 787CF10EB4D;
 Fri, 30 Sep 2022 05:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664514592; x=1696050592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YYG0VPaXVkCI5MGrJEb29K5S9JDFkWLm68XVVeNz5XA=;
 b=GRtnaz/j+bdTC7VCemZafwZEQb1xaiZV6/gmrQC6xWFraMoned7zDOij
 sAAHIRpEW/cdvX37ffp6mMYMNbCtLvqg+jISiWi59PwniRoQMg6kJZ5k8
 6qeFYk9ykCg1J9bZl8KgkY89K19hThvwRXyTXbOHyv+FIhKWyKYenTuE7
 p2WnHAzrZQPKbXvVYJGcKquSVBwALJ40+dPBBAluqiz0CMcUMO0E5oBAu
 FLBGFt7ycxE1e6DraEps2OXTcD6xk+71c/wJWCUJ7tSuO2nDKLq17ootS
 UTuYrOYgPbUup8d/Qz6ivqcg2m1tvnjhAPB28oWTLSsuSMneLFf3k35Wd Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="282469422"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="282469422"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="711668529"
X-IronPort-AV: E=Sophos;i="5.93,357,1654585200"; d="scan'208";a="711668529"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 22:09:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/i915: Improve register state context init
Date: Thu, 29 Sep 2022 22:09:00 -0700
Message-Id: <20220930050903.3479619-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some small improvements to future-proof the initialization around the
register state context.

Lucas De Marchi (3):
  drm/i915: Fix __gen125_emit_bb_start() without WA
  drm/i915/gt: Document function to decode register state context
  drm/i915/gt: Fix platform prefix

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 26 +++++------
 drivers/gpu/drm/i915/gt/gen8_engine_cs.h      | 12 +++---
 .../drm/i915/gt/intel_execlists_submission.c  |  4 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 43 ++++++++++++++-----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 5 files changed, 56 insertions(+), 31 deletions(-)

-- 
2.37.3

