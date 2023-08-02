Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5D976D07D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 16:48:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FA8310E1F7;
	Wed,  2 Aug 2023 14:48:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8627510E1F7
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 14:48:01 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1bbf8cb694aso39176785ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 07:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690987680; x=1691592480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VppVRXoXQvKZJkFtuRWaz8mbgEZARAeuezBGRcJyOiM=;
 b=hFYWlhmljE/klwppV++NKW84d/Eesf+FCOvycpSLv1wwCQpDOYdQA/icP3xC4HHRIF
 7Rvw1vD7plGgiNUFEdgMDG9B+49Prm8n3Uf6scoED+cjMOwuZHCogoPVhnADisSPHX3p
 HBDr52caGrX81FAcSeufVdwOc1PdpTXeZz/FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690987680; x=1691592480;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VppVRXoXQvKZJkFtuRWaz8mbgEZARAeuezBGRcJyOiM=;
 b=UTs2Hjgfv8Gi2M+IRCjfkIAn5MjWdcxKYCKGZiCuHdq3FnHwJyQGtrTy8bRzlwxW6f
 jjleEs+uvP8KI2hGU07LEmK45ErKx/3T9VH4MfLx2n1/c3ZMSRQz3ZBrenB8d+OOR9Fo
 TgZA6Kp3tFF+j2DRH9MAOGWRlc0lSgnRCBzSmrRO4tGfzE2CajYvFO8e8eudDhwJyBl8
 o5Aft2jZoKdGOi0Y6BF4AQ1N8G/oy6QKv8IymC8v+KtqiPnkqSMnGYOWevwLS5EXg1XW
 oepD0NYmvFEdC6saJAFVV3ulSbcx6frMPsaouO/WkjeiJW1OJOPhs8IYA3L9Deri5z/7
 n8SA==
X-Gm-Message-State: ABy/qLYFGq+knnU5NxPv57UNIRFF7ZphbvfJKMi26osHUl9s2CNkx4hd
 Q85FWIfQaq5W9VlyTiNeDwwetAHFXeTMQOTq68wKmUNN
X-Google-Smtp-Source: APBJJlEnKVmSw5s+REAmb9vIHaq2YjWuJwo5aDKSmHQblkNG/fsPSQTcTnzDbOCmKARtJsRK9TdsIg==
X-Received: by 2002:a17:902:ec82:b0:1bb:9c45:130f with SMTP id
 x2-20020a170902ec8200b001bb9c45130fmr19124197plg.69.1690987680161; 
 Wed, 02 Aug 2023 07:48:00 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:6fae:ec4e:7f84:d593])
 by smtp.gmail.com with ESMTPSA id
 b21-20020a170902d31500b001b89891bfc4sm12524139plc.199.2023.08.02.07.47.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 07:47:59 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 2/2] drm/panel: Fix todo indentation for panel
 prepared/enabled cleanup
Date: Wed,  2 Aug 2023 07:47:28 -0700
Message-ID: <20230802074727.2.Iaeb7b0f7951aee6b8c090364bbc87b1ae198a857@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
References: <20230802074727.1.I4036706ad5e7f45e80d41b777164258e52079cd8@changeid>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled
in drm_panel") the formatting for a code block was not quite
right. This caused an error when building htmldocs:

  Documentation/gpu/todo.rst:469: ERROR: Unexpected indentation.

Fix the error by using the proper syntax for a code block.

Fixes: d2aacaf07395 ("drm/panel: Check for already prepared/enabled in drm_panel")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/r/20230802141724.0edce253@canb.auug.org.au
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Documentation/gpu/todo.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index aa0052f9b93b..139980487ccf 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -465,7 +465,8 @@ Clean up checks for already prepared/enabled in panels
 
 In a whole pile of panel drivers, we have code to make the
 prepare/unprepare/enable/disable callbacks behave as no-ops if they've already
-been called. To get some idea of the duplicated code, try:
+been called. To get some idea of the duplicated code, try::
+
   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
 
-- 
2.41.0.585.gd2178a4bd4-goog

