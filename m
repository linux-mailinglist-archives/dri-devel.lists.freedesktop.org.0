Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C5204B9E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 09:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872396E968;
	Tue, 23 Jun 2020 07:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D7A6E219
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 01:36:20 +0000 (UTC)
Received: by mail-oi1-x242.google.com with SMTP id d67so17452028oig.6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jun 2020 18:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xUzhKnsOu6gQ8wo5pNQ9aUbiM+zR6hakYUaVJ25KuY=;
 b=jQ+k9fFJJ6wao/pAeyhtXubATETSraRIKy+LkYNdX0mwxIbSgAtWYLREjqUMYYasbm
 AUShJj8cYZ3ySM5RLlfT6IebvuG7RlzJSVzbP6ndZJ+/fOqTzcjBiPyX2deW+Ag2k/wQ
 082nggYK5t46GylyCV6wXBvULOw9xjfgM2Gwj1g0MN2ThzwzL1hw3pZanyS83XS4FNTX
 cG5CA6zRBlKLbF0vWgBEVpHuDwj2vA9kGVRYlav7R143QbQE569WHfI9+1oJrfJY/nEC
 yGDVKBb4He6zy2FkYSuwnT6QEvMDPSaIK2JZ8+MZ/HUCmBXh3/XWo9VZbgEqnHBWysbi
 lRAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xUzhKnsOu6gQ8wo5pNQ9aUbiM+zR6hakYUaVJ25KuY=;
 b=g7v1Q03nKVf0yF5SyF20cldsddNi3LtIAdRxlThlAo40xbyQ8C/hwXIrxEWrf1Urdv
 7/ek0hYKAj3OG8Br8CDbnKXtR0RMkl9eheaLYvwDtgHoJqpKwDwB+y33RSQWZFlbr5+T
 3YBnT9xrFjNr7o1KmGZm+FuqogL9W85tTKcY2PJCuSRljLjOGIxgoymXXwB8xbq5Tt+W
 BFjogjgzAn/5Xs7GBuHtlkyUffP1yrhPoW2VIxQQnUhkpk7W2edawmKEuK4aZlyx85SO
 KnIGQdOgP0EhoFepS1SbA1yUMlsBhp4mV0MomXnVWFwbTTRE8P2SyaH7Qv08fKxyOImF
 VT+A==
X-Gm-Message-State: AOAM5336QxTiz76gdARmUJIlqLQoyDMOaHOE5FtfaJrdepP6cbWawolJ
 PJ6as4AkJh1Oxxv6YjMd6JU=
X-Google-Smtp-Source: ABdhPJxaVLeLGTXxnw01SkIUJf4ClKrnziWYeidk+XMgDIH3PlOiFDay7sjX9ZcaDqPuG1tKRu2qBA==
X-Received: by 2002:aca:4e0d:: with SMTP id c13mr14664131oib.30.1592876180059; 
 Mon, 22 Jun 2020 18:36:20 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id j71sm3624030otj.6.2020.06.22.18.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jun 2020 18:36:19 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] drm/omap: Remove aggregate initialization of new_mode in
 omap_connector_mode_valid
Date: Mon, 22 Jun 2020 18:36:10 -0700
Message-Id: <20200623013610.555610-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Tue, 23 Jun 2020 07:48:47 +0000
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
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After commit 42acb06b01b1 ("drm: pahole struct drm_display_mode"), clang
warns:

drivers/gpu/drm/omapdrm/omap_connector.c:92:39: warning: braces around
scalar initializer [-Wbraced-scalar-init]
        struct drm_display_mode new_mode = { { 0 } };
                                             ^~~~~~
1 warning generated.

After the struct was shuffled, the second set of braces is no longer
needed because we are not initializing a structure (struct list_head)
but a regular integer (int clock).

However, looking into it further, this initialization is pointless
because new_mode is used as the destination of drm_mode_copy, where the
members of new_mode will just be completely overwritten with the members
of mode. Just remove the initialization of new_mode so that there is no
more warning and we don't need to worry about updating the
initialization if the structure ever get shuffled again.

Link: https://github.com/ClangBuiltLinux/linux/issues/1059
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_connector.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_connector.c b/drivers/gpu/drm/omapdrm/omap_connector.c
index 528764566b17..ce4da1511920 100644
--- a/drivers/gpu/drm/omapdrm/omap_connector.c
+++ b/drivers/gpu/drm/omapdrm/omap_connector.c
@@ -89,7 +89,7 @@ static enum drm_mode_status omap_connector_mode_valid(struct drm_connector *conn
 				 struct drm_display_mode *mode)
 {
 	struct omap_connector *omap_connector = to_omap_connector(connector);
-	struct drm_display_mode new_mode = { { 0 } };
+	struct drm_display_mode new_mode;
 	enum drm_mode_status status;
 
 	status = omap_connector_mode_fixup(omap_connector->output, mode,

base-commit: 27f11fea33608cbd321a97cbecfa2ef97dcc1821
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
