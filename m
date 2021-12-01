Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44A4651A7
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 16:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA0D16E92E;
	Wed,  1 Dec 2021 15:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1682A6E93A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:29:10 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J430Q4Y6mz9vJyg
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 15:29:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O9Ag8ms4brLB for <dri-devel@lists.freedesktop.org>;
 Wed,  1 Dec 2021 09:29:10 -0600 (CST)
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J430Q2VSCz9vJyZ
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 09:29:10 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J430Q2VSCz9vJyZ
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J430Q2VSCz9vJyZ
Received: by mail-pg1-f198.google.com with SMTP id
 w5-20020a634745000000b0030a5bee70e8so12283713pgk.15
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Dec 2021 07:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rFrv0I+b421T8Co7IK4ytoKL4fI+fmNuqvVukqaGei8=;
 b=jovfNoz5FrEQBAY1aW8WLrm9EKHyo29fm5jcwMSE75bCWdwgx9sYR4tizF31JfJ4ZK
 3lIP2xDAGqm/aFlBUqxU3txrarLiwYrUEC3NzS7WDWb1ED0mMEK3ZK8G7eALjSFRRl/9
 ToXR+eaxf2qHZfnZjAWMhmrS1E3LXNaPbZu8zqZYhqySzwJgcW095EB6udfNZSYNGeKc
 TCpHgcLtaVgy4Y2n5fsyB1x+/wJChNR06/Zzz8sT9sGTXhLpwSFGXXDP9Kxyo7H+uJVO
 jGiRTkN2NAO0NdhMKN6s1AxlZyXA8gGTvVF3V/10Ip8ypTJ0Vg5rR/dZIq2UqeNBlQ53
 JolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rFrv0I+b421T8Co7IK4ytoKL4fI+fmNuqvVukqaGei8=;
 b=adH2Du6UgiDr5kjxFTQNBH67SEb/ehQ/xc2JwZQbxbWjqEgrktXjJFdkVgHRrw9AXz
 NAlsY3CH32Y6OAxKMbAS3kmTzYF+a/muf5BKKJwjT2SA6IFSm1EYfil71AwJCd3WxTEe
 UqGIXRVJ8lyrgPXri0iZnPu0uIam56sEJ3zceE84YGSVcr56cpRbQ//dxbcQEEJicFqO
 nlUtMWz6p28retIg62fASr7aeXIAw/FqffO7mLGOXGiHAne0IvcHNL3eiljNlNTBCVc6
 5+vIDWyb6NDim/3wFQSyZLJRnCObHs/FtDDKZDd4Zv+ubvmokXgzd8c8Bk60nGQfHAni
 jMMg==
X-Gm-Message-State: AOAM533yXmAlrg14mAkg2y0/NfRPbd50XQ4r57wSs9Sk6VENAFE3el7j
 Y36PsmJmDVGztaEQjaJBwDp1SECzCxua6jXZpPHRMW2hC1gqXLzm0/8UXYfpQtMz/BJRh5CyWqa
 Fau1RtUI69o5EEKC1cEAX2lxt/2qitAHp
X-Received: by 2002:a17:903:1d2:b0:142:24f1:1213 with SMTP id
 e18-20020a17090301d200b0014224f11213mr8248587plh.81.1638372549469; 
 Wed, 01 Dec 2021 07:29:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy4wUy8vRXj4pRKn23RcK2Pn9zl7CFG5jhQM4oARYVdwFjzP439hi9eQO882QxodiL9CJhB6g==
X-Received: by 2002:a17:903:1d2:b0:142:24f1:1213 with SMTP id
 e18-20020a17090301d200b0014224f11213mr8248556plh.81.1638372549241; 
 Wed, 01 Dec 2021 07:29:09 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.22])
 by smtp.gmail.com with ESMTPSA id u3sm201310pfk.32.2021.12.01.07.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:29:09 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v2] drm/gma500/cdv: Fix a wild pointer dereference in
 cdv_intel_dp_get_modes()
Date: Wed,  1 Dec 2021 23:29:03 +0800
Message-Id: <20211201152904.182293-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YaZP2HzTQw1QJxOK@intel.com>
References: <YaZP2HzTQw1QJxOK@intel.com>
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
 Zhao Yakui <yakui.zhao@intel.com>, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Alan Cox <alan@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In cdv_intel_dp_get_modes(), the third return value of
drm_mode_duplicate() is assigned to mode and used in
drm_mode_probed_add(). drm_mode_probed_add() passes mode->head to
list_add_tail(). list_add_tail() will further call __list_add() and
there is a dereference of mode->head in __list_add(), which could lead
to a wild pointer dereference on failure of drm_mode_duplicate().

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

Fixes: d112a8163f83 ("gma500/cdv: Add eDP support")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in V2:
  -  Instead of returning -ENOMEM, this patch returns 0
  -  Use DRM_DEBUG_KMS to report the failure of drm_mode_duplicate()

 drivers/gpu/drm/gma500/cdv_intel_dp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index ba6ad1466374..bf47db488b7b 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1773,6 +1773,11 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
 		if (intel_dp->panel_fixed_mode != NULL) {
 			struct drm_display_mode *mode;
 			mode = drm_mode_duplicate(dev, intel_dp->panel_fixed_mode);
+			if (!mode) {
+				DRM_DEBUG_KMS("Failure in drm_mode_duplicate()\n");
+				return 0;
+			}
+
 			drm_mode_probed_add(connector, mode);
 			return 1;
 		}
-- 
2.25.1

