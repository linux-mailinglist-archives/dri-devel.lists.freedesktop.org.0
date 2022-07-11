Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D988570945
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20F8390363;
	Mon, 11 Jul 2022 17:41:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7272790359
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:41:36 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id CA9C95C0102;
 Mon, 11 Jul 2022 13:41:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 13:41:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561295; x=1657647695; bh=yk
 Jw2SEo4XpqErhqLa15PfxvMmjlMgg0/ajy7y8+cdI=; b=mJkw+HTFYwMUvYruHK
 h8UP9xaTmPCLoFJh56n4xc+zTOM9r3bK5hlqseNxen18t+FIEz1P+GqYePeMIrZ0
 BUNrIBd4fDF2loEJ3PeBs89pT1au1OcP0iXGfP3Vo/fIgn8daIPVtyb42BB04EyH
 Ng8pOKJNM6Eki/dZUoFDL+LZOw23fByu6jR/3LxgAxL9Um9WHYSxQ1c9H15cFXO9
 7nS9O40xwMOia7s/kj+JGWbL2um1duAtlI/yyITvtjGO9qkKHe9WPHc/SGfHOgcN
 0Zob6119BVh4ONQ0bnuQarROrI6QolND1QugfFJBt3tMHlcxHsJ6tHQ9NdBCJe0S
 ZLHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561295; x=1657647695; bh=ykJw2SEo4XpqE
 rhqLa15PfxvMmjlMgg0/ajy7y8+cdI=; b=QXGmFcoVdBzQQ+s5AAKkVOg5vpDqf
 c5qhsK04vyvDUnGwxotA3giHaNMvJT0BVmvNHus65inHzPVTPzY4nhfk9jYQPIef
 QQ9xf15GdIsx1T/u6xnHSbUCqUzlu4UxtW/ZoqRwAZjcIR3UvZpEcTe3+HlbsZUO
 CwPkoUv2jbXUEYfxDor6F43AXhEkv8n4nk+9GWXhnh4vQ6Qfvxr/m6xUtUkb5VkV
 t9jSdpyjqfXrFXf4COGrquw6IZboPyfEdHn/Vqna/fk28jyAYuAW2ihPqocvwfWn
 DXrnEh4UZAqWMcqmFyoFO3acVGddcK4m0yO9eMlfcdUUQNiy2aNML385A==
X-ME-Sender: <xms:z2DMYoJ3AJcELmCzJebwtT1GrSZ3KwrHQi63_wojG75PCTvEeYh7RQ>
 <xme:z2DMYoLKX-bC1dpuqqsgH1EP6I47uhsYS6rxBUnmhvCichDD2dt6f7PrjnJUmmm3w
 2o3jqohUKhLZRIqhcs>
X-ME-Received: <xmr:z2DMYotd8on5bVmcaCiSDNASt79dnPAjSXxWELSrUpmnJ3hJArK953F6v-ZVfgOyO8sXLNquFXIWvQn4pw1vWHBOiS5Lkjtfvyx3b_c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:z2DMYlYiRIfr_ReUb36QNjtHdiTsNG0QQFlAV-KK1xsWvB1fN33q3A>
 <xmx:z2DMYvamZ0bXjFwfj05Fs6peP-CneJYKifUALb1ozwQtRLD8F3Hu-A>
 <xmx:z2DMYhC30dlBtTYA-SGS2DUON2NI_PqS58bgjN1j2na7Ajojaa62cQ>
 <xmx:z2DMYuVGzwlsX6MnCg_7umJUKo57rUsKrFLU8kYP4Oce_JeWugffTw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:41:35 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 66/69] drm/vc4: perfmon: Add missing mutex_destroy
Date: Mon, 11 Jul 2022 19:39:36 +0200
Message-Id: <20220711173939.1132294-67-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711173939.1132294-1-maxime@cerno.tech>
References: <20220711173939.1132294-1-maxime@cerno.tech>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

vc4_perfmon_open_file() will instantiate a mutex for that file instance,
but we never call mutex_destroy () in vc4_perfmon_close_file().

Let's add that missing call.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_perfmon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_perfmon.c b/drivers/gpu/drm/vc4/vc4_perfmon.c
index 79a74184d732..c4ac2c946238 100644
--- a/drivers/gpu/drm/vc4/vc4_perfmon.c
+++ b/drivers/gpu/drm/vc4/vc4_perfmon.c
@@ -133,6 +133,7 @@ void vc4_perfmon_close_file(struct vc4_file *vc4file)
 	idr_for_each(&vc4file->perfmon.idr, vc4_perfmon_idr_del, NULL);
 	idr_destroy(&vc4file->perfmon.idr);
 	mutex_unlock(&vc4file->perfmon.lock);
+	mutex_destroy(&vc4file->perfmon.lock);
 }
 
 int vc4_perfmon_create_ioctl(struct drm_device *dev, void *data,
-- 
2.36.1

