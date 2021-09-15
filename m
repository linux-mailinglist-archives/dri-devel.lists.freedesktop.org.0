Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC3F40CA92
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 18:40:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597F76E98E;
	Wed, 15 Sep 2021 16:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8596E98C;
 Wed, 15 Sep 2021 16:40:31 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id w1so3628973ilv.1;
 Wed, 15 Sep 2021 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wKV+lnWpUuZH5SUW1lKdicYs9iS1/HR/b6CwzZGnc9c=;
 b=S9I+VL+60lvXHiO1v3wKQjh2TLgFoU2zIMfzmpRCanTOXm0N805LWXpU8PnOp9+jBj
 YRCXjIVfoFkZ0qnzooWi4jakjLgWMbAhWAGnHoggpwQ+cbUtEdpNW92p7uTS6p17DZvH
 N/vmiOTIXtvaMLaIBIMoDS0HFQzImkKIDtAaEy2Eiacl3SS/Y0777LgQwBUaup2DuSa8
 IsPKTtGe5qWSyD7QwLAOsd60/KMq0v8ig3ixgX4L7G1sbcngNYtVDt4l6AWqxEb10axD
 u+Tiv4xEKG8II9Rt70IxMS3jnRfWXoL9qtIUaQh0lex3l7c6thr6oFOVWitknzptZEi2
 +DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wKV+lnWpUuZH5SUW1lKdicYs9iS1/HR/b6CwzZGnc9c=;
 b=n4jbGnNF3L+ai5/DjXeEO6R8/hY87QCQvSOrd6omoVB0SUTmO/jhvl0SuvrkoN4hTF
 K85i6jADtkpq2yczAJ4Df5GNhTJ248Pl5jWUww0gwjzCkcHP5Cdci9w4Nmh6xq6H57YB
 d7vuj0UouWxlaSkN7qhgHbrUgB+GduPWPvc3toT+lnkEKqWMW3gWOiMNOaLOtk2LZj9X
 vTxvrTznVCQ7HqDYdC0d9cZaQ4V8tQ8xEZBCvSZrY3lfSwYRi19WBW8M5v4YCtQrP7SU
 Ot3ikGeW0NaFIpAt/ylvtheUDZcwDSXuNcTaEbXiM2RC9SQwOdYaD6Nrok9SlEIbRltp
 WjKQ==
X-Gm-Message-State: AOAM531l33KUebunIX0/1c0DXr5mkEKMSnVMN207kLFLKVIHMZpza9qj
 TVZuv34GWMYPSvvE9mtbsr0=
X-Google-Smtp-Source: ABdhPJzFjY9IDEO5W7WNqwgctTlwlHwbvpjLICXGhOw3Qy7mcpDmGs/yUuIDeGAG/TErArDsOWTdTA==
X-Received: by 2002:a05:6e02:5a3:: with SMTP id
 k3mr688180ils.283.1631724030459; 
 Wed, 15 Sep 2021 09:40:30 -0700 (PDT)
Received: from frodo.. (c-24-9-77-57.hsd1.co.comcast.net. [24.9.77.57])
 by smtp.googlemail.com with ESMTPSA id a5sm299540ilf.27.2021.09.15.09.40.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:40:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Cc: Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v8 02/16] dyndbg: pr-info in boot-param should say so
Date: Wed, 15 Sep 2021 10:39:43 -0600
Message-Id: <20210915163957.2949166-3-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210915163957.2949166-1-jim.cromie@gmail.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

add "bootparam" to format. no functional changes.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index dfe1e6a857bc..da91ff507117 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -998,7 +998,7 @@ static int ddebug_dyndbg_param_cb(char *param, char *val,
 static int ddebug_dyndbg_boot_param_cb(char *param, char *val,
 				const char *unused, void *arg)
 {
-	vpr_info("%s=\"%s\"\n", param, val);
+	vpr_info("bootparam %s=\"%s\"\n", param, val);
 	return ddebug_dyndbg_param_cb(param, val, NULL, 0);
 }
 
-- 
2.31.1

