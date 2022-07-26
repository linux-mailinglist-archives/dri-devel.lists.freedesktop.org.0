Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8475819A2
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 20:23:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5D797B23;
	Tue, 26 Jul 2022 18:23:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D6A9788C;
 Tue, 26 Jul 2022 18:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+7t/7eAOvi8kAxMn65dXL5tgH7liqj/5NHPtUP/lMtI=; b=pAqbxLvpfzTFr1RX7FKZOOenJu
 fQASXOaguX5weGrJTPL/0MdF5aDoGdczDr/KHCDN84mFJs+mvbfv5kQNKyQm9tzcFu138DfGU8mK5
 Ksy6EzgNzIXPg7yGTC/VqrDQT3m6Tw/ASh5sKGxGtBmxS1ziqAHZuhD0R1Aj0d6Ua27+85Kd4+Bt9
 2N1Mwxfqa2qo2nT8kJjh/YAffcJnaGu36OFjCTKGrNsK2jXbUlChrVA9246W9GyJVe4ecMgpQufCv
 SD1IBaySgilNopilgOlVAvL0d0b8H/ZzxYO6FbtXOQm0UWGyYc/25HzGRcr2k8gzY+nP27ogPh5cg
 +Fb4xDRg==;
Received: from 201-13-50-220.dsl.telesp.net.br ([201.13.50.220]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oGPD5-007aEh-VD; Tue, 26 Jul 2022 20:23:12 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?=27Christian=20K=C3=B6nig=27?= <christian.koenig@amd.com>,
 'Pan Xinhui' <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Tao Zhou <tao.zhou1@amd.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Jack Xiao <Jack.Xiao@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Tom St Denis <tom.stdenis@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH v2 4/4] drm/amdgpu: Document gfx_off members of struct
 amdgpu_gfx
Date: Tue, 26 Jul 2022 15:21:52 -0300
Message-Id: <20220726182152.123649-5-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726182152.123649-1-andrealmeid@igalia.com>
References: <20220726182152.123649-1-andrealmeid@igalia.com>
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
Cc: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 kernel-dev@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add comments to document gfx_off related members of struct amdgpu_gfx.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
index 1b8b4a5270c9..8abdf41d0f83 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.h
@@ -332,12 +332,12 @@ struct amdgpu_gfx {
 	uint32_t                        srbm_soft_reset;
 
 	/* gfx off */
-	bool                            gfx_off_state; /* true: enabled, false: disabled */
-	struct mutex                    gfx_off_mutex;
-	uint32_t                        gfx_off_req_count; /* default 1, enable gfx off: dec 1, disable gfx off: add 1 */
-	struct delayed_work             gfx_off_delay_work;
-	uint32_t                        gfx_off_residency;
-	uint64_t                        gfx_off_entrycount;
+	bool                            gfx_off_state;      /* true: enabled, false: disabled */
+	struct mutex                    gfx_off_mutex;      /* mutex to change gfxoff state */
+	uint32_t                        gfx_off_req_count;  /* default 1, enable gfx off: dec 1, disable gfx off: add 1 */
+	struct delayed_work             gfx_off_delay_work; /* async work to set gfx block off */
+	uint32_t                        gfx_off_residency;  /* last logged residency */
+	uint64_t                        gfx_off_entrycount; /* count of times GPU has get into GFXOFF state */
 
 	/* pipe reservation */
 	struct mutex			pipe_reserve_mutex;
-- 
2.37.1

