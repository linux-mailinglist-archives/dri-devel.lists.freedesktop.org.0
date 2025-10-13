Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60BBD3936
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 16:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2CEE10E485;
	Mon, 13 Oct 2025 14:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EU+qj7Xx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD6010E478
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 14:35:13 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b50206773adso972193866b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 07:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760366112; x=1760970912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=EU+qj7XxS5PPdAK2kNWQkOrQRTE9umVjcmuxyEt+x2ZDPAtipDleZAXCyGt5u3eoJO
 dv+IBcbykc9qLjJ4PIe2sF2KOcY8pI/AjEIwhgC+CQ91qdDkUgJ7UH1N8SVFE6/xI371
 ZmFcIc32JmWUEGb5IDkYHmQi30DlSkfbRBT+PB86s4pqCU29fawdCi7k+Z1s1FZg6jIp
 a6wHyAsS/pAx4pkFccsgMSdoLN+WV0m66NbW6jjX7yUjCw0XxmEs8ht0y+koSkC3/z0i
 8Ig3AUMrsaMj/pYqkemuZ4unC7ivbUC4Y9XlU7w6EfUger7VyZOP32/vDRcQpTi0z3je
 Jzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760366112; x=1760970912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RL6rVAENXblPP/WtJ2kkdTszLuUIj+9DJtEA2dEhVX8=;
 b=gtVrFoUDTttbb4dIubgNPx0Nl6drttX2kLnZbJsGvqX9girZ/TE1kEo5syCwmuihWZ
 WcTbIR9QGrCI6uDDZmiw3Oslo+JD+4rVQLUNJLGnaKQSZs6TmTxSxwfJ8yobN8dB822W
 b0Mkil68LhbiKJ4GzplfwvJ0PjzZDpUS7CZcXx/7Bux1Ne4440Y2x7VcQ1gGcj6ZHfiA
 npAdfqcH0WrkHyOlRbS7hw9Qyzs7kzWvo8blFAyPArhziLvcqJLdkuVxkllFHdiqoyqc
 rq4OxcAjNbKP1TliGTRPdlF0vNNBpWliY1EN8QiIKCqkvHzMcgaqDuis+3XMo8aqACCj
 2sPw==
X-Gm-Message-State: AOJu0YzuQ8/5AIMGSL+k8HKJp022/236pnMN9UVjlRjzyUw2NOQHYmxi
 0+2ndHKT23cODXqxw+RGvDDRMGKW80oMXFWG9iVq0a/VsR9JNXNKBk2A
X-Gm-Gg: ASbGncufW4sHkrvLWTg0Zo4KDBmbf7me7S4cXz3P8CZdqRj5egjClVeEFx0amFSd/AV
 D2Q0tZNufK7v6gKhGaWjKWqM6DX2/WSv6PDFmk8bArbBtia8UaSUXCZrv1e6bWg6z3etOXz7R+g
 HpntcjnSYW73F8EVwctM3JXKlloO6BIYMmk6YxxSGtfqor3VrqyfNjbU+/p9bjBn6n5LH6y+EIf
 RBqgl52SFAaMcZeP5ipcM5PvMzTlD7qgI0M5ayGSrfpZ7+Ep4Qfbe0eVbSSAYvOHkBi6UXW0rLx
 eGX55nYWoedx21cZ0mQewUp8augWqv9zFgyCm4Mgto6ux2uEEgCTXqSo1clLr49rB6T2qha2dJU
 /qU5XNVblVjZ/ICCCkvrt4lrIpyPsVMoPZg8avDfDdFsZI6zPbW94WAE=
X-Google-Smtp-Source: AGHT+IGGP8SEwMWac6436582fvmzSsJRI9J6R8Oxa4gb3xHIOYYorxhUyzBVYQImjrU89tQz8U/bZg==
X-Received: by 2002:a17:907:a4c4:b0:b57:d5de:444a with SMTP id
 a640c23a62f3a-b57d5de478amr859198266b.15.1760366111941; 
 Mon, 13 Oct 2025 07:35:11 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:151b:dc00:15d1:ebc5:76e6:730f])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c321453sm8942037a12.39.2025.10.13.07.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Oct 2025 07:35:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: phasta@mailbox.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/15] drm/amdgpu: fix KFD eviction fence enable_signaling path
Date: Mon, 13 Oct 2025 15:48:37 +0200
Message-ID: <20251013143502.1655-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013143502.1655-1-christian.koenig@amd.com>
References: <20251013143502.1655-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Calling dma_fence_is_signaled() here is illegal!

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
index 1ef758ac5076..09c919f72b6c 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
@@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct dma_fence *f)
 {
 	struct amdgpu_amdkfd_fence *fence = to_amdgpu_amdkfd_fence(f);
 
-	if (!fence)
-		return false;
-
-	if (dma_fence_is_signaled(f))
-		return true;
-
 	if (!fence->svm_bo) {
 		if (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
 			return true;
-- 
2.43.0

