Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF8C3893EB
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 18:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 251E46EE1F;
	Wed, 19 May 2021 16:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8606EE1F
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 16:38:05 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso3776740pjx.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 09:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v+2QREdqW2HXIwZy26xgUhGlmKXeoRbwSm4QcONeIpU=;
 b=pHUUvOpLxOsB9gtmQbg684yPP+rRIWe0/r/Ncbzz4fu7JNy3d5QMGVq42G+3AEAkSo
 6vc7oKhxqvTRZ7ViOa34GHKWwI/xWro1rWaWiMcsj1eoWOaxTOU6oKed95XASr+o6A20
 1SVk/ud52YHiDEarh8WdIwT/nPzVf9MAwei0wKmdEavIyDRdbXDGehsxI7p7ElsXzJ3O
 aj+LcnwDdmz3a3gBhJ+t84FCltWv7ED9NQss75E/o5cN5gVd1A5cGxv1x0bA8zXKlu7i
 FW8gw30hLc7TsERPCjAegD7/Hagetz9hwzsxiHOMXxn9YKGF0u+nMRXvQ4L+K7cuLyj3
 Cdmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v+2QREdqW2HXIwZy26xgUhGlmKXeoRbwSm4QcONeIpU=;
 b=q53CS8OCv31DmOU40+pt+ppTvOvv1FmhVdM0jbgSCYTZcI7sWzmkWymgAUXRWqLURz
 LsTIFiBrhQIFwD73d37FVtq9qj1OMtk41mWhjY/5MDNAmEwRUaKFSzk0e9enP0dCYlkU
 8bHDXDe9Ju43EsElBXh6x+R9PZMl9vJNCkrrMelrteZ62q4reCCsR9RNgajHiRgD2+l0
 UZlHDq++J20tBGJuKKFlsCDhmz9T/pcH4uPcvAJj6N9MLwIFBXRlWMo2tzBCV66POXrB
 JtbG+lTxW/CqX+ps74XOSGY9iL76L8NB+MrcrVFyvwHOLdFxeug57X+xNZHi0H3Xlc+2
 /zCA==
X-Gm-Message-State: AOAM530ukCBMXSAYA+Ljm1UxlnV0yxsxgFDAJFhtlqB82QQM0CyDaxCR
 5Fs605XfWfA9jBMGk1kkv0F9LbxNz2+l9g==
X-Google-Smtp-Source: ABdhPJxnB/0xdDQwHlxTqGn1NC7r4k7Qfc9yYV97bbmsiNLU9A7Z8xr/P/iKC6w4Um8yS3gR753qhA==
X-Received: by 2002:a17:902:dacf:b029:ee:ac0e:d0fe with SMTP id
 q15-20020a170902dacfb02900eeac0ed0femr465178plx.30.1621442284613; 
 Wed, 19 May 2021 09:38:04 -0700 (PDT)
Received: from arch2.localdomain ([182.68.112.122])
 by smtp.gmail.com with ESMTPSA id y1sm1442606pfn.13.2021.05.19.09.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 09:38:04 -0700 (PDT)
From: Deepak Rawat <drawat.floss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org
Subject: [PATCH v5 3/3] MAINTAINERS: Add maintainer for hyperv video device
Date: Wed, 19 May 2021 09:37:39 -0700
Message-Id: <20210519163739.1312-3-drawat.floss@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519163739.1312-1-drawat.floss@gmail.com>
References: <20210519163739.1312-1-drawat.floss@gmail.com>
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
Cc: Deepak Rawat <drawat.floss@gmail.com>, Dexuan Cui <decui@microsoft.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Kelley <mikelley@microsoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maintainer for hyperv synthetic video device.

Signed-off-by: Deepak Rawat <drawat.floss@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 41f2b2b85b6d..dbe4ed540e11 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6084,6 +6084,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	Documentation/devicetree/bindings/display/hisilicon/
 F:	drivers/gpu/drm/hisilicon/
 
+DRM DRIVER FOR HYPERV SYNTHETIC VIDEO DEVICE
+M:	Deepak Rawat <drawat.floss@gmail.com>
+L:	linux-hyperv@vger.kernel.org
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/hyperv
+
 DRM DRIVERS FOR LIMA
 M:	Qiang Yu <yuq825@gmail.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.31.1

