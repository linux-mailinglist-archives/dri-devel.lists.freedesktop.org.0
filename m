Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D880D38AD71
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 14:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E3A6F42D;
	Thu, 20 May 2021 12:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB25489FA6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 12:03:22 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id z17so17371408wrq.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 05:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oOCS+hcR746GCJgf+MTN84dmS4mfJygmI/El7Wrt4P4=;
 b=ZUD65uqjYlggL85gY9v2dGP0qaEAtUv9/6yMYvyc6T+yU5TXOVtoJYkrk15QeUqmTC
 cE3LQxHt/DtOkRgOgMIfh0MRQGRTTmnYhR4AgZwQQLc3SCNbDeioVcipg6covQsn4ynm
 +GCS3mvEDYAgBL4Hn/l6Ci0RwqwCRXM8oWyhnBZ5L+dwOj4c0mg9nNp9ETdiFOkR46P0
 IsDLYhphvMJegX3q3vjLGm6YIWJ0u3V0ktJfDTBfWhBv/yDqJIq2Yhd0k+sBC64x5JMb
 Ni05pKPh4xHIe1OK0JoD10mCgbve8icQ/yi0vvUP5sCREjDv861COjn5th/TxAaeEvYr
 /2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oOCS+hcR746GCJgf+MTN84dmS4mfJygmI/El7Wrt4P4=;
 b=SgjQEbJYjKJbx4je/UDY6MRx19fWWbLtcW7nw4XVbY9xCNq7CudX7g/o/kwAm4X3gD
 r1z3gCsQ9zTFVVzPFofPuGa82C+Q91nzMp+Rdok2RMKmSxRbYq9Y+KXZ4Uouz5iy308y
 fAGnEzydpDP0PEoZ3hUK+TvphGrkLS2ukACqY7JYC8l2/F6UpC8T62Xv+ls0BRPJFceM
 X9cllTWvruabK3NFZIf6i5lLVhFpkBxsz3MTS3e9/PZ6SpneDJ5xbDE2TJcfRT7EFHkU
 pcnnccKjS0/OoGFdjC5DDMUJkDP6S9SRYRpRN3fDEWuwAEmtxDLY0n+hLfJIucVWh7ns
 vi2g==
X-Gm-Message-State: AOAM5307OXEMZFuFs6Jne0zl0qTAJKLode91cL42S7vpctIJxQjXMsc6
 Xpz90cfWYvrefvxsc/P2oCzQrg==
X-Google-Smtp-Source: ABdhPJyAItR0gb4XPRxdBIWogM59UBoe9P9QuJ8hc0mi4kUzQUx9yTK3mbjp5Cx9hjsoU+iBasFpHQ==
X-Received: by 2002:a05:6000:10d1:: with SMTP id
 b17mr3885211wrx.281.1621512201663; 
 Thu, 20 May 2021 05:03:21 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm2886332wrt.32.2021.05.20.05.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:03:21 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 29/38] drm/radeon/r100: Realign doc header with function
 'r100_cs_packet_parse_vline()'
Date: Thu, 20 May 2021 13:02:39 +0100
Message-Id: <20210520120248.3464013-30-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520120248.3464013-1-lee.jones@linaro.org>
References: <20210520120248.3464013-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/radeon/r100.c:1423: warning: expecting prototype for r100_cs_packet_next_vline(). Prototype was for r100_cs_packet_parse_vline() instead

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/radeon/r100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
index fcfcaec25a9ef..3c4e7c15fd159 100644
--- a/drivers/gpu/drm/radeon/r100.c
+++ b/drivers/gpu/drm/radeon/r100.c
@@ -1406,7 +1406,7 @@ int r100_cs_parse_packet0(struct radeon_cs_parser *p,
 }
 
 /**
- * r100_cs_packet_next_vline() - parse userspace VLINE packet
+ * r100_cs_packet_parse_vline() - parse userspace VLINE packet
  * @p:		parser structure holding parsing context.
  *
  * Userspace sends a special sequence for VLINE waits.
-- 
2.31.1

