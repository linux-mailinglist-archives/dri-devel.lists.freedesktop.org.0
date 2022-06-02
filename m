Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DDD53BF87
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D29011317D;
	Thu,  2 Jun 2022 20:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F7111317D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654201105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m6zy4gylOAiT2S0vmAiXock9a3C8kfyAtNE7kTj9V6A=;
 b=IM3SZ4Sf83DpGQwfQDmEl0Rjj4UnAZQfTyFNvHT1yJ83eDjUO8TEqKtkhaeRV0c8b/Es5g
 gQbXhbdPZAYuBfNFMTag6tQNckpJE43G6gdppx0iB7jAlZ/HTorW+EEUvqz1Wa7Hv+qOK3
 OI6/19g9I2gsHezOi1nGrU59ZwgMi2Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-7Tf9A5f1Pxe92-hXKqPAPg-1; Thu, 02 Jun 2022 16:18:21 -0400
X-MC-Unique: 7Tf9A5f1Pxe92-hXKqPAPg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 943D985A5BC;
 Thu,  2 Jun 2022 20:18:20 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.34.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39F99414A7E7;
 Thu,  2 Jun 2022 20:18:20 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/dp_mst: Get rid of old comment in
 drm_atomic_get_mst_topology_state docs
Date: Thu,  2 Jun 2022 16:17:57 -0400
Message-Id: <20220602201757.30431-4-lyude@redhat.com>
In-Reply-To: <20220602201757.30431-1-lyude@redhat.com>
References: <20220602201757.30431-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rajkumar Subbiah <rsubbia@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't actually care about connection_mutex here anymore, so let's get
rid of the comment mentioning it in this function's kdocs.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index d6e595b95f07..9f96132a5d74 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5458,8 +5458,7 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
  *
  * This function wraps drm_atomic_get_priv_obj_state() passing in the MST atomic
  * state vtable so that the private object state returned is that of a MST
- * topology object. Also, drm_atomic_get_private_obj_state() expects the caller
- * to care of the locking, so warn if don't hold the connection_mutex.
+ * topology object.
  *
  * RETURNS:
  *
-- 
2.35.3

