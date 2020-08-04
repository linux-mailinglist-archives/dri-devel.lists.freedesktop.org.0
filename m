Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F7923C6B3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 09:13:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33096E519;
	Wed,  5 Aug 2020 07:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A4889E52;
 Tue,  4 Aug 2020 20:07:09 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id g6so32395060ljn.11;
 Tue, 04 Aug 2020 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QwuLYaLApEmOVHWHp+Vw1bu5HTkIwR1S8vZ0IWZKqmM=;
 b=FLpZxQ4GTpNyh/1BXqukhZgZoy6iGrA7zQp+owRl9101bQaeprmsdtxy3eVIVuNFCQ
 AQ1Bkycg1e8d/wStglObx5UZLQmRmyAGbwikAijd+WWViYbgFdUnvZf4hWoZeAoG0Lu9
 Hsg1dG1Fno2GINrLJQI/JQiW/LLdUAVRBN5E57dqRbjPFWnUgaRf6Gf9L0FU/VTDOXMo
 Q2xp90uVLmWip7UK3nvWlrgW4d+oFC/d87YsaLPcEcU74EzQi0wa39YUIu/p7HiLXAWp
 hbHBiRjl95a86OgI1DHtLJByW+Tg63iS16OT+gfg6HMyUogie2MaGCLjUziIX0GzanYI
 mFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QwuLYaLApEmOVHWHp+Vw1bu5HTkIwR1S8vZ0IWZKqmM=;
 b=sX5j43gpTzlg/d0Xe2oo+FhtwLe6H43Gj/dUsiFPotWkaVSh9OynRMtbL9GrxkGcFd
 /WnKt7gujTj2aJZerLt7+xETByku4LJy95cjos9VWfZtx/z9ARw/VDY5TcQVAD5WyNKJ
 KyCnFc9K+/IvvJiTZW4xG2i2XokbfpSROyjPaQLXs6OzRDM0n6/lmc6DpJ8iaVRUsmhS
 xK4VGzs4U5b7Doba/iB20RUyKgk/scL3d3Rm0F+jtEUHv92eVclXARDWonBwBgsK8//H
 8fi5Ii/DQBop987djTOiS+Q8TpU9n1RWpriMG5fjg+ajfSzsa47YFk4rwz9S5IiqXSgh
 yIYQ==
X-Gm-Message-State: AOAM530apL2QB8Wgt/7HGWeumxAPgvfIsL6Ta749/Xw1+070msb3/OHG
 bcEu0hSmPG4n5j8h8HUoaDY=
X-Google-Smtp-Source: ABdhPJy10VXgAk8Goc18zm0EgsOvZ6ttd08uapq9UzSlkSY6+d275kuzohjkFRZy0NKuyd896rLEMw==
X-Received: by 2002:a2e:8e96:: with SMTP id z22mr9619710ljk.462.1596571627893; 
 Tue, 04 Aug 2020 13:07:07 -0700 (PDT)
Received: from localhost.localdomain (h-82-196-111-59.NA.cust.bahnhof.se.
 [82.196.111.59])
 by smtp.gmail.com with ESMTPSA id g21sm3080020ljh.103.2020.08.04.13.07.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2020 13:07:07 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Subject: [PATCH 2/3] drm/amd/display: Constify dcn21_res_pool_funcs
Date: Tue,  4 Aug 2020 22:06:54 +0200
Message-Id: <20200804200655.30495-3-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200804200655.30495-1-rikard.falkeborn@gmail.com>
References: <20200804200655.30495-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Aug 2020 07:13:16 +0000
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
Cc: amd-gfx@lists.freedesktop.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of dcn21_res_pool_funcs is to assign its address to a
const pointer. Make it const to allow the compiler to put it in
read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
index 88d41a385add..a828696668bf 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
@@ -1754,7 +1754,7 @@ enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_stat
 	return result;
 }
 
-static struct resource_funcs dcn21_res_pool_funcs = {
+static const struct resource_funcs dcn21_res_pool_funcs = {
 	.destroy = dcn21_destroy_resource_pool,
 	.link_enc_create = dcn21_link_encoder_create,
 	.panel_cntl_create = dcn21_panel_cntl_create,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
