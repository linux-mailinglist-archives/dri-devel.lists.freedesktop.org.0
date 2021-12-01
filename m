Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BFC464583
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 04:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA1F6E49B;
	Wed,  1 Dec 2021 03:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CC8E6E49B
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 03:37:11 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3lBt5q26z9w5LT
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 03:37:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6NkQ2ymEd3ho for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 21:37:10 -0600 (CST)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3lBt3ntqz9w5Lg
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 21:37:10 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3lBt3ntqz9w5Lg
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3lBt3ntqz9w5Lg
Received: by mail-pj1-f72.google.com with SMTP id
 l10-20020a17090a4d4a00b001a6f817f57eso161332pjh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 19:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sxI17JYCkrzwyCOJ929jri+QBFkuxfLqgEQthEGtNZQ=;
 b=P6Gqb/2Q04smH+9vxg93MR3uuJ0ejaV5wEKZigk4dw92pVFnaqhDyUk72zlJhqwx8A
 heJTUVK2YS74N5SCrZd4o5oCrfAFz9Mz+qt3LeirjZ1BTTVBxRp7jPVfsm4DUQLfxHt3
 KiYcmLqhzWQDBy8oCDyddCIz7PdMxtBSd3JdtGcy7b42Cq/6qzdv8SZUdxRnKGMMihjw
 sIQxeK9b6lwYY8kXKCi/WKkqVXBqaJUSCz1p8GeP9uL6Q6k86cBW7HNQ+YKsEQe6VsDL
 O8cWBJlgneRKh2dmMb34rWHAqX6zvFiF1Qy1yxxNow3wdfdOCUiL6dqydYLbAkwxyAmR
 KwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sxI17JYCkrzwyCOJ929jri+QBFkuxfLqgEQthEGtNZQ=;
 b=MCUUjZ9+2tdDs/weiV5kqAlPBXsXKOKFMenC+AMuQmfwwvz4h5nfNq4JnZCVrBKh5G
 z4/PIBTUtjocTSnV13wcKPx0WQIbvzudyjVuEBAB62ZmWkcE+GYja1j3aZ8g+bqtPxKZ
 tLkH2UE/W7cgBdlVtL4Cuhmb9jx9OztgOeQPuxzP3awrkKFvWAlY4g39Rcj0ublWo6Wx
 oP0vHVMFmX6sVHjL/UnYdIj7NoLtEC78aPgl21UsjJxVXWnBF1aBtL3PnvxeR+qIA3i2
 2qG3mBJuF+us2lRnswdxwah2cTCcS7gAqaDii6MVAyMEPh6JRk6fOyIAej0MhhxBN2eE
 7I6Q==
X-Gm-Message-State: AOAM533MnBOe/Uy1KPMZU2A+VEhywVLj6w9tVCGrVVluD0DRI5VQVt3H
 CvpRZSMY76TWVzuNWuevb29zM0Z1o637g4WDz2U2hZNQMRh+1cEt+iBHvozUCTYkU9/C8DAbyY4
 cNxv7o0Dt/ysHNEa+yOwxTiSn4WnAxk65
X-Received: by 2002:a63:24c4:: with SMTP id k187mr2707066pgk.554.1638329829656; 
 Tue, 30 Nov 2021 19:37:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+W1/EzQWNjjRF/LWb6oUE32F/fnDqEnCNsrk8MMn/0iyOY7zQrN/HnFUP+i0vFe9QZmUraw==
X-Received: by 2002:a63:24c4:: with SMTP id k187mr2707053pgk.554.1638329829356; 
 Tue, 30 Nov 2021 19:37:09 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id mu4sm4560956pjb.8.2021.11.30.19.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 19:37:08 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH v2] drm/komeda: Fix an undefined behavior bug in
 komeda_plane_add()
Date: Wed,  1 Dec 2021 11:37:03 +0800
Message-Id: <20211201033704.32054-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YaZqt7bwSJtS2SaT@e110455-lin.cambridge.arm.com>
References: <YaZqt7bwSJtS2SaT@e110455-lin.cambridge.arm.com>
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In komeda_plane_add(), komeda_get_layer_fourcc_list() is assigned to
formats and used in drm_universal_plane_init().
drm_universal_plane_init() passes formats to
__drm_universal_plane_init(). __drm_universal_plane_init() further
passes formats to memcpy() as src parameter, which could lead to an
undefined behavior bug on failure of komeda_get_layer_fourcc_list().

Fix this bug by adding a check of formats.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_KOMEDA=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 61f1c4a8ab75 ("drm/komeda: Attach komeda_dev to DRM-KMS")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v2
  -  Use kfree and return instead of using 'goto'

 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index d63d83800a8a..aa193c58f4bf 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -265,6 +265,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       layer->layer_type, &n_formats);
+	if (!formats) {
+		kfree(kplane);
+		return -ENOMEM;
+	}
 
 	err = drm_universal_plane_init(&kms->base, plane,
 			get_possible_crtcs(kms, c->pipeline),
-- 
2.25.1

