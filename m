Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F714EECAA
	for <lists+dri-devel@lfdr.de>; Fri,  1 Apr 2022 13:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB40610E0D8;
	Fri,  1 Apr 2022 11:58:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299D10E0D8
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Apr 2022 11:58:19 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id b130so2215674pga.13
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Apr 2022 04:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=pNnolXvBibVhqxDqWCeFrSPBPwyB5lZY/VZp6mQCeHA=;
 b=Yd6ygkuuA+1IeY5weMNKvZxSvo7KmvYZHJezeyjkEIUPjSb1ZLica8eb7RZ3kaC2wD
 w2bWnKZPX4LdsrQHU88VkW2Djz+2HRZY/qIVgZ0cY4XVGywe3wZHL4IxCNhVsNqosJey
 fgXhNw0NsLPIxqwWuJHEes0WS+2wVYq/5ilYrFYGo8sXVJnL0PQKIaUPZ/vlodxulH4B
 PWD5Lmj5zvbCDDBEKWpD4R+ulUvsgaDzyM35MhsogJ4Q2A5W2v9juxouyDF+NiBk33zL
 vI3tdb7zS+FjPzgq8W3YXcnj24yNXrX/Z4iLUlDm0TLuRsuazFm57UY9Fp4PAFaorMXl
 KGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pNnolXvBibVhqxDqWCeFrSPBPwyB5lZY/VZp6mQCeHA=;
 b=Vto/PtZyuPbwyR9CJDRtjSUVqo9stp8M2dMHlO/uqw9Hkt+A5vsB+g3rX6xYPwkwC9
 n2AcIdQDRUpG27oQITtiOtBUd6q4kru+Vhr+R5qdRmun92EPp5qBxeL0JGO3UuGoIULu
 NVlgJ3z0VlxRsRd1LOOAu4fPg82eWe/eyUaOp28wJ7n3UwJPqCNaAo5vHJRwhrCBnhfX
 25x8Az/PPLVhWUqviTQgiLQzGJ+BMVXqvjVvse0shFFSYMMA1ayZBFNmr+5Sn/Q1KS/D
 +UrdnHfg/DRg9OZm0D6W1UoyIcTKtpn/fJRO2S3MgABqm2pjUlyC3MIvYge/Q6nF9jUf
 0hyg==
X-Gm-Message-State: AOAM532ZMUvjt7wHRzf1jJxPmyv5+bfdi2rsivWxce+z0iHiDmLDaEAH
 Q/o7xjESxG2EtDW//hVRlTk=
X-Google-Smtp-Source: ABdhPJxIC6mkCVE/l4zf/4k9AWKh5V4DbbpyGGI36gOJmNszhaTTmeM1VfUSsbFoNiGDYq6Q3gmgXw==
X-Received: by 2002:a05:6a00:c8e:b0:4fb:18a6:18f9 with SMTP id
 a14-20020a056a000c8e00b004fb18a618f9mr36107343pfv.47.1648814298932; 
 Fri, 01 Apr 2022 04:58:18 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
 by smtp.googlemail.com with ESMTPSA id
 u25-20020a62ed19000000b004f140515d56sm2978064pfh.46.2022.04.01.04.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 04:58:18 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: patrik.r.jakobsson@gmail.com
Subject: [PATCH] drm/gma500: fix a missing break in psb_driver_load
Date: Fri,  1 Apr 2022 19:58:11 +0800
Message-Id: <20220401115811.9656-1-xiam0nd.tong@gmail.com>
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
Cc: airlied@linux.ie, Xiaomeng Tong <xiam0nd.tong@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of exiting the loop as expected when an entry is found, the
list_for_each_entry() continues until the traversal is complete. To
avoid potential executing 'ret = gma_backlight_init(dev);' repeatly,
break the loop when the entry is found.

Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2aff54d505e2..b61a8b0eea38 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -402,6 +402,9 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 			ret = gma_backlight_init(dev);
 			break;
 		}
+
+		if (!ret)
+			break;
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-- 
2.17.1

