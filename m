Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CwtGcJKdWkJDgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 23:42:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2687F26B
	for <lists+dri-devel@lfdr.de>; Sat, 24 Jan 2026 23:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5EF10E1C8;
	Sat, 24 Jan 2026 22:42:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="QsbBBwTY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-244102.protonmail.ch (mail-244102.protonmail.ch
 [109.224.244.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E05510E02B
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jan 2026 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1769259077; x=1769518277;
 bh=qzYHkVfDgHqKRy2iUlNaBaTdYYeyg67pv2PLMQ5Qz2A=;
 h=Date:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=QsbBBwTYAkEKaCrAF5wymcgA6vyy8Jz+jFK96bmdhopTFYFvAuJb066QtFXCTkX+I
 n98SxBSvRmrD07ZTTRvIvsnSP8jxLk2BjADF8Dx+l3fPL5Ul5hP5+RGvgdrPtgWhNb
 90CYK8uKURqhrRwG/66fG/3uDqjhJghpxP+Jvx8b77+wBz5XSR+v1LMNNTnct3nvyV
 gbA6jxzmnh/TcgHE3gxQp36bVySw0Z5hqWa5zUZOkdw9J/M1pglgTkiC15Q6DPpous
 oWR5m2ZjWnBfPumicND4rsE1vBY/hRQlNhG0MsCf+lsYFUWUXUVAsNngkI3EAr3R1y
 7lJMnY9xQ5KAw==
Date: Sat, 24 Jan 2026 12:51:13 +0000
From: Caio Ishikawa <caio.ishikawa@proton.me>
Cc: dianders@chromium.org, Caio Ishikawa <caio.ishikawa@proton.me>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: boe-th101mb31ig002: Remove use of deprecated
 mipi_dsi_dcs_nop()
Message-ID: <20260124124959.196051-3-caio.ishikawa@proton.me>
Feedback-ID: 84115119:user:proton
X-Pm-Message-ID: f570a0f0907bab9b2a323032081b93b7f46306ad
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sat, 24 Jan 2026 22:42:04 +0000
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	MISSING_TO(2.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[chromium.org,proton.me,linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[caio.ishikawa@proton.me,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:caio.ishikawa@proton.me,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[caio.ishikawa@proton.me,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[proton.me:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DF2687F26B
X-Rspamd-Action: no action

Replace calls to deprecated mipi_dsi_dcs_nop() with
mipi_dsi_dcs_nop_multi(). No intended functional changes.

Signed-off-by: Caio Ishikawa <caio.ishikawa@proton.me>
---
 drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c b/drivers=
/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
index f33d4f855929..01b4458e55ad 100644
--- a/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
+++ b/drivers/gpu/drm/panel/panel-boe-th101mb31ig002-28a.c
@@ -221,6 +221,7 @@ static int boe_th101mb31ig002_prepare(struct drm_panel =
*panel)
 =09=09=09=09=09=09      struct boe_th101mb31ig002,
 =09=09=09=09=09=09      panel);
 =09struct device *dev =3D &ctx->dsi->dev;
+=09struct mipi_dsi_multi_context dsi_ctx =3D { .dsi =3D ctx->dsi };
 =09int ret;
=20
 =09ret =3D regulator_enable(ctx->power);
@@ -233,9 +234,9 @@ static int boe_th101mb31ig002_prepare(struct drm_panel =
*panel)
 =09=09msleep(ctx->desc->vcioo_to_lp11_delay_ms);
=20
 =09if (ctx->desc->lp11_before_reset) {
-=09=09ret =3D mipi_dsi_dcs_nop(ctx->dsi);
-=09=09if (ret)
-=09=09=09return ret;
+=09=09mipi_dsi_dcs_nop_multi(&dsi_ctx);
+=09=09if (dsi_ctx.accum_err)
+=09=09=09return dsi_ctx.accum_err;
 =09}
=20
 =09if (ctx->desc->lp11_to_reset_delay_ms)
--=20
2.52.0


