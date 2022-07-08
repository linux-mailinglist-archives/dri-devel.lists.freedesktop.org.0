Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F4D56AFD3
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 03:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74F4D10E4A9;
	Fri,  8 Jul 2022 01:46:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C50510E4A9;
 Fri,  8 Jul 2022 01:45:59 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id x184so8927433pfx.2;
 Thu, 07 Jul 2022 18:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CYkTz9x9VUJaLH+xBYwYdGx5P5J7JR2QlJUwNImcUNc=;
 b=aUuG+j1nS2xHGHrnk+Si61wPRhLQGcIZFUaN3yxiykuoYgH6Y2GH+mQkhhoBgBofsP
 e2CJaH7TJtROqj60+gnLPqYNzUJj1tyjDNjdSQ9LjLyzS+9DZASmBHdzzEQ3laqsKn61
 KCfzxph1z4tQE51sro0sJa7l6XrVVjext86xbexhcFVa9UPkkrIS/RE28XsdcVhm1UWV
 kuDXx5OFDmv+SOeernHly3cXd4UZINaFO35uLzArkhuuNY4PS4yECp5lmnEe9GRVXBHs
 2h+iOdzthLJ+xRydcwrhHoV4CFTl0XJRL9WyWOI0OJrv2psKNlSTz2tnglHTAKbXE0MD
 LgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CYkTz9x9VUJaLH+xBYwYdGx5P5J7JR2QlJUwNImcUNc=;
 b=gAKg040cOUrUdahcqIms+Y5S8k484CnR5eTGH01LQLx+4FikdBXi04LTIySmV1wXhv
 ASh5OQCOCvlS/MkA+yQk7PdbyC1ZuSbvRCODC6MvKV0oENFoZPmP7dwtyHwt2yhRACM1
 Kv4/U3hDo8LaFjWJg7R+4NBDoU8zFmnpS+3BvHxV1+0BBd6eh5pfr4Rli2VZffM0PYGh
 NcwiJxE+FQKZYSl6x9ZorfPIeTUI7P8i4ALP1n9g2lKGXfRACPHyAXcSXTXqNEWKtaUJ
 GmWlmaL1dL6RWoN9ZeJdwJp7NM+gyHQb4qjPvaIb7RX/QR+TfPN2XirrTiunMrE8GB0a
 U+ig==
X-Gm-Message-State: AJIora+phl7Jv9HPmktBtnbbPmRGaggqEzst2zIXLbEjcugRH+9RRvbO
 rz/785Hip+qQOKENtubTdzM=
X-Google-Smtp-Source: AGRyM1vBf0nppZ2iuKetbcWi0B4czZZad3GGeqXIQMBZRdrjZ7ZM7GLVOyNoraqoSqPbY0e+cmeO7w==
X-Received: by 2002:a63:7443:0:b0:40c:5a6e:3acf with SMTP id
 e3-20020a637443000000b0040c5a6e3acfmr928127pgn.557.1657244699271; 
 Thu, 07 Jul 2022 18:44:59 -0700 (PDT)
Received: from localhost.localdomain ([122.162.197.95])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a170902d48e00b0016beba9c3e6sm8629884plg.115.2022.07.07.18.44.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 18:44:58 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, tzimmermann@suse.de,
 nicholas.kazlauskas@amd.com, Jimmy.Kizito@amd.com
Subject: [PATCH] drm/amd/display: Remove duplicate header.
Date: Fri,  8 Jul 2022 07:14:34 +0530
Message-Id: <20220708014434.7513-1-jrdr.linux@gmail.com>
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
Cc: "Souptick Joarder \(HPE\)" <jrdr.linux@gmail.com>,
 kernel test robot <yujie.liu@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

kernel test robot throws below warning ->

includecheck warnings: (new ones prefixed by >>)
 >> drivers/gpu/drm/amd/display/dc/os_types.h:
drm/drm_print.h is included more than once.

Remove duplicate header.

Reported-by: kernel test robot <yujie.liu@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/os_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/os_types.h b/drivers/gpu/drm/amd/display/dc/os_types.h
index 795dd486b6d6..6b88ae14f1f9 100644
--- a/drivers/gpu/drm/amd/display/dc/os_types.h
+++ b/drivers/gpu/drm/amd/display/dc/os_types.h
@@ -39,8 +39,6 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_print.h>
 
-#include <drm/drm_print.h>
-
 #include "cgs_common.h"
 
 #if defined(__BIG_ENDIAN) && !defined(BIGENDIAN_CPU)
-- 
2.25.1

