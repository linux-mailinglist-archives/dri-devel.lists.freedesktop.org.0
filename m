Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1907C6B74C3
	for <lists+dri-devel@lfdr.de>; Mon, 13 Mar 2023 11:55:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 432F710E4D1;
	Mon, 13 Mar 2023 10:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC7D10E4D1;
 Mon, 13 Mar 2023 10:55:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 092AA611CB;
 Mon, 13 Mar 2023 10:55:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EC36C433EF;
 Mon, 13 Mar 2023 10:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1678704905;
 bh=eYKkzzpOv9ljGIlf/tEsZLChp9imOkB4XdHWDfKuoIg=;
 h=Subject:To:Cc:From:Date:From;
 b=d+dZ/c7hax8zB5FLClyiDUoALR3A3I1k0uW/IL+o80Qw5LBW5i1FOurRnNzVxpv2R
 FiivIOmrYDMm6luqBvGKhI/muY/iWwxLKO2PlvpXkGgHwXdHBINzlt0kQ6Iend3nBY
 GUP1ldpwsBMBsbEzFGl5hJw82VFJjHEy7JqgLwgI=
Subject: Patch "drm/connector: print max_requested_bpc in state debugfs" has
 been added to the 5.15-stable tree
To: Vitaly.Prosyak@amd.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, harry.wentland@amd.com,
 jani.nikula@linux.intel.com, joshua@froggi.es, ppaalanen@gmail.com,
 sebastian.wick@redhat.com, uma.shankar@intel.com,
 ville.syrjala@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 13 Mar 2023 11:54:58 +0100
Message-ID: <167870489812633@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/connector: print max_requested_bpc in state debugfs

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-connector-print-max_requested_bpc-in-state-debugfs.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 7d386975f6a495902e679a3a250a7456d7e54765 Mon Sep 17 00:00:00 2001
From: Harry Wentland <harry.wentland@amd.com>
Date: Fri, 13 Jan 2023 11:24:09 -0500
Subject: drm/connector: print max_requested_bpc in state debugfs
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Harry Wentland <harry.wentland@amd.com>

commit 7d386975f6a495902e679a3a250a7456d7e54765 upstream.

This is useful to understand the bpc defaults and
support of a driver.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
Reviewed-By: Joshua Ashton <joshua@froggi.es>
Link: https://patchwork.freedesktop.org/patch/msgid/20230113162428.33874-3-harry.wentland@amd.com
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Cc: stable@vger.kernel.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_atomic.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1052,6 +1052,7 @@ static void drm_atomic_connector_print_s
 	drm_printf(p, "connector[%u]: %s\n", connector->base.id, connector->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
 	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
+	drm_printf(p, "\tmax_requested_bpc=%d\n", state->max_requested_bpc);
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)


Patches currently in stable-queue which might be from harry.wentland@amd.com are

queue-5.15/drm-connector-print-max_requested_bpc-in-state-debugfs.patch
