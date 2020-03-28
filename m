Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D6E19689A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 19:37:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B86E154;
	Sat, 28 Mar 2020 18:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5316E154
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 18:37:04 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id x16so11623845qts.11
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 11:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=L7P/B+D3AiYeRNTTtzGoWO1grg+iCf61OrKb7YkEpG0=;
 b=mozY0O3aE0VsrcFIuz0SN2grN9wdhs9EnPiQNI3+eyqlmq52didy7GDf4OrhQA9mFJ
 zvFn7B8hUwZweJt7r7xlbvOh5ezOUblSDGBkrYQ1lz8JN1jm9NaWQuF/UzXpCXfdVby4
 ElA2DBkDa5zmyHf4TkZu25bsmsoQa+L9QPT/zqor/KhrXw5M/JcmfOr4miM2dMfmMIrm
 eTvTYzgrk8dFWLYm4erp63ZN5llKI8R5JWVhYnIKVPkkLIr264MaVKDtiO5QvC0d4c+u
 jUDZTeeZm04LNVsBwW31DBN5XD2d0svr4QFWKYgJCVagSRMlBlKZv9igXxVOvLY2QHJt
 mDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=L7P/B+D3AiYeRNTTtzGoWO1grg+iCf61OrKb7YkEpG0=;
 b=VvUUJc7PGzlAGyFBNYzKijG4CLkyD03gASBEz8i750ehGbjE9nJ+CTJXWfO+9OFNmh
 uxUWzfpHeq9Pv9ON5dpoPcxZ0LgyIlcJ4au9Ch2x2ySqSklaqWswLKFZdtOlNjj1sObZ
 8EfPeGOJOdjPjt+/Mh2AJW1Vr9bAe4hvSu/2yd//JCxDGFWZPKIx2uZHhmD3ulpTxq3Y
 W+VDuAD8oTgQgQ2El9DKl7palwlWuOLnqmpJNnnE2errFo58Bu++1G2gAK+zaFzf6v93
 zZ2ev50aTmNZebwof0FEf3XYJJfD6QsUlO4fKgAZA7jYuhJXQWrAWzJy14Qc6vrdEw1A
 MIwQ==
X-Gm-Message-State: ANhLgQ2RExFFiHoMWDE6QX1uD5Wt83u9K7yx/7r3yMD3OUB2ztqKuJAO
 ycUEIGOg5GyIkonXLYp//BM=
X-Google-Smtp-Source: ADFU+vsLENpY4Q1bbAaq9kMxiairnEMYoFEgtPmD/wxeAhAyhV91TphsOcDU+P6yj8+0y+IeJ1qSgQ==
X-Received: by 2002:ac8:358f:: with SMTP id k15mr4986112qtb.113.1585420624015; 
 Sat, 28 Mar 2020 11:37:04 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
 by smtp.gmail.com with ESMTPSA id u40sm6822420qtc.62.2020.03.28.11.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 11:37:03 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH 2/2] dt-bindings: display: xpp055c272: Remove the reg property
Date: Sat, 28 Mar 2020 15:36:41 -0300
Message-Id: <20200328183641.11226-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328183641.11226-1-festevam@gmail.com>
References: <20200328183641.11226-1-festevam@gmail.com>
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
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, heiko.stuebner@theobroma-systems.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 52120e8c7ae3 ("dt-bindings: display: fix panel warnings") removed
the dsi unit name, but missed to remove the 'reg' property, which causes
the following 'make dt_binding_check' warning:

Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name

Fix it by removing the unneeded 'reg' property.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml    | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
index d9fdb58e06b4..6913923df569 100644
--- a/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
+++ b/Documentation/devicetree/bindings/display/panel/xinpeng,xpp055c272.yaml
@@ -37,7 +37,6 @@ examples:
     dsi {
         #address-cells = <1>;
         #size-cells = <0>;
-        reg = <0xff450000 0x1000>;
 
         panel@0 {
             compatible = "xinpeng,xpp055c272";
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
