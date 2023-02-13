Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B301695237
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 21:50:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 305B510E71A;
	Mon, 13 Feb 2023 20:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA94E10E718;
 Mon, 13 Feb 2023 20:50:03 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mx0.riseup.net", Issuer "R3" (not verified))
 by mx1.riseup.net (Postfix) with ESMTPS id 4PFxL34gwMzDqCJ;
 Mon, 13 Feb 2023 20:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1676321403; bh=JwKuMQUZcCsBvQp/gWtBY856rW6ykXQs2U1Xb2/QmzM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S5aRKaEH7pWX4AoAaYR3C2L8NtH6gSPDdrIbWtLSb/3196l6naNn6xf+N+PD3jnwb
 YGCIxEVXV+jhB/uHyWLbzBYZ5g8O5PDNocjyLEgxAEV67eLgPmn0unKhTOOPKfSaho
 hJjVaN+oOIvBoNrI8Gi1aEYg9Yr0V9YB+77pj0To=
Received: from fews2.riseup.net (fews2-pn.riseup.net [10.0.1.84])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4PFxL26hRMz9sv7;
 Mon, 13 Feb 2023 20:50:02 +0000 (UTC)
X-Riseup-User-ID: D0E11173C49F93EAC3288792BBDB51921CBDE302FCADAECD4D12C5C4BFC81C0E
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews2.riseup.net (Postfix) with ESMTPSA id 4PFxKw1nqkz1y8Z;
 Mon, 13 Feb 2023 20:49:55 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/10] drm/amd/display: Add function prototypes to headers
Date: Mon, 13 Feb 2023 17:49:15 -0300
Message-Id: <20230213204923.111948-3-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-1-arthurgrillo@riseup.net>
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
MIME-Version: 1.0
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Arthur Grillo <arthurgrillo@riseup.net>,
 mairacanal@riseup.net, alexander.deucher@amd.com, andrealmeid@riseup.net,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add function prototypes to headers to reduce the number of
-Wmissing-prototypes warnings.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h | 2 ++
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h | 2 ++
 drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h   | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
index e015e5a6c866..89d6208287b5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_hubbub.h
@@ -133,6 +133,8 @@
 int hubbub31_init_dchub_sys_ctx(struct hubbub *hubbub,
 		struct dcn_hubbub_phys_addr_config *pa_config);
 
+void hubbub31_init(struct hubbub *hubbub);
+
 void hubbub31_construct(struct dcn20_hubbub *hubbub3,
 	struct dc_context *ctx,
 	const struct dcn_hubbub_registers *hubbub_regs,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
index bdc146890fca..b20eb04724bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubbub.h
@@ -204,6 +204,8 @@ void hubbub32_force_usr_retraining_allow(struct hubbub *hubbub, bool allow);
 
 void hubbub32_force_wm_propagate_to_pipes(struct hubbub *hubbub);
 
+void hubbub32_init(struct hubbub *hubbub);
+
 void dcn32_program_det_size(struct hubbub *hubbub, int hubp_inst, unsigned int det_buffer_size_in_kbyte);
 
 void hubbub32_construct(struct dcn20_hubbub *hubbub2,
diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
index 56ef71151536..4cdbf63c952b 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_hubp.h
@@ -61,6 +61,8 @@ void hubp32_phantom_hubp_post_enable(struct hubp *hubp);
 void hubp32_cursor_set_attributes(struct hubp *hubp,
 		const struct dc_cursor_attributes *attr);
 
+void hubp32_init(struct hubp *hubp);
+
 bool hubp32_construct(
 	struct dcn20_hubp *hubp2,
 	struct dc_context *ctx,
-- 
2.39.1

