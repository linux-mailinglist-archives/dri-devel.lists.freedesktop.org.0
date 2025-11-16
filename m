Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DDC60E0E
	for <lists+dri-devel@lfdr.de>; Sun, 16 Nov 2025 01:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5A610E070;
	Sun, 16 Nov 2025 00:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=rocketmail.com header.i=@rocketmail.com header.b="h7w8AFDp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic309-22.consmr.mail.ne1.yahoo.com
 (sonic309-22.consmr.mail.ne1.yahoo.com [66.163.184.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D303B10E09F
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Nov 2025 00:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rocketmail.com; s=s2048;
 t=1763252864; bh=aX9bDCarybqRabI1m9orgwYtyLves6dkFPQroYdr3wo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=h7w8AFDpOXTOn5KpIM4rA/5YgaxF3I4yUJ0URKuSI+oWYQoSzvKZSBeblyfmwCB8BcM1AdfnohIeVlemGbmi1xLAb+Yty+sqz1pK9egU1cBrWUMK8+1QRATycO/rKa6k/SGVrzCwf4lDy08YHo7botMh+XFNW5QJT/CfhGkRglAqewxCfkZXWKCvTdltQLGo1nCUXiGbyeb3WtnSXVWqMxuGLl/khudDRgSdHUVtPvsieLzHrmbu3Yhmmagt3B9uJ0yApfxSO/vQcLpf2l8Idgl2/WVxsU1rbNbOM/KXcT9sPVnaO8gBOKhX5X1y2SdnBptVJZ0WQLQqRSbUPkICZA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1763252864; bh=cXpn+AuSq3Hl+yKw0Ao9E2TAl2WOiTTPfdmCVHwd3dD=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=XLDiajKxwFgLAWDOzzaAbJd4piDrsp1wjZWbhLoJV8sMcKbAXoBfZp6uTbxLF5OGs1+LHgoXxmsDELmN/MHwVMlR1GyoUtMXycd53+UQpe4Qgaz55/wanQ0dRwhR+UMBLL5GL4PnKJTYT5fLlZDLgBxjp5dqswt8Y4dbgHgJmqQvO9Em8ZBarLp9kBlSAAxNUqo8gXF2odaJXoNJyywRHzRblzycV699TnjJFxLpzouW+3hgkO+TT0hmxNPkQGbNtN2KmqA08FKzvKhwWXjnFHcUPe1bBEtASlr6SkgfjfnQnGHQgI5odpi0i25fuAtHYawl/rjwrX6UQlZDQnqpxA==
X-YMail-OSG: tYc.aFUVM1lGHnzjj98zdSL_tY2R_5.PQx1W5459QDyqa.pdWob3PMVwvbSKkRU
 8JmZEvwZXPMl.In04DRWxAFakLQRDSv3IurYxUrH0ufPpJSjcKx7fW3lsN7njZkRFEfY2VyjO5Zl
 UrkCJf2cP8efUdZKs_tRVPFn43Z_X1nQZvJ.Pb4U9Oo_G5k3JU14yF8YVRDaqixa40FAk6I8YQzr
 L7xm22GEvgGj1iAHkdOoaEeQD.F4D1.U4u3mmnWhLTSc.oIZyRGvka5qaIAZ8zeloiAB00yRVYbH
 3ReTHlGsazQuxZ1.zwHaoKqRSVjGST_VR70HltW2JqAUYyhXlL.Cxp7CkI_xCir_he.Xsx4QXbsj
 8xJnrq8AVVrhBLeqowu8M49Xerh9lnqdNozmWtopOoJh9HDdnzX4WEZlXcVWnVwmCcnHvWTz1vjH
 cEYL0HzVGcy7XUHBjEHUKGAb4SLPXjc7D2.aiTDqVH9fITAnlUzr_DFK1dt_0.k8c6ZTXRtqtAau
 U0e1423aRUNh7zdWq3VpxnbL49ikTUlm7DyL7WodTVIveMZ1JffNatqGVLLmA27cTtfZ0cKjCLdX
 RZ99LMy742SXkML733P5.0aG9NCXT9jtY1pb4MDMNMvI6izD3dkoh9I99LAJBDByBDQaRBM8YPSS
 qd7woiz0TmNP7YgxtyZNbvcu8o7UsxFcvRYEzA1qPXdjsssMjo76dj9GvD4OjKnVxTUQI39ftULU
 QS13hKeh.KJ4pDLQnnYOFCEPHVjaOOBKiCOy3sM68eHr2DQ1SUMt0Tba2s3Z6pjACcq1ad1o17.K
 9KEQ2zWoLo0WIC5aiRYNFjzyBQVJ0AmLS0HhAjNu.DBLsSqUJMT3Tw2m85s1YHqbrLQKRE7dqZkP
 4Dcc.mar8FUhtVVMaKSqIoPnHI6QqcVKOe23hIwHLnrnVDLHns3ZZ5Jf6WgKtYoFME4RYFYArzCB
 DMYrLi5IeIoNCnMgTR_q.YKHPPY8XWRhqMUs.xxzCS8oM3jSfSMGSNQcJKNaOQpoD5h39n6_r.xm
 TiaUPOYUaLzHYDEjkxZTrE7dsqrSxWGIHvu2_mibMO8Esr6vaoSWEDIAKc3H.a8u3bExCOyd_ud6
 qq3jwBAuiTfQKJLeqXFIkpsol83t36j9x8AMubbH_X0g3fCWGzjPoG7iKhffZqA4s3AvivKh5W8j
 yicLAiBwqdxhmK0nKfr7Q2attyswEK8zY5Rnr5OIdWs3gGOa930K2tQwTj9AuVY9GYRsmFE2vqVp
 P_Er.ZO2vl4AfFhV3rlRCSMLpc8ERWTf5poqdn3dhyiOfNFAWKxz0qpfYgXteV06dpRIVjabHs7S
 VWqs1TyS_YEsJtH4gz9IrVh8Az4iQX3kBM4.KocUzASkmLpJVTMnolnWy1sxAUbse9.8stpOE2sQ
 MfQMHO.F7XXLb0byWmLmCx8JYQSa5pQoTZd5JC0svuDOxkqpHOXwu_97pDbxnoOaz_NzaOsO13yX
 iws57Bupngi6DXoLbszOrv2MDEQ7uT5.d0eTv2Ts2edu3YE7XeccNut90dDClO_8InDpaNDEFPxe
 94z_oNs561pObFxEBQHNtD8jtxqLWyFEHaOjNRHC5XYdl9b7eURXaHseNNK.1.ImCzX2OecHNrZt
 x4aKVDKmlUz4Lp6reYknvQj86QXG_0gECJLiXgd8dlcEvAmRwgMv1tZvx8dfESDhnmV6FNTT5z8G
 wwIo38YnM0J6WOdX5q9YH2xTcnhDXde2tqDwuwdpi77o3Y5xZXN.HUTf08T8YequMhiW4A1abDI5
 yV255Pavi6dI.F_EJ7FEKOuaFe9TLxi04R9kOGul3FUQdVSwOXkZgthm0pFtnqVm7FlxwFRgw7rJ
 IbPSvOnIS90MJYVxJK1g6VE3m4tGUIpFHYLgrT8je3vLOI83G4TCyKD0fotb6Hizib.xj8qwgxPA
 1RPPcNK5NISE5SdVvUC65BRVTtt._fMrbo4w0ZM.6CqLj37M8Ppwo1rSeeDXN9I4hcK3vFAABemk
 l0n8kfcnzRpgyQNMkiwdZVeExa7g4GKdGh7CBymRr7.rtGaEc6GzA6JcV1y1ocq3B1_TQsbN3_By
 5DtHjPzfcif11thP8jdRNWOivdEwBmeth3FoiPlJSXOnw2AM8GOct0XiUoSftGkkkbo6X3HB8PuU
 4eKqRFINzqO0C2Oi05xuS0Msng4L_QRE3KPD14JfMWCdDOAY8vbNwkfgXwWC7rT10PQtMPcKSEvk
 pRl7FfWINq9zXNdL8Olxh0DhhuQSrCFcFwHVfSZWDX.1Ur7hwBKgOprCnsrBTAN8uaGwi.XW0TC2
 _Q9Ao8GIuZJSUpCsjhVlXCnsY9NUvJvpBkhvEbwtnLIf5d5gKdrg-
X-Sonic-MF: <lxrmrz732@rocketmail.com>
X-Sonic-ID: 32aad50b-1538-4144-adb4-af40c00e679b
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Sun, 16 Nov 2025 00:27:44 +0000
Received: by hermes--production-bf1-58477f5468-k9hpl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 3a3c42801977728ceadb395fe82b8b03; 
 Sun, 16 Nov 2025 00:27:39 +0000 (UTC)
From: lxrmrz732@rocketmail.com
To: lyude@redhat.com,
	dakr@kernel.org,
	airlied@gmail.com
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Alex Ramirez <lxrmrz732@rocketmail.com>
Subject: [PATCH v3 2/2][RESEND] drm/nouveau: implement missing DCB connector
 types; gracefully handle unknown connectors
Date: Sat, 15 Nov 2025 19:21:17 -0500
Message-ID: <20251116002628.21930-3-lxrmrz732@rocketmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251116002628.21930-1-lxrmrz732@rocketmail.com>
References: <20251116002628.21930-1-lxrmrz732@rocketmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Ramirez <lxrmrz732@rocketmail.com>

* Implement missing DCB connectors in uconn.c previously defined in conn.h.
* Replace kernel WARN_ON macro with printk message to more gracefully signify
  an unknown connector was encountered.

With this patch, unknown connectors are explicitly marked with value 0
(DCB_CONNECTOR_VGA) to match the tested current behavior. Although 0xff
(DCB_CONNECTOR_NONE) may be more suitable, I don't want to introduce a breaking change.

Fixes: 8b7d92cad953 ("drm/nouveau/kms/nv50-: create connectors based on nvkm info")
Link: https://download.nvidia.com/open-gpu-doc/DCB/1/DCB-4.0-Specification.html#_connector_table_entry
Signed-off-by: Alex Ramirez <lxrmrz732@rocketmail.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 73 ++++++++++++++-----
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..d1fed2beee63 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -191,27 +191,60 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	spin_lock(&disp->client.lock);
 	if (!conn->object.func) {
 		switch (conn->info.type) {
-		case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
-		case DCB_CONNECTOR_TV_0     :
-		case DCB_CONNECTOR_TV_1     :
-		case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
-		case DCB_CONNECTOR_DMS59_0  :
-		case DCB_CONNECTOR_DMS59_1  :
-		case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
-		case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
-		case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
-		case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
-		case DCB_CONNECTOR_DMS59_DP0:
-		case DCB_CONNECTOR_DMS59_DP1:
-		case DCB_CONNECTOR_DP       :
-		case DCB_CONNECTOR_mDP      :
-		case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
-		case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
-		case DCB_CONNECTOR_HDMI_0   :
-		case DCB_CONNECTOR_HDMI_1   :
-		case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
+		/* VGA */
+		case DCB_CONNECTOR_DVI_A	:
+		case DCB_CONNECTOR_POD_VGA	:
+		case DCB_CONNECTOR_VGA		: args->v0.type = NVIF_CONN_V0_VGA; break;
+
+		/* TV */
+		case DCB_CONNECTOR_TV_0		:
+		case DCB_CONNECTOR_TV_1		:
+		case DCB_CONNECTOR_TV_2		:
+		case DCB_CONNECTOR_TV_SCART	:
+		case DCB_CONNECTOR_TV_SCART_D	:
+		case DCB_CONNECTOR_TV_DTERM	:
+		case DCB_CONNECTOR_POD_TV_3	:
+		case DCB_CONNECTOR_POD_TV_1	:
+		case DCB_CONNECTOR_POD_TV_0	:
+		case DCB_CONNECTOR_TV_3		: args->v0.type = NVIF_CONN_V0_TV; break;
+
+		/* DVI */
+		case DCB_CONNECTOR_DVI_I_TV_1	:
+		case DCB_CONNECTOR_DVI_I_TV_0	:
+		case DCB_CONNECTOR_DVI_I_TV_2	:
+		case DCB_CONNECTOR_DVI_ADC	:
+		case DCB_CONNECTOR_DMS59_0	:
+		case DCB_CONNECTOR_DMS59_1	:
+		case DCB_CONNECTOR_DVI_I	: args->v0.type = NVIF_CONN_V0_DVI_I; break;
+		case DCB_CONNECTOR_TMDS		:
+		case DCB_CONNECTOR_DVI_D	: args->v0.type = NVIF_CONN_V0_DVI_D; break;
+
+		/* LVDS */
+		case DCB_CONNECTOR_LVDS		: args->v0.type = NVIF_CONN_V0_LVDS; break;
+		case DCB_CONNECTOR_LVDS_SPWG	: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
+
+		/* DP */
+		case DCB_CONNECTOR_DMS59_DP0	:
+		case DCB_CONNECTOR_DMS59_DP1	:
+		case DCB_CONNECTOR_DP		:
+		case DCB_CONNECTOR_mDP		:
+		case DCB_CONNECTOR_USB_C	: args->v0.type = NVIF_CONN_V0_DP; break;
+		case DCB_CONNECTOR_eDP		: args->v0.type = NVIF_CONN_V0_EDP; break;
+
+		/* HDMI */
+		case DCB_CONNECTOR_HDMI_0	:
+		case DCB_CONNECTOR_HDMI_1	:
+		case DCB_CONNECTOR_HDMI_C	: args->v0.type = NVIF_CONN_V0_HDMI; break;
+
+		/*
+		 * Dock & unused outputs.
+		 * BNC, SPDIF, WFD, and detached LVDS go here.
+		 */
 		default:
-			WARN_ON(1);
+			nvkm_warn(&(disp->engine.subdev),
+				  "unimplemented connector type 0x%02x\n",
+				  conn->info.type);
+			args->v0.type = NVIF_CONN_V0_VGA;
 			ret = -EINVAL;
 			break;
 		}
-- 
2.51.1

