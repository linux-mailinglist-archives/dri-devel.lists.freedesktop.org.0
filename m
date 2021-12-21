Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54E47C790
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 20:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DE910FED7;
	Tue, 21 Dec 2021 19:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A76D112416;
 Tue, 21 Dec 2021 19:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640115481; x=1671651481;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ujzt86LagKjMqdhM1H0x0oLwJXXrZUzmaZ6yFafsd+Q=;
 b=eSQcxbWnxX5BhiiNt2BNlkL6UEzfW35VmKzMDrumZlDEucHrw9Ic7Jb3
 cdkEhDfLPqqCA3kMd6Yx0/bamCzTod+5KqobIQNYCfs/JZiX/qkez9stx
 SrqntgB8n3DId6gD0j6GMXR2eGsU45qmWEKVVPaRuyGdu5tm34PBfjGf5
 blBY9kS3xcxWGkOr+edU+y00QQREcrZscQlHqVRR7G7kuiVrbYz1H+DbW
 b/hO5ICLWn8z0XjW00VWfyxlMU3U4xRHylOnz0rbQX45OFS87bQpv53QG
 /ICY2wyS1QX3gab1L2VCBlJWj1WWsvncLDada1obJs0cMzvlB9FDteIIF Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240433722"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="240433722"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 11:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; d="scan'208";a="521384617"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga008.jf.intel.com with SMTP; 21 Dec 2021 11:37:58 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 21 Dec 2021 21:37:57 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/dbi: Use a static inline stub for
 mipi_dbi_debugfs_init()
Date: Tue, 21 Dec 2021 21:37:54 +0200
Message-Id: <20211221193754.12287-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211221193754.12287-1-ville.syrjala@linux.intel.com>
References: <20211221193754.12287-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Replace the slightly odd "#define <function> NULL" thing with
a standard static inline stub.

Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/drm_mipi_dbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 05e194958265..6fe13cce2670 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -194,7 +194,7 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 #ifdef CONFIG_DEBUG_FS
 void mipi_dbi_debugfs_init(struct drm_minor *minor);
 #else
-#define mipi_dbi_debugfs_init		NULL
+static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
 #endif
 
 #endif /* __LINUX_MIPI_DBI_H */
-- 
2.32.0

