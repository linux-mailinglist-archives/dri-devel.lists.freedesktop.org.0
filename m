Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4080682D299
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 00:24:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67D3410E1E3;
	Sun, 14 Jan 2024 23:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A65DB10E1E0;
 Sun, 14 Jan 2024 23:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=8seE2zIZMjrbRlZUpr7wsQh/besw/Ag80LVcyAuejxw=; b=yay+tf3R846p+lMi4BztI7vFTJ
 k1v18na/FUgdTagA0zVYUl0sSI8nnpLBUOLhPZdzfKGmk4MXhJrMX7/ma183DYvSEopvvQwVfQgvx
 1ZeHyqw/wz2+U0pnL25gs9m6LsO4vJDjM1yWqEBCufIYKFLQZyV+K6GW6T8k6RkzHPa1PbfMsaEjD
 JDIe4iQ8BcDhu08Q/9cpIeq+HspDV3NT9TnjqrSpZPePFNLD5ZjnSRZ4kjohO6f4S5ABS19ISthnt
 pUvuNknQEI7s3bC9QMavVNBgbkA5/fA2NMotTMHRP7lYZ+UhIUP5lxQDQnU/WSH3DJ9TrzD6/l4JU
 rpfMs8pQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1rP9qG-007Uve-2i; Sun, 14 Jan 2024 23:24:36 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: remove kernel-doc misuses in dmub_replay.c
Date: Sun, 14 Jan 2024 15:24:34 -0800
Message-ID: <20240114232436.32426-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Change non-kernel-doc comments from "/**" to common "/*" to prevent
kernel-doc warnings:

dmub_replay.c:262: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Set REPLAY power optimization flags and coasting vtotal.
dmub_replay.c:284: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * send Replay general cmd to DMUB.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Tom Chung <chiahsuan.chung@amd.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_replay.c
@@ -258,7 +258,7 @@ static void dmub_replay_residency(struct
 		*residency = 0;
 }
 
-/**
+/*
  * Set REPLAY power optimization flags and coasting vtotal.
  */
 static void dmub_replay_set_power_opt_and_coasting_vtotal(struct dmub_replay *dmub,
@@ -280,7 +280,7 @@ static void dmub_replay_set_power_opt_an
 	dc_wake_and_execute_dmub_cmd(dc, &cmd, DM_DMUB_WAIT_TYPE_WAIT);
 }
 
-/**
+/*
  * send Replay general cmd to DMUB.
  */
 static void dmub_replay_send_cmd(struct dmub_replay *dmub,
