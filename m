Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC83A37C39
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 08:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731D610E0DC;
	Mon, 17 Feb 2025 07:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H5WJfbho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D678310E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 07:31:26 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-aaedd529ba1so475364166b.1
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 23:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739777485; x=1740382285; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=i3N1F9lKBugdIVSZf0JnXa3f5AJ+PHptBaxL337Q39w=;
 b=H5WJfbhowuk3rUP0XLX059BSh6tfYcmUDNhE0Cqw1wlVdB6xK6i7mlqjgqA3AUqR4R
 tpiP+jIcmPsb41oXHUGAlW+DxX83u0DrtQVzoRSXzzygvTZVw2KYw3BZeCSXhOIW2cTe
 n2Y4T5/ZWLjwWYAXhYrQ8LgQjYyFhCG+3+QBjhPZ3ImbGEYJOrmulj2oEbelWL0Fp9aO
 nnUDWxWopEeIIGPHC/UmMEDAkQbIMCh/0+R53n9mMo4qeUPfo8sruT1duPlJUIBSWgHT
 OdHmal4wS5kVnninRU4pwv4mlVnhDJ8BkQD5yWj3da0iqQub9C6VNXb7aA26krA9iVO7
 hIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739777485; x=1740382285;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=i3N1F9lKBugdIVSZf0JnXa3f5AJ+PHptBaxL337Q39w=;
 b=tfVwdmbZh+783Mb0w+HEq8x0VaQbpgDW97HF+MHdxns/U7ASYmMYqichKH9uTqFhQ5
 4Ag7HWGznaTVj4Komsgab6s7Hm+3WvP9Ck8tL1lAnd/FNjHPHGyIV4wB3Q1oLHUBMdov
 GBtIHW69dJCNWcf1oKamolyNBwENlmLNrOQ43utVyPFBzi07icDrKc8+93Uj51JTFSMQ
 4ScG2674wNYLphJBLYpK6L2oAVhgnzfmWUJKU+okJWHKXT7PT8Vt/GtG2YoMp+JcnHit
 QOVRs4RiUZPFtHL0f5JXawX77JME15c75PIM0ZNGNv44A6zNqJQo4BW/bseXuQEHuSRy
 HH0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT+teHMJxP9UMEcHwTa7w9tXZzDdLRyRTV0hH2KA+nKxAmW/cLEmikHwGEWg5WQ56YM4t5Lw1lM80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyUMykroOr5PR1Z3uEV4tjrV3hctSy7i7bp6AHlzWT4uEd9oNHN
 ErhRUfRfRX8arFmZRXxTQIxE/bJNpkW0NKAsYN+omjY2AbuGlhwpAqRUe7ARFSQ=
X-Gm-Gg: ASbGncsxrHAUXRxRZrfdXafsLbmaItdJCwL3pTVFRJehCrAt4w+tO68H4/eezsyuG3k
 1TdAfsmT5ViKOuTFltXOP04MOltlm/I0V/QwBM9DqHxXer2optigozJOZmPrHdDQzVBqWHJ7iWF
 F087qV5bs0FrlHQiuA3Fx8v5SELjdt7Ejm6Xqmm5Ll29HzmyMo6BBY7/2vLZXn1No7pJHiwy08i
 hwXVpMHVn9EwXXphynx4MlQcEwrteKIXY1Vijusln0C6I14vK/t8VPjUtxC0JX7vg/ZUXtScYSs
 Z/2gOjVn8QZrTTRQ9hU0
X-Google-Smtp-Source: AGHT+IHnHjxlo58ZzOxdeP7u7lyqoH4uJ6/5PcUK9k1FokcbI7i8gKzpjfAHODR2Y8cP+hgufV5HRA==
X-Received: by 2002:a05:6402:3589:b0:5dc:9589:9f64 with SMTP id
 4fb4d7f45d1cf-5e03602f759mr19286982a12.13.1739777485351; 
 Sun, 16 Feb 2025 23:31:25 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-aba532322c4sm830991766b.34.2025.02.16.23.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 23:31:24 -0800 (PST)
Date: Mon, 17 Feb 2025 10:31:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhi Wang <zhiw@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Timur Tabi <ttabi@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Ben Skeggs <bskeggs@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/nouveau: Fix error pointer dereference in
 r535_gsp_msgq_recv()
Message-ID: <b7052ac0-98e4-433b-ad58-f563bf51858c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

If "rpc" is an error pointer then return directly.  Otherwise it leads
to an error pointer dereference.

Fixes: 50f290053d79 ("drm/nouveau: support handling the return of large GSP message")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 2075cad63805..db2602e88006 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -348,6 +348,7 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
 	if (IS_ERR(buf)) {
 		kvfree(info.gsp_rpc_buf);
 		info.gsp_rpc_buf = NULL;
+		return buf;
 	}
 
 	if (expected <= max_rpc_size)
-- 
2.47.2

