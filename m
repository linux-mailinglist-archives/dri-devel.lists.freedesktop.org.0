Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D8D4E84A7
	for <lists+dri-devel@lfdr.de>; Sun, 27 Mar 2022 00:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC8A10E05A;
	Sat, 26 Mar 2022 23:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3464010E05A;
 Sat, 26 Mar 2022 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9eoNsGPRKDQN5hEBg7GTRtq6aujXrI8GzeayPp1jk4Y=; b=tLwgQ5EXzg8YZU4qShcAUON0J9
 1yuz1RaHyKMGRge7whSW4f6rmnOQFm3WMN4WMzqcU/0/airpZ3kGt+uWtD6nJtb3Y2M67JY8Z1BO6
 X0SVj0aG7LJBmGmSVJgvPQ78Wtl+G/XJWPY78GXcjAELtsFD17JV7lDUovZv9T6zX3cRLtuGDw3j+
 L+PbKmztk4VEJKGxx8sb5dFhqbrlYS7cq68r2Pz74nUif1baCTIkWt9ImkLGnXmzl07y4cpYxuhUk
 VXFp7S7mxNbtfep0d/r3/W1Xqw6BHqHVFNAijnfcj3DYulGkeoK9221vHSch/ezxTt/hyKd4tbxcM
 h4QVIQVg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYFyL-0051yD-0L; Sat, 26 Mar 2022 23:37:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/amd/display: DCN3.1: don't mark as kernel-doc
Date: Sat, 26 Mar 2022 16:37:26 -0700
Message-Id: <20220326233726.14712-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, patches@lists.linux.dev,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need for this one static function to be marked as
kernel-doc notation.

Avoid this doc build warning:

warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
 * Enable CRTC

Fixes: 110d3968fe95 ("drm/amd/display: Add DCN3.1 OPTC")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Christian König <christian.koenig@amd.com>
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- linux-next-20220325.orig/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c
+++ linux-next-20220325/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_optc.c
@@ -91,8 +91,7 @@ static void optc31_set_odm_combine(struc
 	optc1->opp_count = opp_cnt;
 }
 
-/**
- * Enable CRTC
+/*
  * Enable CRTC - call ASIC Control Object to enable Timing generator.
  */
 static bool optc31_enable_crtc(struct timing_generator *optc)
