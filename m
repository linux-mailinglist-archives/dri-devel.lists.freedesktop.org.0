Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6902A57E862
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 22:34:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0668F93BB1;
	Fri, 22 Jul 2022 20:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEE393B96;
 Fri, 22 Jul 2022 20:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AvqpOLOaKzQjLCE8a0MQjXay6IH7jaU/OiGpffc7pXk=; b=O+RHRvq38ETi9MaxBQjpLRErKf
 OOyTpDWel/FJxULm9l1LpRHhdsmNwijywvRk9+RzMCdUk5tchfyAlpefq9p9pqVehdHRPn8kDfrG3
 Zapa5oOp4ENFD9i8pLNR59I19XYvoyGNNJrBhRXRFibfOupF89x141sQQwTpEQCgOheIXUK/01yUw
 hYrU1rz+5Q2+IXiUmXbTm+SlYeOztsoWvd6rp00uiZ9G/ZxVz3pQYipme0X7KxZGxm06NlSLdey/l
 rd7ENpeG4UM3H4tqaUbn0crBu3hcuu+0bVUSbLERo5ykxjYX/Bh67ufgE2szvezVuMvq/USfBw9Fj
 /r20uKIw==;
Received: from 201-13-50-220.dsl.telesp.net.br ([201.13.50.220]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oEzM8-002fLB-HD; Fri, 22 Jul 2022 22:34:40 +0200
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
Subject: [PATCH 4/4] drm/amdgpu: Document gfx_off members of struct amdgpu_gfx
Date: Fri, 22 Jul 2022 17:33:47 -0300
Message-Id: <20220722203347.70176-5-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220722203347.70176-1-andrealmeid@igalia.com>
References: <20220722203347.70176-1-andrealmeid@igalia.com>
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
index f06e979e2565..a552a49c1b25 100644
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
-	uint32_t                        gfx_off_entrycount;
+	bool                            gfx_off_state;      /* true: enabled, false: disabled */
+	struct mutex                    gfx_off_mutex;      /* mutex to change gfxoff state */
+	uint32_t                        gfx_off_req_count;  /* default 1, enable gfx off: dec 1, disable gfx off: add 1 */
+	struct delayed_work             gfx_off_delay_work; /* async work to set gfx block off */
+	uint32_t                        gfx_off_residency;  /* last logged residency */
+	uint32_t                        gfx_off_entrycount; /* count of times GPU has get into GFXOFF state */
 
 	/* pipe reservation */
 	struct mutex			pipe_reserve_mutex;
-- 
2.37.1

