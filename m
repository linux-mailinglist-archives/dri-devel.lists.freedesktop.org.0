Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B51BD5ACA8E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 08:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D84F610E162;
	Mon,  5 Sep 2022 06:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 321 seconds by postgrey-1.36 at gabe;
 Sat, 03 Sep 2022 18:45:50 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D997510E3C8
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Sep 2022 18:45:50 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 631555C00FE;
 Sat,  3 Sep 2022 14:40:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 03 Sep 2022 14:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxfierke.com;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1662230434; x=
 1662316834; bh=Tx3DFdgigyfpS0RGXNOmDW5kr5FUnVG7KC79bAVMMLo=; b=T
 b2mptC1d2k7blc6CQXb8fB9SsHbY4U8HviqJsA+Iy1QU7eOZElNHjEtOmUMXj5Rg
 ZqCst2AWcrYm3t4Cxm2z3txof5Mbuz2sihMwtYglMwMN5UDFBvE2sxVjtl2HzYu4
 IIloOuhkdKQAK4jUnl2poJvbuULdC/qcFZhePxTjNGv872tm8O9len3EexODi7Yq
 wemJ4XEzfMUfNpHE2PLr7GmKt7GiKycKwyLQEXw/C/CZFUnZZfWyoOxJlMG+PJZL
 zfDpHiFbmSrghJ22jZEyDxUJEQo1n6GWraDAlRI14ErRYN7gSlZqNG62vFZwbyoM
 757QdxwICyS4khF6+0hnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1662230434; x=1662316834; bh=Tx3DFdgigyfpS
 0RGXNOmDW5kr5FUnVG7KC79bAVMMLo=; b=NnQTErZDs8y0O47HjG2lI9s/qtqTR
 TjedFU0rxaiHOfL82oqwaLvRreaJrjFhzsT0wm7k5NsSrmMp53f45djmr1QIN9nd
 C2wwQ8ny5GUOw8z/njLWfRhkJhCGhaC1cou2QzvzIp7CoUyd8GOwCQb2+/xxlAV1
 +6W4CRzZOH33wNP5fqIHLJqmqfEAIpe5cA0HoLVJRCXhYlCVLF2awEe4eS8C2byx
 KFuqBNt1cNqIJgFnabU6Ba9omTBVFVkyzUZ87ZPDcus1qwLgnWPnpjr4rsVp+evx
 bgE2R58NKcdl+/FDcbl1iKIxSj6cyfw674byOSvUUR2rU35KAxPO0FhqA==
X-ME-Sender: <xms:op8TY0uW6x7B3vPPLnjgCZGfoF7G2uipvrC_9K-OCKjK5XH7BK43Mg>
 <xme:op8TYxd8cLLnRfgZR_OQuYGksO3TsEFuOFANLGCLwvt4v9OFmaOTQhU52HtVXa8jM
 cLwAbIdbFYkPHCs6lk>
X-ME-Received: <xmr:op8TY_zX9VcHgWkuQe3sKN9b8LgEbN8n5XA5TViVKXzweWqZxJdVvNBL3zFfJOqgFN0VfFm5k_aCgBOhNir3rW66mhY7PSn71tl17UVoZS5eN6oSXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelvddgudefudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvvefufffkofgjfhgggfestd
 ekredtredttdenucfhrhhomhepofgrgicuhfhivghrkhgvuceomhgrgiesmhgrgihfihgv
 rhhkvgdrtghomheqnecuggftrfgrthhtvghrnhepudelvedvtdffhfeugfelieevvedvhe
 fgvedtteefkeevvdfhieekudeuteefgeeknecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrgiesmhgrgihfihgvrhhkvgdrtghomh
X-ME-Proxy: <xmx:op8TY3PK7Dz_cgmWmp8dBkqf2e-EyrDjiJbO38aNZiLvdv7fkrTSrA>
 <xmx:op8TY09J_Ubh7eWwkU9vini7e2qdoYbKyOSnIW8zwg2-fQxtAFuyIw>
 <xmx:op8TY_XMb2GKl5aSNkauyBZS839U3p1oTuQUGocdDNzkR2wPz2dW0Q>
 <xmx:op8TY_WXNEtMuBvQhmyawHWKqMcm5QKSZ7DDrYGcoBzqTvxov05tDg>
Feedback-ID: idee9475d:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Sep 2022 14:40:33 -0400 (EDT)
From: Max Fierke <max@maxfierke.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Subject: [PATCH v2 4/4] drm/panel: clockworkpi-cwd686: Implement
 .get_orientation callback
Date: Sat,  3 Sep 2022 13:37:53 -0500
Message-Id: <20220903183753.25736-5-max@maxfierke.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220903183753.25736-1-max@maxfierke.com>
References: <20220903183753.25736-1-max@maxfierke.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 05 Sep 2022 06:28:39 +0000
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
Cc: devicetree@vger.kernel.org, Max Fierke <max@maxfierke.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Returns the panel's configured orientation

Signed-off-by: Max Fierke <max@maxfierke.com>
---
Changes in v2:
 - this was added as .get_orientation is now available in drm-misc-next since v1

 drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c b/drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c
index 87d20d784596..2c433a458c8b 100644
--- a/drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c
+++ b/drivers/gpu/drm/panel/panel-clockworkpi-cwd686.c
@@ -340,7 +340,10 @@ static int cwd686_get_modes(struct drm_panel *panel, struct drm_connector *conne
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
-	/* Set up connector's "panel orientation" property */
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
 	drm_connector_set_panel_orientation(connector, ctx->orientation);
 
 	drm_mode_probed_add(connector, mode);
@@ -348,10 +351,18 @@ static int cwd686_get_modes(struct drm_panel *panel, struct drm_connector *conne
 	return 1; /* Number of modes */
 }
 
+static enum drm_panel_orientation cwd686_get_orientation(struct drm_panel *panel)
+{
+	struct cwd686 *ctx = panel_to_cwd686(panel);
+
+	return ctx->orientation;
+}
+
 static const struct drm_panel_funcs cwd686_drm_funcs = {
 	.unprepare = cwd686_unprepare,
 	.prepare = cwd686_prepare,
 	.get_modes = cwd686_get_modes,
+	.get_orientation = cwd686_get_orientation,
 };
 
 static int cwd686_probe(struct mipi_dsi_device *dsi)
-- 
2.37.1
