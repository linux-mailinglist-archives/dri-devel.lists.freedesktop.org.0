Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B5040A45B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Sep 2021 05:23:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D676E329;
	Tue, 14 Sep 2021 03:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3586E329
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Sep 2021 03:23:15 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id d18so7230588pll.11
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 20:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXGxvZeRy11wrq81EuFsuIuGp1cxXAYLGS+zZfcIkQ8=;
 b=FUWGMpzYDzNSs1YhVrn4J9x00iaB0aUf5fu/2psw7i1niqGg13CKZBYcUuv4fuN9Pt
 TyvAsNmoPMhNYe5CQtUdiDztWgR5v7qaOy4g6XpdBhEEUnE49lXHDeDbSTBjC4R++Dm7
 exLYw8B66E4vCp6Jbh9Jx3Oa6JpIMmyK8ZXEtA4i30VuU9TnXpKd7H+h5N75tCm/XoZC
 DoGmIDxTL27qkUx16nQsmQ19oO0z2JL/wyTuVhW7sFZdxZzyFWHHHifbj64/ZtQzASff
 MDbwc/IjvYTBXcml1LrMUYBFClE1dReqqOV4HRVhoslz21CU3qt7wz+/1ICS8OQHE0vA
 gm9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXGxvZeRy11wrq81EuFsuIuGp1cxXAYLGS+zZfcIkQ8=;
 b=FweKJdNTdqI1MPx+evhuxLymRirq64qRv2xfBWYz90gJzSzHCzcWLIsE0mrUOyUJOK
 bMQLx+bsIDYlRokqwERLHAhjXJxKWiDpTexaJ/Lq07m9GhTrJDVA3OOyn392gG/pxLR6
 edz2wk4F76Kt2v3T/Zv9+1bQ9Gyusqef8CJoqx5S45ws5pnaPb+6Yw40TyrvngXXIDnB
 MkJXUJWcJNG6aOKO4xAc7/8f8nCOHMC8ybetWsHakJC1Ne2uf1ngHWOzFh+k+mSHpbYd
 JEja2JbuYBeuGIcSgNUDjehYppTwXuGt/XNMHArkfV3b4FKJj3wyxXZeFl7XfI3IS6fd
 pmAQ==
X-Gm-Message-State: AOAM530OI1WxFV8umyIYCsWdeaTsRsttUV6RZ8VIFuF3NxnCItQqPKel
 hEjtIPaAV9wGGkkciyAdaYvUCA==
X-Google-Smtp-Source: ABdhPJwSryE04sn4MBsmStYuZGgSfTNorV0kSo8J+9jlVkj5QEy2MmNtVex6BzGNLAeS2J9ZC4EDhQ==
X-Received: by 2002:a17:90b:3e88:: with SMTP id
 rj8mr3201634pjb.86.1631589795442; 
 Mon, 13 Sep 2021 20:23:15 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id x15sm9354101pgt.34.2021.09.13.20.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 20:23:15 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [v6 2/4] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Tue, 14 Sep 2021 11:22:50 +0800
Message-Id: <20210914032252.3770756-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210914032252.3770756-1-yangcong5@huaqin.corp-partner.google.com>
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
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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

