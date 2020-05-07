Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ABB1C93E2
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 17:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228E66E9F4;
	Thu,  7 May 2020 15:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA5E6E9F4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 15:10:53 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id g13so6816230wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 May 2020 08:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9xkgTnOQcTRYXjVk7HhKY+NVTDisujd9ARA0vYIdOsM=;
 b=bbmxQ++nHreG148TInUfokdSHVt/cBYk1AX1+ZtWVAV3ZZqj6QD8rqAQluwTQ9dcMO
 H4calMQ/qXMNWbZCh0sBMdAuWTc9JfHySkyRJDL5K6Z1ffgheYAa91jbS7+TZycsLpyK
 Ml0afORw0DHiryDWUFFnCSjM0+4/IvWhnpVrloeZ/MhrjWvQ5oJJJPWPzGxpnn/THxfq
 QCWNeB1JDPlXDrmEkerf4Qs0NhIb2wdIp6ERKEJwZbfK5/BTnFS50iQsIIaDbYqnBHyG
 QcseNo2J7hTvV8tuxMz+lL2y/SRJ84vG7mXO8Iz4yiYm8KolEeKSGnwiJU6atVxVzm25
 CZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9xkgTnOQcTRYXjVk7HhKY+NVTDisujd9ARA0vYIdOsM=;
 b=BXkgFmZWwOltFN1wkv4dVOutZCyR1cUWuKvqMZXZlRW8tmpG8Gt6YDNcE/swliv7oR
 EslAfFK1PxT4UH16ciAhbIc/7/32tPoy1kKJa5sjnwtcoBrpJmt6esXdkyUbnS81zZOz
 kQkysQ/nC5+aC+T47mPzoT/TGCx6saPFkfIKQ9Ad4kGWLfwA4Jbg6B96Rneb89jBTequ
 2JkfBSsQNq9gsHPecPB5+/6hk2pgoL0MGffWH+d/gK46/Ix+OnNcFrfK+w4qp1H7M4j2
 2eqfuKKi820tiVaU7fskgpOrvdTwTam5C1c2KW+Y1yEDgpYPhuHNnv3VUrEKZrTNRISF
 9SSg==
X-Gm-Message-State: AGi0Pub3RfhG5HckKbCbPEh0Y13p+7zMdJQM+vLsvgeoy5CofyuU7Y8d
 x5UBYlD2PnwgLesoALa7mZemm1Nz
X-Google-Smtp-Source: APiQypIfCVYx1l9dnGzkhxOxieUyqWQB1evSDEvt2DkKf2bwcGoeP+RJFjYy50rdFjKQ+AsCEomKFg==
X-Received: by 2002:adf:ee03:: with SMTP id y3mr15104132wrn.190.1588864251921; 
 Thu, 07 May 2020 08:10:51 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b66sm8704247wmh.12.2020.05.07.08.10.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 08:10:51 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/36] drm: remove unused drm_gem.h include
Date: Thu,  7 May 2020 16:07:47 +0100
Message-Id: <20200507150822.114464-2-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507150822.114464-1-emil.l.velikov@gmail.com>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
Cc: emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_vm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_vm.c b/drivers/gpu/drm/drm_vm.c
index 56197ae0b2f9..954baa8a2a8f 100644
--- a/drivers/gpu/drm/drm_vm.c
+++ b/drivers/gpu/drm/drm_vm.c
@@ -51,7 +51,6 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_gem.h>
 #include <drm/drm_print.h>
 
 #include "drm_internal.h"
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
