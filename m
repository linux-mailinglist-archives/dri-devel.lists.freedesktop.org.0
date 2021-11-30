Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97504463527
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 14:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC99F6ECB0;
	Tue, 30 Nov 2021 13:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428516ECAE
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:11:56 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3N0W58Z2z9vJyB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:11:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RXE4CDUXx5tb for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 07:11:55 -0600 (CST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3N0W35Wnz9vJy7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:11:55 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3N0W35Wnz9vJy7
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3N0W35Wnz9vJy7
Received: by mail-pg1-f200.google.com with SMTP id
 z19-20020a630a53000000b002dc2f4542faso10220711pgk.13
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 05:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zP2V3v73TH3YI7ufMMJbNxUkEcjQUni5BsrXUcho/a8=;
 b=YkFSDBRcVydtQTX6o8vZyQMx/S8RDL6ju53POTTjGGSacBb5sUabaTM1oRX4Y0bWVU
 wpBGtby56+bWja18Q1TVf49o3fAsogXfkXb80zVAwbIW4Ff3+nakMzIAE9oiR47CeTQO
 y1seMLn6woU+LwT4nFqapEz8BvOp8sa4LouTfzyWHva541eIbi0evSMM6J3MbCJzzlYN
 MGdt6+XaOoVdzOPpSbgkeUzL4WR1ZdVhwHx1oDpS98fkoOFuZkwZVzxkya3o7Y9sC25Z
 I7ohaEJxkkteHjLUCf+kSy5fVKagAu6+gzbC7GYqJN2+bJA5q6UFAfiNleMA3WYnsxXw
 KLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zP2V3v73TH3YI7ufMMJbNxUkEcjQUni5BsrXUcho/a8=;
 b=RhJU9TKKniMRy0T+EXXKlHmXO4TwELwG5dtN/tN5/476CkAEiWeM9BeffRyAH0ykr3
 T+j4Q2aSyJ6Zsx+GBxl3yNFEEqXWGXKVfLuiL11tUZDtdTPfUkywWqFDPiQAAhD5pU+l
 rInKtTbK18VAbwhgWhAyOyQMnWlezovd6FgIh+t32ACebsDMInIlZCykmLoebulIJjT+
 GSOvQTr2LfbRZkT7h10GJEcgTVqXphpZPB972bmOVoqqToLN3vkQ6RnV+ppamX9GoXh0
 bVBQl5WHyps1YFDGOxlk/bCogw9UK1KgsSd38jxaS8gGmtYA4R+7RkIGKjN9yyUXJZDh
 7hTw==
X-Gm-Message-State: AOAM532kbCjlupvLL4WXE1FIimQF9YLQTiGfJqc/Li/AzYCiGSbIdm7F
 8XbPfv81dnsaiCl1TCBOIxrxcoSKIbD4fszu/qY9FgtKjZAn8FXgJ9V2eBdMKEEc91jXqe+dbh+
 vZpzuWp+XapiCo5KvGfrsCxO5mGZJsQXq
X-Received: by 2002:a17:90b:4d08:: with SMTP id
 mw8mr6005287pjb.236.1638277914559; 
 Tue, 30 Nov 2021 05:11:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDAkyZLWvvoJdW2VIMQ+7cqEEnERC++JVHd62eGGU6w2A9FkL534V2oubJjtc7oPYV0SHOuQ==
X-Received: by 2002:a17:90b:4d08:: with SMTP id
 mw8mr6005236pjb.236.1638277914216; 
 Tue, 30 Nov 2021 05:11:54 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id j7sm2622428pjf.41.2021.11.30.05.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:11:53 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm: bridge: cdns-mhdp8546: Fix a NULL pointer dereference in
 cdns_mhdp_atomic_enable()
Date: Tue, 30 Nov 2021 21:11:12 +0800
Message-Id: <20211130131113.126261-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Parshuram Thombare <pthombar@cadence.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Swapnil Jakhade <sjakhade@cadence.com>,
 Yu Kuai <yukuai3@huawei.com>, Thierry Reding <treding@nvidia.com>,
 Jonas Karlman <jonas@kwiboo.se>, kjlu@umn.edu,
 Dave Airlie <airlied@redhat.com>, Yuti Amonkar <yamonkar@cadence.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Quentin Schulz <quentin.schulz@free-electrons.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In cdns_mhdp_atomic_enable(), the return value of drm_mode_duplicate()
is assigned to mhdp_state->current_mode and used in drm_mode_set_name().
There is a dereference of it in drm_mode_set_name(), which could lead
to a NULL pointer dereference on failure of drm_mode_duplicate().

Fix this bug by adding a check of mhdp_state->current_mode.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_CDNS_MHDP8546=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: fb43aa0acdfd ("drm: bridge: Add support for Cadence MHDP8546 DPI/DP bridge")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 5530fbf64f1e..347fbecf76a4 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -2040,6 +2040,11 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 	mhdp_state = to_cdns_mhdp_bridge_state(new_state);
 
 	mhdp_state->current_mode = drm_mode_duplicate(bridge->dev, mode);
+	if (!mhdp_state->current_mode) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
 	drm_mode_set_name(mhdp_state->current_mode);
 
 	dev_dbg(mhdp->dev, "%s: Enabling mode %s\n", __func__, mode->name);
-- 
2.25.1

