Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EE896AD75
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 02:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572F810E670;
	Wed,  4 Sep 2024 00:49:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FdhXum30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559AF10E670;
 Wed,  4 Sep 2024 00:49:03 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-374bb1a3addso2437399f8f.1; 
 Tue, 03 Sep 2024 17:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725410942; x=1726015742; darn=lists.freedesktop.org;
 h=user-agent:mime-version:message-id:cc:to:subject:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MI2VD9V3HSMHAEsHid7UqFpfCx71vZJu73a+V6jxQIc=;
 b=FdhXum30B5GUlfi7KqySBvBDCAit0fAaUphGA9QDoHTj8U4b4N4jCJQh58ZOtyDXDK
 tJX/nn4RRQzDrBGVFEx8XE+5mnhQ00kug2anMwqz8a1JxNgW3KFLe22UxQgkF3w9Mpgd
 myTEjXxSNsYXbWI4TyccTPJiUH+SlaO7iK5yZxxEmO5jPZZhb1g89WL5uxsdvmzMSbGu
 vLRPQhcanfQa1qxI2hs66V90tO5G9J7Wt3YcdBGHxra6G/QwwiTNn7cNMgiYcEz+jt45
 gDjqF9yW8ny8gaKrNrj1cxn5WF2cjftz0jb3t9D2d2lm6cki6AsJlkSlAR4kWy61G5q8
 neEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725410942; x=1726015742;
 h=user-agent:mime-version:message-id:cc:to:subject:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MI2VD9V3HSMHAEsHid7UqFpfCx71vZJu73a+V6jxQIc=;
 b=X6Z0lKoa9xNPwytArtT2Nr7GInvY+TqR8yabv4ty9recjrpt6f49avfGQm4xRFARzg
 9CqeeMgTzvHTBJ0Wig3AdTos5Wmh3Q5LOWiVrZp6HJFmG7CQaMdGnw1YjOwCF/a5bIiA
 gGFoK4arHfxJWP4Sunt+a7GtvpStyIzcqecfJHQOMlcJIBDjCmyva74li9XSvNr5zeVq
 X1dUdPFFczR1+zLUjJ0/CeRzRUOPtZF0rr7odNTzRNx0d5uf3KmIXVMJb8clAoba0LPY
 qmUZTjbcZzIaw//rQnmwZxbH+1P8FtLGAGVFt/tf5r5ZnS30+wiJxMMUQGAaaxtscVde
 qnSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDuBZtaWVIb8RsckjzxIufYmUz0IxtM3fgY4y7qAsUg+LpQqsw5TSi4zZl1hPOll3eAG60EUBc9kPn@lists.freedesktop.org,
 AJvYcCXQoMsWyK5VXahE621Gn5Qmzp8LcmUFKiS9Mwmb7RBI2qsdYEtneDqODqZrQCXr/5k83yRZ1cBV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnumhBrL1iiGpmbe9nuImCBbY9zjgA5sZeeefq2Q+/toZJtHoP
 T2FiinOVVq4ETT/8Wqa39o0Na6PMyo6oKWZvj7r/jOTtj0JRrd+Z
X-Google-Smtp-Source: AGHT+IF/dT9moCjMlTPpV1LF79HsX4lZi1lQZyE6VNTQ8vBAlwqecX7lrCGqmEOe3DjJR3wrDhVrhg==
X-Received: by 2002:a5d:5269:0:b0:368:420e:b790 with SMTP id
 ffacd0b85a97d-376dd15a8cemr1591613f8f.14.1725410941339; 
 Tue, 03 Sep 2024 17:49:01 -0700 (PDT)
Received: from [10.33.80.43] (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a399sm6976144a12.8.2024.09.03.17.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 17:49:00 -0700 (PDT)
From: Filip Hejsek <filip.hejsek@gmail.com>
Date: Wed, 4 Sep 2024 00:50:56 +0200
Subject: [PATCH] drm/amd/display: Fix debugfs dmub_fw_state read
To: Harry Wentland <harry.wentland@amd.com>,
    Leo Li <sunpeng.li@amd.com>,
    Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
    Alex Deucher <alexander.deucher@amd.com>,
    "Christian König" <christian.koenig@amd.com>,
    Xinhui Pan <Xinhui.Pan@amd.com>,
    David Airlie <airlied@gmail.com>,
    Daniel Vetter <daniel@ffwll.ch>,
    amd-gfx@lists.freedesktop.org,
    dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <d02c033c6f4411be31a9439f33de2c593b51d8fc.camel@gmail.com>
MIME-Version: 1.0
User-Agent: Evolution 3.52.4 
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

When the FW state is too large to fit in initial seq_file buffer,
seq_write returns -1, which is subsequently returned from
dmub_fw_state_show. This causes the read operation to fail.

Return instead always 0 and let the seq_file handling retry the read
with a larger buffer if the initial buffer overflows.

Fixes: 2364076772b1 ("drm/amd/display: Add DMUB firmware state debugfs")
Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index db56b0aa545..ecda44789b4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -958,7 +958,8 @@ static int dmub_fw_state_show(struct seq_file *m, void *data)
 
 	state_size = fb_info->fb[DMUB_WINDOW_6_FW_STATE].size;
 
-	return seq_write(m, state_base, state_size);
+	seq_write(m, state_base, state_size);
+	return 0;
 }
 
 /* replay_capability_show() - show eDP panel replay capability

base-commit: 96a5152075c0424e9bda551d00ab850c815e309c
-- 
2.46.0
