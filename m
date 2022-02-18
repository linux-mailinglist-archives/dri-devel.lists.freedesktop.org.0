Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EBB4BB7FC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 12:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD2210EA11;
	Fri, 18 Feb 2022 11:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFD510EA11;
 Fri, 18 Feb 2022 11:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645183529; x=1676719529;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IjnCDa8zGx/Mw5DSU2XCOFdZVljnetKnEZf8gLsK1tQ=;
 b=UpC99Ezi9vpMLryZaWDJSyd8nCIs6gExZpZKHXKzgv3pvH/U6qXgV/nr
 TlbBUh6aKc1wyLG+GllRD1AQKjxNM3LIFlvGm1aG9ZORQCYQDRPHhGrko
 2T+0E9QVsY0cw7ChZAHGTvvhq9y5d/C0e/ART7rwX9+CSjLW7crdKE9hP
 07nc3atSaoDWDs28SVCv4YxJgjo9mISw8p+B6elVu7Wxbj95K2emvy7ao
 RrdNtUyN7tzSc2K8RxL5cHX+06mOXfAfeIKTrNt4GjyrnOQTMyA51M4Ca
 0EHjnQxN0NQejjHpZ0TF68i6MkxscrMWJBRxIcCIkG+zyiN4ImyEXBLD1 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238512848"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="238512848"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 03:25:29 -0800
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="705344756"
Received: from jawiblin-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 03:25:28 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] doc/rfc for small BAR support
Date: Fri, 18 Feb 2022 11:22:40 +0000
Message-Id: <20220218112242.2117968-1-matthew.auld@intel.com>
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

The new bits of proposed uAPI for the upcoming small BAR support.

-- 
2.34.1

