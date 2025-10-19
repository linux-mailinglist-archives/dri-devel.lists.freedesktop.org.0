Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53083BEE7BE
	for <lists+dri-devel@lfdr.de>; Sun, 19 Oct 2025 16:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8103E10E212;
	Sun, 19 Oct 2025 14:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="k7mEeEB8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774F210E211
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Oct 2025 14:53:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760885604; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=TyQgwPJFSdja5xt3/pnoBPBOpibcbstCxEWhmkaJX8zaeXLwsnz20c9e61CYL7iTT1GkGkf10yAf2sgie3fECEqxvg/3L5Un/QU/ejYfrgtdh748eVv6cVt2KdRMSIH9AQ+7F0V5ef9zJAn4tsxTYf8tOsj9U48q4uQE6xoV81U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760885604;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=fm9xERrsKw3wXC3AFusqkflp0ntN3coW0lxcISTjVRc=; 
 b=cwIv0PB2MqxGoMpv8PvNfjTW91IwXiXVYv66lRdp+ZgRQORQtS9wVuzSc6XT7fceH2/5hgIk80Ww1TOEXymizhrkuLhUf3BBk2condC6p4OhLAIVaMVct4KWSFVDER8+Pk7felpFHykDhXJKWFDkJgJCrHlNdx2v0NcgfPBxnQM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760885604; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=fm9xERrsKw3wXC3AFusqkflp0ntN3coW0lxcISTjVRc=;
 b=k7mEeEB83lwhkWDcIIT6qUk+agtCYLdkC9IfCjbezVCZsYXxsbAfXkGYdA18k901
 B9n+HT6Yr9OLfrtmL5U73l727GcGQKkQFuL1tQOk0iudLHOAIBu4ZK12XRtN6VJcm7X
 GtXVn7ViIjrk0Hx3A/eqwwYiamDcK97a6h7JqhzU=
Received: by mx.zohomail.com with SMTPS id 1760885603183791.7930395787703;
 Sun, 19 Oct 2025 07:53:23 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v7 12/12] MAINTAINERS: Panfrost: Add Steven Price and Adrian
 Larumbe
Date: Sun, 19 Oct 2025 15:52:17 +0100
Message-ID: <20251019145225.3621989-13-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
References: <20251019145225.3621989-1-adrian.larumbe@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recast Steven Price as Panfrost driver maintainer.
Also add Adrian Larumbe in the same role.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88e7672c1d41..b04f7191164a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2092,7 +2092,8 @@ F:	drivers/gpu/drm/arm/display/komeda/
 ARM MALI PANFROST DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Rob Herring <robh@kernel.org>
-R:	Steven Price <steven.price@arm.com>
+M:	Steven Price <steven.price@arm.com>
+M:	Adrián Larumbe <adrian.larumbe@collabora.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
-- 
2.51.0

