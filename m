Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D64EE3409C9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB38D6E911;
	Thu, 18 Mar 2021 16:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C18E6E90D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:13:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 94922165A;
 Thu, 18 Mar 2021 12:13:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 12:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=YwTMjG3rZyCS1OsU1SfsayiBq+
 7Wkm9LEwu3OUhJoMU=; b=arusMg/Q6JcfJwvNKUgWgeF23Ow8D+NGzLL4UowZVs
 FQmHUXA0tJv6zJ7jZcEbMZCndLNgyblpetDJY2SlnVERo4ALW1NAjHY6q6beVPCL
 YrsVjvfrKpQDxOK4eQod1WH4qI5MaQDlcpp7g9WH7viqCjGooXSNaPpdqW40Gjah
 M/cm38FEoNU0VicAPrwxY4GhMvplGlh/QsHeBT9H4GRrcBMFoJUacUlg5ZpJ9e/b
 AIwW18DJNZsI8gaVVUXyCZHFQJyUw03E+ohDS53riHwHQMbeqoUMtYUagW8W0yn4
 7kDeF8O6gtlF3hFSd/X3GTOaYzOzVy6HVnVaqv+3cTFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=YwTMjG3rZyCS1OsU1
 SfsayiBq+7Wkm9LEwu3OUhJoMU=; b=Ok8cm7C0lCo8+e28EvhStU/vGIsttAURH
 vLiVZSN1dxUJsHN9LstJYhEwwNU33m+JhmXs0P7gfoIxMPa3O7Nu446YngUVcrdx
 HASGiWHDAiZ5ovVAagc1dK5h462NjDeW5MdN/4ioz72Mcz8V7Lf22I6mJGmz8plr
 oxB/73kNv70HtS0HeA6sqpjtaKS8iHZ9sDFXCzi+f3avpIWQyGNND/WyOBpqBjXd
 grAKh/lK4p5eI5MfVKj8i7Y8vM1tlE+XQdPQT/INKWlvBiYT8Mj6inqivS9w4g7o
 rqubHKds6ebCCxY0hLdXC+J33wp+nOGbk78AL9iwS5UvPBwcKGLLg==
X-ME-Sender: <xms:K3xTYHqOGOZ1njiwhQZ9YsXf-VMVD4U_NXQHYkHP73xr5UNCDQq1Jw>
 <xme:K3xTYBpi5HR0Y36TmSH9YpCUjTdQPqkAZ_5On9Y30WX9q5LEdm37g14vTgGPqNIQW
 0lbZffzoahH5mzq9uQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeffheduvddvvdelhfegleelfffgieejvdehgfeijedtieeuteejteefueekjeeg
 necukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:K3xTYEN5uei3giiVAIRxg2gg5oVwXS_lNOHKwdx5im0dblJrpofHcQ>
 <xmx:K3xTYK4_kuKbVoyvwEsD-J1fpKcB-skmZlRm1FYszt9I8GSMzyCStA>
 <xmx:K3xTYG41J7IL-GqUPT0MFXZZuRfj8Gft1m8fdNA4JvW4YYKyC9PfjQ>
 <xmx:K3xTYMlygAsb7aK3sepvC7QyDmOd_-0eOdcqloXl4D5Yzhhk-EgTeg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id E498F24005B;
 Thu, 18 Mar 2021 12:13:30 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/vc4: plane: Fix typo in scaler width and height
Date: Thu, 18 Mar 2021 17:13:26 +0100
Message-Id: <20210318161328.1471556-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Maxime Ripard <maxime@cerno.tech>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vc4_plane_mode_set function still accesses the scaler target width
and height using the older register layout while it was updated with the
BCM2711, and the proper defines got introduced when we started to
support it.

Fixes: c54619b0bfb3 ("drm/vc4: Add support for the BCM2711 HVS5")
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index eb37d7f8a118..3fdc32244b59 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -912,9 +912,9 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 		if (!vc4_state->is_unity) {
 			vc4_dlist_write(vc4_state,
 					VC4_SET_FIELD(vc4_state->crtc_w,
-						      SCALER_POS1_SCL_WIDTH) |
+						      SCALER5_POS1_SCL_WIDTH) |
 					VC4_SET_FIELD(vc4_state->crtc_h,
-						      SCALER_POS1_SCL_HEIGHT));
+						      SCALER5_POS1_SCL_HEIGHT));
 		}
 
 		/* Position Word 2: Source Image Size */
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
