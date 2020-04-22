Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ECE1B4F4D
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 23:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA2389C48;
	Wed, 22 Apr 2020 21:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA4889C48
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:25:33 +0000 (UTC)
IronPort-SDR: r5/UEIFjNP0Ku5dd8gr4uOwOfPlxhD/w5qhIoFkfU9t5O47E88KAAgdjVpH+sQ8NDWbwF5VLZY
 Xx9Y3kIQ0fJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2020 14:25:32 -0700
IronPort-SDR: DFuFJEnoZCTU9K2xMBtLFbCeQxjQg6MZcAaqrZcRqPh3U5LsRigBA8eOLqYkMdXL84cOy26F1/
 oVSKw38r4bcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,304,1583222400"; d="scan'208";a="259208482"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by orsmga006.jf.intel.com with ESMTP; 22 Apr 2020 14:25:31 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: drm/i915: Teaching i915 dmabuf about LMEM
Date: Wed, 22 Apr 2020 17:25:14 -0400
Message-Id: <20200422212519.36276-1-michael.j.ruhl@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: jianxin.xiong@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the addition of device memory (lmem) for the i915 driver, the
dma-buf interface needs a little polishing.



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
