Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C452B5708FE
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 19:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80CF38F68F;
	Mon, 11 Jul 2022 17:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 194168F5DA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 17:39:46 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7A7145C0156;
 Mon, 11 Jul 2022 13:39:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 11 Jul 2022 13:39:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1657561185; x=1657647585; bh=Dq
 aG14qLXqHdK4Y6h2JUk2d3R8FO9EygivlfP2JCqrA=; b=s903tdF3Z7I6DqbqLp
 XvK3Rfn14t2QdX2UPX8XCPnnefbMs1nAvZcfY8WK9NJOo4zxr/Cu04+MlGKK4iq0
 wZLf9Aq/R2E6Ligf2ffZh/Sjp0SREl31ttt7U0HfizPMEX8yzko0XHqz4WSwnAiX
 N5awyowype3rvVgggEavN8P0BNZ5Ixwfij0RUUld6kAFBYQMnipWT+S/PNhuJbwl
 Dc359MfWH/Ba2SFHnkbUIVtmrmp0ej9QhDWP6Y5HGscuo4pBSSOsVkDCZesNwHvm
 TQaGXvTqm7q8bqmADat7DVxXTsx05eL2cqDzj+veRlEvlb+9BC6x9pjL7nX6cYOt
 4USQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657561185; x=1657647585; bh=DqaG14qLXqHdK
 4Y6h2JUk2d3R8FO9EygivlfP2JCqrA=; b=ZakGkWnUh20zw+lo7sJKI3JljKdH4
 awUplkRrD7DsxLVNisY8GxNnLS7qqH0vBbHEgVRGhSAzTwhdgKba1gbNuhL71fpL
 CJDZv4162v+jW3Q5IiQt97VApPvcQF4YSwdbpsCvEZPH36ZfVvNakMLtKfGnrGXG
 sRN3WLM5+6JulCxLunvtmBHoiUgf67/VeAYbpHOKG46QiRBvv6/2PjKonv4ELVtF
 VcFcNZMT10zGUgrfxsNHGWDv28qpfgzJPGow3OeeR4GL9/uRIxVklYAe9gUMQ5nW
 M5OrIabpvGj87XLGSy/q//YD+MK3Xo6rk3AVpLZcnF9eynzHrq9b+uLIQ==
X-ME-Sender: <xms:YWDMYvSBAB4NXiCsuJcayW15XMjNCib3lylaJVKYFouLk7dO-69BEg>
 <xme:YWDMYgyp3ueJE6Vmy1miidkRe2sp2PTRop6hZBMekm0VTp1lmsPde3DmHE9ADzqhf
 w34pryKvC3Z88mxvTM>
X-ME-Received: <xmr:YWDMYk0aH_zBqKByeqT6K3T8Ss3yW3ghW97P7zn5hF9Ods2wkTweTgdLhJzF0-YX-lf6ESXB47WkqeNjCSjXIjgGG4wqJq2X-f4AcDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfef
 uddvjefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:YWDMYvDMvpQipGDskHxXBEzfF7Vg7Yh_h7rO77zeLG3mR-OzGcccSA>
 <xmx:YWDMYoim4AqJln82Av3jueQ4jebh8UPQRMFNOv35-rJXsIG_fDTKzA>
 <xmx:YWDMYjq0i23SbYjR0Rq-EIrRWzat096ivXT91FP70-H4ijHKXzyXlA>
 <xmx:YWDMYgcILfg89HGDXW7B1C0J6F1GjKPZrH9MAvIlTz3y63J-nyle3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 13:39:44 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 01/69] drm/mipi-dsi: Detach devices when removing the host
Date: Mon, 11 Jul 2022 19:38:31 +0200
Message-Id: <20220711173939.1132294-2-maxime@cerno.tech>
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

Whenever the MIPI-DSI host is unregistered, the code of
mipi_dsi_host_unregister() loops over every device currently found on that
bus and will unregister it.

However, it doesn't detach it from the bus first, which leads to all kind
of resource leaks if the host wants to perform some clean up whenever a
device is detached.

Fixes: 068a00233969 ("drm: Add MIPI DSI bus support")
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 2e25804d6ffa..3ec02748d56f 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -346,6 +346,7 @@ static int mipi_dsi_remove_device_fn(struct device *dev, void *priv)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
 
+	mipi_dsi_detach(dsi);
 	mipi_dsi_device_unregister(dsi);
 
 	return 0;
-- 
2.36.1

