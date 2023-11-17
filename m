Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3935B7EF7FA
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:44:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A6810E76F;
	Fri, 17 Nov 2023 19:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D31410E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 19:44:13 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-6ce31c4a653so1231365a34.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700250252; x=1700855052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BUK0KxqwQQVr1ykgLC91ghqfVd5cJU4TsdkFoLiMbfU=;
 b=HG6+M5D7U+/8RCeHPeJmGwqVrJRRN6jvSfPAunH7+VddjjaI4OPMFrDMsu6Myx1ASG
 6loqxc4PnYxfjfN0L9x+cuVTh1ImTfXLeTk1zSvGv4wkdoVX7vyP+Pw7L2I089qa4zEn
 ajAdPHtibDs011B25Vj+LRPJqUOC1607cCsAKne1pDM8Xz4pdGcKTWGwn/2nqiWBi9ys
 FcJrOK82nXe0K301nKFHmyr5VL8Bu+OkAwyOM4RrU0Jdm3dyO/3g3r1GXmq9Bb7ahiH5
 tymwAkd4IGImFPFi0Zn7r3O+iX8GOJGZsqtm3zEGh6u4CyG6AokinBYUHo+Ja4BF6v9w
 q60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700250252; x=1700855052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BUK0KxqwQQVr1ykgLC91ghqfVd5cJU4TsdkFoLiMbfU=;
 b=Em5gamZgejuYF4fFB1PomR8THXbVNFSO9Cn3po71Oxfho+QxrgG8llDZo4fQ6Jr8ol
 g8+Wj6yPNwvdBWOMfPx5gZ5O/dYSfGp1EAFwUn0LTN1tmKPMIUtPWKdh8mX3cYnoywuF
 Iw1cMdwjmI24XkmVpe6R4St4UZU8WU4cmsdvJNXLK8cv4N0iQe+kk76yiSSdkXYOl6bZ
 gcs2xbsGBvBz1gJmU8TkJ+HA8ZGY+eC7CHlOjzxAiP0fTEyijKEkssDdY9ULv1Db5udA
 5PtaDqftQzR2iEh01/R69x/ZJ0+UQvxXtpTpmd41CC8ztxXczZQafIXpVyZeXv5NrHtf
 FRqA==
X-Gm-Message-State: AOJu0Yw1gvSEluMPZikFM4UQjPp3Z4KuP+Z80Wl/0JYctwriU/mbQUy6
 A/0pMUCfBBH3gSetoD5b7UrWa51o95c=
X-Google-Smtp-Source: AGHT+IEmjfwK+LaF6o45YmdCZ05cGwx7GGSjEc84F00U528YvQdlWD3gNRzihxvIUTJcac3VgEHyng==
X-Received: by 2002:a9d:5e93:0:b0:6d3:1369:af7 with SMTP id
 f19-20020a9d5e93000000b006d313690af7mr205832otl.14.1700250252038; 
 Fri, 17 Nov 2023 11:44:12 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056830108500b006cd099bb052sm338193oto.1.2023.11.17.11.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 11:44:11 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 3/5] drm/panel-elida-kd35t133: drop
 drm_connector_set_orientation_from_panel
Date: Fri, 17 Nov 2023 13:44:03 -0600
Message-Id: <20231117194405.1386265-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117194405.1386265-1-macroalpha82@gmail.com>
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Stop calling drm_connector_set_orientation_from_panel() as its now
called by the panel bridge directly when it is initialized.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index f1fc4a26f447..29b4ee63d83b 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -211,11 +211,6 @@ static int kd35t133_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 	drm_mode_probed_add(connector, mode);
-	/*
-	 * TODO: Remove once all drm drivers call
-	 * drm_connector_set_orientation_from_panel()
-	 */
-	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	return 1;
 }
-- 
2.34.1

