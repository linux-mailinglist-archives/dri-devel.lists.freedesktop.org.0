Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 213E925E152
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 20:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87B26E04B;
	Fri,  4 Sep 2020 18:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04BC96E04B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 18:08:54 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id y6so1509617plk.10
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 11:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vzdf81iezfmu4wvC29MoXNkCDvJVBLYXkjv5GQ8JBzg=;
 b=AY5OpA7EQVxVAQ2BRX17UsK93kzal14AKuR6K16pVMKsOYoO8PkFnqa4VfSl/adDAt
 XJ1kq1MbD9UwAc8cTVRUKWrp8Hb49mM2XqEEwqy8vpbmhJ6sw8TLcsWbJogpfNM8eFhz
 OaFfs98t3oVzsTtMaiEPwPi48rdYUP/ydXtDc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vzdf81iezfmu4wvC29MoXNkCDvJVBLYXkjv5GQ8JBzg=;
 b=ag0+8axwnUYU0Y+5mmbIGQeEyu5sgeFa6s8Z5tuAx3YYr/+AZForVribk0pe6KrG0m
 5fBjvw4bxzBR8S6kGdiOxVWlJu+xh2xoJeWh//tbaPY8wKqSwAYWwznt2rsBNPMlzAa4
 UUc6iik5q5XvxdbmW6vFJrDhj1lOTyES3LLgPll/FJeFDK4klyuvdg61wfHjv28WCvov
 3ih0ZHOEwpHOCZ9qOtXUnFVWKuRoYW8TH8m7M1bw7kUjQTxeUVNlKCaWLjuKcJGrFcLE
 NqEnn1sSsCOjprevCrSeZvqnn5jcSXE0G2iIEeM/3eTrRmV7Bcqyp9Yhweeqap3jPRE2
 GDlQ==
X-Gm-Message-State: AOAM531xQMQqUo8Sfwz80Tkl3O1iKd4/uI7mlk1OdYRcYh0mQA6sx1e9
 CCgZyqt5EYriiE3ZQI/O6KAc4Q==
X-Google-Smtp-Source: ABdhPJz+WOCZ/I5jjFzcU51vGXw5nkCE8i7D62RQZfF3tj0lru20q/i+6dduujH2uY1P2mruBR1a2Q==
X-Received: by 2002:a17:90a:5a48:: with SMTP id
 m8mr9275714pji.181.1599242934113; 
 Fri, 04 Sep 2020 11:08:54 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:b9ea:24bf:6b2b:1eee])
 by smtp.gmail.com with ESMTPSA id 131sm7448281pfy.5.2020.09.04.11.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 11:08:53 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Yes Optoelectronics
Date: Fri,  4 Sep 2020 23:38:19 +0530
Message-Id: <20200904180821.302194-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-amarula@amarulasolutions.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add vendor dt-bindings for Yes Optoelectronics Co.,Ltd.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 9aeab66be85f..15a6a8e7260d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1167,6 +1167,8 @@ patternProperties:
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
     description: Xylon
+  "^yes-optoelectronics,.*":
+    description: Yes Optoelectronics Co.,Ltd.
   "^yna,.*":
     description: YSH & ATIL
   "^yones-toptech,.*":
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
