Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9AB1A29AF
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 21:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B65C6EACC;
	Wed,  8 Apr 2020 19:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 996036EACA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 19:51:45 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id x23so6120891lfq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Apr 2020 12:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=724/lfLQXagg3iBwy3nhrx1mv6xJ9vurcClPnBGSmdI=;
 b=DD1bKhJPg0YJyuw3KDAjtl5+8V/mS7cpL6VRrInSPwb5kCQ8fYVOCylh671+i+GgrO
 aQ6IP9eVbZu/KFmbqWznIwLTxQz8j5OU9VUyys1AOgJ+sDm2dofFqFGyk9xucYwK/TMH
 21kYkSIBXYDxbV9VEJF4hnCaSLMXMXEKVP5+c2eKF9iLOw8eFqNOQ3cKJanTtKs35CTy
 muR5KYyVJ1N8CdvZoQWR1cZgxxzD/TDGPKjLgr4cGJfAyWFoXWqCzO//kiMgvKGgOnmp
 VM0dWiEvRghrv8h7WB0DpNeSCxLJqBS/XzntnVPDzdi54bR91aYScMe7sjcv5n2xHjyr
 R16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=724/lfLQXagg3iBwy3nhrx1mv6xJ9vurcClPnBGSmdI=;
 b=aD+fl8tO4gA2FpkG8UiaF63V2n1mSSK3cwuhIB9Hw3GZDm7qLIUqm2Dy6t7OImOvJH
 PwVtfqdvCjk4wFOgtdKmO0s83x90Y3AWcALAWnMpCBt39PKexYqe1BDTC7P/sAcDMmSf
 wCgksWCgJTG0vhs8Nae7Pd0DDG2knUqXvl1UySqO8mO11vGiNOrQrdiuYwnlDpR3TfSA
 xXNB4fjiSc6VcXvL+Zuh4/2dl0QBtzLvzrS5Ybgz/r7ghLqpLCooRZ0xkxlZfDMvGtWL
 QDD0YQoh4mCvt58DhiKabxBjafRD8U0dQ4aV3hxEaFQs0mfcKu+ZyxWPcTKn+z4+ewab
 eR/w==
X-Gm-Message-State: AGi0PuZ8rx8/UFQ9AXsDYiUgQeXAhx+t5yDRO/TwiXj1DPlB6Q+5TSgw
 rpogXejM4JkvwQ97HULQrmRb6+xeRzg=
X-Google-Smtp-Source: APiQypKyZ+P2VTnHN61mAiyG/8Kk7/dsCVnRJle8luKRqOOJ0Det3YcWnuGUAQcR129tK+Bst+f/Bg==
X-Received: by 2002:ac2:5192:: with SMTP id u18mr5501184lfi.114.1586375503698; 
 Wed, 08 Apr 2020 12:51:43 -0700 (PDT)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 i20sm3961304lfe.15.2020.04.08.12.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Apr 2020 12:51:42 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 03/36] dt-bindings: display: add te-gpios to panel-common
Date: Wed,  8 Apr 2020 21:50:36 +0200
Message-Id: <20200408195109.32692-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408195109.32692-1-sam@ravnborg.org>
References: <20200408195109.32692-1-sam@ravnborg.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Several bindings specifies a "te-gpios" for tearing effect signal.
Add this to panel-common so we have a shared definition.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 .../devicetree/bindings/display/panel/panel-common.yaml    | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-common.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
index dd97907a7450..17b8367f12dd 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-common.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-common.yaml
@@ -124,6 +124,13 @@ properties:
       while active. Active high reset signals can be supported by inverting the
       GPIO specifier polarity flag.
 
+  te-gpios:
+    maxItems: 1
+    description:
+      GPIO spec for the tearing effect synchronization signal.
+      The tearing effect signal is active high. Active low signals can be
+      supported by inverting the GPIO specifier polarity flag.
+
   # Power
   power-supply:
     description:
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
