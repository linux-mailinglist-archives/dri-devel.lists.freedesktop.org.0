Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE076781D9
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 17:40:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1243310E504;
	Mon, 23 Jan 2023 16:40:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F4D10E504
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 16:40:41 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d3so11943112plr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 08:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=edgeble-ai.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SklIkx9ayFUcVrlImxzAVAqtQZ+1umWUcLW5sAOy5vI=;
 b=Z3bBPyBrxNd/40Y2ZxG5Mdi5CcX9byUTG7KrjT5G1/9PRjvsII6nImSNzOQu8WWmvF
 z1v6cxrtX0cHwfeZsmCdsof6QHgxgi5gJLXYwto6q8TgLFqq10/3UwKC5ZdHiisHvmKU
 dXElC3Xg7KEeTTqRtrPjI1LmseNA4YUc9Ad5KjIhrx7R609uaQLhTvE9JTBS3m2VwYM/
 nTeqgfYiAB2XFl5tLmi5NdsxmvAJ1Rt2a8V5fdx/YdKfhMian4/lOI/ds6T8Xqeq5mCG
 JhZQ4O+rvrDuVcMiPbBndTLXxzqfLUz+BDMTlWRNmItP2+DAF6Jo4Pr0GG6PeknA5hGn
 bqrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SklIkx9ayFUcVrlImxzAVAqtQZ+1umWUcLW5sAOy5vI=;
 b=RnFsw7QkAeHciBKLijm3joTXXrjRGgAxXgsfszRfYrH+Fb2kUwemeXwMLpty8chy7C
 KfInKnGl4VVVFof9ZU6fSTThg3Fmt8nkRi5t/6p0cLIkdgIIHq6HNUF8kNm+ZQmhsZP8
 6nOQT4VJIaxscHJ2Aku2bHvsK4yXWcFj+UFIJsA6fvpmsSf+v+910+5IxBRiZCRdoi8X
 4sUi+zs85WgeaZ5mKMr56GkXsYHy3Wu5rOImuJwUBHWYiRpBml0lnWQaQyHSrSPUXSsP
 U/TvVEeLqhRigqWKYS9wzbxkIirO+lRXkqkcAdCSeHnmNbrNAORKtTk5vwrXnJOfaRvW
 Bvhg==
X-Gm-Message-State: AFqh2kpXXtyHf4ob1BDhWTtbbVAqXOpHBHrgWULzCGoFw2hdpTcvb+hF
 lhtrWuZhB2AbPyQAz8y9wU8IwA==
X-Google-Smtp-Source: AMrXdXurDJLnWjC3ng3vTmwfVWkcgNySJOigFQAkPKfqksyYIBAUMad0cU8/CYQNmOGiKbHSdIgh0A==
X-Received: by 2002:a17:902:b492:b0:194:c733:ea0f with SMTP id
 y18-20020a170902b49200b00194c733ea0fmr18460066plr.50.1674492040810; 
 Mon, 23 Jan 2023 08:40:40 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a15f:2279:f361:f93b:7971])
 by smtp.gmail.com with ESMTPSA id
 a3-20020a170902710300b0019269969d14sm17679971pll.282.2023.01.23.08.40.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 08:40:40 -0800 (PST)
From: Jagan Teki <jagan@edgeble.ai>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Thierry Reding <thierry.reding@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/4] Revert "dt-bindings: vendor-prefixes: Document Chongzhou"
Date: Mon, 23 Jan 2023 22:10:16 +0530
Message-Id: <20230123164018.403037-2-jagan@edgeble.ai>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230123164018.403037-1-jagan@edgeble.ai>
References: <20230123164018.403037-1-jagan@edgeble.ai>
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
Cc: Tom Cubie <tom@radxa.com>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@edgeble.ai>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 90f86d0c617d9461cb00f4d8e861eda28011d46e.

[why]
The initial datasheet claimed that chouzhong designed the 10" DSI
panel on top of JD9365DA IC, but later Radxa mentioned that chouzhong
is the manufacturer. This concludes that the actual design of the
panel, gsensor, and customized FPC is done by Radxa.

So, drop the Chongzhou vendor-prefix as it is no longer useful
anywhere in the bindings.

Reported-by: Tom Cubie <tom@radxa.com>
Signed-off-by: Jagan Teki <jagan@edgeble.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..f5d0e75dab1f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -248,8 +248,6 @@ patternProperties:
     description: ChipOne
   "^chipspark,.*":
     description: ChipSPARK
-  "^chongzhou,.*":
-    description: Shenzhen Chongzhou Electronic Technology Co., Ltd
   "^chrontel,.*":
     description: Chrontel, Inc.
   "^chrp,.*":
-- 
2.25.1

