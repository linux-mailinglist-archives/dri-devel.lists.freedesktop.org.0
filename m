Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D63615992CD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 03:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C88410EAEC;
	Fri, 19 Aug 2022 01:53:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com
 [IPv6:2607:f8b0:4864:20::a32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B01010EAEA;
 Fri, 19 Aug 2022 01:53:50 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id w129so1629560vkg.10;
 Thu, 18 Aug 2022 18:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=N0PWF6mpMkapDmr2x+HcuoLa7BiJFVqo/4zstKJkGXc=;
 b=jVOcOR4dyUUmu0Ru38o7pgFej2RbLG6EiG7e+69dbvV07sSLuI6X2SzYwzrszF5Ey3
 vGHq8To9NtIljhtfQzCI8QodAxfnYRmcu9mVczzohxV/qAj6kVswX/rYNlR11xrlcs+p
 PJ7eMBT+Jc5+gtcizMID9lGBRZS6pee3R6DwnTaaT4tkw2KhomAAISLtc3jzb84G0VjE
 TRkUG0dTtEiEzRuOVqd9JfgzpQ8ZPMBa8ATOg5uEG07FEXh7gXSLs112cMTlS4N1lOTK
 RzebJTGmpKPZGvNxVssgWiJhfyXA7XkkggP9Q9JqAVz1DvAQt4GK78x4TZRTvEfySjXT
 DLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=N0PWF6mpMkapDmr2x+HcuoLa7BiJFVqo/4zstKJkGXc=;
 b=J9cBQloOS783LREAqiRLdcR/6OpCWcBOv3jD/vk2bTBEuKO9/CA+mPe0qHoB0rDstv
 +PtG++lKhEGL+a1SXkyFbENHnSM7x7HaCwUr73WuLEQ+ezLeQXOKh2PFMTUx3MyfpN/j
 UvzyIygYlT1K1WdBWFn2V2z73UxTcHHKi5kQ6TyXQAs84xkRtkXuVTixQWRyNhMFt8p+
 SsPKrb756B+v0Nzf3ssTe95yftCIUk33VxTMi10jxH9gFGZYl4HC+9WuJnXnY2TaVdNL
 lpGFHns0IS4adq90JPwVPapBfSV9vLhMQtAYIPbSL2dm1XtGF29GmOyV1ArRhKsJIjHF
 N3zQ==
X-Gm-Message-State: ACgBeo07bFKbFm2Y4Ai8PSNAYjfMYH8EiF6QM7m05vUeySyjTEDHMHvI
 8F+BLgVYCEOdFLlAUt2Wsas=
X-Google-Smtp-Source: AA6agR55Z7HWq5kYxU4cZZDHiLU1jvf2NOKy5WIq3lZuv6az8K3G4nCMud1VCwJwc6cN2GLenYT/bw==
X-Received: by 2002:a1f:1887:0:b0:388:97f9:ad42 with SMTP id
 129-20020a1f1887000000b0038897f9ad42mr26354vky.18.1660874029241; 
 Thu, 18 Aug 2022 18:53:49 -0700 (PDT)
Received: from fedora.. ([2804:7f0:b443:d427:216e:21e9:69ca:fc9b])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a67ff8c000000b0038712af0dbesm1666992vsq.22.2022.08.18.18.53.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Aug 2022 18:53:48 -0700 (PDT)
From: Magali Lemes <magalilemes00@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/amd/display: remove unused header
Date: Thu, 18 Aug 2022 22:53:02 -0300
Message-Id: <20220819015302.1731088-1-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.37.1
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
Cc: Magali Lemes <magalilemes00@gmail.com>, tales.aparecida@gmail.com,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 mairacanal@riseup.net, dri-devel@lists.freedesktop.org, isabbasso@riseup.net,
 andrealmeid@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dml_wrapper* files were removed in commit 724449e30433
("drm/amd/display: Remove unused code"), as they are not used anywhere.
However, the header file wasn't removed, so remove the header as well.

Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 .../gpu/drm/amd/display/dc/inc/dml_wrapper.h  | 34 -------------------
 1 file changed, 34 deletions(-)
 delete mode 100644 drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h

diff --git a/drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h b/drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h
deleted file mode 100644
index 5dcfbd8e2697..000000000000
--- a/drivers/gpu/drm/amd/display/dc/inc/dml_wrapper.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/*
- * Copyright 2015 Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: AMD
- *
- */
-
-#ifndef DML_WRAPPER_H_
-#define DML_WRAPPER_H_
-
-#include "dc.h"
-#include "dml/display_mode_vba.h"
-
-bool dml_validate(struct dc *dc, struct dc_state *context, bool fast_validate);
-
-#endif
-- 
2.37.1

