Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7BwiD7Nzc2mwvwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:12:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE1576243
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 14:12:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726AD10E126;
	Fri, 23 Jan 2026 13:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ORz5/fFM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA1D10E126
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 13:12:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769173928; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=X8tGQoPSjrgHiwG/0JqXoKRbP64Y3BKDtCgWzRARtW/9OtntGSC0sY+lSaKq9XUo6zY+5acfgLBEUYK/cha3dfNTG/cfcpWT0i7ZYqJ5EoKd3dJ10X3i68+GTPrNXmMc8XVYMhux4R8NctsqmTllUcGe40HYmEjtqA9HegQruNY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769173928;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=D7B4hnPFetTd0y/qVbJbesqkbENEgiW463JV2/X5nWw=; 
 b=Hfl/7pJDd1Z3mpag1flMS7y9a2lOWESmjSAvBY6Q28piiBztcKt30H8aLlNgj9bVFYpsTtHA2Z/vYGIYCsCTusLZrK2D2WCtbBHXrWrMxdVQ/B52WBkD+IpfBJI1v9UNBnrlBnAAnqplqKwJ9uKhQroJwt2mljVFuc58AcV48L0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769173928; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
 bh=D7B4hnPFetTd0y/qVbJbesqkbENEgiW463JV2/X5nWw=;
 b=ORz5/fFMrs2XPglgRHyZc/Qq1A8YKD+s9jOi5ZZl5pVG5LwljnsSkwPP7SUWYYLv
 gaTmqkQHoBcYTOEmV3MUTlJTEa6ZWjZUlxDuppNvHRqRQLenLVEzHqvo2OEb0sk3jlr
 y/tU0EW0NJUR6VAmLD/WycosntCBCyUtYH50BvFo=
Received: by mx.zohomail.com with SMTPS id 1769173927094478.03219631138563;
 Fri, 23 Jan 2026 05:12:07 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 23 Jan 2026 14:11:44 +0100
Subject: [PATCH] drm/panthor: Add src path to includes of panthor_gpu.o
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-panthor-tracepoint-build-fix-v1-1-7d67b7c0ae9b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNywqDMBAAf0X23AVjoRJ/pXiIyaYuNI9uYhHEf
 2+ox5nDzAGFhKnA1B0g9OXCKTZQtw7sauKLkF1jGPrh0avhjtnEuibBKsZSThwrLhu/HXre0Ru
 tvVajH8lBS2Shpv/553yx0Gdrl3pJWEwhtCkErlPnJGDgYjHSXmE+zx9WBTJznwAAAA==
X-Change-ID: 20260123-panthor-tracepoint-build-fix-fa99f917f7ed
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sasha Levin <sashal@kernel.org>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:steven.price@arm.com,m:liviu.dudau@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,m:sashal@kernel.org,m:nicolas.frattaroli@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.761];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: ABE1576243
X-Rspamd-Action: no action

The file that defines CREATE_TRACE_POINTS needs to have the src
directory added to its include paths, or else the build may fail, as
define_trace.h won't be able to find the included trace file.

Add it to the Makefile's CFLAGS for panthor_gpu.o.

Fixes: 52ebfd8d2feb ("drm/panthor: Add tracepoint for hardware utilisation changes")
Reported-by: Sasha Levin <sashal@kernel.org>
Closes: https://lore.kernel.org/r/aXLyzd6pMmexwWlY@laps/
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/panthor/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 753a32c446df..dd15d52a88ba 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -14,3 +14,5 @@ panthor-y := \
 	panthor_sched.o
 
 obj-$(CONFIG_DRM_PANTHOR) += panthor.o
+
+CFLAGS_panthor_gpu.o := -I$(src)

---
base-commit: 15bd2f5d52de890f745ac0c60a44cd27d095bb0d
change-id: 20260123-panthor-tracepoint-build-fix-fa99f917f7ed

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

