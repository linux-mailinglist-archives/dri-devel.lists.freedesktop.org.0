Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC159866806
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 03:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3269F10E5D7;
	Mon, 26 Feb 2024 02:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RvxDLnLq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B65F10E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 02:11:55 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-512e568607aso2277518e87.1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Feb 2024 18:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708913513; x=1709518313; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=B4WJzDolwQAt18vJAoYRdoVVqjnAvhbqXGlG4vWEs3Y=;
 b=RvxDLnLqIT7W2q/xFqEPPuI0unJPc6sO/ERCnzdPXnnDspoYEO1CmRec+9/ZIIRmc9
 z1/yBLrJebqdZvKbdn5HXpVCPThQLCs7SLDne4FEE7dhU87KVFQoNpLJTk2MgU6tC/hw
 n26fefmkRDSWJ+PWmrjfAr4aaviBu2RrJoIYCpZBM/uHmz+DKPZpCjbh3euH1ykEsqaM
 Hxz52+BMG/UmBN8SJbd40qPr7YOGVm2TiAclyp0NH+p7u7ijFo3CN/IVOSbWMbpMwTQ2
 btCZfMeP+C0BEXVXPnvpXzG27rsmSClnTk4xkM+plGULNo4aBo71y4qyfl9oAz+wwcQE
 xHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708913513; x=1709518313;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B4WJzDolwQAt18vJAoYRdoVVqjnAvhbqXGlG4vWEs3Y=;
 b=UxFQ9ONtCjFb1B05epA8uSV0GVwJ/utKi9nreSt/qTJ2LVNmXngR0JLaTl4OzxeHRJ
 zOmCIrtM0rqXwe5fHV1BqHMamG7IYKJyS3cUcD0HsohlNaC9n1QUWsZcM7kU61Rw466Y
 Ag5yAvhruPYdwEL38m0roqDGvt0mZyWo06a1d3jO7Km1PiP0AsLiqTrw9yy93mc4mq6N
 5ObWFtdsnoE1rrfg6FUJGNdF27Ntt0O6NdpYKzf8coXS46FQ61LI0BBgAD+GXSlB4pzn
 GEhDSkrO9V1jnaoBH5Rr33g6C/4QBFbi3P4fcy/bqhFJ181tLQxfulDrfbcOoHASxW1x
 c0rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi/GJ9UMU9vXstKcUOaMKtUn4coHh2Pz5cO0Yy9O6Jiqw199CQWF64zlJ2VwPTiPRt9+2mBDadoQCHQDaFAaaBW4BRkc6aDIq+MSMJB3kz
X-Gm-Message-State: AOJu0YyfXnTGPVwF+sQXdT0cxv/USPUsSsG8aTFBf6ZqS/hOxq1/fe9W
 deeVxjuioP7HjPYDChKA6nofbQUyO7c2cj2AKRow+LHS5tuuaW9JzIGKRpLYLUY=
X-Google-Smtp-Source: AGHT+IHIhjygvqwAPNq6G01cvfGh0Xz2bV+AHOCuxJnMV+tOjv30gYslyjwruP3z9HG5pCKzHnIc9w==
X-Received: by 2002:a05:6512:2352:b0:512:f628:32b9 with SMTP id
 p18-20020a056512235200b00512f62832b9mr2204358lfu.27.1708913513426; 
 Sun, 25 Feb 2024 18:11:53 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi.
 [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a056512358b00b00512e39ce472sm676176lfr.175.2024.02.25.18.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 18:11:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 26 Feb 2024 04:11:43 +0200
Subject: [PATCH RFC 07/12] drm/msm/headergen: use asprintf instead of
 custom aprintf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240226-fd-xml-shipped-v1-7-86bb6c3346d2@linaro.org>
References: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
In-Reply-To: <20240226-fd-xml-shipped-v1-0-86bb6c3346d2@linaro.org>
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3089;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jZfVAAcDxjvKB0VY8B3YaZ+uO2w0uEao68eTQKvjiw0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl2/NhtJZMjKcvl1vvJmmqadrFVvuv6cSSXvf/V
 iZT9I/HRvGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdvzYQAKCRCLPIo+Aiko
 1TdVB/4rX75OqHP0pic+FcAPiu8AJWgzBPrcNlgqGriLQU68RjcWyfSqT8vjWjJQ0hJFEi1PD+D
 hT1pS43M0PqiToTLxrZJdJE1RXheoLvG+7nCKJspMiBg+0ALmJ+RSf49AoJyRA8gCmS6bhebATz
 clq0L088U7EmdDA3O+3bZSXDnDtsy8fWi5vjqu+H1Muw3+8KS+0R2jFDpIQjLuuW1bZ9YLHiOQL
 hCeXbjMkeftb7dv6WjK2EI9wBhaWdz+9Ssewt673vGkZU3eka/wyfnH9Ppp38YKVDmIROMTFpPw
 Z9syTfwp2u2AnGSgjcs2yWiaQapH/EB7rjQrVhlZPG6KEFbw
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace custom aprintf() function with the standard asprintf().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/headergen2/aprintf.c | 38 --------------------------------
 drivers/gpu/drm/msm/headergen2/rnn.c     |  5 ++++-
 drivers/gpu/drm/msm/headergen2/util.h    |  2 --
 3 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/drivers/gpu/drm/msm/headergen2/aprintf.c b/drivers/gpu/drm/msm/headergen2/aprintf.c
deleted file mode 100644
index b3d924f59413..000000000000
--- a/drivers/gpu/drm/msm/headergen2/aprintf.c
+++ /dev/null
@@ -1,38 +0,0 @@
-/*
- * Copyright (C) 2009-2011 Marcin Kościelnicki <koriakin@0x04.net>
- * All Rights Reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the next
- * paragraph) shall be included in all copies or substantial portions of the
- * Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
-
-#include "util.h"
-#include <stdarg.h>
-
-char *aprintf(const char *format, ...) {
-	va_list va;
-	va_start(va, format);
-	size_t sz = vsnprintf(0, 0, format, va);
-	va_end(va);
-	char *res = malloc(sz + 1);
-	va_start(va, format);
-	vsnprintf(res, sz + 1, format, va);
-	va_end(va);
-	return res;
-}
diff --git a/drivers/gpu/drm/msm/headergen2/rnn.c b/drivers/gpu/drm/msm/headergen2/rnn.c
index d82d2a561b02..6cf3c54954bd 100644
--- a/drivers/gpu/drm/msm/headergen2/rnn.c
+++ b/drivers/gpu/drm/msm/headergen2/rnn.c
@@ -44,9 +44,12 @@
 #include "util/u_debug.h"
 
 static char *catstr (char *a, char *b) {
+	char *res;
+
 	if (!a)
 		return b;
-	return aprintf("%s_%s", a, b);
+
+	return asprintf(&res, "%s_%s", a, b) < 0 ? NULL : res;
 }
 
 static int strdiff (const char *a, const char *b) {
diff --git a/drivers/gpu/drm/msm/headergen2/util.h b/drivers/gpu/drm/msm/headergen2/util.h
index 98a32a34d076..07ad637e4521 100644
--- a/drivers/gpu/drm/msm/headergen2/util.h
+++ b/drivers/gpu/drm/msm/headergen2/util.h
@@ -110,6 +110,4 @@ struct astr {
 
 void print_escaped_astr(FILE *out, struct astr *astr);
 
-char *aprintf(const char *format, ...);
-
 #endif

-- 
2.39.2

