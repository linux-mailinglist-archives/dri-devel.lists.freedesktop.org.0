Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D3B5441A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40FC410EBB8;
	Fri, 12 Sep 2025 07:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TBgggMvn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAD010EBB8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 07:44:19 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-45e03730f83so6782205e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 00:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757663058; x=1758267858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+vzS365Y8dpkhAzeZRdnCGhHbPvqCTNi/Gxyj9Ln0+k=;
 b=TBgggMvnQnfKtcVg8xCgzl9TtKMZy9U5c+e0rt+Kwc3dbW7jQHUkfQLSpCXibmHE8b
 rC6zk093z6zqbqmgDspCxLOWJ1lXpzdt8i9cYCFcyiqmUnNXL3Fu2uw/dCLY3Sx4nwkX
 st3f7LebN487qnqMoDWvip0GuBbrrI2zgj3Ot+x+QD7mGtM7sjiUMBz7BsWXN2g///df
 Tt5Kmkr+O5YnlJw9mtEJFOCSJ7m9FxEJd62nxCeuNHF4t+xj0ukgz0cIVYp5Y8t7/U4y
 AqG6x90697FZ2TO3eD8xWfE3d0L9wZiMnvttMYVwOSNM9LhJmg0lbrVRylrS30+gGAch
 mqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757663058; x=1758267858;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+vzS365Y8dpkhAzeZRdnCGhHbPvqCTNi/Gxyj9Ln0+k=;
 b=bvrqSfmxrWgpfpRh0d6A/qp9D4524OEAKibdSkIuDSChHWDTKcFit45iol3CZQq1gM
 xOUYYvt88tPVA4EgfWO9JMoc/BuAjy1jbReHf/D80dlcrdvuy7kHThGyL6W3t0bJDv/k
 9gfkZ5sMnG1qP0JvEKvDwezbsIJBhSoSZeDwZA2N6MRAKlsH/LMfw7FaYC1HFJFxjDpA
 I3gIB5XNGc9LZmIaw3EFgcsZlNmd6dT/l8SsV3m4bdltV2PKjx74Ncp3X5GUC9CGiEDM
 oCCEDV4t5jNswIaonhAoQlK3wn0fS+IEB5UNG6vWh5sknEjCpUttKt0ArU9B+Bfbjz6n
 0koQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVl5O519LFKjAgQBYvaf+5HZnTKjZoVkwnNCETgW5OMly5TAxbbcgX7Gzukb/HjefesZWl1y8xnkg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGEdb1wrRHuZl0lVwkQQGiI6IYfjbvGxYZQyV6AIZaJt0LnFi8
 r0QHuOk9FU2Rn6dEuCeLO+Q69BGR9uLm4ZH1h4T/+6b7gncDC5rLxhgF
X-Gm-Gg: ASbGncvL1UDCvZMbtaLKs4hGYridmpu17WwqZqrzTTNG2GwbhqO3ARjBTCu6gW06IN0
 jfnPhTT/LooNBC9tC8AWjZtlIAmUGJy3dKveDVunDN3vuc6Q2tYxb/DxbbKdlquW1oqxOAxzmGp
 lM3jRiPmGwIdu9wmsPRVBKSlM0sKegjLpbUWQCQivjxVeUBJhYLs+AWSy3HTKFmJV1lWoaMRtes
 WRWpRLx2yQ+HEHyEqr38KBsqSURuLUTtPva//DnUd2DBI3xFfkcJdSsAVdBSSqfIt7S/NHa9QhY
 SWX08qTOsgmDC/GFiyRnzXh6ad/evLi3/BtwrTZPDhrdGNmep1EylmNRaC4RMac1QLI+8xZl3id
 x/tdc6TgJaq9kOIuwtO3c
X-Google-Smtp-Source: AGHT+IGcBRTRyBh6Cwu5iI4hTdWjgTJRmHmc3IyNU0i7I6eC8AyH4njMSzoX7KbtbrF08N3PuQ7bhQ==
X-Received: by 2002:a05:600c:3209:b0:45c:b55f:466a with SMTP id
 5b1f17b1804b1-45f211efac2mr13603635e9.15.1757663058119; 
 Fri, 12 Sep 2025 00:44:18 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45e03719235sm51823045e9.1.2025.09.12.00.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 00:44:17 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/xe/guc: Fix spelling mistake "sheduling" ->
 "scheduling"
Date: Fri, 12 Sep 2025 08:43:30 +0100
Message-ID: <20250912074330.1275279-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a xe_gt_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index a465594b61dc..8cb8b93a37a5 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -355,7 +355,7 @@ static int guc_init_global_schedule_policy(struct xe_guc *guc)
 		ret = xe_guc_ct_send_block(&guc->ct, data, count);
 		if (ret < 0) {
 			xe_gt_err(guc_to_gt(guc),
-				  "failed to enable GuC sheduling policies: %pe\n",
+				  "failed to enable GuC scheduling policies: %pe\n",
 				  ERR_PTR(ret));
 			return ret;
 		}
-- 
2.51.0

