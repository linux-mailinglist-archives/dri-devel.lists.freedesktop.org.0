Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343E7EC71D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FCF10E059;
	Wed, 15 Nov 2023 15:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8796910E059
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:26:53 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-6d645cfd238so3260880a34.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700062012; x=1700666812; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHLM8GEK5kIF6P/tIjxS+4ZYxDZU/v7DZUKMk83fj/Y=;
 b=dH04FofP88PHs2LAH7j2oSOI/tS+yP0UAAcIKLIjbB7lRFtYMLBvsQjd1rRil9iP+P
 NUtn/8xK6Q6GCuet3QoihYTv6hCrKATM1Z1xhb9lusOsUXix4rI4mtBlOXMFOpBSDnoe
 JHQE6IdF/ScfLRmi5cA7+920UXq7IlZ4Xv0ZQ/Dt6zd1tUP9LptOr19LkB9hcS5WzUhu
 1o7jGRksMVd++Ecag97fKpQZaAlmrQP7zH4ioL0kBMelWmrkl0KyXcBTQCgcAJ3OARtx
 7yuLyDHkpn0r01Lo4qCnXILSOWZtwIi3puJl4DIX9xtvFE4njsSGIMSGXnXwg0rrmFB7
 A32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700062012; x=1700666812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHLM8GEK5kIF6P/tIjxS+4ZYxDZU/v7DZUKMk83fj/Y=;
 b=CG6fKy3JuPfw15pSA/W2tuLf6Nyztj1MV4qsLlykF47wn71Yz+j1hY9d7+ppfkq8bP
 x/8xzJP4VGgF42Ug4+CEMcOHFcU4lpwsOTugauBRZ+TL3x0JuXatb5GDwHpNgkQCMZL1
 ZCQ8kDXhMQZj2ppjUn/15SCdr+Meln/iZt5tHzCDZQg00JK8NayeTWCdm9BbVyPv2sYE
 6eCcUbH4NK0PRdrONsgUuGF1YY8JVaOTt++Yt1CdSIFxzE9HzSfu+TbBqXwfSn3FGC7+
 nu9lJvZwGMDQvQRKPJjZK/4A/Dy5qhpwt/IeC4Klpiu9B6lWdVKyMyQ3PYPBhgXc5coL
 VIDA==
X-Gm-Message-State: AOJu0YzqahZYAiaCzsy/68KXmPQCFXhpb/Edq0TuvqWRJmY28r2wMueD
 bAOeAcd7Ojw0lSHPPAldK+yMEHKZj+w=
X-Google-Smtp-Source: AGHT+IFthqHpMg+jjz96IAmQF/JvQXkQw7lmW/dVlNuUTv1Jpfb9kQtXB7F4zfGEpeWPGyKGUCeGtw==
X-Received: by 2002:a9d:6741:0:b0:6d6:3fca:db0c with SMTP id
 w1-20020a9d6741000000b006d63fcadb0cmr6481043otm.18.1700062012623; 
 Wed, 15 Nov 2023 07:26:52 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056830101200b006cdf9935af2sm398012otp.53.2023.11.15.07.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:26:52 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/panel-elida-kd35t133: trival: update panel size from
 5.5 to 3.5
Date: Wed, 15 Nov 2023 09:26:44 -0600
Message-Id: <20231115152647.2303283-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115152647.2303283-1-macroalpha82@gmail.com>
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
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

