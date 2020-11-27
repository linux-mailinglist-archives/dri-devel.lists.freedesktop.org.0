Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DBE2C6959
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 17:26:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083BE6EE4A;
	Fri, 27 Nov 2020 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF036EE4A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 16:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606494376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=9kcT9NngfazbuS/JmAbn32wrrn8CkOa26eF7oEFiGFI=;
 b=H12ipulR/Ir0EUQPUaCWj/ddClTP633xRhgahTnOQdQfBorTuzZnXBxp00/luU4QDcuFn1
 y1YreGIRm8RnJSPoG0aQ94L7MGDJ1flAxHW/OV0AIKXnBTu8QtbzGrQnGpnxULC9gmXA02
 ZWdhbYLVMJlVFKdBxV/gy+YiuauMLsU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-6SJZQ7P6Oa2hrF6MMRylWg-1; Fri, 27 Nov 2020 11:26:15 -0500
X-MC-Unique: 6SJZQ7P6Oa2hrF6MMRylWg-1
Received: by mail-qt1-f198.google.com with SMTP id v18so3503831qta.22
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:26:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9kcT9NngfazbuS/JmAbn32wrrn8CkOa26eF7oEFiGFI=;
 b=STVr+JnQbsBzWscqtNNfsiuSPBCPRgsujI1maHDDxmZIQvdJaM28Fh9wSIUh3GKDAP
 C9cBpQDGeJwLpQTc568jqvTN0NTZ3j6uxHeB4vr8TmZr+ddvr3gpH9XFj+bhJ6eYn7GF
 Z7K8oDBjAyc+Dn4mBnou7UvEimdpSs7mvK0n7spnamlETpJJgW/P7p1q+6pNsjYw4g2U
 vZ0OxvCgG7Xro8EYUQHHmHQw04n4zpY+WSFhA7+VTvKwQu2GBfyxbvYmu82mZ+BlwhyS
 H4nN8cwQcsgavb3sHsJApCp2Ar5nnK20ddYYuFE0/TOj9F8Rapd8pYYKMSlPf73aufFB
 fmlw==
X-Gm-Message-State: AOAM531GhXUDjiCMLKUQqNIkaodQifVBAwFQUJl3X34O3poe3xTIt1wU
 /XGyx0cPK84RjEHqhTTtbGGrILz7i29y49MEmLLLlNk/Tkl3ttXqt9Ap0RN93fq0w7ysY2Lcy01
 try86bpI62527DUzqhV7dQr2TekzW
X-Received: by 2002:a37:4350:: with SMTP id q77mr9607315qka.14.1606494374694; 
 Fri, 27 Nov 2020 08:26:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNGd4qb8oVRkjqDYpGhY8hkSGk1iJ3KkPlgznYCKM24/i6OjNo9tI0muQNVpoA0U0g2g/58g==
X-Received: by 2002:a37:4350:: with SMTP id q77mr9607280qka.14.1606494374479; 
 Fri, 27 Nov 2020 08:26:14 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id x33sm6358454qte.73.2020.11.27.08.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 08:26:13 -0800 (PST)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, Hawking.Zhang@amd.com, evan.quan@amd.com,
 Felix.Kuehling@amd.com, luben.tuikov@amd.com, Dennis.Li@amd.com,
 andrey.grodzovsky@amd.com, Joseph.Greathouse@amd.com, jonathan.kim@amd.com
Subject: [PATCH] drm/amdgpu/display: remove trailing semicolon in macro
 definition
Date: Fri, 27 Nov 2020 08:26:07 -0800
Message-Id: <20201127162607.2656353-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.4
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Tom Rix <trix@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

The macro use will already have a semicolon.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index f9c81bc21ba4..301e93c9e72a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1213,7 +1213,7 @@ int emu_soc_asic_init(struct amdgpu_device *adev);
 #define amdgpu_asic_update_umd_stable_pstate(adev, enter) \
 	((adev)->asic_funcs->update_umd_stable_pstate ? (adev)->asic_funcs->update_umd_stable_pstate((adev), (enter)) : 0)
 
-#define amdgpu_inc_vram_lost(adev) atomic_inc(&((adev)->vram_lost_counter));
+#define amdgpu_inc_vram_lost(adev) atomic_inc(&((adev)->vram_lost_counter))
 
 /* Common functions */
 bool amdgpu_device_has_job_running(struct amdgpu_device *adev);
-- 
2.18.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
