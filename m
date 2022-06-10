Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E73546FFB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 01:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2082F11AFB3;
	Fri, 10 Jun 2022 23:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0D611AFAD;
 Fri, 10 Jun 2022 23:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654903268; x=1686439268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A4+lPKDnTI+yoJGG5baeZBNbeEmhuj3eODvaLwB6HHE=;
 b=YGGnrLG7+ABCQ7sgrbtasYWDpLVhluNlP0FypMEx0mF4eKiBrF0fyPGd
 LGrD8ksoHUV4vWoUIWgN6Pl+5Ba1HKZZZyCoseAIaqm5LNWPzAA4S0/MC
 BWTsWakbdItV46IgNZfQDzNqPfZkkyQeCAHwt1P6J0jTX2/FctGjLC4X0
 1wqlonq9v2zjonGvBGM4BpkyhuIygPjlZ8eqtmEAk+RAEOj9ZCJ0iKk7e
 VEy4Wl3hpU9g5lZLjfMvBTKKwDXVQO3zsplnyKTE4+9XyVjH4t9xDRLYe
 RtbVSaPnISD6q9sFmpnRK8BgqaMzGZtcHgLPl82KiIerFzwM8YMsdFtgJ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="258210106"
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="258210106"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 16:21:07 -0700
X-IronPort-AV: E=Sophos;i="5.91,291,1647327600"; d="scan'208";a="610919574"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 16:21:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] iosys-map: Fix typo in documentation
Date: Fri, 10 Jun 2022 16:21:30 -0700
Message-Id: <20220610232130.2865479-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610232130.2865479-1-lucas.demarchi@intel.com>
References: <20220610232130.2865479-1-lucas.demarchi@intel.com>
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
Cc: daniel.vetter@ffwll.ch, Lucas De Marchi <lucas.demarchi@intel.com>,
 christian.koenig@amd.com, tzimmermann@suse.de, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's one argument, vaddr_iomem, not 2 (vaddr and _iomem).

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 include/linux/iosys-map.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/iosys-map.h b/include/linux/iosys-map.h
index 793e5cd50dbf..d092d30f5812 100644
--- a/include/linux/iosys-map.h
+++ b/include/linux/iosys-map.h
@@ -23,7 +23,7 @@
  *	memcpy(vaddr, src, len);
  *
  *	void *vaddr_iomem = ...; // pointer to I/O memory
- *	memcpy_toio(vaddr, _iomem, src, len);
+ *	memcpy_toio(vaddr_iomem, src, len);
  *
  * The user of such pointer may not have information about the mapping of that
  * region or may want to have a single code path to handle operations on that
-- 
2.36.1

