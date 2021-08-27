Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5FF3F9601
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 10:24:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEFA76E06B;
	Fri, 27 Aug 2021 08:24:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB366E06B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 08:24:27 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e15so3466641plh.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 01:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5UjOdchXs6TvxgAlQ1PtdmA7+D4r3Icdkw2qZVkuTU=;
 b=zktf+/p86fTWqdQ8mVamuslYY1EqZYgEv8DP2sHNp7YY3OUMJ01Mvi5DMFzUzREusI
 kgoWYfZOV5zYZDs8wyU70siIKTHq/PtU7G+Jukqy8QgCU4gSkmEZ37ItWUkcb+3Lr8/y
 8YKD14+joyXg7nggTF3l0v4+7tPy7zhbrVBdti2yjwgo2oICln+Pg58Waf7ISvMK8xtl
 ZNe/ZPilCU9WtOHp+yZ+xvX7WA4CtMUO8mlxlEI6870WVE8ru64GHaddlJj+5i+kBZxW
 xzhhVqW0i2Dsua5u5R0CwVh245aXbARdLgSo5Wd53QM4dQv2YEdfu9r5S+u054tP3It+
 iW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5UjOdchXs6TvxgAlQ1PtdmA7+D4r3Icdkw2qZVkuTU=;
 b=cFwz1V3J2fwdpAabcG0S0GQ/2UYHj34JF4cJc0xhoV/MbcPCvlKyziTMY3dd4WZ/tv
 7/pZ08i/6WdW2FQ6eSpg/uEsaZJ8QJ34ELv44sLHsnO0fAPXZTqqQYeVcjWObX3zOiq9
 Qxx1bF2FQAYWqSzJxlC7pXsr1RIRS3kuZYZObfOOr47aIaT5UH3k4iAqQ/KHdA5PzVEr
 F0qTLKt+sGLIbNNXyEeGmwpxaN1ylKH1o11J0O3vxZ4Eg0jcSTHc4ot913lI7qw3Y0a4
 SghGIasXHEInrV2wRRNqbV2mQeoYE7zhXUn4j9+zI8aIq4WNnD0asSGJBRni8Y2AlZ83
 Or5g==
X-Gm-Message-State: AOAM531/QuGCWlZT6z5nIGuL0ZPqn67GPNHXnG50Q3veyQ0oKjcFCqvD
 KV/P6ruC3aH+HyeYvh+NQHHXIQ==
X-Google-Smtp-Source: ABdhPJwjwFm5HrTFTcrFg2ztSmUwlihs33RfTHwXzh7mjp4UZQEbCqjNfmZSMh/nrYp/7xoYHd51MQ==
X-Received: by 2002:a17:90a:ab8f:: with SMTP id
 n15mr9463755pjq.154.1630052667348; 
 Fri, 27 Aug 2021 01:24:27 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id m18sm5391371pjq.32.2021.08.27.01.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 01:24:27 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v3 2/4] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Fri, 27 Aug 2021 16:24:05 +0800
Message-Id: <20210827082407.101053-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210827082407.101053-1-yangcong5@huaqin.corp-partner.google.com>
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

The auo,b101uan08.3 panel (already supported by this driver) has
a 3.3V rail that needs to be turned on. For previous users of
this panel this voltage was directly output by pmic. On a new
user (the not-yet-upstream sc7180-trogdor-mrbland board) we need
to turn the 3.3V rail on.

Signed-off-by: yangcong <yangcong5@huaqin.corp-partner.google.com>
---
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml    | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 38bc1d1b511e..a7091ae0f791 100644
--- a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
+++ b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
@@ -36,6 +36,9 @@ properties:
   pp1800-supply:
     description: core voltage supply
 
+  pp3300-supply:
+    description: core voltage supply
+
   avdd-supply:
     description: phandle of the regulator that provides positive voltage
 
-- 
2.25.1

