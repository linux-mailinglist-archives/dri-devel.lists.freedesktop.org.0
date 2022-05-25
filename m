Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C411653433C
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 20:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D6D10E99D;
	Wed, 25 May 2022 18:43:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAE610E618;
 Wed, 25 May 2022 18:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653504233; x=1685040233;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ylNzH0aZT7IDb8yoPBghgoUIoYVJ+sfQIIFN0PCeloA=;
 b=SVRNtMselIbZHBBEoIKgSPshZ7A+9Ak7SHOxh620Qn9B9ARwNqOeLXzD
 G5Eac8ai4bVRPje4fLGg25bP5VDVlZ9LcL7Nzputrq9767oMSCG4T8czh
 JPqDeF7dExv4td0KR4kKfOzrjTu6R3axCirmTKfBATo69zI8VsU7HR4jp
 DD0gMbitn1OFf74XLR/gIJ4baxuVCCXltbZU518ykV+qvLbsIA2ZeZ/96
 wO3ZSpVz/f96iVjmRCuxkr3P3tY4HSMWyFtzoPqNCRewTqtvnM5gIDSRh
 xJOkXDs2JfCoqPMlf9D9B6lFd4pJzW6XKfwjyJK6C/H3LiIBH/7pGsxsV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="274013347"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="274013347"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:43:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="578465094"
Received: from daithiby-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.5.16])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2022 11:43:52 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/10] small BAR uapi bits
Date: Wed, 25 May 2022 19:43:27 +0100
Message-Id: <20220525184337.491763-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.3
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Test-with: 20220525183702.490989-1-matthew.auld@intel.com


-- 
2.34.3

