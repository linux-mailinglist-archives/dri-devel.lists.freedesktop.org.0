Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A50F65429A1
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 10:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596DF10E691;
	Wed,  8 Jun 2022 08:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C488F10E691
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 08:41:27 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id u18so17070570plb.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 01:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=kCNBdcO4eoFOVjLRvT8Z2N/y1O53eJhJcKUq651+9sk=;
 b=bit2wIiyAJxn1s5PrPmVxVa8L9FFb163p3AmfXkmDPgZQYMURTcFenjrXsCY6NqSIk
 PuvsU+AvCWlaah1oVCI6b9yYDqT97QUVSyOR70IWJY/d13pMB/XZJvB76UP2u5QThVoY
 yBXPWMS26gx8it4G2E15Cd0h5p4svWGSkUmHsXsfdcnWC3q5d9LPuD0qSmHAUsKmoMIU
 yFyA/3sGyyWT6jzcGsluJRxxuZz/muWnFyNnhxCcWmr5jeOhaKqpURTed5MuU023P383
 RBl4eQveJrM4024P+PAcQFeOrVMQBOj9431ZkTk+gCxdDOA58rpSDyDzbrwK4/MzDPs+
 4dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=kCNBdcO4eoFOVjLRvT8Z2N/y1O53eJhJcKUq651+9sk=;
 b=lD2CEuIxRwmNopWJsOgTl2rVFT4rn561pnQP8guTIC3GwkYUa6/zFjfV19Qy8cT0lX
 il2QK4CZuon/VOved1lmPeg1FGNbSTV5W2U7wnG6yltGYPnYfWA/UMOxHkA0J/PIY3t6
 IvFq9CrpxgEsbi/t9J7ysDDTYN6GdwsxEs02Tb5xTCAl3tn961nIzd5L7hYWWitbKdjo
 VJoPji5sLfny1KbGAnHaqSE8FBLUhVk+nPu2ZkvKKYANZ+hFp/e/rE23/42xltAxjJnJ
 REvhRWJaqspDeHf6/0bqUtgmEXvk9xCW5r3xyLY5JembLTn3biRde8WBsHH5p0pzTX2l
 9Csg==
X-Gm-Message-State: AOAM533QlCvteAoeJZAWrtNLg+MzpvCiMGOMYLtCXehiy0JakTwGBJB0
 EbPGSH1pHtkIe/dHoVbqqzU=
X-Google-Smtp-Source: ABdhPJwNcbYcVlZIhaeCGBxYyO+6ciZc90nZSC52cPCGgsTAQa8jbSACg9+m6+RlipHxUBy8lvwUXg==
X-Received: by 2002:a17:90a:4291:b0:1e2:92f3:20d1 with SMTP id
 p17-20020a17090a429100b001e292f320d1mr36261288pjg.163.1654677687268; 
 Wed, 08 Jun 2022 01:41:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:479:837b:38ad:1ae9:1239:b178])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a170902f34400b0015e8d4eb263sm13902217ple.173.2022.06.08.01.41.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 08 Jun 2022 01:41:25 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 lee.jones@linaro.org, daniel.thompson@linaro.org, jingoohan1@gmail.com
Subject: [PATCH v2 0/2] Add the property to make backlight OCP level selectable
Date: Wed,  8 Jun 2022 16:41:12 +0800
Message-Id: <1654677674-15417-1-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
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

This patch series is to add the backlight ocp level property parsing.

Since v2:
- change the property name from the register style 'richtek,bled-ocp-cel' to
  'richtek,bled-ocp-microamp'.
- Use the clamp and roundup to get the ovp level selector.

ChiYuan Huang (2):
  dt-bindings: backlight: rt4831: Add the new ocp level property
  backlight: rt4831: Apply ocp level from devicetree

 .../leds/backlight/richtek,rt4831-backlight.yaml   |  5 ++++
 drivers/video/backlight/rt4831-backlight.c         | 33 +++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

-- 
2.7.4

