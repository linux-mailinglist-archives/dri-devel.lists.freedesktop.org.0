Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D71196897
	for <lists+dri-devel@lfdr.de>; Sat, 28 Mar 2020 19:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA57E6E152;
	Sat, 28 Mar 2020 18:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FB16E152
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 18:37:02 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id m33so11642983qtb.3
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 11:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gOE1QJ7KEzi2821QFOUr5VIkfnYNAnKkaW2u6yhroF0=;
 b=kmSkohK9C99aKQMtcTaFk7VI6eCx8fIEA2JspD5Ai/1besCmp5AL7m1d5zrNarN9/g
 WcLnr93JMyYvpGjVt8uh69o6+w/N/DaH7++Ww/VMpBMxX3sgz792/2m2mxVjr9MM7vEd
 RaVAGU1qju5Khd7nQaeGgIlME9y1JbQfp6xEkU/97kyu8z7P3Sk5I0iU3udPQEYpd+Xp
 fElkx6HBH5tS+WIYZMUQeFhr4Z8AW+29n648e4nq7h3aNgXiymCOTkcd1YpzUYd0v5Su
 wFbWHhebJ/9vWl3SMcRqc9o+1CwZoL6KTm5I5/vXRqDwGTftA8MptQ+GWSxqQ2+GxJD7
 g4Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gOE1QJ7KEzi2821QFOUr5VIkfnYNAnKkaW2u6yhroF0=;
 b=YxwDeUoEOUu2Iskq2c7HiE0dQ1xbP1dJrMEn0Vv37tQQd+yOBbUM8+Y/2RaeXpcmFB
 XuUxZAqLVL1AWVxhAPlQC7zsUfpjIxaMvyuzTyl9wKcjhV1QJj1ymMtNGmTpBk4X/WT7
 EpFtqUHeR4wvTCNGUW6z3wwpsRXC1o/ukGCEg+3QOI6FjQRmJb4AdNh2E8Y1clsKOu5F
 LeUmLyy/aPfpl/760by/M2Nd1JNX+Gieizm6SfAWCY4l3nqSxwpFeySlibXNKdX6Io/i
 yGkYniYeeP52RL74/3omE9C8Mqnmz7eiudO3M+eUOmsj8y2KDseGqbqL+xjKS1mmphCn
 GNxg==
X-Gm-Message-State: ANhLgQ0E3vVPAekmH4AidDaDxnrqtO8/ftNi9x/5pfRm8iIGyzRhDtsW
 IvmJVC6u7Zpvnkr5qmfZoWA=
X-Google-Smtp-Source: ADFU+vukbniIbbOEjIUJNNGnuXRbWumjZpud/PTzz0M96h+nBpM4Neds+sKV/il0u+AFwBLmJmF92Q==
X-Received: by 2002:aed:39e4:: with SMTP id m91mr5206540qte.188.1585420621130; 
 Sat, 28 Mar 2020 11:37:01 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
 by smtp.gmail.com with ESMTPSA id u40sm6822420qtc.62.2020.03.28.11.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 11:37:00 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: sam@ravnborg.org
Subject: [PATCH 1/2] dt-bindings: display: ltk500hd1829: Remove the reg
 property
Date: Sat, 28 Mar 2020 15:36:40 -0300
Message-Id: <20200328183641.11226-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
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

Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.example.dts:17.5-29.11: Warning (unit_address_vs_reg): /example-0/dsi: node has a reg or ranges property, but no unit name

Fix it by removing the unneeded 'reg' property.

Fixes: 52120e8c7ae3 ("dt-bindings: display: fix panel warnings")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml  | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
index fd931b293816..b900973b5f7b 100644
--- a/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
+++ b/Documentation/devicetree/bindings/display/panel/leadtek,ltk500hd1829.yaml
@@ -37,7 +37,6 @@ examples:
     dsi {
         #address-cells = <1>;
         #size-cells = <0>;
-        reg = <0xff450000 0x1000>;
 
         panel@0 {
             compatible = "leadtek,ltk500hd1829";
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
