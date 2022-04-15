Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8FF502EA8
	for <lists+dri-devel@lfdr.de>; Fri, 15 Apr 2022 20:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE07F10E2B5;
	Fri, 15 Apr 2022 18:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E089810E2B5;
 Fri, 15 Apr 2022 18:21:17 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 e25-20020a0568301e5900b005b236d5d74fso5830268otj.0; 
 Fri, 15 Apr 2022 11:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sm8DSCIeMC6YuTy9deusE25jUiKvOwY3HtepIUMUjaA=;
 b=AeojTpXTTI3PAeqfCB4sVmZ3FJX9rlQ35P3Z6A2SPsBqrYuL6mStUlK1jmTtDzeUDg
 GoMR/UihMx51mH539Ivg9EYwYrzZJFXOvA5S/OzTXlS4f6vak4yvV6lLLMJaIOpRIvIN
 MBl1B8F5FHW3NJZKU2IzkhFxEqYID733KgeR79Rvv+BpD/FESAwBbMV67/I8AyIYOPwc
 q3ayexTCyEeakVugv04xej536AD9mRpX+eMmG1S4yiX5bboRnlMLkrjrJiOH8SnP109m
 2iKy/jQFJQZ0/6xQgxjmACDTsXJo7DG+isNphpKOfQIVpEhUfVL72lyAwRPpneI90iOu
 l3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sm8DSCIeMC6YuTy9deusE25jUiKvOwY3HtepIUMUjaA=;
 b=UjQns9/eqFS8s5UqJSZqqlAsOSdR5lcmp3/7D6a7iULUyxIvkosZVMeFTcIwUAurh7
 QnaxymZUYN0MYkPMJ6W2UVo0XKQmaAcGWhFqHrv2S/+Huduc+7PHd58pcqjofZ5rzZJw
 S9bAWh9b5Xil/jWjAcjB1opIdUR+hZDr6LwgmGj8tFO+2mzGIw7E7y2nN2rZBEpVCKRw
 YUMdDFLVMnu1l9iN9lnjryW47BuNdkWto1hDe2YOBpkD0BIYGTDa0jpZFXLj1ZmZIyEl
 pqSBba8bKbjk7wTRV0sJa9QAWBN2gRoFS/MjEduQzIRL1GdrzzRfWRwoBQPcBUm96Vgr
 bqFg==
X-Gm-Message-State: AOAM531Nxcs+LcDWtW1U93h7kEFRAkqBEyONgHB6eQGOc/KhvEzmLreS
 6nMmrLvKcvtQz2KOY9Zv9gk=
X-Google-Smtp-Source: ABdhPJwo0WGvkFrC84zXYCfOA6ncaJO1ft/Yn11zS61rS4Jw3IoXDc+bU0rl6jIQu+nRBg3s43kmUA==
X-Received: by 2002:a9d:58c3:0:b0:5e6:d8f7:c18c with SMTP id
 s3-20020a9d58c3000000b005e6d8f7c18cmr151853oth.364.1650046877063; 
 Fri, 15 Apr 2022 11:21:17 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4c2:8a9b:dcc3:45ee:2581:b4cb])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a4a8256000000b003332a0402f5sm1367127oog.23.2022.04.15.11.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 11:21:16 -0700 (PDT)
From: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrealmeid@riseup.net
Subject: [PATCH] drm/amd/display: make hubp1_wait_pipe_read_start() static
Date: Fri, 15 Apr 2022 15:20:14 -0300
Message-Id: <20220415182014.278652-1-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a local function, let's make it static.

Signed-off-by: Tales Lelo da Aparecida <tales.aparecida@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
index fbff6beb78be..3a7f76e2c598 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_hubp.c
@@ -1316,7 +1316,7 @@ void hubp1_set_flip_int(struct hubp *hubp)
  *
  * @hubp: hubp struct reference.
  */
-void hubp1_wait_pipe_read_start(struct hubp *hubp)
+static void hubp1_wait_pipe_read_start(struct hubp *hubp)
 {
 	struct dcn10_hubp *hubp1 = TO_DCN10_HUBP(hubp);
 
-- 
2.35.1

