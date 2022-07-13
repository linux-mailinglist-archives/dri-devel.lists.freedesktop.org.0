Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972C57304C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 10:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2834E95285;
	Wed, 13 Jul 2022 08:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 731A895177;
 Wed, 13 Jul 2022 08:12:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC31C61A4E;
 Wed, 13 Jul 2022 08:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 203E7C385A5;
 Wed, 13 Jul 2022 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657699952;
 bh=pMNi1ayauvZyE2hTTFtqz2aomeuBB+Si8/98xbKOU7g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JA+OgdF31PhwaS1YOCRdIVQLb2X8X482C5ZsYll0jnQo2MgvsEotWh9vyg4ZRzZhs
 QlIXZ5MMmKT9OJ0NSxhFT4fJS1lu7ZSg7tSa4u3acRI6ZuP1AKgFh0/WCA+91U4Wbn
 yv8xGamrvTeF+88ib22sX5IFggoU04sVgKYJK2+d9PvalOiN1Ms5f+PNpUER21bvjr
 nSVKgP4W13+tj9dZrrX1ibKIIIHn6WZSMId+UZ0Pi4avLRsgGtCW+zHMGgTF4FFC+j
 ZuwJelLuQwjJtU4S8AsV4mXuzwVaoL4N//Myx7WeNXNGXzVtjd7NSyNzuGZhEZBvR+
 RjVaO9fLZVDog==
Received: from mchehab by mail.kernel.org with local (Exim 4.95)
 (envelope-from <mchehab@kernel.org>) id 1oBXTx-004ztR-LH;
 Wed, 13 Jul 2022 09:12:29 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH v2 17/39] drm/i915: skl_scaler: fix return value kernel-doc
 markup
Date: Wed, 13 Jul 2022 09:12:05 +0100
Message-Id: <58fa90350ac1fc4f2b37a50179bdb38613d5fa5d.1657699522.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1657699522.git.mchehab@kernel.org>
References: <cover.1657699522.git.mchehab@kernel.org>
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The way it is, it produces this warning:

	Documentation/gpu/i915:150: ./drivers/gpu/drm/i915/display/skl_scaler.c:213: WARNING: Block quote ends without a blank line; unexpected unindent.

Use list markups to suppress the warning.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH v2 00/39] at: https://lore.kernel.org/all/cover.1657699522.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/display/skl_scaler.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
index 4092679be21e..59099f793d3e 100644
--- a/drivers/gpu/drm/i915/display/skl_scaler.c
+++ b/drivers/gpu/drm/i915/display/skl_scaler.c
@@ -208,9 +208,9 @@ int skl_update_scaler_crtc(struct intel_crtc_state *crtc_state)
  * @crtc_state: crtc's scaler state
  * @plane_state: atomic plane state to update
  *
- * Return
- *     0 - scaler_usage updated successfully
- *    error - requested scaling cannot be supported or other error condition
+ * Return:
+ * * 0 - scaler_usage updated successfully
+ * * error - requested scaling cannot be supported or other error condition
  */
 int skl_update_scaler_plane(struct intel_crtc_state *crtc_state,
 			    struct intel_plane_state *plane_state)
-- 
2.36.1

