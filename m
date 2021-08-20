Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E63F26DA
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 08:33:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3CB6EA04;
	Fri, 20 Aug 2021 06:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD9F6EA02
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 06:33:55 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id q2so5383263plr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 23:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5UjOdchXs6TvxgAlQ1PtdmA7+D4r3Icdkw2qZVkuTU=;
 b=bTuZUZG2L023gJdqS/6c2NsYteGNsl9DpgJy9cEKZSgBK3ciqceHtp+TCGQzXnqHha
 TQCCoYEdT3V3+Gr1ejZU8RfAoNXn6ijo2UmUBzbv27O8EJ5wVN2J9aY44SL6QvhNFwjn
 cNXQ7caJT172iQ/JDpoq4NZFyZ0ZCgYq3qYnbw/GaGmiu3I19DRqak9yfrW9kaPiSH1Z
 1sFA7WRfJvQmIhzGiV1aUm9NuV1aTAX4+HEXQ+meK4fRmBM8ddVpK4toJsecpCUQR3vF
 RTL9ildAL8RHP6iIMY3cmFTTKh1Wae5w6iz4pPQggstfL6z9KPJtJBdKUUgPgzaxi8rS
 R4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5UjOdchXs6TvxgAlQ1PtdmA7+D4r3Icdkw2qZVkuTU=;
 b=hVgzoKjbeZfe/ol8wQYebzXQ8WhAONKbvFbMqxs/gONBmydqovZIytbJ8F3O5VEjcT
 ucUbmaF8TU6JcedA80uL29v4/hPuxDQYjDWWBFKcpmviKLEggRkHn6AQ5X4SsXqUbAvP
 Pc4BbUh0u/BpR+3O3K9VNw+G+HHLeGx5eq0fxv4eDdkCfbmpc7PNWjoWQSoW/2EJgGgi
 epar4TY5pPnytgyBzCS/jg4vlq3ed9tNqb93ApgEU9xN916tc5SBJErGMbt3KqMOTzQf
 ZiDDBmC/pVudUb3LlQ0ed31yX3GLUK0pCY/vO3IlThJ5PFfH6SfHPmOlHc8LDvbcrumd
 pDsA==
X-Gm-Message-State: AOAM532i1pyGAlWCWkcdjob63HTllMrlCu/82+BAU4Pzed/zFBOu3CWl
 HB45N07VYgkufBDVr99nZnEf9w==
X-Google-Smtp-Source: ABdhPJxcfJeJTAnFweCv0/oxrTDnDiLD/9R6V2Ea7CuYTrnttJqAItOzfFKmmq6j+RJkk0hAGkXpVQ==
X-Received: by 2002:a17:90a:ee91:: with SMTP id
 i17mr3018612pjz.67.1629441234921; 
 Thu, 19 Aug 2021 23:33:54 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id a10sm5612160pfn.48.2021.08.19.23.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 23:33:54 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v2 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Fri, 20 Aug 2021 14:33:37 +0800
Message-Id: <20210820063337.44580-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820063337.44580-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820063337.44580-1-yangcong5@huaqin.corp-partner.google.com>
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

