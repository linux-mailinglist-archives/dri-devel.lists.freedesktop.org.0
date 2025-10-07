Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FC9BC1D8D
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09E6F10E6BD;
	Tue,  7 Oct 2025 15:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="kxdUpqjF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41C10E6BD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:03:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759849400; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=GIbgOgvrGdDH0MmO2iVCIAEElPMTCoUhX8twFtDo67qQVi2Va9GnTohiiXvgJYtEgHHXzigHGBQaHb2bl9FoteHChg84JjL6O2vBFCaPO2Z8diFQxagh4Ts3FwqMGp4H9xRh1jYk5nJwjKMyP88fSnZGopAWHItz3YGqK2NXfP0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759849400;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=3Avom6u1bIcaE3ifbK/nKn1t6YtMx3UrDttb45nJwps=; 
 b=DzPJnQR4mEnCNgYqFArnw51Ukq9OBTcDCn23vtVBmRsYo045I6cM3HgbqKBCYqi902if1aIDo4SCWm7Qn4BQRi8H5OW0r67XlVhKMldwP9EE5qORlkNI2iSkdZevg6iq72gmI55NS5Bxn3E7O5mbviNbnXTd6x6iWh7KMNWAskw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759849400; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=3Avom6u1bIcaE3ifbK/nKn1t6YtMx3UrDttb45nJwps=;
 b=kxdUpqjFGMrCCto0BPvn6mJzGcdo84n7kpL7lQ1fkJxcL+UFi3j53VLD+8NMPyvA
 oeoKKVyn9OcyIaPTKsTQqfISQsoZ8SKg4yrUXV/4Shn+oWIUZbX7YJjpFSr+ud17z7X
 tZfU1yP7DQLUm4mBeUqMc38ZtMZeb2c68tG5IxgM=
Received: by mx.zohomail.com with SMTPS id 1759849398220392.1724335407879;
 Tue, 7 Oct 2025 08:03:18 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v5 12/12] MAINTAINERS: Add Adrian Larumbe as Panfrost driver
 maintainer
Date: Tue,  7 Oct 2025 16:01:54 +0100
Message-ID: <20251007150216.254250-13-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007150216.254250-1-adrian.larumbe@collabora.com>
References: <20251007150216.254250-1-adrian.larumbe@collabora.com>
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

Add Adrian Larumbe as Panfrost driver maintainer.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5257d52679d6..cb68fdec3da4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2066,6 +2066,7 @@ F:	drivers/gpu/drm/arm/display/komeda/
 ARM MALI PANFROST DRM DRIVER
 M:	Boris Brezillon <boris.brezillon@collabora.com>
 M:	Rob Herring <robh@kernel.org>
+M:      Adrián Larumbe <adrian.larumbe@collabora.com>
 R:	Steven Price <steven.price@arm.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.51.0

