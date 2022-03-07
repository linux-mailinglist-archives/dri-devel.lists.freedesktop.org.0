Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7904D0855
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 21:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D9F10E180;
	Mon,  7 Mar 2022 20:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586BE10E173;
 Mon,  7 Mar 2022 20:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646685005; x=1678221005;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lEfZFbhadpvMpkae0qaumiOR++1Tz+U//Gup1pG64T8=;
 b=aEIUyG8Zad+QFemEwLb2EoXMeRRmWCrqKrpBK9M5jVNwASh2Lo5d7fkt
 ATFrlB0/THmRO8+nXkaiJqwqvYGbEh9U5Nppj5/0uTDqbpPRirR2QkRrP
 3G/rZ2lTSuEf59PCNma4vD8GiVf48IlHW5LJ7JTYLgcYHL55fb54BAbkZ
 TwzVCP+Kmlh9Fk5hxwGjsttL/8xeVwi+gMim6dT030rmAoQ8cxbowXsOS
 fi1clsz8rLox+lzYzl6tZYm3ZIx9oh/U715pfFukNPD5w3FgKvj9niOFX
 yAa69DQRD3+3uNVXt3LdhTwSoSS2tZpBAV0rooYL4lxLWFF0tW3yPbbYq g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="241932980"
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="241932980"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 12:29:43 -0800
X-IronPort-AV: E=Sophos;i="5.90,163,1643702400"; d="scan'208";a="495188046"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.76])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Mar 2022 12:29:41 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v2 0/2] drm/doc/rfc: i915 VM_BIND feature design + uapi
Date: Mon,  7 Mar 2022 12:31:44 -0800
Message-Id: <20220307203146.648-1-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.21.0.rc0.32.g243a4c7e27
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
Cc: daniel.vetter@intel.com, thomas.hellstrom@intel.com,
 chris.p.wilson@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is the i915 driver VM_BIND feature design RFC patch series along
with the required uapi definition and description of intended use cases.

v2: Updated design and uapi, more documentation.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>

Niranjana Vishwanathapura (2):
  drm/doc/rfc: VM_BIND feature design document
  drm/doc/rfc: VM_BIND uapi definition

 Documentation/gpu/rfc/i915_vm_bind.h   | 176 +++++++++++++++++++++
 Documentation/gpu/rfc/i915_vm_bind.rst | 210 +++++++++++++++++++++++++
 Documentation/gpu/rfc/index.rst        |   4 +
 3 files changed, 390 insertions(+)
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.h
 create mode 100644 Documentation/gpu/rfc/i915_vm_bind.rst

-- 
2.21.0.rc0.32.g243a4c7e27

