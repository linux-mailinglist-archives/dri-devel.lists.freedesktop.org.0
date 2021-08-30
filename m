Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E23FAFD5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 04:39:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F9889D5E;
	Mon, 30 Aug 2021 02:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82C9E89D58
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 02:39:06 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id q68so12001940pga.9
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Aug 2021 19:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xXGxvZeRy11wrq81EuFsuIuGp1cxXAYLGS+zZfcIkQ8=;
 b=hnG4AjOcYMuAsoxoKXmEO/E1z2aFhz7sb7Sn1GJWao4nnj3gNZ4Grs3f5UvPsejL7H
 ibg/AKwYyFapmCGEm6aoD0W4eBXKJaUx/1xIyzpHT/BNcyAiLOF4/i8uHIU2vlGluT+l
 z4Sk90+6iv+Pah0mtGlDwcz1GXdp4kj1ToUB0urdPHXboGedGPLYiA6nEQZR+Nd+taN+
 mbZucipvw6kDvKJjCV6ZhlN7jIjIc7AlZvjaZLpm4cy9VW1pF5ETRuCqdsP01Iq5ia34
 E2LXb0HJ9vkk0sY7KBsnc3t4KWqOblVnFS94MR43WLCMUaiv5IKZp/mVqloQKEx1sCii
 SRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xXGxvZeRy11wrq81EuFsuIuGp1cxXAYLGS+zZfcIkQ8=;
 b=tWb9VphVspP1SdkYk3QJhqSuKh1hWQjo4I0URDPviU/C2lPrYKTqI84DjVx7fbnskB
 stx6LK/J/UhAFp6LeCZmJV6zuA/L8lqQwTj6LUSP/7NHfw8sjAMYRs3XTLSQrCh/giXf
 uGr4ad22u2Rjy4d6T9OJ4uikgywGkn/2+epZb2jAL4GznI5p2OwYEF30neecnC8PH41E
 w+dKI8Vqq4v1rhbc3+7MaXjwn4/F1KES5evdfVJzCQN1fgWlQQLXOWbuyiXk/O36tLtM
 LDZ308wr/hLzUVM/3eEXrBDJdkyehx/YjPlpai53SgEqLUcVIpfRR8lTbVUFb2jqqf5m
 dIeA==
X-Gm-Message-State: AOAM533Dnmadz6qdy1ViTDHkF1eg0tNuLwKJdoDYCI45XcbSNIcAtt2g
 9gJOh92Bntkv9lNghD6zZNtbhw==
X-Google-Smtp-Source: ABdhPJziqFO9RqYOhlv7NxeqTzepoB696kqSKaI64e48ycgEgclCcfq8PvrDdH9Hjs9nf78MtUc0oQ==
X-Received: by 2002:a65:5c83:: with SMTP id a3mr19952951pgt.287.1630291146237; 
 Sun, 29 Aug 2021 19:39:06 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id g13sm906839pfi.176.2021.08.29.19.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 19:39:06 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh@kernel.org>
Subject: [v4 2/4] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Mon, 30 Aug 2021 10:38:47 +0800
Message-Id: <20210830023849.258839-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210830023849.258839-1-yangcong5@huaqin.corp-partner.google.com>
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

