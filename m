Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD49E3A381A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 01:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4C66EE20;
	Thu, 10 Jun 2021 23:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396A56EE1E;
 Thu, 10 Jun 2021 23:48:17 +0000 (UTC)
IronPort-SDR: P5Md9LE7bGP0k5K6y5SAi0pNJ7prYocOSnuibRqZDfgERr2cY3PuGUQx7XwxmmaqKGc5Ghb+hw
 rZZIOmGyB56w==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205246682"
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="205246682"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:48:14 -0700
IronPort-SDR: DYMLCkQpceyBisvQxyws+8RJTqugRHpn6EsE4v3XJaBaYPBti3aBt/mHeNJDOUqWJm8aD6foSs
 DpVqaza86Zzw==
X-IronPort-AV: E=Sophos;i="5.83,264,1616482800"; d="scan'208";a="483054957"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 16:48:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/1] Relax CTB response timeout
Date: Thu, 10 Jun 2021 17:05:54 -0700
Message-Id: <20210611000555.133859-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 Michal.Wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A previous version of patch [1] was NACK'd because it introduced a
Kconfig option. We agreed on a larger timeout value if problems were
shown with the current timeout value. A problem was shown in CI [2],
let's increase the timeout.

[1] https://patchwork.freedesktop.org/patch/436623/
[2] https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_7775/fi-cfl-8700k/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html#dmesg-warnings385

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (1):
  drm/i915/guc: Relax CTB response timeout

 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.28.0

