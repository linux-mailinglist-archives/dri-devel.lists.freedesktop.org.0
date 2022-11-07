Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE7161FBB8
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0160610E83B;
	Mon,  7 Nov 2022 17:43:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F8B10E837;
 Mon,  7 Nov 2022 17:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667842979; x=1699378979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XlCKGtfUOOsWZKAmOLbMdf7L0wmWwqYuF9wT5UroNEg=;
 b=JcOlRC0r0lh2EAEpV8f3y9QSTifChTLOjUMSzG7t65CfmPT2H9PFJVu3
 HIM4tD3PQJDNxANuEeRpPucl3kooxUrLausLImfval7FYcd7Nt4ZNPfIt
 VRcm9jn3rOteV9HxTXxm3L+XQVJdazb/4tDunWoMelz84dl4v/BNJ5Vsp
 ya6BX6SUVMRwh4wKMr/FBW0EJmTz6onog7gpe3I5EXvooequoa+IUEEh3
 SjB2IBz6brrSCzN0lCPvtoIomO4E+FnYbMaHM0E4XxLzFWRa2HOsmbnj0
 qguudaVPvuuenylvC/dB5OvgyHlrtw/AcZFDDadhktZ5uxLBJ8Kv/7BzO Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374744375"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="374744375"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:32:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630568315"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="630568315"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:32:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: [PATCH 0/3] Documentation/gpu: reduce verbosity in toc
Date: Mon,  7 Nov 2022 09:32:06 -0800
Message-Id: <20221107173209.2219571-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking some issues I was having i915 doc made me look at the toc for
Documentation/gpu. I think it's too hard to read when extending the toc
all levels for each driver. Reduce it to maxdepth=2.

Also fix the usage-stats section appearing in the wrong place.

Lucas De Marchi (3):
  Documentation/gpu: Fix section in the wrong scope
  Documentation/gpu: Limit index to maxdepth=2
  Documentation/gpu: Limit drivers index to maxdepth=2

 Documentation/gpu/drivers.rst         | 1 +
 Documentation/gpu/drm-usage-stats.rst | 1 -
 Documentation/gpu/index.rst           | 1 +
 3 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.38.1

