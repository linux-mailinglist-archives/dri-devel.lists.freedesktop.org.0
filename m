Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FDD618EC4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 04:17:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 629EB10E6DD;
	Fri,  4 Nov 2022 03:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C7410E6D8
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 03:17:08 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id o7so3436315pjj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Nov 2022 20:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rqxToHgUhXx5zVzMpfDkvTdc32yI7QdTCdmYmbj1mWo=;
 b=j1eELCK3rXz3s3bVoQnv3Vu0BMdZY+jObv7KwIQDVrR/E4D0UEyFceL4GQlw1xzjy7
 vR2S08jcyzZtY/FzzMOPNKL/mC6V5S/GDhUPCemBf/0pIl5V7bpIUoChLzdo5Psuh0em
 j6+SBf0d2qJgAfDSlw+wEoaYR/gQptqt6n+L9+o6IcfgkO40Qw3gvLemyJlbT5q5jCRX
 22D+sHrmOok5bNY3Cd50+Phy4Tleu4e2HwFMk5mcpaOKOHgs7MXiLCyF26TbMxjZRPDF
 evKOy7Ibuht885xVqnYRnUzL3tequdDqUUXVsJIbb6M7tlHz4dWFMT/KzEhrJNoDWsLr
 EHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rqxToHgUhXx5zVzMpfDkvTdc32yI7QdTCdmYmbj1mWo=;
 b=eH772r5jKiqxcGIuuPr7GX4NxZhvUaaWoK3RXLakSJCB8U99CxrAPKxIDm3Z8IU4dT
 GPqV4aLlWHY0sVGR1gWkKTfV/vWklAcxueaI/LIxZsui3daUYqWtwaNDJKLuIl+28cJp
 eLLhtxyqWmor+Oje65alBwNBAjpQ0Z8ZB0LaAFk/Sqskl6r4Dw8n/XI37wCfYCx13M+m
 c2pMr6TGsfdujtnXLxfSEk+nEj2tzpxDn/iYdCkhF482svxRWjUc823dmqZcU/QGh9zZ
 OUIu4U6ToOHCcMW8JygBpWqlOtynoQ4AXCX38fRwsQfW4RgEAqyVsxmmX3/HboGsSjnN
 tcfA==
X-Gm-Message-State: ACrzQf0xMpdV94oItNqAz84nnKTMZSv6KZVn93dyiolACkboiM2rm8b4
 Q1SjpnPOKHK6bUZz60rUstg=
X-Google-Smtp-Source: AMsMyM4PVCPU2yHDYVCuNekAeB+5DTpKg+DXH2Jw0NlIlDE7xSaEuoTpI1qXSN4RrNFJ8SJoMNzKvw==
X-Received: by 2002:a17:90a:8c7:b0:214:e1:cad0 with SMTP id
 7-20020a17090a08c700b0021400e1cad0mr20381543pjn.3.1667531828266; 
 Thu, 03 Nov 2022 20:17:08 -0700 (PDT)
Received: from dtor-ws.mtv.corp.google.com
 ([2620:15c:9d:2:a6ae:11ff:fe11:fcc3])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a63ff43000000b004702eca61fcsm1078655pgk.36.2022.11.03.20.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 20:17:07 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Helge Deller <deller@gmx.de>, Tony Lindgren <tony@atomide.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Sebastian Reichel <sre@kernel.org>
Subject: [PATCH RESEND 12/13] omapfb: panel-tpo-td028ttec1: stop including
 gpio.h
Date: Thu,  3 Nov 2022 20:16:41 -0700
Message-Id: <20221103-omapfb-gpiod-v1-12-cba1fae5a77c@gmail.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
In-Reply-To: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
References: <20221103-omapfb-gpiod-v1-0-cba1fae5a77c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.11.0-dev-28747
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
Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver does not use gpios, so there is no need to include gpio.h.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c
index 3c0f887d3092..c18d290693c1 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c
@@ -16,7 +16,6 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/spi/spi.h>
-#include <linux/gpio.h>
 #include <video/omapfb_dss.h>
 
 struct panel_drv_data {

-- 
b4 0.11.0-dev-28747
