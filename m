Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E979E3873ED
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 10:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E59A6EAB8;
	Tue, 18 May 2021 08:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1256EAB8;
 Tue, 18 May 2021 08:27:53 +0000 (UTC)
IronPort-SDR: OgFqPJmkTbEwuNG42FqT51dYEwoIsXsvR+wFZLslsH17stqQ1ea0ZsgFZ8SjTpqhhLPTbF0O53
 qnCrddcsPapA==
X-IronPort-AV: E=McAfee;i="6200,9189,9987"; a="180937232"
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="180937232"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:52 -0700
IronPort-SDR: tGvW710FPrVzdz5tzQ774NII7AWlRrXf8mPHHv2T9CgEQibA8yuekk4nDPHszqy+Y/I2HqYKgI
 JR0iBjpG0C+Q==
X-IronPort-AV: E=Sophos;i="5.82,309,1613462400"; d="scan'208";a="611892341"
Received: from cmutgix-mobl.gar.corp.intel.com (HELO thellst-mobl1.intel.com)
 ([10.249.254.195])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2021 01:27:37 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/15] drm/ttm: Export ttm_bo_tt_destroy()
Date: Tue, 18 May 2021 10:26:53 +0200
Message-Id: <20210518082701.997251-8-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
References: <20210518082701.997251-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the upcoming kmapping i915 memcpy_move, export ttm_bo_tt_destroy().
A future change might be to move the new memcpy_move into ttm, replacing
the old ioremapping one.

Cc: Christian König <christian.koenig@amd.com>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ca1b098b6a56..4479c55aaa1d 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1221,3 +1221,4 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
 	ttm_tt_destroy(bo->bdev, bo->ttm);
 	bo->ttm = NULL;
 }
+EXPORT_SYMBOL(ttm_bo_tt_destroy);
-- 
2.31.1

