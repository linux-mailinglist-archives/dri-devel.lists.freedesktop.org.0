Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2806E40B5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:22:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A77D10E39D;
	Mon, 17 Apr 2023 07:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6126E10E31C
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 10:01:49 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id q23so47281885ejz.3
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Apr 2023 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681639307; x=1684231307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bS+Nk5tohYdjt0M+Lv5Edd8xQcZQmX7f5b7WTtVtHzg=;
 b=RuEfaLXciTcAZlv5u4MJtuL2VgOZ49Wdk/1vl86tSwFdXqfjiltwWMwo8uvtnc0ho1
 bufJbRYn9hMHXwbO7uJ/BoOuEy5dP2PhGYyYrybgWwHH3JBP5IYvvWxDNdPbVaCoxYEe
 ZszvpLPCZ6gSt9tceHdv8CxNhW61IxKZg/DisecM+uy4hHVjijoClEnPXJpEIAwZSwR0
 kGTPhgI31i3yARXH3AhqoDuPlVG2DbIYmjn53BIBDsoiWe3gEL3J5v1rWOwT7W49HmxI
 MoNbkh6iDVlDOegG9xTAiilRW/vNWXvwStWC3VfI1Ul223w0g54tFzdpInX8qSQd04Rh
 dTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681639307; x=1684231307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bS+Nk5tohYdjt0M+Lv5Edd8xQcZQmX7f5b7WTtVtHzg=;
 b=jYjGn2Otkq6bO1xYd7k9meEbjbanwV9QCeimeUb+pfnxuK/e+h4AwmOvVDqhEm0bkV
 IeGGa4ufLigXNd4tWiY02FNQYBwmHlUEE7F8iR+OImdJgmXw6+TQ3qa9Dy5x2DPDR6nE
 No3ZqmQGK2QaN/6srJSSGuQ5HUmkX/weVXAihHJCWQEH5r3rtJGSwkkPx+VEE7JqGgan
 C9EP/3YKfC+kx8nCOWMZKKYIpq0bBTNm12N5yv0SJnG4J6PkkLaqS0rzwzDUofi/K+0i
 Rcermpxp8J/ly9492ulVwFScosJ1zirAI3+3kAQkKcQptapAVxfDVgCDqxEDk3wvrHqm
 so/A==
X-Gm-Message-State: AAQBX9cOu7xR3nq7iJpt3v9Rmvt1M3sNgitTRQy/7u5eghFZvYLs22fA
 pFAlyQphhd1wUBQbzJdyTFQ=
X-Google-Smtp-Source: AKy350Zsxh+KLSNWSgLa2gYb4NYNfxQubU3xCOln1931vfBIF0m0uS+s3t5u+AG6G6D2YvI1PIuNkw==
X-Received: by 2002:a17:907:a074:b0:94e:bede:6d2a with SMTP id
 ia20-20020a170907a07400b0094ebede6d2amr4503207ejc.24.1681639307530; 
 Sun, 16 Apr 2023 03:01:47 -0700 (PDT)
Received: from localhost.my.domain (83.8.121.70.ipv4.supernova.orange.pl.
 [83.8.121.70]) by smtp.gmail.com with ESMTPSA id
 lh22-20020a170906f8d600b0094f6bf5ac9asm145232ejb.22.2023.04.16.03.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Apr 2023 03:01:47 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: thierry.reding@gmail.com
Subject: [PATCH 3/3] MAINTAINERS: Add myself as Samsung S6D7AA0 panel driver
 maintainer
Date: Sun, 16 Apr 2023 12:01:39 +0200
Message-Id: <20230416100139.13741-4-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416100139.13741-1-aweber.kernel@gmail.com>
References: <20230416100139.13741-1-aweber.kernel@gmail.com>
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

