Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4445A0A19
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 09:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F3A511A1CB;
	Thu, 25 Aug 2022 07:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98CE514A0CB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 07:24:02 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id c24so17126899pgg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 00:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=/kpt2RV6NM9K6J+Df1fFRo6EZL8n/4JlPeLG7FAew6U=;
 b=UDBqe9YjPW7t3UyrluqNFqCKncHu/IFGNJrVjvdU/qUzU9/RInEy1OUH+YhUtqZSjo
 H5KCL6YWlLFAc4dzcpZLFyZWVItgkRUiUpAuGkDVWylwYv4S8vPQ3QzXirhjcM4BL5LJ
 IC7PGzR5x7uffJJB+z5VktykrB0bl6cMp52YSNx+AeW2KWjy/SgD7A2gxFuqBpWoV6hz
 QQ2zT5406WVkKvb/ykqJgDTja5ESHrRoCMht2AUVoU4nahwFzg2EKNda4NEP51N8k5B6
 BP2m6t52bad71ST+B+m0XnikxPtbmkkQKkqrjDi3cqas0dJOPRMc4Fgdaa/848EV5/eH
 /qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=/kpt2RV6NM9K6J+Df1fFRo6EZL8n/4JlPeLG7FAew6U=;
 b=mN1T0zIf0CrZVWr2+oNCJIkI2Bw4PNotMHpNv4yfqzIe6CznqBchQDKHiFkhihq/vF
 xgmJu2kw0JAgvWMeq+2Io0EloCMsVS9rKYMDskynzTVHpWNTqFq6bTVUw98fCUnoYsNT
 rID/XQDL9BMYFBA1VkKk1j5Dn63RUECvAcucTeipM1yTCBhrRzSJdi2MElfuLDxZt2kc
 t6I2F45VUjRzp8OlO/TxMQuUxWk6x+q7GGR4TC+Ih/Fb688i8oHVosvjIf+WkfE8db8P
 f6EdR3nvObzpAKAyijxKzqpllz0popIKt8YJi7bXWAcKQHq6elC6Kuniz7EDrnbyM0T+
 FQDA==
X-Gm-Message-State: ACgBeo0yTUS79ETuuBt0RI726k6EaeL+Bgeo9mldIzXoSuX4fSbfLglf
 qD7p9Ce0DLdAVPS55nacMvA=
X-Google-Smtp-Source: AA6agR7v/r3DRgd8SnJ0ZIUhy/OVQel9Bx9fmiJXxu11YC3eOwMJefcW1JsusLYI5j/00IiosOtX/w==
X-Received: by 2002:a65:6b8e:0:b0:42a:162c:e3a0 with SMTP id
 d14-20020a656b8e000000b0042a162ce3a0mr2215384pgw.464.1661412241538; 
 Thu, 25 Aug 2022 00:24:01 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 x124-20020a623182000000b00534cb3872edsm14256958pfx.166.2022.08.25.00.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 00:24:00 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: matthias.bgg@gmail.com
Subject: [PATCH linux-next v2] drm/mediatek: Remove the unneeded result
Date: Thu, 25 Aug 2022 07:23:35 +0000
Message-Id: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value drm_mode_config_helper_suspend() directly instead of
 storing it in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
v1 -> v2
Add all the mailinglists that get_maintainers.pl give.
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5f02f8d0e4fc..91f58db5915f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -833,11 +833,8 @@ static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
-	int ret;
-
-	ret = drm_mode_config_helper_suspend(drm);
 
-	return ret;
+	return drm_mode_config_helper_suspend(drm);
 }
 
 static void mtk_drm_sys_complete(struct device *dev)
-- 
2.25.1
