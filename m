Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 231046AFF93
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 08:19:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE1410E59B;
	Wed,  8 Mar 2023 07:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B0D10E59B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 07:19:26 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id cy23so61759264edb.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Mar 2023 23:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678259964;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7DffdRwGDBop/pqo1Pf6hDrTszBK5MTXyDDUS5LoX44=;
 b=DKqRaeMBoqg23HyolHJ7ehExRKA3JVp9WMsXfCfuMP2g5MwlulLitZrSe7N23oWS+l
 z6O5exr7mxf5JnAJdPeaHzylHhsGtBPowONlVoRmPkplx3Ib2Pajj50G+QGk8TQvKaxd
 GMIaIp0EtB0RnKdi+1nG0m1way6Xb5mnOIFQ4g7nX0P5OFxr1ury0c+g6JTo9hUjuWLS
 0zhrhjLl6N3IAoogvs3DX5eXbf7b/KrHJkHox6x1ixjYPU4nSKDaAV90uftmQKW3lYVP
 l7XOd2YgA0VrBHeh3lW9WNlIVsBvVmCPMulWUOwTvxCazKNztJOlBa3WYrhZtAyRy+bL
 KKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678259964;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7DffdRwGDBop/pqo1Pf6hDrTszBK5MTXyDDUS5LoX44=;
 b=iEOwRTg+o4eby0DZ9xitfHg7ppyS6JXTJFLE3epZIbq1tZ7/kpxQiAf+TBlj8n1r20
 ZgLuZxGRffu6Rm0B2dIbu4wzmuHuk+cHVgO/6zjRd8G+0/nazVzaZMqpxjRz6+j9Kg3N
 t2SJ4vEiHBINB6ENZbyhuTeCsK7laAHWwikRnM5yGOwqubFY1F3869ZvcIlKiCkyZgF6
 BS9GR6okMojC4zeT96PibCzWsqVA3wgL0vp8r95ThiWWmSpiSVq+W1gpEs5PirlNJosw
 TcHnH1eMR38ZCzTVhoTqhMsyVKjRS8816voF4hihtMydSbWzhqlUleAQtwBeNyNZSkIm
 EaSA==
X-Gm-Message-State: AO0yUKXhIRyG77dYP04llDlxFmSMQI6OBpOyAKuuDhMVr7SCPTZsHDTY
 pBGgLjtUaqghzj8GteQjhy8=
X-Google-Smtp-Source: AK7set89QYt41YYVWHj5Y9CH01N7bzvlP2LuDopQGYI0Bl3Mglz73M2IdtVeSNyCooucMm289KznqQ==
X-Received: by 2002:a17:907:c24c:b0:8b1:293a:ef21 with SMTP id
 tj12-20020a170907c24c00b008b1293aef21mr17077217ejc.64.1678259964504; 
 Tue, 07 Mar 2023 23:19:24 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:2a40:1104:c4be:f7db:77fd:b9e5])
 by smtp.gmail.com with ESMTPSA id
 ot18-20020a170906ccd200b008e40853a712sm7101541ejb.97.2023.03.07.23.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 23:19:24 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Thomas Winischhofer <thomas@winischhofer.net>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: orphan SIS FRAMEBUFFER DRIVER
Date: Wed,  8 Mar 2023 08:19:21 +0100
Message-Id: <20230308071921.10963-1-lukas.bulwahn@gmail.com>
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was triggered by the fact that the webpage:

  http://www.winischhofer.net/linuxsisvga.shtml

cannot be reached anymore.

Thomas Winischhofer is still reachable at the given email address, but he
has not been active since 2005.

Mark the SIS FRAMEBUFFER DRIVER as orphan to reflect the current state.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d8f46f35aa4..354577534aef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19191,9 +19191,7 @@ W:	http://www.brownhat.org/sis900.html
 F:	drivers/net/ethernet/sis/sis900.*
 
 SIS FRAMEBUFFER DRIVER
-M:	Thomas Winischhofer <thomas@winischhofer.net>
-S:	Maintained
-W:	http://www.winischhofer.net/linuxsisvga.shtml
+S:	Orphan
 F:	Documentation/fb/sisfb.rst
 F:	drivers/video/fbdev/sis/
 F:	include/video/sisfb.h
-- 
2.17.1

