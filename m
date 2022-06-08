Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E29C5429A2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A0F10E74E;
	Wed,  8 Jun 2022 08:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2F410E74E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:41:32 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 w13-20020a17090a780d00b001e8961b355dso5974721pjk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=hHkedwJj/HENazSRh10iqNTbeup4cO7vLg1WpgNFr1o=;
 b=CMXhZZ+2L9gC73xafarc2LyxiVvEakzSUBq1+9q47cddUq/zAMwzRNX0DzccXieEM6
 SbhKBkwyktyRoBWWSi2RtFNzEYlXAxq6KlF3G9kTNtxgERdeAbVwhhEQKFn89/Eepo2p
 gtYyJam0AHJ7ANn6j9GMU/nDaic0NRUDJ+I8utcdMwRx+njSwI/JkGxBKrjYGyisizJ4
 3FivjpU1CpbLJHw5AVzjlI/A1HxlvsPIqVp/ik7glq9OB1xvP+OvZYZBTVCsnkhq6VJ3
 DsSZltm6S0cBS/57xjZA93F2GAb70eh2TsSqr6npl2nfkzgdmvJ00tbC1eziWv1zMn5s
 A8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=hHkedwJj/HENazSRh10iqNTbeup4cO7vLg1WpgNFr1o=;
 b=A7Z9BOC2ka+i1OVA6Ei9Qt5wRtFjVy3HoTpwxqQJcwOja4+Cw8iZEAulTv1GWitVbh
 u+YVS56bZGSN3oxvfKfgnmztc039nOGQ6qOSArI+CKjjuS/IUCp9/Ctb6inyNbwGxpPP
 CSUhT6vj75uDLgHbAGEm6oRYYq++UTWGha+udrdHXLeMtq/hcFXd2T9/MMAGwMrvw2sa
 GCHm4+jJ1r8IfGz9pMyDENnG36l9dUhE0+Iyx5sx2ju20aga9wIVHIYEurMBvSuhzGJM
 IMFU8o05Oo0+xurTsBN5qTsEZCwj/tzm1e1XATgDZtjsTPwAdI/73GmxUjX7JIJmNikw
 SRPQ==
X-Gm-Message-State: AOAM531z68CwAyE3VlVxBuIeU8xqu/lLbSwKN5g1Rh30Tu2xBH3gN86K
 wRBPpkWpOHDSy5ONNcEY9tR52Bxams+kfg==
X-Google-Smtp-Source: ABdhPJzxDgIx3QKVftstVQ8aFxJFGsBRl+3Gkgpx8Nyi5EhYtsysbCak+XjtddVMSSZpCxvbNnJnrA==
X-Received: by 2002:a17:90b:4c10:b0:1e8:d377:4998 with SMTP id
 na16-20020a17090b4c1000b001e8d3774998mr6155161pjb.227.1654677691646; 
 Wed, 08 Jun 2022 01:41:31 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:479:837b:38ad:1ae9:1239:b178])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a170902f34400b0015e8d4eb263sm13902217ple.173.2022.06.08.01.41.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jun 2022 01:41:31 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v2 1/2] dt-bindings: backlight: rt4831: Add the new ocp level
 property
Date: Wed,  8 Jun 2022 16:41:13 +0800
Message-Id: <1654677674-15417-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1654677674-15417-1-git-send-email-u0084500@gmail.com>
References: <1654677674-15417-1-git-send-email-u0084500@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 lucas_tsai@richtek.com, deller@gmx.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cy_huang@richtek.com, pavel@ucw.cz,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: ChiYuan Huang <cy_huang@richtek.com>

Add 'richtek,bled-ocp-microamp' property to make it chooseable.

The wrong backlight ocp level may affect the backlight channel output
current smaller than configured.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
Since v2:
- Change the property name from 'richtek,bled-ocp-sel' to 'richtek,bled-ocp-microamp'.

---
 .../devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
index e0ac686..0f4beeb 100644
--- a/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
+++ b/Documentation/devicetree/bindings/leds/backlight/richtek,rt4831-backlight.yaml
@@ -47,6 +47,11 @@ properties:
     minimum: 0
     maximum: 3
 
+  richtek,bled-ocp-microamp:
+    description: |
+      Backlight over current protection level, unit in microamp. The current
+      supported level is 0.9A/1.2A/1.5A/1.8A.
+
   richtek,channel-use:
     description: |
       Backlight LED channel to be used.
-- 
2.7.4

