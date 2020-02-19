Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B5716597E
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 09:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EBF6ECF1;
	Thu, 20 Feb 2020 08:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA8A6EC69
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:10:04 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id h23so1346932ljc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4SdNyJxLKQOIopt47a2aKS0SgVzGo+LdVLFJnDNkr60=;
 b=ajPOejSF29nBVw6tbuq0GHQZOGRuvjPON14D3VaeaF1LH6vjeWwa6p0cWZgH6zesTO
 J1Ui38ijhxOoRdm3TfKDF4R7H0HmmLturnRvJa/QM09PzVlT2w1VMf00jpAGKNaPVMda
 I85l8KSzkxhJVo2F6blZ9iRu5HDzG9TpVxzSlDWUcSJJsNw115wPlajnlTjfu3T8/MB/
 um2nDZOxV7QVt9wg+SvolsJC9JibUC3jLBBcslW5qtJwHX3jUQMqxRwef/cxypmFvGGA
 pgEGAO5K85Kz4wINQicpr22O37S0uYBbibEPUUZ84Ss2H83dCNenjyM3p/98A/6tqqie
 LybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4SdNyJxLKQOIopt47a2aKS0SgVzGo+LdVLFJnDNkr60=;
 b=Rd4k2ecOZFWzGBEEZFRQKvkgh57lVAAlyDvNyXf1NayEoP/JDWsoVyE7CDdfzAoGm8
 O9+IHArzPLV7REkkjbPu44Hq9cX6+G6ikzdSXhASxdoGY2ipkSsjDMvNPx9bhfqPfhEv
 9YXPRj+R3dP1VVdgGsTiXfQjwv5jFGKFb493PW3OgXLMvylbty7jgBI9aDgz1wNSDtqz
 cfvJvOiHPWhsve+CgN9YbQm9D/s8OHnxFI3Tut3Duy3m0OZMTxIhzgG/Zq1tSxnvVFdo
 4AguvE6kTNBjaknsU2hjPWzCsWqLu5nMDOnxOExObo6cwuXryfQijGkZjD+vxM+0am8w
 qXZQ==
X-Gm-Message-State: APjAAAW7mWiytVFo60JtkOd/X7Z7oqcnsJxQUFIAbYvnRJSHX1TWTPOx
 eV7NCII6VDLxLLBBoNg1ids=
X-Google-Smtp-Source: APXvYqz6P5Gs4MdtlOwx7++w+qdzCPpaUxoDvbr0krs2YjnjQqicU5hmCYwRTr1W7tVRPTxgCIWT0Q==
X-Received: by 2002:a2e:9a04:: with SMTP id o4mr16930038lji.214.1582135802940; 
 Wed, 19 Feb 2020 10:10:02 -0800 (PST)
Received: from localhost.localdomain ([5.20.204.163])
 by smtp.gmail.com with ESMTPSA id 14sm183942lfz.47.2020.02.19.10.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 10:10:02 -0800 (PST)
From: Andrey Lebedev <andrey.lebedev@gmail.com>
To: mripard@kernel.org, wens@csie.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] dt-bindings: display: sun4i: New compatibles for A20 tcons
Date: Wed, 19 Feb 2020 20:08:57 +0200
Message-Id: <20200219180858.4806-5-andrey.lebedev@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200219180858.4806-1-andrey.lebedev@gmail.com>
References: <20200210195633.GA21832@kedthinkpad>
 <20200219180858.4806-1-andrey.lebedev@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Feb 2020 08:45:37 +0000
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
Cc: Andrey Lebedev <andrey@lebedev.lt>, linux-sunxi@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andrey Lebedev <andrey@lebedev.lt>

Document new compatibles used to differentiate between timing
controllers on A20 (sun7i)

Signed-off-by: Andrey Lebedev <andrey@lebedev.lt>
---
 .../bindings/display/allwinner,sun4i-a10-tcon.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
index 86ad617d2327..c0f6bb16fa34 100644
--- a/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
+++ b/Documentation/devicetree/bindings/display/allwinner,sun4i-a10-tcon.yaml
@@ -46,6 +46,12 @@ properties:
           - allwinner,sun50i-h6-tcon-tv
         - const: allwinner,sun8i-a83t-tcon-tv
 
+      - items:
+        - enum:
+          - allwinner,sun7i-a20-tcon0
+          - allwinner,sun7i-a20-tcon1
+        - const: allwinner,sun7i-a20-tcon
+
   reg:
     maxItems: 1
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
