Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D27F53BA47A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 21:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1ABD6E1F3;
	Fri,  2 Jul 2021 19:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2DAE6E1F3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 19:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625255585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KRoKHMQ/QYj7rUDlz3XNGWb+wy/iN7sUlepMrk5JPbo=;
 b=Ah2dflWYnr+mGhiX0GNbUaqtcGYq29KRviYSB+dQ+34C569uxCcwCOQjXMajRLuJSKmqA8
 UPGvplbA+mcilrghe0HNW9gMmL+NoealkiDjR8Tijo9wv99s7eqvI8PT7LxdKj2etEq3ij
 7zNm2pZL60rD/CuzEdxxa4IX24Uu/jc=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-lHEIjJb0MeCpTk4tlW1oyg-1; Fri, 02 Jul 2021 15:53:04 -0400
X-MC-Unique: lHEIjJb0MeCpTk4tlW1oyg-1
Received: by mail-oi1-f198.google.com with SMTP id
 a29-20020a544e1d0000b02901eef9e4a58cso6233740oiy.3
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 12:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KRoKHMQ/QYj7rUDlz3XNGWb+wy/iN7sUlepMrk5JPbo=;
 b=DyRDHEoHvGYl8jm6kv90OA8WTYjawXMAcD12PpluQzmTZ1nBhMC9lqoqOTQFu04Wi6
 AUT75qhKN0z7QuTCic50VJJN8XiAlCztFuNnm0mgZ00z+q1dFAo5wNExxmQqfny8B5AB
 F80OrbxmMiXxWbECCXUYMLXi3aPdlKGuvcmOqNH4kMYGqSiFJEyI+b9VgP8Yb1ncIJZE
 T6IESLlyp9OtFF1QqNZTkqwHmF3VR2GdPzUYp2wlEuNFnLDnlM9dJepg9Mf267slzwHj
 PNoQOue01Hyw9r61pbvWAVpBGQ8vI/yULwzVn98u8v2BF53t9mTiQNExQlxJ2bRBVypU
 HQXA==
X-Gm-Message-State: AOAM533m+AouB+dHLlbufl8Ql5DvG3G0dZ80vTEtNKaRaypGw1QDTvPq
 CaH8NJ6UXLUJuJxx4jk2bwDQIqGlpUZlkL/nTlY9+M4/ntPeybWv2ySTrMArDNi2HGwfjXqZZf+
 9xZStEfeJZAljZD+e6RherkvXVqLz
X-Received: by 2002:aca:4302:: with SMTP id q2mr932145oia.111.1625255583753;
 Fri, 02 Jul 2021 12:53:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeVRL/DQmiY8F2uMYWaBUYWtTORAPrUvyzc7HoM34TMuLz0GslVBRJe+SamgLTpcc4McWv6Q==
X-Received: by 2002:aca:4302:: with SMTP id q2mr932125oia.111.1625255583503;
 Fri, 02 Jul 2021 12:53:03 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id l2sm810062otl.27.2021.07.02.12.53.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 12:53:03 -0700 (PDT)
From: trix@redhat.com
To: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, Hawking.Zhang@amd.com,
 Dennis.Li@amd.com, guchun.chen@amd.com, luben.tuikov@amd.com,
 Stanley.Yang@amd.com, nirmoy.das@amd.com
Subject: [PATCH] drm/amdgpu: initialize amdgpu_ras_query_error_count() error
 count parameters
Date: Fri,  2 Jul 2021 12:52:45 -0700
Message-Id: <20210702195245.1629908-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tom Rix <trix@redhat.com>

Static analysis reports this problem
amdgpu_ras.c:2324:2: warning: 2nd function call argument is an
  uninitialized value
        atomic_set(&con->ras_ce_count, ce_count);
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

ce_count is normally set by the earlier call to
amdgpu_ras_query_error_count().  But amdgpu_ras_query_error_count()
can return early without setting, leaving its error count parameters
in a garbage state.

Initialize the error count parameters earlier.

Fixes: a46751fbcde5 ("drm/amdgpu: Fix RAS function interface")
Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
index 875874ea745ec..c80fa545aa2b8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
@@ -1056,6 +1056,12 @@ void amdgpu_ras_query_error_count(struct amdgpu_device *adev,
 	struct ras_manager *obj;
 	unsigned long ce, ue;
 
+	if (ce_count)
+		*ce_count = 0;
+
+	if (ue_count)
+		*ue_count = 0;
+
 	if (!adev->ras_enabled || !con)
 		return;
 
-- 
2.26.3

