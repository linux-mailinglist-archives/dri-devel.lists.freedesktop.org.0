Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3056E40A6
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4599010E389;
	Mon, 17 Apr 2023 07:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D153310E101
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 13:16:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-94f70a552fcso6168466b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 06:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681651002; x=1684243002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6CtBhR8YOpDqMIofOmWwuAA+9qpS9Sa8zpuzMOiM4dE=;
 b=o+aE5sz6hjs+PU7P6jpKpEYd/ddQAMkZwZEdi4i5+0TJc893iZu3zdUdN+TZ/m7tmp
 /ZlMtzc/ldAuQQ6rYiaX77Nx2twfzEHJ7nRxs50ymAsIaukE2OjGRAag+yygtssbzi2S
 cuyqpWSRE5K526kbgLolZf5DkfBQ7KrKjDG5e/SryNcrhdzNbXG0NJ+wuqI8iz9+BILq
 ZrEr9I73Kz5y3ZYLK19U6Pk5cvZ9dceCmxe6AiWow7zC1G5stu2wGp6eIXXq1tQ2mpq0
 Btsa8TI/T3BrS+mFliXe8Jr21P8gX481u1B+NslPYuVgCZzT4jQE/UNz1+KBfnqCbj0G
 LFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681651002; x=1684243002;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6CtBhR8YOpDqMIofOmWwuAA+9qpS9Sa8zpuzMOiM4dE=;
 b=cE9KP+vm7wkkuWQ04KZfblXS/C7Vks6QOnHt1jsyxe0WxDIBqCuDmI5OugEJ3x4e27
 iw99JZXpo74Fj0g1PYEcZeMyhDLWKt2Kcd0BxXc7mK47Ip92ucgb49zMhVyMx2Ur26N/
 7ye7DAVrcmCdyaGhlERcq24ownyY63uRdVfN5soASdUOAl9INSVixMuiGRpfW/w3gxi9
 QQROuwvsNnBLSEyAoCjkA/CDoUJk+8XtXw8QppDToaM9r7qR5EjB1GFbK4o33ZvbTpBh
 +SOxXbHpXg1CBfHNGr78yxHrW9LhIEaZ9onxQUccjSQ6pGKotgx8G0Sxl+1MWfbzwXRg
 nHzA==
X-Gm-Message-State: AAQBX9dKhlE06yI4oRZ2mRn7FVB6VPolYGgYl5udVXd5BYIOFrUVNcng
 0buDwSMT2AdWr7Acu9BBmSs=
X-Google-Smtp-Source: AKy350aXeAkH9jYFdGqlBTS31BvhP/sjNVYULPpdbxeCz/nFrJ3kEGRykCB1cjBPgkoQPALudjRWFw==
X-Received: by 2002:a05:6402:14ca:b0:506:7f78:c4d3 with SMTP id
 f10-20020a05640214ca00b005067f78c4d3mr7817582edx.27.1681651002057; 
 Sun, 16 Apr 2023 06:16:42 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05640204c900b005068d7ccfb0sm2396594edw.83.2023.04.16.06.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 06:16:41 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH v3 3/3] MAINTAINERS: Add entry for Samsung S6D7AA0 LCD panel
 controller driver
Date: Sun, 16 Apr 2023 15:16:32 +0200
Message-Id: <20230416131632.31673-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416131632.31673-1-aweber.kernel@gmail.com>
References: <20230416131632.31673-1-aweber.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 17 Apr 2023 07:21:51 +0000
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, krzysztof.kozlowski+dt@linaro.org,
 Artur Weber <aweber.kernel@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add myself as maintainer of the Samsung S6D7AA0 panel driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 90abe83c02f3..6a55e6e3ac59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6623,6 +6623,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6d27a1.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6d27a1.c
 
+DRM DRIVER FOR SAMSUNG S6D7AA0 PANELS
+M:	Artur Weber <aweber.kernel@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6d7aa0.yaml
+F:	drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+
 DRM DRIVER FOR SITRONIX ST7703 PANELS
 M:	Guido Günther <agx@sigxcpu.org>
 R:	Purism Kernel Team <kernel@puri.sm>
-- 
2.40.0

