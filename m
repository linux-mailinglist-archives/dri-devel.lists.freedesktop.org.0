Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFDD61FBBC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 18:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275B510E840;
	Mon,  7 Nov 2022 17:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52A610E828;
 Mon,  7 Nov 2022 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667842978; x=1699378978;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W3zR3ozQVaFaXeQbgRXKBUOwQlqXOEQHKQq2JdzbNp8=;
 b=QfCCXbV2mz5AsIm0H4yJ46LKXTvjXSirl1mBuAnODr8ZENkv4G1/Heg7
 5VhNivldAybqQlv9U81bTlyd1aF7Y3rw82U1UaTM8JKRvnJd7eAZQ097X
 KakQQfiF33zR7gU1lLnVMEQ4N5qzMU8CAtivTt8953zf/O2BHuzYDFJ3g
 lvuUqTZAeU2wltikP6I667j5j/birSAIAQ1C99BMMuRHCNUTtx9534iOV
 AsATA3q02CqdY+OAYKzCmIPw1sPmG9HReZ0uLxoNRqRvmxIPB5aKF+fQa
 grUXcyarmEB0bSyPsyIPepzZtTHxbiVu2jZnLd/L+vP9tiDDKVubxe+CX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="374744378"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="374744378"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:32:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="630568322"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="630568322"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 09:32:58 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Subject: [PATCH 2/3] Documentation/gpu: Limit index to maxdepth=2
Date: Mon,  7 Nov 2022 09:32:08 -0800
Message-Id: <20221107173209.2219571-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107173209.2219571-1-lucas.demarchi@intel.com>
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
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

With a lot of sub-section it's a little bit hard to find the information
needed in the main GPU index. Limit the maxdepth to 2 so it doesn't get
poluted with noise from each driver and from other sections.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/gpu/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/gpu/index.rst b/Documentation/gpu/index.rst
index b99dede9a5b1..1d9402d519be 100644
--- a/Documentation/gpu/index.rst
+++ b/Documentation/gpu/index.rst
@@ -3,6 +3,7 @@ Linux GPU Driver Developer's Guide
 ==================================
 
 .. toctree::
+   :maxdepth: 2
 
    introduction
    drm-internals
-- 
2.38.1

