Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4786467A56
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 16:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383D46F586;
	Fri,  3 Dec 2021 15:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0966F586
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:33:28 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J5H0S1FYxz9wjXf
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 15:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63XQKsV4jxuR for <dri-devel@lists.freedesktop.org>;
 Fri,  3 Dec 2021 09:33:28 -0600 (CST)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J5H0R69v0z9wjXb
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 09:33:27 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J5H0R69v0z9wjXb
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J5H0R69v0z9wjXb
Received: by mail-pg1-f200.google.com with SMTP id
 z4-20020a656104000000b00321790921fbso2089452pgu.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 07:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HjgNKDbbr6ZOOlNKpxwBIvbqs7099djs3WiwVtq38m0=;
 b=lNvxGiJuGWJmPAZR23PeQYeKAew/1RyNFlpUXAVn8VcKZ93jJTPCc4rKB36nIqSTUh
 Ew+0PujB3bAP6H0pjgLc07lSSJ/PJvJlHexdkTzfe03ZCkAHkOKRI7enOq9SNJfZLZl4
 G0EAbZWS97jE9s9NIxTt6meWodMADoj4DM8c7iO5EDGi4v1I5Y2IdZSYvZLff+u8tAV6
 9TWvj7OE2NYsqXZxPpgATlZYVkM+o4hvZM9KdZ/Rd8KgRxPPiBz4TfBhXFgljRD3m4Hc
 iNKhtEejo4bHD3TQW9xZd/9e1xu9E5uRes+CtR1TLzkyHJk5JUKEPrwiP1bsTStb3rGY
 15zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HjgNKDbbr6ZOOlNKpxwBIvbqs7099djs3WiwVtq38m0=;
 b=w/9pTg8seyPZPmN5wl7w0lFn2rgbFuCCdELCPj51XtlrmqVcdfx94tKkgDYebWaW5x
 NrITi7M+KKVQre9Wi0AAjQkdUxsMxhbmAvNnA599Ce6aITcjmRCHN8+EEq9IG3o0xUzn
 S/dGHJDFb70B6ctTPVNui3wlWbSOkNnqLu4kI/MJ4xQxNhJqjYiv8Yodb1Z30C4GG7Yu
 LAwdeWD/v9a09C6J/tJk2r6+ZuFm+5EXMv839wDr66NhWAf8mL6uq8O9dhkgUl6WmqBt
 cE5MQJEpkhu+vdloWiQpYw7SmSjBmXuGmpbkR8P+4F9fMpO6filL7rpFhB4Zs5X9ZSB4
 M0Jw==
X-Gm-Message-State: AOAM532cp1pChQRfB0ekQtXOGzc+H10T/ZCdQu5Dtyrfg8cqMCXRvX4i
 2YzOGq+KiAHEJj9asu+1F8Ib6TVWDEqqpFMlBx2XD9q+8WWP4KVA8cKtOOphDt5fHp10h3dLWm4
 FgUbii9C/4biDUWhabJzpEH9k1HMl4n1r
X-Received: by 2002:a62:6542:0:b0:49f:c35f:83f8 with SMTP id
 z63-20020a626542000000b0049fc35f83f8mr3876159pfb.47.1638545606971; 
 Fri, 03 Dec 2021 07:33:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo2x/qdpagwLI3kVTPhJVDsCz4gB3f1riiBcD5zb+aUZCU3M2IhH4d5TGhd8XeJ7xcpCxmbQ==
X-Received: by 2002:a62:6542:0:b0:49f:c35f:83f8 with SMTP id
 z63-20020a626542000000b0049fc35f83f8mr3876118pfb.47.1638545606611; 
 Fri, 03 Dec 2021 07:33:26 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
 by smtp.gmail.com with ESMTPSA id h13sm3678811pfv.84.2021.12.03.07.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 07:33:26 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v2] drm/gma500/cdv_intel_lvds: Fix a wild pointer dereference
 in cdv_intel_lvds_get_modes()
Date: Fri,  3 Dec 2021 23:33:21 +0800
Message-Id: <20211203153321.108049-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAMeQTsazxeXgOJcuGZhEH5BX5ZzmOgM-NAjLjj9iypNgTqu-dg@mail.gmail.com>
References: <CAMeQTsazxeXgOJcuGZhEH5BX5ZzmOgM-NAjLjj9iypNgTqu-dg@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In cdv_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode and used in drm_mode_probed_add().
drm_mode_probed_add() passes mode->head to list_add_tail().
list_add_tail() will further call __list_add() and there is a
dereference of mode->head in __list_add(), which could lead to a wild
pointer dereference on failure of drm_mode_duplicate().

Fix this bug by adding a checking of mode

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_GMA500=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 6a227d5fd6c4 ("gma500: Add support for Cedarview")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v2:
  -  Use dev_err and return instead of returning error code.

 drivers/gpu/drm/gma500/cdv_intel_lvds.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_lvds.c b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
index 9e1cdb11023c..581fc8315631 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_lvds.c
@@ -310,6 +310,11 @@ static int cdv_intel_lvds_get_modes(struct drm_connector *connector)
 	if (mode_dev->panel_fixed_mode != NULL) {
 		struct drm_display_mode *mode =
 		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
+		if (!mode) {
+			dev_err(dev->dev, "drm_mode_duplicate() failed.\n");
+			return 0;
+		}
+
 		drm_mode_probed_add(connector, mode);
 		return 1;
 	}
-- 
2.25.1

