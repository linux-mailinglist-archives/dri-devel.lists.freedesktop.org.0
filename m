Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0039256910
	for <lists+dri-devel@lfdr.de>; Sat, 29 Aug 2020 18:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8A76E1FB;
	Sat, 29 Aug 2020 16:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5B6E1FB
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 16:33:40 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id 5so1957345pgl.4
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Aug 2020 09:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGoI0Ukde5f+T5RdhyoqC2Vyh2NxruRDSw/PCmJ5yyE=;
 b=Ytz4kozTp8JHB3Kr1KqCfEscAfIEhScIPQddPrKNmx3BJLEPqx6qHskUj7R340QrMj
 4iB//fZ+ipdcLk5SskpCsNXy1DQoIBw69MnclHtkZu0SWtlpQCkFJVmhfXBDPrUFjsrY
 LiXUo05Sy4ydXSgEkHxGnGgwxwkU0ITXXzkqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mGoI0Ukde5f+T5RdhyoqC2Vyh2NxruRDSw/PCmJ5yyE=;
 b=pnu/gVjZ+tHDEaYeydWukZ9l2KYB0ZN4m+jYCxLTC8lXPpsEfTpRuwEkGfFRDVBE9A
 yIMys1+Qtyr+SR0KrqPV94bk65be1uIOwNs7lJFyHnn0rpzxKuygoOab8IS5Sj4qRqvp
 wfsUogCtdjkccS8COUY7SrwYa1gj9LEAN4NxCmsrSve+EPtqDuaFLm38Er0gTDIQFETY
 w6rsHENdb/q6K0HA18EcSOUDAKXPBEFDlIPqgol6CH/qmBUHQQaP4cQFdHSQrPBp0o+K
 KoJW/y6BiPwb/YQS838k6YRdueIK2FDBbOnwNu/zQqfarEAdaawIzBTc4T8sd7ChrxX9
 AalA==
X-Gm-Message-State: AOAM530e94v6WhWScA7kJ0ZL87vKS96P3ki0eSsHH/YKYpkNwoAAqe2Y
 66mm+mBnCqFjXSbvcwEPHW1ZBQ==
X-Google-Smtp-Source: ABdhPJxnRj9/9TzRPftUS0YznqkGB8zAJFCBjQNDnLh2OUsp9vVRDPJtX6C7whEEyjCG5VdhHXX6Tw==
X-Received: by 2002:a63:d14b:: with SMTP id c11mr420597pgj.64.1598718819609;
 Sat, 29 Aug 2020 09:33:39 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c809:c7d5:9460:cfb8:90a:fedd])
 by smtp.gmail.com with ESMTPSA id
 o6sm2457934pju.25.2020.08.29.09.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 09:33:38 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add AM-1280800N3TZQW-T00H
Date: Sat, 29 Aug 2020 22:03:27 +0530
Message-Id: <20200829163328.249211-1-jagan@amarulasolutions.com>
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
 Rob Herring <robh+dt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add dt-bindings for 10.1" TFT LCD module from Ampire Co. Ltd.
as part of panel-simple.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v2:
- none

 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index d6cca1479633..f629d04f7737 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -29,6 +29,8 @@ properties:
     # compatible must be listed in alphabetical order, ordered by compatible.
     # The description in the comment is mandatory for each compatible.
 
+        # Ampire AM-1280800N3TZQW-T00H 10.1" WQVGA TFT LCD panel
+      - ampire,am-1280800n3tzqw-t00h
         # Ampire AM-480272H3TMQW-T01H 4.3" WQVGA TFT LCD panel
       - ampire,am-480272h3tmqw-t01h
         # Ampire AM-800480R3TMQW-A1H 7.0" WVGA TFT LCD panel
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
