Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE7A4089AD
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 12:59:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C077B6E160;
	Mon, 13 Sep 2021 10:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6DF6E160
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 10:59:38 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id w6so5533921pll.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 03:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXGxvZeRy11wrq81EuFsuIuGp1cxXAYLGS+zZfcIkQ8=;
 b=scm3Agzn64NCaeJ9kze2BH9zZPJ3JWjFGBzUENGevvAR7dJi2wq/l26a+oCyFFF2bI
 2WHboZ/qUUw7kM+Zxn2qhxCmHflJVYl5zjDH9GDPh/jP4d8mqTbmeEh4kg4n8lOw/70M
 1KTxonW7v5pb4/y78fljlsE/5BjzmUuiUwOm7go2GU6Fbbpdqx/71zpSwXSjyMEF8bFI
 EE/q0a7nDKkREl/0pGYtbCAsA1kb5Kfdken4I7DrfQy6aSx2xlt1B2LDfyRS68q79akO
 GijexyxDOukcI+XxPpg6bzyRNtcbJA97+0gKaLHdHb0tMK3zPU+wRQUigDvpoRaQjJ7K
 mjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXGxvZeRy11wrq81EuFsuIuGp1cxXAYLGS+zZfcIkQ8=;
 b=FaFgFxBWROE81pFzGD3tmz98k2COhBZQjbtkTBFOtZzeEJwAqJ5KPU7vDgbWWR8Y6v
 KJCsaYcLGr7VGKonufivyxnbUTcCKuy0PjFh6Lq3rLv4o6jOV2NVL82GZ+RDBiD6XuDF
 Um8JiPVV9vAekRSQ/iZ/hyyWU8spVYlrVAtN+sLVTAQsB5cYcpQ+IrJnlNg38Env2KoS
 B9vHGl+rOVFG8NZ7Fh3cOBeifGhYTZn3QIjfGtxry2T7flMAJDW6LaQ3IWS1g3EXsWp5
 7tnGpHBwN48ozugOWppCFdnfqF+xnCoHjQgLrVjYjYPvwueS6ECXSI2KC3aJtXX4cr14
 xyvg==
X-Gm-Message-State: AOAM531ALuYH0VFZaVNxaKUP599C7lBkZy+ajmriAp+GBkGnCNCvBlDu
 khB8uzvbpcC65P79EsiIhC5g2w==
X-Google-Smtp-Source: ABdhPJz4NPRdoHNetAHXZGIJVMEYtvswwAebbRUWgXm056DPe2NqGkzVMyseA4o2RCUCl1hQpUut8A==
X-Received: by 2002:a17:90b:1957:: with SMTP id
 nk23mr12405121pjb.180.1631530777637; 
 Mon, 13 Sep 2021 03:59:37 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.214])
 by smtp.gmail.com with ESMTPSA id l22sm8279641pgo.45.2021.09.13.03.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 03:59:37 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [v5 2/5] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Mon, 13 Sep 2021 18:59:17 +0800
Message-Id: <20210913105920.3719525-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210913105920.3719525-1-yangcong5@huaqin.corp-partner.google.com>
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

