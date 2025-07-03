Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2E9AF6D39
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 10:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7D8F10E169;
	Thu,  3 Jul 2025 08:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.b="t2VFBL5F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Thu, 03 Jul 2025 03:53:04 UTC
Received: from out203-205-221-252.mail.qq.com (out203-205-221-252.mail.qq.com
 [203.205.221.252])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853D110E0A8;
 Thu,  3 Jul 2025 03:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1751514777; bh=F+ILISzDjtPPxv3dgfZUBuIfwYunt431F1PsflXRPJM=;
 h=From:To:Cc:Subject:Date;
 b=t2VFBL5FUawREaLL+yclxgZr7IlquCfWkeKP/VhwVk3WRQIsR2j4Q+PpMr2aAPfqX
 amWduCK5nRLW37+j3pSd1y9l5fILq6V6q0Ini+DcjM/Bg88d7eLIGskDXrtbyBoD7o
 NyysT/LsiwYVO7gpHc/UPZ/ZHwneaIzedKWGBpfE=
Received: from VM-222-126-tencentos.localdomain ([14.116.239.37])
 by newxmesmtplogicsvrszc13-1.qq.com (NewEsmtp) with SMTP
 id 9E327C20; Thu, 03 Jul 2025 11:39:35 +0800
X-QQ-mid: xmsmtpt1751513975trlfmosn8
Message-ID: <tencent_4A53F3018A4E9A1EAECFAD853F6952D67B06@qq.com>
X-QQ-XMAILINFO: OEnxXf6IMmheJ7ACWL7UaaRa8R2XU0uytHp9G+VfxLWKLXqiLR0EJcNmnngBLa
 UyD99zyxTwuxpuZaT0E9S6jYVq+Rj7ufMP7AYRjbLCFVwlDFeIae+t6y6ITtyJiW4h3gWhhyvbI7
 zK1imbEOGJ8Rtzh7+ZUWYCIqXRYbCWTdp2yDVnWGG+8ZqUmylc/MPwCKQ3MLVo+Cu1aUFqxLAY0D
 FXRfxjnx2dBBUhKJnVw6R/9ghxeMXbYi24sLdP/BYsUSykWcOli+KOOrx+sui4d1usOWMActFjiV
 HPNlLjvIV4LqaYH0eMl8A8ceOvo3f69kwCXN938j6BGKQjvwa++XNdLrygakREJkivRhowkRnp0x
 rr1A+aEf+Lqiub/fa2p3396BGJkHvgeXnvuA8pGEHsTEvlMGLLWDveLnEzC7dB9xYgfJYvQQ9oCP
 lCWAihZFX42H3qZEeAWPBxI3z8p+xiY73eatQZzBg4r6QC4Hg2SW3lvigq57s/Tx/fVVL/6qCaNz
 ta48b1UusOU+X9lRqibTE/v6ECfho7Pq4d2bpnSvKksjOxNvMVbEMTnwbf9rmmIzDLZ4lWLJnv6w
 UowmV0XYnomiN7sZjyd0Qszhyt6ahnMh5LhbBEDkenQIuLc2S2qkis3A/WJwl8PZKlkQ2qatVBVA
 eRNMVYsLvRMwiMSQenu0Kpkmu3lJm+oTwbq/rz9crU83PleXDABoVxSBle8OdRmcHi8KOdYbJIza
 XinphfatitXh2pR5ze6ewDHbgV2IiZ8YAqpTw2hmCeUL+yFsXd9Bd0thuCiDkPB09ovRVG9UMugv
 W5/Z0YbxgdF4QjhWpxNP5kb6DQjJBkSBGEi4R84g5FTdcg7UwWlrJh2NMdSX4rmcgB/J3h3H+P6W
 ScfUGubsKIECqTqvp/peOzK53dPaxQoSt2xpoWXME0gUevza5vIPF6kly6JCtcqwXCWf/HPSANMm
 kOPmZ4Nk773NdImwy6O14dHzVCyX2eSXIzCuqB1m34Qz4pCINi5uEx+eYMkDw7F6743cDZZdsmJU
 NlNn1NjxNf+SEPBfm0M1whDKjSo8987d0x1+w0EA9PGoUtfeFykOE3TH7XbXhDtxCpF49ybg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: jackysliu <1972843537@qq.com>
To: harry.wentland@amd.com
Cc: sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch,
 alvin.lee2@amd.com, aurabindo.pillai@amd.com, Dillon.Varone@amd.com,
 Austin.Zheng@amd.com, Sung.Lee@amd.com, mario.limonciello@amd.com,
 Wayne.Lin@amd.com, ryanseto@amd.com, linux@treblig.org,
 joshua.aberback@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jackysliu <1972843537@qq.com>, jackysliu <Security@tencent.com>
Subject: [PATCH] drm/amd/display:fix a Null pointer dereference vulnerability
Date: Thu,  3 Jul 2025 11:39:28 +0800
X-OQ-MSGID: <20250703033928.2201509-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Jul 2025 08:41:37 +0000
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

A null pointer dereference vulnerability exists in the AMD display driver's
 (DC module) cleanup function dc_destruct().
 When display control context (dc->ctx) construction fails
 (due to memory allocation failure), this pointer remains NULL.
During subsequent error handling when dc_destruct() is called,
there's no NULL check before dereferencing the perf_trace member
 (dc->ctx->perf_trace),
 causing a kernel null pointer dereference crash

Signed-off-by: jackysliu <Security@tencent.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index 56d011a1323c..3bda0593f66f 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -934,6 +934,11 @@ static void dc_destruct(struct dc *dc)
 	if (dc->link_srv)
 		link_destroy_link_service(&dc->link_srv);
 
+	if (!dc->ctx) {
+		dm_error("%s: called with NULL ctx\n", __func__);
+		goto skip_ctx_cleanup;
+	}
+
 	if (dc->ctx->gpio_service)
 		dal_gpio_service_destroy(&dc->ctx->gpio_service);
 
@@ -946,6 +951,7 @@ static void dc_destruct(struct dc *dc)
 	kfree(dc->ctx);
 	dc->ctx = NULL;
 
+skip_ctx_cleanup:
 	kfree(dc->bw_vbios);
 	dc->bw_vbios = NULL;
 
-- 
2.43.5

