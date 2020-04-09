Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 899291A3027
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD22E6EB7C;
	Thu,  9 Apr 2020 07:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369B16EB2D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 01:28:23 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id ef12so4733642qvb.11
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 18:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aurabindo.in; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAZ49xsLFafBw1eWwQbQgcyCMLWhUsSohaRadPz3t44=;
 b=gGAFmj/fpiuOrhiYazOd8ZJKb6FeO5AcwBXbcykszik2Cxb11C6INXDPGjZMgX/IFL
 +8D0QXaBjKOfXqrfiz6uxYMOaI+BTDldCTv+XLW5SH3eY3eJ9F4BdJAQvelqu8zm58RA
 kOFtmJcThBkMtMItCWkwgfjkzJVC141uKOV6IXm/dAyZ0eueS4wO3b437dyZRrVzdG6I
 601kOarVFZTFtZOMcPJkE9U7ugiUoPFoXsFT+CLNnzBlQ5DKbHJQpeHrHCMSO18ArPJ6
 5XSjo+2ShjDn/GNQK7IhGamQxv+BtZuN4R9pV98ffL7O6gPAENUwTiasoXfWUWVkjRf1
 j2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iAZ49xsLFafBw1eWwQbQgcyCMLWhUsSohaRadPz3t44=;
 b=j+br4ekLe3D0R3QnovFgAnZJbG8rO9tLW/JwtYCvWiwTcS9AEMdlGPmQhuTLiR47Pn
 PT/ZJllbeM7gFnONRC/Hi/kSftY5y5/iaZnM9J8ESHOaQr6cqn885SbKeA8rIMnVLk2k
 OS+K8rDKe+C156u7mTr5JouKoEkq3T05ps47SFaJeJ/tqwhLfFR1/Pl7oQ4rNQYSLUvD
 Qu6LtliVi6L2pvc0vbXnfUxEDLpsirv4sbCJqQXHmnWPPdhJnoBFzWPxJ2GoF6KZ/pjm
 OLtK+TYP2Q2inwuHfnqh8FEC96LuoZkqS09rlgjkOB3IFfJhZDLMgLp8ihPW3cpXN66p
 OJIA==
X-Gm-Message-State: AGi0PubFBfdL6I+6F5XnOo1ZkVBrde6NouNW5SyQrOQcyoMXZw3PZm6L
 kn4DD4kk/JME8cVMVclzQO6V1Q==
X-Google-Smtp-Source: APiQypJc2DhYwtTtM+Ce7usYBK/yFp24XNfCDvHn8AqXL3/muK8IGYc5YthGfwGZy0C04JbdRiUWqQ==
X-Received: by 2002:a05:6214:9cb:: with SMTP id
 dp11mr9948057qvb.60.1586395702443; 
 Wed, 08 Apr 2020 18:28:22 -0700 (PDT)
Received: from localhost.localdomain (135-23-249-169.cpe.pppoe.ca.
 [135.23.249.169])
 by smtp.gmail.com with ESMTPSA id h13sm11710186qkj.21.2020.04.08.18.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 18:28:22 -0700 (PDT)
From: Aurabindo Pillai <mail@aurabindo.in>
To: christian.koenig@amd.com, alexander.deucher@amd.com, David1.Zhou@amd.com
Subject: [PATCH v2 2/3] drm/amd/amdgpu: add print prefix for dev_* variants
Date: Wed,  8 Apr 2020 21:28:14 -0400
Message-Id: <20200409012815.22309-3-mail@aurabindo.in>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200409012815.22309-1-mail@aurabindo.in>
References: <20200409012815.22309-1-mail@aurabindo.in>
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
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Define dev_fmt macro for informative print messages

Signed-off-by: Aurabindo Pillai <mail@aurabindo.in>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 67d654a89..7a52d37e6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -34,6 +34,12 @@
 
 #define pr_fmt(fmt) "amdgpu: " fmt
 
+#ifdef dev_fmt
+#undef dev_fmt
+#endif
+
+#define dev_fmt(fmt) "amdgpu: " fmt
+
 #include "amdgpu_ctx.h"
 
 #include <linux/atomic.h>
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
