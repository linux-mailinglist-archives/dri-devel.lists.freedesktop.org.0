Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13EA2747D4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 19:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC88489F38;
	Tue, 22 Sep 2020 17:54:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 973B589E9B
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 17:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600797258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=alwBugiUW8xhAC3yh9HKqdv3Lr5JciXw+OErJT8eH5U=;
 b=R4RwpC4MBfveSh6rl72coUQ6QgYclS3ZwcnOegvbK79iP49C0tp5WLSFDWU14O4LIma0HN
 In3zE+SlgtlrlYdtOYhc/LwLw4FVvjvnQJr7Tt2PMqLaM0je5TYgAiinFzB40fOrgN0UfT
 SOh7fQ+TatZRCCHz8IW83O08+i7Du2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-8Soh6L6WOce9OXEe3dfgMw-1; Tue, 22 Sep 2020 13:54:14 -0400
X-MC-Unique: 8Soh6L6WOce9OXEe3dfgMw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02D3D186DD29;
 Tue, 22 Sep 2020 17:54:12 +0000 (UTC)
Received: from Ruby.redhat.com (unknown [10.10.115.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74E8C7368D;
 Tue, 22 Sep 2020 17:54:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RESEND PATCH 1/2] drm/dp: fix kernel-doc warnings at drm_dp_helper.c
Date: Tue, 22 Sep 2020 13:53:56 -0400
Message-Id: <20200922175357.42998-2-lyude@redhat.com>
In-Reply-To: <20200922175357.42998-1-lyude@redhat.com>
References: <20200922175357.42998-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As warned by kernel-doc:

	./drivers/gpu/drm/drm_dp_helper.c:385: warning: Function parameter or member 'type' not described in 'drm_dp_downstream_is_type'
	./drivers/gpu/drm/drm_dp_helper.c:886: warning: Function parameter or member 'dev' not described in 'drm_dp_downstream_mode'

Some function parameters weren't documented.

Fixes: 38784f6f8805 ("drm/dp: Add helpers to identify downstream facing port types")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 90807a6b415c..478dd51f738d 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -374,6 +374,10 @@ static bool is_edid_digital_input_dp(const struct edid *edid)
  * drm_dp_downstream_is_type() - is the downstream facing port of certain type?
  * @dpcd: DisplayPort configuration data
  * @port_cap: port capabilities
+ * @type: port type to be checked. Can be:
+ * 	  %DP_DS_PORT_TYPE_DP, %DP_DS_PORT_TYPE_VGA, %DP_DS_PORT_TYPE_DVI,
+ * 	  %DP_DS_PORT_TYPE_HDMI, %DP_DS_PORT_TYPE_NON_EDID,
+ *	  %DP_DS_PORT_TYPE_DP_DUALMODE or %DP_DS_PORT_TYPE_WIRELESS.
  *
  * Caveat: Only works with DPCD 1.1+ port caps.
  *
@@ -870,6 +874,7 @@ EXPORT_SYMBOL(drm_dp_downstream_444_to_420_conversion);
 
 /**
  * drm_dp_downstream_mode() - return a mode for downstream facing port
+ * @dev: DRM device
  * @dpcd: DisplayPort configuration data
  * @port_cap: port capabilities
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
