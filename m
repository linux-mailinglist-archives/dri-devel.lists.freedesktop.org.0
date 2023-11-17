Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D517EF7FB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 20:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B5D10E770;
	Fri, 17 Nov 2023 19:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5164A10E08F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 19:44:13 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-3b3f6dd612cso1414794b6e.3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 11:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700250252; x=1700855052; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRwe6F5agEZPsW1zo8c/XoE7+M6ec22ODd0/7JLQ2D4=;
 b=Vi2yXSn6SVhGL5oqLtkUKAeb+6oqHFiW5sH4+WEpf5G7xA/RyADptuIinuo7tNhKZK
 HbGlRJ8ABQWRrSTiv0cILd8YvVlFVCpmycWBlPZceaXhKqJQTxblqKpSgBuWjayfxj1I
 uMXZRkNBNb/xekff6XVxJeltf7pPbjL/Hon9gb+tciDRh7nsihfE6FvMmpgiInauQRvk
 4cwW3sTNbEaiDcdrcAADCub7rznm0fsD6/Lx7hunQz/NHVLMskfihgVDmlKi6gi1e45o
 bhRHyIkxB5w1Cc3b174qqhp0dpCOcddmBmou3ppiLHb7BVRZ5XOtWvN8lK2ZJXpkgzmN
 gA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700250252; x=1700855052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IRwe6F5agEZPsW1zo8c/XoE7+M6ec22ODd0/7JLQ2D4=;
 b=Ef6BswPgP53vhfLo0RSbdU4bp54W9K1ZQSuCJgpwAon2R/dhXGkBYUGkN7iFXMvlwe
 RWMIj/NBnMYROk9nwoklinAOq198rRTOuC9Z5y99TAHtqrkFvbjYK1lh+Mqb9xFZMAts
 xpF1Y/kl2QCXTHwLMq22XNv5+cMijrrmL2yGj+AAXV+BH05iwNTRyja5kDSUksO5hN/2
 vuQPKVu9okkPWdSJs1YTHC58y5+AjrEo3oeZoqWMJIo+8ZcKeMD9qFbI8l+79RH18iHl
 17CY2zZJdXnzDfpbLrveqclg24xrmTcnklZ+YmTrL5b2nigeRs0fuJOGd3w6ccEjI8Cs
 o+1w==
X-Gm-Message-State: AOJu0YwXNlcaQEmWZl473xYvHzAnvuycE3wOM/peXhBvo0OefaN8wUAr
 OcdIhjO+2M7uAYRq9kKIyKh5xQp7YWA=
X-Google-Smtp-Source: AGHT+IHWfot5lAXZHdF+K5EC6ChPXjzkCaXC/lxQ86+JpJxUWa5/UAicUxnquPdjnDuzXlvbaNMqJA==
X-Received: by 2002:aca:1005:0:b0:3b3:e64e:e0a4 with SMTP id
 5-20020aca1005000000b003b3e64ee0a4mr363776oiq.54.1700250250893; 
 Fri, 17 Nov 2023 11:44:10 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y5-20020a056830108500b006cd099bb052sm338193oto.1.2023.11.17.11.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 11:44:10 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 1/5] drm/panel-elida-kd35t133: trival: update panel size
 from 5.5 to 3.5
Date: Fri, 17 Nov 2023 13:44:01 -0600
Message-Id: <20231117194405.1386265-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231117194405.1386265-1-macroalpha82@gmail.com>
References: <20231117194405.1386265-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

The comments at the top of the driver state the panel size incorrectly
as 5.5" instead of 3.5".

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index e7be15b68102..6cd8536c09ff 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Elida kd35t133 5.5" MIPI-DSI panel driver
+ * Elida kd35t133 3.5" MIPI-DSI panel driver
  * Copyright (C) 2020 Theobroma Systems Design und Consulting GmbH
  *
  * based on
-- 
2.34.1

