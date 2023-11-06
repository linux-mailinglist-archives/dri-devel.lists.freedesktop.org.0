Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B287E1DE6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Nov 2023 11:08:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9A6110E2AE;
	Mon,  6 Nov 2023 10:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 804A210E2A5;
 Mon,  6 Nov 2023 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699265320; x=1730801320;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3FTaU3UZGXHaCP0kFA3RhbeuFF1T8ffaPIWh2QxDvAk=;
 b=HPXQwtMY88qBUMAVKWWC6zNuM1iqqZ4fgjxpSEbPwkB3kuQO1bXvB3fE
 6gwOsGnRZoijoXnp9S0T38uWazSuJ5qqxE51XBYNRAbu0h2Mi/HVoyndY
 eCa51NSHsO43ww0kW3HN3BC85RRgwy7I0Smgjeb4Xmbsc6sqarkk1q/Zc
 iAHA7FKrDZpqYe2R2DMdjLI1Si/MUvV/0jSwR0f+uM5bpUjBpOegiZt//
 Y53r/r5Ksdw+mxZToRpyclGgHFEcwZK7eNrfJ9HW/GxlfpjRQ6cOhxkVz
 OB8cO5Z542EF6K43zYsj69koT3YJCo+/rnNFbNN/4pAjxSSvMLm2PPYpI g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="388125605"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="388125605"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:08:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="755804910"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; d="scan'208";a="755804910"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.213.8.220])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2023 02:08:37 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] lib/kunit: Execute test cases synchronously
Date: Mon,  6 Nov 2023 10:59:36 +0100
Message-ID: <20231106095935.7031-4-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Load KUnit modules in a way that only one selected test case is executed
per each IGT dynamic sub-subtest.

Janusz Krzysztofik (2):
  lib/kunit: Split out reusable part of test case list gathering
  lib/kunit: Execute test cases synchronously

 lib/igt_kmod.c | 262 +++++++++++++++++++++----------------------------
 1 file changed, 111 insertions(+), 151 deletions(-)

-- 
2.42.0

