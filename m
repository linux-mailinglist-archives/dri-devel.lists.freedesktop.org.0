Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6B4D46D9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 13:28:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6549A10EA60;
	Thu, 10 Mar 2022 12:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547F910EA5C;
 Thu, 10 Mar 2022 12:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646915299; x=1678451299;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6qiPj6EfjgU94R/D4MnOvl3PH3wC6ELgE8wzPM1o9KY=;
 b=HbrigkXHBhQFU3fQDkHbqMnCQeLmTKKS9krMcwlAav981IZPemjNswXj
 QdqNEpzUpGzT6s7SBDftRmsFEuFgAfbnC9eZgJHjARgm3tctBQpGM9g3x
 H++LELMYdSngEreh+4gP4GHzRskWV8sn8T4C33WjCTClcw4YUzDH9Avgk
 NuPbDZoddStlp1gM6VuK81o2Pp0xGJ0CO1Uzq7N6MTHcTSBTeAog3q5fq
 8X7cZuQo1I+bMEeYIpcKXOA3pFMB4/cMmGQ4JoZe+MtlnWXoMvSS81WH5
 0gsziBBc9UOt4UrzyiZ6WorPNhkuve7S8Al/f0Dv/bamJyvTBork0RKiH A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="341665146"
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="341665146"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:18 -0800
X-IronPort-AV: E=Sophos;i="5.90,170,1643702400"; d="scan'208";a="496237711"
Received: from tcuddihy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.3.1])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 04:28:17 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/8] Some more bits for small BAR enabling
Date: Thu, 10 Mar 2022 12:27:43 +0000
Message-Id: <20220310122751.89693-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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

The leftover bits around dealing with stolen-local memory + small BAR, plus
some related fixes.

v2: some tweaks based on feedback from Ville

-- 
2.34.1

