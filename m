Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C38602283E3
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 17:34:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F21E76E418;
	Tue, 21 Jul 2020 15:34:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1D26E418
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 15:34:41 +0000 (UTC)
IronPort-SDR: g+KFCvfdg0f0Z2NhmW/j9rDgIJI8OPhVEP72wKHiMayDzoOj10I+fyZaX+R7pruYDi20o8nuMq
 GOHeI3fzs47A==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="168297475"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="168297475"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 08:34:40 -0700
IronPort-SDR: uGpqZL3xHpoHwAOLUZvYHOhUidytSL5aLwomY8xG91aOUh1HN2u0st0ELxHRZCfXNXcF/5gOWb
 TI+5N3SqiWKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="271747879"
Received: from awvttdev-05.aw.intel.com ([10.228.212.156])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2020 08:34:40 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: io-mapping: Indicate mapping failure
Date: Tue, 21 Jul 2020 11:34:25 -0400
Message-Id: <20200721153426.81239-1-michael.j.ruhl@intel.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I found this when my system crashed long after the mapping failure.
The expected behavior should have been driver exit.

Since this is almost exclusively used for drm, I am posting to
the dri mailing list.  Should this go to another list as well?

Thanks,

Mike

Cc: Mike Rapoport <rppt@linux.ibm.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
