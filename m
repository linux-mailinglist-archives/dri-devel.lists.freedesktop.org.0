Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF51F7EF227
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 12:55:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F4410E74D;
	Fri, 17 Nov 2023 11:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2563F10E74D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700222126; x=1731758126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x+f6oWcJy+BuVdfdlhM/R/Sb64cWX6yj9k104meQ2Xc=;
 b=LFY6/mm651H673JvUSUdWn5StZgJ5fwYcmuOglt0c3KetyRGNmrKb7qB
 +NEFr6l9CRFd1BuhWXq+8CuSkBUbXY2JMKnS3PS1LS0ZyJRj01i4/4/kN
 0Ihlef9vZYLMG4/cODYCZBOVKqgBmcBDZHBoldv7d67g0SXCNa++TeswY
 69pd8iqudFisrq5BfKrHbKNp30S77Vsb5vKzTPq625uclfyBx/um97Xom
 ak7oFICTtrvXbrD6KwvqLUZYk2hgGVawnFYlt4EvOZ1FW5DZiN/FLFk1U
 ZdnEdej5kWW8AhNxLllkdBj6QMYbOLMcLy0sVQMRb2eTU4vJtXXNiaLBz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="395211869"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="395211869"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 03:55:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="6996410"
Received: from ldyrga-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.213.28.173])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 03:55:24 -0800
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [v7,4/8] drm/ttm/tests: Fix argument in ttm_tt_kunit_init()
Date: Fri, 17 Nov 2023 12:54:53 +0100
Message-Id: <20231117115453.6326-1-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <119b80776b83fa71b67ce746afcc3c2ee8342fe2.1700207346.git.karolina.stolarek@intel.com>
References: <119b80776b83fa71b67ce746afcc3c2ee8342fe2.1700207346.git.karolina.stolarek@intel.com>
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
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
