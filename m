Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0B4636A1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2210B6E301;
	Tue, 30 Nov 2021 14:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p5.oit.umn.edu (mta-p5.oit.umn.edu [134.84.196.205])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE256E301
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:26:11 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4J3PfB6ZWtz9w6Gc
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m5nR4ktMKBnN for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 08:26:10 -0600 (CST)
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4J3PfB4X2Sz9w6GT
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:26:10 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4J3PfB4X2Sz9w6GT
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4J3PfB4X2Sz9w6GT
Received: by mail-pf1-f200.google.com with SMTP id
 w2-20020a627b02000000b0049fa951281fso12919665pfc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 06:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuQ42+umRcpPW+VMKGxj6sWr71Sv5xh4Rg14DLaks5k=;
 b=PwoWlRWAMO0iWwLAo/aYQlakXElaCjD6VMo9NBp2f3HZSFUvXsfa1haSpu3NFk/jqH
 NljBRNM+7/3cQ89MDBH/6XqBC09gzgT/mLtnMdxH4K2ayiigmRu/zgfryY9PbWqCxlxj
 wsP1JQQ8Be0QOJ32s2uUM+JgauLV4N1tX6MRxaqvbBZVWzPKOM0xaISKrzkQDV0puX7Y
 RXFJxbQQBqpoasb/eaceP+V2HBd5Tp+1BQFaM9eCgscf1Lq99qVeFpjPP0ZYfONxNT6M
 pF/QV7sJRxs3Dv0ewAtua/bhkFQHWIrYdh1svhjso2tqPwrsMiUQEHCxdST3i8RflN7K
 ssFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KuQ42+umRcpPW+VMKGxj6sWr71Sv5xh4Rg14DLaks5k=;
 b=KcRoguYTikYCVASVTKkjzD3kBqEC/B+fjgUcrH/t0Io4ZBnsRHp9Ux7xbulmt6OKkE
 kQHAezVvw7LjnRj1rQ9eDEjrH1AvrXdsLybKs/QaeiCK62IvepPTeJSusGnWK9EY83ed
 0MY6esrJxjiOgG8FixU57nIU1onSqB4XJGrHOgcmn/5FaqUGnP/gcRkbKE07MdJp6DeX
 0X6SZWpelDazRevyC01YQ2qspGdrVZJoAh34a4WW918++txPTdrpKV7GobT8fZshFj0S
 Yw89gvtIRZNI9fvxbaBXXcQyvn4W2zLsxhaiSVaA3HuxRWfhXJdGxen4Em64IUXBCKlb
 HPsQ==
X-Gm-Message-State: AOAM531Jw2/3+BvxLUb9uCKobukNLeKvknkb8Pd12+hc6kGkDYqYmvl2
 XnDAIpAmqAEZuQrrA0FmbFgNO4lCUUMTXcTJVk16SImY5kIx0gDyNbHFVYtFtsTwftsKma5p9WD
 iO5bX4rNg+cSkCEOw2TC/q3oH6e82gsAD
X-Received: by 2002:a17:90a:2fc7:: with SMTP id
 n7mr6378161pjm.141.1638282369876; 
 Tue, 30 Nov 2021 06:26:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7GdydZXDEWnsAUZ7LT9R88o7lt/wXSRMThDt6spxy2SRR9dULTljXwp0Ihnwi8tcyqu8CCQ==
X-Received: by 2002:a17:90a:2fc7:: with SMTP id
 n7mr6378125pjm.141.1638282369630; 
 Tue, 30 Nov 2021 06:26:09 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id k19sm21540692pff.20.2021.11.30.06.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 06:26:09 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/komeda: Fix an undefined behavior bug in
 komeda_plane_add()
Date: Tue, 30 Nov 2021 22:25:31 +0800
Message-Id: <20211130142531.156863-1-zhou1615@umn.edu>
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
 drivers/gpu/drm/arm/display/komeda/komeda_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index d63d83800a8a..dd3f17e970dd 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -265,6 +265,10 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 
 	formats = komeda_get_layer_fourcc_list(&mdev->fmt_tbl,
 					       layer->layer_type, &n_formats);
+	if (!formats) {
+		err = -ENOMEM;
+		goto cleanup;
+	}
 
 	err = drm_universal_plane_init(&kms->base, plane,
 			get_possible_crtcs(kms, c->pipeline),
-- 
2.25.1

