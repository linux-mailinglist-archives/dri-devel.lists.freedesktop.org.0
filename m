Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE9C3F2728
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521FB6EA0B;
	Fri, 20 Aug 2021 07:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383CC6EA0C
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 07:01:29 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso13130168pjh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l5UjOdchXs6TvxgAlQ1PtdmA7+D4r3Icdkw2qZVkuTU=;
 b=aRMqUWS9nLpM5yOQ2nBhEQWrqnbF6ihk1Ki2ziRxoUM+rPLnRsSaqM/R7hV8G4rdur
 0bjhHww20DxAsIgcXxsBfZg6LeWJVPTeUv8SN/c9Exu1+eeKfmpsHZd6I/07fL1Q9DY3
 KRpVc70rOeFP/CjBzkw/jA9sTIpKG0u8y0Z4EbnxjA9cdodzNHtIhPEROAt21KI1XX4u
 s0gPTnKX0lNwDCzhOTSIm7pC+i/8Xb2vrBiap/quu53iG6r8dWH+cGqwWww8yj9asUIq
 GrZvyl5cIJiYeNMhqzQqt6MB9PyxGn7UGio+ES58f4FqiuYBXTvyHTsOM6ws161DAXgR
 TMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l5UjOdchXs6TvxgAlQ1PtdmA7+D4r3Icdkw2qZVkuTU=;
 b=Za0AGkI+R6m3k98YR1YrzC7DVyxiX4RhMNC07I67d19Jap7vSdxyFcMV+IZDB2bxJo
 Qyd/CrAkPhvLabezQjDVQaHUS6xGFcAHIViGBV+dhS9W+56/GVtsVS9Vp8zutvfHi6fU
 I/LAhTMIfrjC4u2eBUNp/pcN7lBFIRvroYMsujx2IPZ0QCS464BJBmyO/uzqkuK8ocFv
 yPBv8nktSC3/ccdaVoHY7qwjSkPcB5YLqbL3d++RjnLSFr9cuP4z2w/98cNxeEgmpnCk
 k5+5wQs/IzyG57xiMps0nKqDOonNnaHxw75pxpGg3bUHNrEitxTgNh0nCblk29Tieha3
 ISVg==
X-Gm-Message-State: AOAM532R4MoZpy8xf3GnpgxuWEPxgB+DGl+rWXqkCh6jSj06Tl/rGRpb
 /fMAMryZ0dSj1SAX5fySu07/+w==
X-Google-Smtp-Source: ABdhPJw2zK3S5b1K/1RwQ6A2/7zXhDLmaX5knLzuXE8Gd+zanyl8DH9ZUOSigjP9IuNEoySH7yknnA==
X-Received: by 2002:a17:902:bd07:b029:12c:f4d5:fc6b with SMTP id
 p7-20020a170902bd07b029012cf4d5fc6bmr15315683pls.31.1629442888807; 
 Fri, 20 Aug 2021 00:01:28 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id hd21sm10539997pjb.7.2021.08.20.00.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 00:01:28 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v2 2/2] dt-bindings: drm/panel: boe-tv101wum-nl6: Support enabling a
 3.3V rail
Date: Fri, 20 Aug 2021 15:01:13 +0800
Message-Id: <20210820070113.45191-3-yangcong5@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
References: <20210819124844.12424-1-yangcong5@huaqin.corp-partner.google.com>
 <20210820070113.45191-1-yangcong5@huaqin.corp-partner.google.com>
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

