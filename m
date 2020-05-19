Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C501DAC4C
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 09:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29DA6E488;
	Wed, 20 May 2020 07:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A32489C7F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 16:44:39 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id e2so12538210eje.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 May 2020 09:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=x55y7NheOCYCR/iiqhGsYzOg4DTF/y3LF/qDoYECs4o=;
 b=thnsfHkv0gxvjmBc79oOPNa2XSk/2n5KFV9FZB7tOa33jiWBZ1goEgBCBwUdrwZ3gj
 OTCkcHhoWCeQ1W2Nh125unX/RglfetrAr5DQQzJrz76pUhOC9BTlo31qcxY+eal1Z18J
 G+eb/Kbx8lFloEz4tj66j3zowbRjicyuqKcaX8cJzzKOgA2in0yampzsSdGccRslDYuP
 dTxIpS0YXYZjzpLBHS3iLdoE6X1YzfUIsLswsmaQdVOIOdl5adc78Sqbe53kVmau7Lmu
 Y0OCL23mG7KsKA9JSvccCLbb484dJ+fBfTRBO65FVFIQxgopISt+qn+kqokAxh66IZPV
 /hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=x55y7NheOCYCR/iiqhGsYzOg4DTF/y3LF/qDoYECs4o=;
 b=A5p7jocHtHVyyQKKAYUwj7qeKEoZGWPKDpVjlZkXNuO8yfwIFcu4e6TnFSgdpTeeJZ
 IUK39pSrH/sIcm4He0NYjfs1cFyB6n4BGgo05goycbeDtt4Z+yOjfPFd37F4WzWRwHTK
 j78d2zUJGDOqfibALs2JKVxClMbWjQbV6aItXfmcE/BRU1CqdjMw1igY2sxnJluMznSq
 QtKjK+JJEL05hKdIMOauXJ4jiPI/+7yV2Mtn6WPpiPR28vub84rdteYeZ03xfbpWSpzP
 rN5wc43fsIcTuquBxIEf0HFk2oUkABqYcYEPlYfm6vkkK3jhKHMhQC8PlbuL/yPaNoEZ
 0jjw==
X-Gm-Message-State: AOAM532nuC3LntUHD4ChW08rIlTxPKuVfZwDv+0/cY3RMAaP3IBvhJll
 WtvJW6NHfWkAJ7bVJrBgx0A=
X-Google-Smtp-Source: ABdhPJzyeykMTQLiecg5AXfa/nUcuDFcwIRER9TYnQXDCL+XVixes/FbSGKEiL37/S3TIG69RrvBIw==
X-Received: by 2002:a17:906:f1cf:: with SMTP id
 gx15mr60051ejb.471.1589906677896; 
 Tue, 19 May 2020 09:44:37 -0700 (PDT)
Received: from debian.home (ip51ccf9cd.speed.planet.nl. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id b3sm49627ejq.52.2020.05.19.09.44.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 May 2020 09:44:37 -0700 (PDT)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH] dt-bindings: gpu: arm,mali-utgard: add additional properties
Date: Tue, 19 May 2020 18:44:25 +0200
Message-Id: <20200519164425.9729-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Wed, 20 May 2020 07:34:33 +0000
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, maxime.ripard@free-electrons.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the old txt situation we add/describe only properties that are used
by the driver/hardware itself. With yaml it also filters things in a
node that are used by other drivers like 'assigned-clocks' and
'assigned-clock-rates' for some older Rockchip SoCs in 'gpu' nodes,
so add them to 'arm,mali-utgard.yaml'.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index 4869258da..2fc97c544 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -95,6 +95,12 @@ properties:
       - const: bus
       - const: core
 
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates:
+    maxItems: 1
+
   memory-region: true
 
   mali-supply: true
-- 
2.11.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
