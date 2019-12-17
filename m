Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 363C1124151
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 09:14:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01F336E258;
	Wed, 18 Dec 2019 08:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2618 seconds by postgrey-1.36 at gabe;
 Tue, 17 Dec 2019 12:36:53 UTC
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk
 [78.40.148.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2975E6E9CA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 12:36:53 +0000 (UTC)
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1ihBPb-0005Vg-VH; Tue, 17 Dec 2019 11:53:12 +0000
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.3)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1ihBPb-008x2P-Fw; Tue, 17 Dec 2019 11:53:11 +0000
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: ben.dooks@codethink.co.uk
Subject: [PATCH] drm/arm/mali: make malidp_mw_connector_helper_funcs static
Date: Tue, 17 Dec 2019 11:53:09 +0000
Message-Id: <20191217115309.2133503-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 08:13:02 +0000
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The malidp_mw_connector_helper_funcs is not referenced by name
outside of the file it is in, so make it static to avoid the
following warning:

drivers/gpu/drm/arm/malidp_mw.c:59:41: warning: symbol 'malidp_mw_connector_helper_funcs' was not declared. Should it be static?

Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>
---
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/arm/malidp_mw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index 875a3a9eabfa..7d0e7b031e44 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -56,7 +56,7 @@ malidp_mw_connector_mode_valid(struct drm_connector *connector,
 	return MODE_OK;
 }
 
-const struct drm_connector_helper_funcs malidp_mw_connector_helper_funcs = {
+static const struct drm_connector_helper_funcs malidp_mw_connector_helper_funcs = {
 	.get_modes = malidp_mw_connector_get_modes,
 	.mode_valid = malidp_mw_connector_mode_valid,
 };
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
