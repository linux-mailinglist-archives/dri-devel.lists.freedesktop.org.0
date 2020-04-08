Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1449E1A3015
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F246EB5F;
	Thu,  9 Apr 2020 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33706EA64
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 13:37:40 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id x66so31263qkd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 06:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8mBf/x6tKmxXEyAN6VSKYHc9JSU+mIaA50Z6TnFau4=;
 b=oNGBRMTTT4G0ujvkoAxRMd3XDpqMEs3ISjiGTl3+WMr3y0jNbTYWFZVr6oSkfSctjo
 820mOtbknzXiP1a+VHzTLSrRoFPDtBkZyrvm3Y3KHV/5L1o66DFPQqYtjEqM7Q2tmeN2
 bZYbGMP/wDNJ20bM9UVlVtK9xYk0ZDHBaRHDUwPMUyRhgJFh220KAzu6Ob9GFKhlQauB
 xWQdo4bNV/1iV8qJjw+cDLSSoaWUxzOP+3oFmut9SJFXCDdi73L1QXjveEoi4S959mUF
 MlfOIVkuGAoI/PZErdQEivO3GhuWEOt1ALkBlCc746rf7CeiGoO3crXm+N6ddXc4vbo8
 YTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a8mBf/x6tKmxXEyAN6VSKYHc9JSU+mIaA50Z6TnFau4=;
 b=hZoH2gKB8EDeNAv/0XAejenRg3xZJzFmclNnvq+bV6kdCYGYpHww7gTYpv/Jg7zhID
 +WtVf5lmn+eV96MkhthEG+sHxodzYxEODj54Hj80aqAuHANQKdz8d5pMA6t6Oi8zNIiv
 3IO8q58VImE1yKo2bPCC678pzSNgaojMdpOre7x6F9eThnHLzYdKXc3Ai2qgBXf8/NCo
 fY9DoNeaCFgzCyqT+hGXO9qX+g3n0OdxoFYJhhcx2PODpjt14FMk7AZYNK8aZYhK8+Tl
 KPz8KPqDau7YFrOsIiNoMIZybKslzzo7njUZL9dwwC9q/6KVSUK3QBhVWG5iHOeM911A
 jIAQ==
X-Gm-Message-State: AGi0PuZuItqFY+7lB1lJD3CgtKhAwpz4ArM2pmpNsh0XXSEu4Nka7/98
 ufvIDM7Z8N7+Wc3h9bBZMaFmLg==
X-Google-Smtp-Source: APiQypLRBp+bZkFj4khOGASSTYhMEobSFxchIEOA/aHpRrEQBTYsVV97VRsDR3YR4b6DeyK0CmNFZA==
X-Received: by 2002:a37:9e17:: with SMTP id h23mr7319606qke.315.1586353060016; 
 Wed, 08 Apr 2020 06:37:40 -0700 (PDT)
Received: from localhost.localdomain (135-23-249-169.cpe.pppoe.ca.
 [135.23.249.169])
 by smtp.gmail.com with ESMTPSA id q5sm8493827qkn.59.2020.04.08.06.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 06:37:38 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
To: alexander.deucher@amd.com,
	christian.koenig@amd.com
Subject: [PATCH] drm/amd/amdgpu: add prefix for pr_* prints
Date: Wed,  8 Apr 2020 09:37:35 -0400
Message-Id: <20200408133735.7679-1-mail@aurabindo.in>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: airlied@linux.ie, avid1.Zhou@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu uses lots of pr_* calls for printing error messages.
With this prefix, errors shall be more obvious to the end
use regarding its origin, and may help debugging.

Prefix format:

[xxx.xxxxx] amdgpu: ...

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index da3bcff61..67d654a89 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -28,6 +28,12 @@
 #ifndef __AMDGPU_H__
 #define __AMDGPU_H__
 
+#ifdef pr_fmt
+#undef pr_fmt
+#endif
+
+#define pr_fmt(fmt) "amdgpu: " fmt
+
 #include "amdgpu_ctx.h"
 
 #include <linux/atomic.h>
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
