Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5866666F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 23:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D8310E2D2;
	Wed, 11 Jan 2023 22:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D34B10E2D2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 22:51:17 +0000 (UTC)
Received: from localhost.localdomain ([174.232.190.8]) by mail.gmx.net
 (mrgmx104 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1MI5UN-1p0Yto3p27-00F9t5; Wed, 11 Jan 2023 23:46:05 +0100
From: Kevin Brace <kevinbrace@gmx.com>
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/ttm: Fix of rework on ttm_resource to use size_t type
 commit
Date: Wed, 11 Jan 2023 16:45:44 -0600
Message-Id: <20230111224544.4837-2-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230111224544.4837-1-kevinbrace@gmx.com>
References: <20230111224544.4837-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:xPF253lXoTCHP9SEn0wilFML7JlbJCuaEIUDrY99IbfhsUXukwv
 zTfupaKEkpQ0PBL9DSNKwY7k7WnoLAtAICCe/QjD+Tha7itONfllMH0rrqV+8fYFySsf+le
 ZxqPQsLcPQCvpXaKqs4eUq8fp7b6VuX1nhEponMAK2SvtGq5rHHZ8Sn6hW46YS1zmP8cKJD
 UnIti0P8iZN/VscFPZkSw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vJYURqUMelM=;fg9DHXtrfQOxhKBPu7g3vux30Lv
 XRC4l6q/wqVA/UuywTucfjbsDKXWq5Xtr7olnPA4jeotlHX82AxRYEQdN41VIjRC3OChFphMG
 03p1bXAybZL28VKJPMkXnxOog7Oo+5FeSA1+af5qsEgDhkrYr+9l1vaFg3CU4UwkuWBYZMHb7
 TEG834HsaVaf3JVODUqqOEzju2dWZD4Enmw7btqd2bgdcFHZzteJMfrTlB904eDdPfgelDYuE
 kh/KKWP/dAKOYEFmdlY4c09iHpoujXwijuKA4opuDJVUcFINHWnwXj9wtopPn3OLTB2DLFBlz
 lczHeabumrcFIQJ4zZhIUmS9VHdIkqRqF6MQnux30wIcSGOZvyNjRPPL4Mf6qwC2knoQO+4Ib
 RuUQHagcDpitviq4h6OpbEtY+QYWnkaQA6a0notTT7MXC2v+zWnOjpYxypZt+62viiSqLNLaD
 HTEWqJJnMMfXx3wSoHuwLSR2M8ZkfIvJldHJl9wZE5xDx49LxY1zibLpFfSDh6vBHKnF5a9YY
 dNcS2WTdf77PMTCadG1zR64GHo7HUAAAI96Q4Jqte5LFS94RhDyO/6KVGvW1ErM2PddrHRjWI
 Z1819EUOxP+JjJh7FGkFmXwnwDlteKPZ6GQyYJGCQ5UWQQHUBTN+pN2GOon0pNPX+Wsbcz4ES
 GsK4MD7xrsxSND3ZX1VcJGXT5JxAjSMP9/1VgvjN+gW1hA0zXUF1P8Ny7Hz+7eqGk9mHUGKjx
 UjitUOW/NFUve59cEtv6m0i+euWdliRBZr/5K6pqCZTJF7EZLgBU9AoVzqIH1I61RF1jNdgQU
 6+XfpwNmHTXUEvZf+uNl8SI0vstUAyJPgD/bUDIpcvzIs1MtCWQqGj18HaqAySSOK3iCNtB4E
 2opWfkTQ6QhiS2M04BV31TBk6BclS+DpdjbXmyqlnKEDsFWZJIQnoQrxuio0O3AOFofldLF/l
 BPpCersHa7ikduzGtdx30bTaNGI=
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Commit e3c92eb4a84fb0f00442e6b5cabf4f11b0eaaf41 (drm/ttm: rework on
ttm_resource to use size_t type) reworked ttm_resource{} to use size_t
type size instead of unsigned long type num_pages.  In that commit,
when ttm_move_memcpy() is being called from ttm_bo_move_memcpy(),
the code was changed to specify the page size from ttm->num_pages
instead of the original code's dst_mem->num_pages.  Since the commit
is about reworking ttm_resource{} to use size_t type size instead of
unsigned long type num_pages, the commit should have specified page
size converted version of dst_mem->size.  Use PFN_UP macro to convert
dst_mem->size to page size.

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index ba3aa0a0fc43..da5493f789df 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -173,7 +173,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
 
 	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
 	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
-		ttm_move_memcpy(clear, ttm->num_pages, dst_iter, src_iter);
+		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);
 
 	if (!src_iter->ops->maps_tt)
 		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
-- 
2.38.2

