Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E341A6C6996
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BF010E20F;
	Thu, 23 Mar 2023 13:34:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D9A10E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 13:34:27 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 m6-20020a4ae846000000b0053b9059edd5so347379oom.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 06:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679578466; x=1682170466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8RyZAJc5BMnE79hcpQtiEO+k/dInqdtkEaO5MHpP+H0=;
 b=dUCL+V+ZiSlLVYfSuXmC6MMvbnyX+TRtH9Q/gIjCkqFJZiFp3roRn5lgHXawza4+bQ
 9cw/Lk2LoOeHGzHlXSNiCnxkbmscC6N5trizUQSSGu0dcS1YNKl7m21ygoGSiUTn4/+f
 65/N8SO+WeRQq9i5v3yJ0RD4cC2np7jT32UzXxg1mUqmWZD4/LCq3EFz3MIjYz1n5wBF
 z7DiI4+1Whavyn0txq7pALMa1ShxSovXScBXROsZus6YLRRuD/yxu4MMkKvzEv4tZ7OD
 nUiG4if+GnHxxTTCtNDeZXlVn8E0p9odO12h5bvV1M7FAcTlci1sQJF8jakBB44w9krR
 2hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679578466; x=1682170466;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8RyZAJc5BMnE79hcpQtiEO+k/dInqdtkEaO5MHpP+H0=;
 b=PDi/vCro8lHi3ELrUcoA4WC+c5U7wGyLeTKJGwmuPyhzptrjhAwTO+uNzPawfZogiG
 rc9XBCnvP/EWv5uMJI1hL1Fk8dUMWi8d16zMA8NsqIVydgJBrtoNv+rOJb6oknC8R2mf
 CRp0dSFxxIFtS3HcMAbcmGlVfF2olfoDkMyzzYPavAWEQGJaeRI+83fAZhO6FjufF/lE
 lhE+BbyJPSP9+DSk+eHmGwwHVWut20Lm5QtAD98EQFMOp6E2nTnMXYevD0Ce2c2F4jKR
 0p+O7eV6VY5hNaR13LXNbjGRzfYmnHg2UB4k6bIErrTqKa0wRobLLYfDvEiYSuBZd8Fi
 RfIw==
X-Gm-Message-State: AO0yUKVkH35DZlzZbhxw/Fbdl5ibtfGlih85aehnyk12vm52AZ2CG83l
 ASgkmXlrd/1BbOI4xO9v3wU=
X-Google-Smtp-Source: AK7set9XiXDyob2o0Lq+VDDpUahZHU/0xXfrvHyVtwCY9cBex9oyETNCBznEOOROiNZT8UdpDypWUw==
X-Received: by 2002:a4a:4348:0:b0:525:bdbb:2f94 with SMTP id
 l8-20020a4a4348000000b00525bdbb2f94mr4688172ooj.1.1679578465053; 
 Thu, 23 Mar 2023 06:34:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:4c56:116d:eccf:8809])
 by smtp.gmail.com with ESMTPSA id
 bl31-20020a056808309f00b00384a45d3106sm6958857oib.58.2023.03.23.06.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 06:34:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: neil.armstrong@linaro.org
Subject: [PATCH] dt-bindings: display: seiko,
 43wvf1g: Change the maintainer's email
Date: Thu, 23 Mar 2023 10:34:07 -0300
Message-Id: <20230323133407.3378606-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: marcofrk@gmail.com, devicetree@vger.kernel.org,
 Fabio Estevam <festevam@denx.de>, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Marco's NXP email is no longer valid.

Change it to his Gmail account.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Marco,

If you are no longer interested in being listed as the maintainer contact
for the seiko,43wvf1g.yaml, please let me know.

 .../devicetree/bindings/display/panel/seiko,43wvf1g.yaml        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
index a5426586b473..7977e07e2f48 100644
--- a/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
+++ b/Documentation/devicetree/bindings/display/panel/seiko,43wvf1g.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Seiko Instruments Inc. 4.3" WVGA (800 x RGB x 480) TFT with Touch-Panel
 
 maintainers:
-  - Marco Franchi <marco.franchi@nxp.com>
+  - Marco Franchi <marcofrk@gmail.com>
 
 allOf:
   - $ref: panel-common.yaml#
-- 
2.34.1

