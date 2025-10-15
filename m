Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA06CBDBE01
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 02:11:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C6510E6BE;
	Wed, 15 Oct 2025 00:11:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="F7A5E9bw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9438410E6BB
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:11:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1760487053; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QJhxPP6q8ZuOoSArUQzvAgg/NXVLBSCxzo/c4Dh629U4Dbf9paoiBUsxbWdpl1jqh4bOhCTwjeSTfTQxMNCV+lPhEkC7s9UqRjDx0YKJtAKstTaEZHfpBsSfeu9KxUjKTHLoeO5zA4An1305xKHX1hFmI2kMoHNRgiAxBar0lDs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1760487053;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=UZ+A9WMJwgRfHDkTOF9I+28XT7q9CSJ9rtZIwAZGtvE=; 
 b=Iixk9HCSfHj7EgI6FoloYywDc+Pg2UEdhYseAnZEAUa6BxqjvQ79kNm8qgzk0+p4sAj+oNf44ANnnWoqFZR2KqC7b+bK86nWcSitUSD5VMZdn/U5BsqIFWpYQsDIh4zPyCYpGy95gJLQfYT5uKjZvBcX/aR8nXOkHy3/VNl7moc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760487053; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=UZ+A9WMJwgRfHDkTOF9I+28XT7q9CSJ9rtZIwAZGtvE=;
 b=F7A5E9bwXt+gwhS4lAYvcqrt19tH264pJ2uVpFuQ9Olbl1DPywXsM9nmoCJf4XHA
 EDb25J7S/OYyUJwfVUUAEYLRjHmf8/ueZq99uZ0qb0Dm/TZ8DyVdSt8O8TGb7uszEJG
 yPMtNhJwXFNZCJ6ap7UaWWHMognkQQVcmc34wpBg=
Received: by mx.zohomail.com with SMTPS id 1760487052275419.86855804746517;
 Tue, 14 Oct 2025 17:10:52 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v6 12/12] MAINTAINERS: Panfrost: Add Steven Price and Adrian
 Larumbe
Date: Wed, 15 Oct 2025 01:09:18 +0100
Message-ID: <20251015000930.356073-13-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015000930.356073-1-adrian.larumbe@collabora.com>
References: <20251015000930.356073-1-adrian.larumbe@collabora.com>
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

