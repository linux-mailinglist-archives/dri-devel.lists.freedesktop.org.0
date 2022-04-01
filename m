Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3994EEC93
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 13:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85DD210E084;
	Fri,  1 Apr 2022 11:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FACC10E084
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 11:50:26 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 gp15-20020a17090adf0f00b001c7cd11b0b3so5104949pjb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 04:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=iZW4cTjGkgQQnvoH1SH2yfBq0jAEd28dgp9ZEgKYlCU=;
 b=FMBXKpVMw6CHOWmZdyjdP7IFP5q30KPxLUhq7S0lu5uLr50iVVtQU5VarR/qT8NUwY
 1QzaF3bIJ3trJF9NApoRKTdTn/n6TWgJR2lME5SBR5gze5mctoSt1cL8lfH56a2CcqbL
 oCGsqVq865sBkfe+kg/gwChXKZvLlX5Z3Cn7MGcrtKura4HWO6KvcVFcRHIcYj3VQgsn
 OHHR58HwZtSN1HLt179hvIbpNHmdn9Q/j3JhaPf+BQ8XCSg7tSErsBpiH4pOoeI2EPH5
 9gltfqRC1Firwbp8/vUVL4HwSucuaytPEZq1nas+W6m7YMN75Avd3cuZo1L0YXKVwipV
 FHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=iZW4cTjGkgQQnvoH1SH2yfBq0jAEd28dgp9ZEgKYlCU=;
 b=sr0gP8zKjzL13z/qqbw5whO6EYmjCrgQtKK8f2Nnk/mXZ2vEqfljzp4pEGoNiz2SXS
 IBdJcwgCGfuBkHMrOjfZHq6FNpZbLlT0X1881PCrTifrQskCxmxc0iLA48tky7LR69dg
 NCB1hoPL8bxiMQ6YcKA0wSz9pNZ8obN6xpaigEQjYZw44uF72Ehqgs1ickaqOIDq+JOZ
 Ur113+xiKbocGlVMY8WGxi3TlFeCUtDaVSKq5NPbjoc8eJcB6ftEQgRpufVZWKFeKp8h
 oHR8sRauSNDybbIT58jVpTh4Ek2KtNRGbkbM1UjQdKbrhUpGAMfENgsMqEAZHMXxWRr0
 wI+w==
X-Gm-Message-State: AOAM531DuHlorlFHJK7g9ulvO5a+5EKCkU9nJTR897/xvjWvlhNXIU5u
 CwgYIxOwvG6nym/4keIKtvc=
X-Google-Smtp-Source: ABdhPJwK+lD22J11hHSwZVvW2ESfd4FbII74EeJ9+yfoA7Wm06YhiQVqUAA6LIA/Tv4P82+VbNmjwQ==
X-Received: by 2002:a17:90b:3807:b0:1c7:6cd5:cb3f with SMTP id
 mq7-20020a17090b380700b001c76cd5cb3fmr11399977pjb.201.1648813825648; 
 Fri, 01 Apr 2022 04:50:25 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
 by smtp.googlemail.com with ESMTPSA id
 y41-20020a056a001ca900b004fb000ccd92sm2679532pfw.96.2022.04.01.04.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 04:50:25 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: fix a missing break in psb_intel_crtc_mode_set
Date: Fri,  1 Apr 2022 19:50:18 +0800
Message-Id: <20220401115018.9335-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 airlied@redhat.com, alan@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete.
when found the entry, add a break after the switch statement.

Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/psb_intel_display.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_intel_display.c b/drivers/gpu/drm/gma500/psb_intel_display.c
index dc467996cce4..9a5ea06a1a8e 100644
--- a/drivers/gpu/drm/gma500/psb_intel_display.c
+++ b/drivers/gpu/drm/gma500/psb_intel_display.c
@@ -135,6 +135,8 @@ static int psb_intel_crtc_mode_set(struct drm_crtc *crtc,
 			is_tv = true;
 			break;
 		}
+
+		break;
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-- 
2.17.1

