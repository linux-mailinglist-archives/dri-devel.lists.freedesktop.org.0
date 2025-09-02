Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C5B3F5A3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 08:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E95710E5AB;
	Tue,  2 Sep 2025 06:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Cp/bSDJV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5217D10E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 06:35:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-45b9814efbcso2277715e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 23:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756794944; x=1757399744; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o6dRSOg31Mko9p5tril5Cb2sG6ftwSr6FMGcLX9f2c8=;
 b=Cp/bSDJVCJUhgIksyai688LzX9AMyTbwF6k2BIWnK5XxVz/MHG6xhJu12kbQLPi5tE
 KW2XqOABDTHxHJF023fQJVyRruLywJSgDlD7TtkXhohBulWxv5lybyHoTVx7e1eq3gu/
 Dnwsj0gfTQipVc+LEmWGgTunyNT/P3lXDPkhI/2NJxM76NWKauw3xciz7F0csrx10xmg
 U/a3mYUxBV03f/AjvnUQcEy/sT1zzW6m5qaqor0L7B2ZkdpJTNX2NMudH7XgTUbDVnKU
 sW9xJ1dwc+bqsNc5NC0wF77ko5vP0rrk7rmbFMsRYZk+D2NjkS3GtHwIlMpmEWs6uaeN
 mIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756794944; x=1757399744;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o6dRSOg31Mko9p5tril5Cb2sG6ftwSr6FMGcLX9f2c8=;
 b=AFR6pJpT0JI1/UI8zsPSBL2dNUdlTH5alYyXZErgWa7j6T/vxyN+vI/Q/roieiUCIh
 eoQbJ7+WhAJBxjt3E/cTucHBXDVazzZ83GZZ1Do/tg7WHMTUY3hBa7byi0oVMPgwIw0v
 ZpWA0Ic93p0SO+DcUe1y4Ke7LB7Sx12K9oO+rVI91wZ8pXzS26q7LeAsgg+4OzhdWmaO
 Z5MHRhx3ZP1gEqMHNrRvmEjQbsSyvosjJFdJ4jheyj6GujBT/zba8YV4UkoKxjTavYZi
 eUt2ZONMEZI2BTm2FnvyIe+3Djv7n405GzA8t2/uhI5X2V6cmZQJ0klY06fE8Hj9n6L8
 kEUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4gOOp1kLXaLQHewQxkOdZQ3eL9ZfkrcjViAuybre9nSAy76sMFgTvKsnybFhtvLX58e8r7WHihXU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtqTETN1I+svKbXkJemHw4NDE6GbRxsNdTHlmzUI5h7PD/+jYE
 6BGBgDMFnqRtcM4SO8mhEb9xgvE2vew+66RPao3eIuuiLUaNeywvHs8G9cZBmPaSSNU=
X-Gm-Gg: ASbGncsTWBuCR62Eh2jS4QXKZi8mnIc2aFbjcPBRk1P8l/M1eOQ6aWZ4v6VLGXnrv+p
 q/xbFqh/QFnLbww6F8/uJ3UyiGbF2TtLT1GzPL2ZiNNaFmFZvEqObwzFO4v8T+QCBoya6iaiUGR
 2WmK4emgVgCBMU3XflnpH9sttPvIRaTaYBkLP4rh0MYh/2B06irWmXXimtWrG8tgRyhxsqiF2f0
 NjI/3knQpqs061CWvoVNJUgHkFEDevDKrXRcaqKMJiC/oiGlfDywhHhKY1x1oM1UDE2jzl2Bnau
 ArF14D6UvvaooIoixhdlw05bpxfAfSWtKTdbOHZIUM6ZU8otOLG39cqa4ci84dgHoXY0EpKiCw5
 iz4jcGI+YdGkzfsL4A3cz6NzNIYA=
X-Google-Smtp-Source: AGHT+IEnfjMtfmIxXQ+PI1ax+u6+bozcWFK3bQPZnYJtBudvpfl6k6o2nsV602G8vQ758YC6q09N3Q==
X-Received: by 2002:a05:600c:a30c:b0:459:e002:8b1e with SMTP id
 5b1f17b1804b1-45b8c05a036mr43636325e9.13.1756794943784; 
 Mon, 01 Sep 2025 23:35:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45b87abc740sm117736355e9.7.2025.09.01.23.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 23:35:43 -0700 (PDT)
Date: Tue, 2 Sep 2025 09:35:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ben Skeggs <bskeggs@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gourav Samaiya <gsamaiya@nvidia.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/acr/ga102: fix NULL vs IS_ERR() check in
 ga102_acr_wpr_parse()
Message-ID: <aLaQO-dpTsHJ-oH9@stanley.mountain>
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

The nvkm_acr_lsfw_add() function never returns NULL, it returns error
pointers.  Update the check to match.

Fixes: 4b569ded09fd ("drm/nouveau/acr/ga102: initial support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
index c7d38609bb7e..aae96a94acee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
@@ -218,11 +218,13 @@ static int
 ga102_acr_wpr_parse(struct nvkm_acr *acr)
 {
 	const struct wpr_header_v2 *hdr = (void *)acr->wpr_fw->data;
+	struct nvkm_acr_lsfw *lsfw;
 
 	while (hdr->wpr.falcon_id != WPR_HEADER_V1_FALCON_ID_INVALID) {
 		wpr_header_v2_dump(&acr->subdev, hdr);
-		if (!nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id))
-			return -ENOMEM;
+		lsfw = nvkm_acr_lsfw_add(NULL, acr, NULL, (hdr++)->wpr.falcon_id);
+		if (IS_ERR(lsfw))
+			return PTR_ERR(lsfw);
 	}
 
 	return 0;
-- 
2.47.2

