Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D13F2775
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6BFF6EA20;
	Fri, 20 Aug 2021 07:17:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925F06E823
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 08:29:06 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so10769691pjb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 01:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9pbcm30VIAQ9iEVPI1FIF1aW9JXXtwoO9LwunNGqeRE=;
 b=hkj83Zr+ZblfHzbFg9Ibwfy+X6mXbl5OoEgBrmAyJ08HPtD6/tVWqZrOlZ95P9qCA4
 qLv7JIfGyiESf+tVTKA7E4tsgxwPPz2iAH30GnlHth/pe6QnkbVzgWyZy5+TgTveWdQu
 6T+eAQRsetJcowu8vjULbtiD7BU4D/AD3afT5NADOny1DuzlqoY8j3RdINep0+vSqJ3N
 +QEMn4Bw2CbhCjLMMdHQFMEJ6qCl/R4iJ+wteLK1EgBZX3/oXRO+wq5pde0p7SM0T8Hv
 T3OAs/drOoo38rBeFurJM9Vyb7E9oK0UIsUcSvqnsgFqF2EGS1ZRyRlB3l/odFh+l6T7
 cLdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9pbcm30VIAQ9iEVPI1FIF1aW9JXXtwoO9LwunNGqeRE=;
 b=cgkikIOE5RIM26r54D4EOLASPF3oWGMSM2UWTORiNXKGcvRpYxq65eaGKgotMnlcFm
 uLoh/gELwkq+rQQaP1DWqQsc3qIVyotFKRCVFPf+n+apr6Ba4VS2UlREJYqF4hcbaw6W
 BbN2gw1hWi1FDppLPgX5RmM9wVzDJ30KkdKl8QmLy+NYUZrRWpeBsNo0rMpyuEr/ZJTU
 1SoeMeb3G1s1p5EJWAQuvuua3JGEmVPdVMY3AYmKWXTfH7KCxV6iQ9/ANGZNaPgWRuAJ
 /2JTNF7wSNwZn8UfWV7mDMhSi7rmmVgqQQ02nvqnsnzbP7eJbTFtppp5DHJlFhJTHzgl
 IshQ==
X-Gm-Message-State: AOAM532G8dIhuBu2Rlyj4M7D1276p4i86ditM5kB06/79g3lJ/ENlp2A
 DlvVZIdLjclv5lultjUsSo+Row==
X-Google-Smtp-Source: ABdhPJyutR7vlosglYs3jbeVxN1Iy5tUynkr3fLtf98T3GvmpAwc9K8oCvIQtz2kIFukHbzeHjgMPA==
X-Received: by 2002:a17:902:6b8c:b0:12d:b95c:30fb with SMTP id
 p12-20020a1709026b8c00b0012db95c30fbmr10870574plk.81.1629361746199; 
 Thu, 19 Aug 2021 01:29:06 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id i11sm2347220pfo.29.2021.08.19.01.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:29:06 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dianders@google.com
Cc: yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v1 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Thu, 19 Aug 2021 16:28:43 +0800
Message-Id: <20210819082843.716986-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819082843.716986-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819082843.716986-1-yangcong5@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:16:30 +0000
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
 .../devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml b/Documentation/devicetree/bindings/display/panel/boe,tv101wum-nl6.yaml
index 38bc1d1b511e..e45de7a4360e 100644
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
 
@@ -52,6 +55,7 @@ required:
   - reg
   - enable-gpios
   - pp1800-supply
+  - pp3300-supply
   - avdd-supply
   - avee-supply
 
-- 
2.25.1

