Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A3D500D69
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 14:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D87E10E2AF;
	Thu, 14 Apr 2022 12:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B94E10E1F8;
 Thu, 14 Apr 2022 12:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649939440; x=1681475440;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HRKFubKrtd5FTv5YNfXCxGA3hC7nrwE2jmGRUJNoEfs=;
 b=FbKyHCGEGU5Wrc8m67otRsB6mK7ge0JqozdfKdIunn4mevnjuKeBgOtL
 1DpYODvHPsSvfNqGyZOLCR2ndFiYFkpUY9Eu6fefxiA0398lp7nT8MqH5
 4m9d8Lenr+Jeu3OkoRsQlo5iN88GpDfFrkt4wGt/xv82xDn5wv7aPB3OD
 3Jwapw6Z91iPEJdTkZfMf4W+y4COcRS8P/DeqlYyUc11EKRo3zeCsE3j2
 OsE2glutozpkvJpHrdCUslEuUFU2qwC8+cWYYNTRcICIQKFreQsZyJ7g5
 7fE9N7IrzAwXSRlweHFr4a+/Tb1s4y6UujTzHXQ2H9qqIyNTZLOZ8ZHuU w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="323362146"
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="323362146"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 05:30:39 -0700
X-IronPort-AV: E=Sophos;i="5.90,259,1643702400"; d="scan'208";a="552662557"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 05:30:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] add support for enum module parameters
Date: Thu, 14 Apr 2022 15:30:32 +0300
Message-Id: <20220414123033.654198-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey, I've sent this before, ages ago, but haven't really followed
through with it. I still think it would be useful for many scenarios
where a plain number is a clumsy interface for a module param.

Thoughts?


BR,
Jani.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>

Jani Nikula (1):
  module: add enum module parameter type to map names to values

 include/linux/moduleparam.h | 64 +++++++++++++++++++++++++++++++++++++
 kernel/params.c             | 41 ++++++++++++++++++++++++
 2 files changed, 105 insertions(+)

-- 
2.30.2

