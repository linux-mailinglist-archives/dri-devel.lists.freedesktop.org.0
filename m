Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7533211DF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 09:20:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6996E4D0;
	Mon, 22 Feb 2021 08:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x830.google.com (mail-qt1-x830.google.com
 [IPv6:2607:f8b0:4864:20::830])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F9C6E32F;
 Mon, 22 Feb 2021 08:20:30 +0000 (UTC)
Received: by mail-qt1-x830.google.com with SMTP id a2so3106972qtw.12;
 Mon, 22 Feb 2021 00:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEsue70XIPQEInMMkgGoF4UA9sanH7a374aFWEVWsoQ=;
 b=Dfuv3wSOf9TNSmJ+wDsYfVCQx8U0hJku/qx541DETfjJYSEr7hA95MwV1cLnCr4p9A
 ZKMNnf7KhPsUagyaP5yvxAZhGYXIAJGi4h74GRjKRr4uuNb6t1g2AYf8OwJFbm/ztFAo
 DxejTTl+a1GO2OF4hf6UnoefACroXkwkLSPtE3TpfghWy+DVW6MNXAbJP3W/TB1IKC+r
 CuzU4Ah1WHiZsIWsSt9nlfEhrayGfJROckKejkL3hcB7+rCaVwN1+H5LXQwh8C9G89eZ
 y8geH5u5QKlQg5E/dYg6Q/XJpKFSbJ2VChZTIaqHfdlj5K1gpIggx0KblPkY01JpCeJo
 9gSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEsue70XIPQEInMMkgGoF4UA9sanH7a374aFWEVWsoQ=;
 b=WUfXlxSSG8+nuYWTSpCggXhz3+fXk00le+zA1tOsOxY2b3ia/95ipvqryCaIPJ5T66
 UtUnE09tjbGOQ0lTwko95Xxq22ZamUXDan4w0Y50ny94FqaggdIZ36dcllmZwXT2u5og
 SZdsj7PkjbDBOrxewIbdChqCkZc2ULrSMbt9E+Zk8CtR7uqPhSjy4VKLQUny6IAxI5nd
 yFrjqAPuwbbcCCCp2PKh4I7xbCs61etKUD3sGR2pNMnf115y64azUJlh1jPyzjjmS35i
 +09uK7315460sN2Sk0WU8gIGM4V7h89gVmyURPMOLDDIYUeJcCx6jo1Z/MjpPLmw5y1F
 EMFQ==
X-Gm-Message-State: AOAM530nVwD44qjlqIRxXpO2Azun7VojrTPR6JtVLiyR+hyZkTolCJoH
 HsjDeHwBTpYm6xwifEC8Mgc=
X-Google-Smtp-Source: ABdhPJw+6w74sHbYZbuUPQpqzjMte/UAu7Uu4isgDpuMj1BA2fUbg7ij1cTMu1Jdeg9pS8ny1lBxZA==
X-Received: by 2002:ac8:37c8:: with SMTP id e8mr4003871qtc.29.1613982030073;
 Mon, 22 Feb 2021 00:20:30 -0800 (PST)
Received: from localhost.localdomain ([143.244.44.214])
 by smtp.gmail.com with ESMTPSA id i13sm1074777qtv.95.2021.02.22.00.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 00:20:29 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: jani.nikula@linux.intel.com, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: gnu: drm: i915: gvt: Fixed couple of spellings in
 the file gtt.c
Date: Mon, 22 Feb 2021 13:48:38 +0530
Message-Id: <20210222081838.30328-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/negtive/negative/
s/possilbe/possible/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/gpu/drm/i915/gvt/gtt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/gtt.c b/drivers/gpu/drm/i915/gvt/gtt.c
index 897c007ea96a..dc5834bf4de2 100644
--- a/drivers/gpu/drm/i915/gvt/gtt.c
+++ b/drivers/gpu/drm/i915/gvt/gtt.c
@@ -1159,8 +1159,8 @@ static inline void ppgtt_generate_shadow_entry(struct intel_gvt_gtt_entry *se,
  * @vgpu: target vgpu
  * @entry: target pfn's gtt entry
  *
- * Return 1 if 2MB huge gtt shadowing is possilbe, 0 if miscondition,
- * negtive if found err.
+ * Return 1 if 2MB huge gtt shadowing is possible, 0 if miscondition,
+ * negative if found err.
  */
 static int is_2MB_gtt_possible(struct intel_vgpu *vgpu,
 	struct intel_gvt_gtt_entry *entry)
--
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
