Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A744670F8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 04:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA1C6FE17;
	Fri,  3 Dec 2021 03:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACC8F6FE17
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 03:55:49 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J4zWR2ZXnz9xhTP
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 03:55:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PXGeZTCgBnfL for <dri-devel@lists.freedesktop.org>;
 Thu,  2 Dec 2021 21:55:47 -0600 (CST)
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J4zWR0VFJz9xhTN
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Dec 2021 21:55:46 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J4zWR0VFJz9xhTN
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J4zWR0VFJz9xhTN
Received: by mail-pf1-f198.google.com with SMTP id
 y5-20020a62b505000000b004a804839861so1124890pfe.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 19:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uL2yNvkA3EwvvLX30C2sN3DzOJq1PBcjm6fgTdzFxIY=;
 b=Y7hRR5jgfbMNFtMzlfpttQEcDHHEzIj9/EhXj9fjV8ZbonFzo7Z3446+4m1pHh5SW7
 eAuiBP6s293GQGKQxgIwWu3XDm8Lkg7HbNY0YZan4uaHTWWa89DHOB5hW1kgbSeQpApy
 yt+nqRltXpQsWoiiGDrTaoNOCx9x4mtznIJ+wAFwI7nKa9utnBOg0lj9s3AQ4/jDE2vJ
 uk6iQQVbZ/gH9fb62wSKoA706B6ZOdXsWiD30C4iDU6an8u+788pCquPp3h3EAkBPv8/
 QLEzo4cuiaw3af8liOSscYCITAJTNFUx6boJerq7Lh8IWMPjD9A0jvIf6BFKOAUt0hRL
 /mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uL2yNvkA3EwvvLX30C2sN3DzOJq1PBcjm6fgTdzFxIY=;
 b=TCkP3Ys/N6Mkm6QH0yUpEkeL7bZ3l3aP1U8DT94kbYGPGEY5ZGMnwfpHtKpgQOPNfN
 xz2DVo96426neBGBDCerTK/WtKORm+Rym4WgyB/H/GvO4wSoEG6GwcKykA27UZjxEVS9
 2DLoBegS3trswupn4WB6dvlC/R26tbBZz9HnpPG6IEnx4NxcHXGILq/bH51vYBOrWwFp
 ZRlStEyDC2bhYkcos5WNb7mYJT6l92x0wPYCqanns1JwSMohXAV7LUhXr/hclz8QslJ3
 IE2xtcRiohouEkRtJqQm5i0TW939/SAZhW+6cXoIWedo1e2ZGYraA++Ucz0PRjNiFbrI
 7YXg==
X-Gm-Message-State: AOAM533C2Col2hQBTh6tZ5HkyURJYC5qdJ65IGPgmQzv6DYe3vPSf2KI
 S73h6lavVcUSwWzT2uz1seIaQtf7skK3KTzss5YguEGS2Sp0ACsgNW3+JRTAJyLOfUDGHQLTQe/
 ZiBogVhdcBSPoEjMKBSNVkHcknEQ9VV3t
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id
 j13-20020a170903024d00b00143beb5b6b1mr20071189plh.54.1638503745310; 
 Thu, 02 Dec 2021 19:55:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwudyrYq9gQZ+R57vlzJMoUgCs0HJi/sF8Ao7ohFMNOx3e9v+E2exzSAkJ3YtKBdAq1kaOAFA==
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id
 j13-20020a170903024d00b00143beb5b6b1mr20071158plh.54.1638503745029; 
 Thu, 02 Dec 2021 19:55:45 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
 by smtp.gmail.com with ESMTPSA id w17sm1286471pfu.58.2021.12.02.19.55.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 19:55:44 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v2] drm/gma500/psb_intel_lvds: Fix a wild pointer dereference
 in psb_intel_lvds_get_modes()
Date: Fri,  3 Dec 2021 11:55:39 +0800
Message-Id: <20211203035539.34627-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAMeQTsYZuqqOGjernWKY=GL28DuW=0wXDbGsvaiuv+53CA36vg@mail.gmail.com>
References: <CAMeQTsYZuqqOGjernWKY=GL28DuW=0wXDbGsvaiuv+53CA36vg@mail.gmail.com>
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

In psb_intel_lvds_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode and used in drm_mode_probed_add().
drm_mode_probed_add() passes mode->head to list_add_tail().
list_add_tail() will further call __list_add() and there is a
dereference of mode->head in __list_add(), which could lead to a wild
pointer dereference on failure of drm_mode_duplicate().

Fix this bug by adding a check of mode.

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

Fixes: 89c78134cc54 ("gma500: Add Poulsbo support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v2:
  -  Use dev_err and return 0 instead of returning error code.

 drivers/gpu/drm/gma500/psb_intel_lvds.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_intel_lvds.c b/drivers/gpu/drm/gma500/psb_intel_lvds.c
index ac97e0d3c7dd..3b3aa8fba6c9 100644
--- a/drivers/gpu/drm/gma500/psb_intel_lvds.c
+++ b/drivers/gpu/drm/gma500/psb_intel_lvds.c
@@ -505,6 +505,11 @@ static int psb_intel_lvds_get_modes(struct drm_connector *connector)
 	if (mode_dev->panel_fixed_mode != NULL) {
 		struct drm_display_mode *mode =
 		    drm_mode_duplicate(dev, mode_dev->panel_fixed_mode);
+		if (!mode) {
+			dev_err(dev->dev, "drm_mode_duplicate() allocation error\n");
+			return 0;
+		}
+
 		drm_mode_probed_add(connector, mode);
 		return 1;
 	}
-- 
2.25.1

