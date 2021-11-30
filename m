Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E164463556
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 14:23:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBE06E1C0;
	Tue, 30 Nov 2021 13:23:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p7.oit.umn.edu (mta-p7.oit.umn.edu [134.84.196.207])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB706E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:23:35 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p7.oit.umn.edu (Postfix) with ESMTP id 4J3NFz1Z6zz9vYdC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 13:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0gfWQ0btqP9 for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 07:23:35 -0600 (CST)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 4J3NFy6btVz9vYdH
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:23:34 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 4J3NFy6btVz9vYdH
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 4J3NFy6btVz9vYdH
Received: by mail-pj1-f70.google.com with SMTP id
 l10-20020a17090a4d4a00b001a6f817f57eso9802580pjh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 05:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMbczQKx+meArYfgDMMS9S5+n8b54qUiBtJTHFRI1Ss=;
 b=bZQ4P1c+67icLzyLeBeAdZqxqLCOoRcIgo3bqcML25KrMkIqlXcEoKbp3r0F+BdaE0
 GY6NjtX9BxWn+v1wgiMY1yuMuslLCWxuyD6KsQuVW+40NkHOG7VQxME+tfuQ3OGbo2ZJ
 LtemgI78Bch/xWiLkdtiVTb3Xhz52gLeFT4sGrGZbgiyDZPpDIGZrtlsYF+oQC4lxwlZ
 gYlLI3VUisuI5eD8iBs7s80K/27jiYIRuv4payol6uWznF5H9MjYAWIQP0faYKyAw9GZ
 047a23auLD8b8UJlTs3gVoE6RrktFPvZJtiT1Wecw/4Wvo+jDDe56HW3I9h8RfJko+SD
 dYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMbczQKx+meArYfgDMMS9S5+n8b54qUiBtJTHFRI1Ss=;
 b=F7h8oUdKbEbXZ6fK6bsKJJidquD9bZ1vAswZPU6DOTWzTlmTakOwwKZawc2xfX8qnw
 7fQaMoc7rOCAWmieuiXJpKLmU+mw3tAuz60wYK9Y12mGpONbNH2C7iE3SAAZ5IZwVIPF
 W6E5sM5+VHDXSJRbZQJLgFeVbisEe32MyFherZk3/YZCOIiyL1iITmYhyduSKDPjIhPx
 +AiGnW3g1qrEHVeEh0KNKnBUMic3J0SaZgqTnPvOvMea854QIeIaeTHNCYVjN3LvDjZF
 WY7slBswmXWyQ+lBq5hRAdl0yD/IO/lZOWSBlYRBdYSBCj4CNzjyiHdcBc+6bwaF6liv
 9cWg==
X-Gm-Message-State: AOAM533uPWZ05CdisvGzbUSMopejHbjP+upNVKalcKm2MHGBgKDZkNP7
 +CEuFeOy0wNTBrOfXfqmtETShHN/cdhdVm32gHk+tqA/BBhYZKuN+xsVGMP5cbsAjKDLVGSpgx/
 /M6Rv7DMuAurM8s2ql/g44XWOKPcnuvxK
X-Received: by 2002:a05:6a00:1909:b0:49f:a0d0:abcf with SMTP id
 y9-20020a056a00190900b0049fa0d0abcfmr45882292pfi.70.1638278614206; 
 Tue, 30 Nov 2021 05:23:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwahFAY8/SH7RSGKIvS4KMExJldA7+3SJjCjV5r4CDnjIq005kny7EaxGsqlY3DNwntwUYrFQ==
X-Received: by 2002:a05:6a00:1909:b0:49f:a0d0:abcf with SMTP id
 y9-20020a056a00190900b0049fa0d0abcfmr45882258pfi.70.1638278613937; 
 Tue, 30 Nov 2021 05:23:33 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id 17sm14590476pgs.92.2021.11.30.05.23.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 05:23:33 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/gma500/cdv: Fix a wild pointer dereference in
 cdv_intel_dp_get_modes()
Date: Tue, 30 Nov 2021 21:23:28 +0800
Message-Id: <20211130132328.129383-1-zhou1615@umn.edu>
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
 drivers/gpu/drm/gma500/cdv_intel_dp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma500/cdv_intel_dp.c
index ba6ad1466374..b389008965a9 100644
--- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
+++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
@@ -1773,6 +1773,9 @@ static int cdv_intel_dp_get_modes(struct drm_connector *connector)
 		if (intel_dp->panel_fixed_mode != NULL) {
 			struct drm_display_mode *mode;
 			mode = drm_mode_duplicate(dev, intel_dp->panel_fixed_mode);
+			if (!mode)
+				return -ENOMEM;
+
 			drm_mode_probed_add(connector, mode);
 			return 1;
 		}
-- 
2.25.1

