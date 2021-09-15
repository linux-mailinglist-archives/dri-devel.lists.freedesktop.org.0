Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49AA40CAAF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217F96E99D;
	Wed, 15 Sep 2021 16:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2386E98A;
 Wed, 15 Sep 2021 16:40:37 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id n24so4232353ion.10;
 Wed, 15 Sep 2021 09:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FAAUD4UVAIgvdGAgUfVDeuWiveCb3NYwtKpCMpZVl+I=;
 b=Nj6tYJpK9houkWpzaczaQjb7+uMjNtEtRE8whUhsX4iXhn99YimKrVl8Df/+DZDfwH
 PPddZMCvXjaAKQrGRlRZ1dm8R1/3oGR5hQ+maecuXHvUZnUHAfkryqAnGd9uxILiPQUR
 FWKXCXiPVuTWx/AKPHyt63yAxq3RQy0d8ZlIpg6fv+5tdq3oyYPWJ40XuoUaQdDyZ8rN
 QvqlHsGz5Fm8TJ87izJo7SpUX3at/RkD+JT5PA75TBT1w+FLByGcpdEPfU2h8LKdhlrv
 S1JPwdnhVfw/7tOVfzuwQDj89zEUgrOCl5cS/VUy8EUx89q+5JP7VfsPmZ4hbv9DGfLQ
 uDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FAAUD4UVAIgvdGAgUfVDeuWiveCb3NYwtKpCMpZVl+I=;
 b=h65YwKHGSjxZuLMDCIiCE7gjch1saoefkiNt7Ye+TBiRseA+Y+b6BDwUYZZJoXLC88
 XAcU0rHrgPsrjLsvIcDgVtcoTJHZ+jm/cyLFGVc6ggmXn3QQfK/MNT7OPEoIl8Vc7DCr
 59JCCpI9aLXt1UK12EbKSaBMcNAH78k+/BY8ogDppe7dPUz3ETB3k4zBYhtRQOc9scnC
 XCBbP6DRszHaiB9g95YjVrOKFiSmDq7Pke1SRZJGEOilmY2u0ExWiRKyCdl4OGeJwuVi
 j49RtROHCWszmxFu2q+YzNitIwHzwxJVttCN8mcMbnZpLxiDUpUr++E94FhJI60E0BNs
 AOVg==
X-Gm-Message-State: AOAM5329rSxRx1J1nRB2Zh1wnAMxC+FprexLoN9wn00DB2wz+0XnBWLu
 i4FFeQgSlj1k0iGkkq+LSDk=
X-Google-Smtp-Source: ABdhPJzFP26+aohIn5kHPCvXIsCTdV2lsKWwp1Fz6xIAnhxk/uwdB/4xjSujak3OGTs20tOa/e421Q==
X-Received: by 2002:a05:6602:200f:: with SMTP id
 y15mr793147iod.64.1631724037160; 
 Wed, 15 Sep 2021 09:40:37 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:36 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 07/16] dyndbg-doc: fix bootparam usage example
Date: Wed, 15 Sep 2021 10:39:48 -0600
Message-Id: <20210915163957.2949166-8-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This example uses dyndbg as a core/kernel param; it is a (fake) module
param.  Using it as given gets an "Unknown command line parameters:"
warning.  Fix the broken example.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index ab28d200f016..b7329e72c630 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -359,7 +359,5 @@ Examples
   Kernel command line: ...
     // see whats going on in dyndbg=value processing
     dynamic_debug.verbose=3
-    // enable pr_debugs in 2 builtins, #cmt is stripped
-    dyndbg="module params +p #cmt ; module sys +p"
-    // enable pr_debugs in 2 functions in a module loaded later
-    pc87360.dyndbg="func pc87360_init_device +p; func pc87360_find +p"
+    // enable pr_debugs in 2 builtins, 1 loadable modules init* funcs
+    params.dyndbg=+p sys.dyndbg=+p pc87360.dyndbg="func init* +p"
-- 
2.31.1

