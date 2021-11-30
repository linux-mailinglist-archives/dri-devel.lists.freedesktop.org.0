Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 003B2463579
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 14:30:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226326E116;
	Tue, 30 Nov 2021 13:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E9CB6E3D8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:30:23 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3NPq1yLGz9vmdF
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ogsND0ZNdx7M for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 07:30:23 -0600 (CST)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3NPp6zQvz9vmdC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:30:22 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3NPp6zQvz9vmdC
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3NPp6zQvz9vmdC
Received: by mail-pj1-f69.google.com with SMTP id
 p8-20020a17090a748800b001a6cceee8afso6782261pjk.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 05:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BkYKhAYDRvCU9BA50ZAHDXbEjS7ZYXZYlZfMe/zTsg=;
 b=lTINGR/FdIkP4B1IPin6tk9l5kaUpYn6ZTOVoWYb6/d2JmLrhlMfFlG4RIPBGIAcMm
 9xQo5WXjSMiFhPTvnmn2v8OJP4l9Z6hEwOsptIhKC2+BLMvg6PArEhqqtUuoQrva3Ygb
 Gdr2sd92NKNgszBn8+F1jUKeJQqNETEpDDjzadFOf5FS+XgtUkx7j/z1OrhoxMEcRRH5
 dAPyWLCpYcdAEJcy2Xd+r193kL1dILxGL/0pYFYwjoUm0yH7K47uZ6zBv2feXrlWXPXZ
 JJ0yMfhZMljguw6i37EFapxYPQj26u4IbPB4lmBZNEIaWhd+DuIVDluMuWdTfpzOuC4R
 +0SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BkYKhAYDRvCU9BA50ZAHDXbEjS7ZYXZYlZfMe/zTsg=;
 b=YsGsH6FbksvLcBhiJq0M55fr1CVl3LKg9AXhiCbQ0X1PiGzyKlW6WgaePuqdEjd/nV
 yocusSJ67Wh+FskpCaoRn3IUrfIdshw+BFnIorIU/HqBJU+vk/UXcH6zUAzRjQmtW7HH
 oOQZgk0UlHLSnte3oFGVY8dYgtMjzr+d9zUITfMNzchkxhUT2pZDjak0PyaiYMjU2tFh
 KLNsjVqnKW6mAGTUbXYnBRfZET0NbqqB8L51wMe7tZXxHf/kPjfSOLTGMDryhGSbmPIv
 8dy6WrnGkkQP4pdWF4uEh3Rzq1T7RR8DKgK3+mYFHS8VhbLZYrukxRz88GXsF28yObWn
 raDQ==
X-Gm-Message-State: AOAM532uhlyNU++7zmTUchRZAK9CGjGdyY5Sbui4hhF7CECfKUELleYA
 MHjuDxiwColv+i4aqVPFc3rMx6t7pc63ZNJNtohaOFto+CfiufvZ/l/08Enp0SRkwsHj5fyj67I
 KIgay8O9gaJaLb1RTEKb6ripTgwap57xX
X-Received: by 2002:a17:90b:4d0a:: with SMTP id
 mw10mr6088955pjb.89.1638279022213; 
 Tue, 30 Nov 2021 05:30:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpTw2cHCau1ckvwMhlR7lH625HDu7cgITYjkAjSWVlE3HONwyGQ+1MBDgvF/5aG5KUSSkGiA==
X-Received: by 2002:a17:90b:4d0a:: with SMTP id
 mw10mr6088910pjb.89.1638279022023; 
 Tue, 30 Nov 2021 05:30:22 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id 130sm19981782pfu.13.2021.11.30.05.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:30:21 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/gma500/psb_intel_lvds: Fix a wild pointer dereference in
 psb_intel_lvds_get_modes()
Date: Tue, 30 Nov 2021 21:29:12 +0800
Message-Id: <20211130132912.131985-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In psb_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode and used in drm_mode_probed_add().
drm_mode_probed_add() passes mode->head to list_add_tail().
list_add_tail() will further call __list_add() and there is a
dereference of mode->head in __list_add(), which could lead to a wild
pointer dereference on failure of drm_mode_duplicate().

Fix this bug by adding a check of mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_GMA500=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 89c78134cc54 ("gma500: Add Poulsbo support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/gma500/psb_intel_lvds.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index ac97e0d3c7dd..da928189be91 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -505,6 +505,9 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
 	if (mode_dev->panel_fixed_mode != NULL) {
 		struct drm_display_mode *mode =
 		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
+		if (!mode)
+			return -ENOMEM;
+
 		drm_mode_probed_add(connector, mode);
 		return 1;
 	}
-- 
2.25.1

