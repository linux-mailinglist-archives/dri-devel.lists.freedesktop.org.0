Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAC9406991
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 12:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D626E9BD;
	Fri, 10 Sep 2021 10:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03DC06E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 10:12:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 68B1B2B0094B;
 Fri, 10 Sep 2021 06:12:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 10 Sep 2021 06:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=//PdX3qAZ6LQH
 C2/gchQ+ogB7t0gtOhnylWlMf4N1sE=; b=1tXCQiVETicjO+Q+IyuF1yNhGbldj
 whfNJ3aghKYKx0cstTMih1p0MN2tMom9CQXKM1J47++Oxy2ofKO7aFvWXI19Tsvs
 lHueFIeNtR7mK7J8hvolPypwT24xeUrk/bZuCs0wtXqaE57AhrJdj+zwTisbRi1P
 QCzReNDx943cgbkhed/K1zNi4L/JNMFsHsTRAlCY3ranVFwMy5D+7OfBjOCG6xTX
 gLLuh45ta3LA4XsBoCka1jov085XeXTkozRHqemiWV+bMf2+v0FN5wwgdvxn/8wn
 hCDZ+SucEMDzpeoSAd9Ld/bBLershkUDPJsdB9AZMuj5QpXe/WppEoUHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=//PdX3qAZ6LQHC2/gchQ+ogB7t0gtOhnylWlMf4N1sE=; b=RsLhHWUH
 s6qspdu3NxZNEPg3DM4rCKh+OTtjz0P65tgZXxGtjn81KwedEhRRz4oFIoWaPu9g
 LglxAtPlAoLxKo2Kno1l3Rrnq35+EXel0gj6F1s2nFhD7leemD5Zxs7tgaLprMLG
 4fyZrS6ZC8CYC6L72ZlxtaQVwVjdnIkBqRPLy4yY/X+TdvJZJrhLrKUnVe/2gl17
 Oyd5M/MmxsFSo+fFybpUYfB3xVmv048+qUx0T6ApXoe3IGtz2ijDnIt85qm0FX4i
 9ntBJ7f8pNAd8T+hqtjox7Li/lXgXjfCWVG9CeDxvbsmnBC767CijNPocyI6f4+m
 9t8PqqKFOn6JlA==
X-ME-Sender: <xms:ny87YR2oSjTSJPn0itMOKpB5CdIyveL2ghzAV7j1yuRYsOSpDxv3QA>
 <xme:ny87YYG-hb8MvAl_R_ekEumjiStUMWv1yRLj386RirXNM0a4f45Mqk1HpHcYIWTlj
 tjktROkMqrSydLHFLo>
X-ME-Received: <xmr:ny87YR5bZikUHXzZusyqOYjxCzdR5CcUXmIhVe31kPCOhwwCm-rPkC-BJcZ1eW6Fdxr04tonDJ044U8Od2RBJ84MdMO5Xo_OGThf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudeguddgvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:ny87Ye0r_d5IeITfhMWhqA4saBIedZB9UCH26mMIqUKXAuRFuqy5qg>
 <xmx:ny87YUFmAqjU0vTP6nJodt-rx99oOo8oHByI5jXDtQheJcL1fhKMEA>
 <xmx:ny87Yf-LttPNeTkcwP4W_zNCRcRN9fzp_p9aECCXXBQE5SjY3Cx89Q>
 <xmx:ny87YUWkwZUlEuTSzBSzgFV8h7hBXfM-oOpiJCqFNbR3aczMNklXwOWVSck>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Sep 2021 06:12:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Andrzej Hajda <a.hajda@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
 Inki Dae <inki.dae@samsung.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, John Stultz <john.stultz@linaro.org>,
 Chen Feng <puck.chen@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Subject: [PATCH v4 04/24] drm/mipi-dsi: Create devm device attachment
Date: Fri, 10 Sep 2021 12:11:58 +0200
Message-Id: <20210910101218.1632297-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910101218.1632297-1-maxime@cerno.tech>
References: <20210910101218.1632297-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MIPI-DSI devices need to call mipi_dsi_attach() when their probe is done
to attach against their host.

However, at removal or when an error occurs, that attachment needs to be
undone through a call to mipi_dsi_detach().

Let's create a device-managed variant of the attachment function that
will automatically detach the device at unbind.

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 35 ++++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dsi.h     |  1 +
 2 files changed, 36 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index ddf67463eaa1..18cef04df2f2 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -391,6 +391,41 @@ int mipi_dsi_detach(struct mipi_dsi_device *dsi)
 }
 EXPORT_SYMBOL(mipi_dsi_detach);
 
+static void devm_mipi_dsi_detach(void *arg)
+{
+	struct mipi_dsi_device *dsi = arg;
+
+	mipi_dsi_detach(dsi);
+}
+
+/**
+ * devm_mipi_dsi_attach - Attach a MIPI-DSI device to its DSI Host
+ * @dev: device to tie the MIPI-DSI device attachment lifetime to
+ * @dsi: DSI peripheral
+ *
+ * This is the managed version of mipi_dsi_attach() which automatically
+ * calls mipi_dsi_detach() when @dev is unbound.
+ *
+ * Returns:
+ * 0 on success, a negative error code on failure.
+ */
+int devm_mipi_dsi_attach(struct device *dev,
+			 struct mipi_dsi_device *dsi)
+{
+	int ret;
+
+	ret = mipi_dsi_attach(dsi);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, devm_mipi_dsi_detach, dsi);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_mipi_dsi_attach);
+
 static ssize_t mipi_dsi_device_transfer(struct mipi_dsi_device *dsi,
 					struct mipi_dsi_msg *msg)
 {
diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index d0032e435e08..147e51b6d241 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -233,6 +233,7 @@ devm_mipi_dsi_device_register_full(struct device *dev, struct mipi_dsi_host *hos
 struct mipi_dsi_device *of_find_mipi_dsi_device_by_node(struct device_node *np);
 int mipi_dsi_attach(struct mipi_dsi_device *dsi);
 int mipi_dsi_detach(struct mipi_dsi_device *dsi);
+int devm_mipi_dsi_attach(struct device *dev, struct mipi_dsi_device *dsi);
 int mipi_dsi_shutdown_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_turn_on_peripheral(struct mipi_dsi_device *dsi);
 int mipi_dsi_set_maximum_return_packet_size(struct mipi_dsi_device *dsi,
-- 
2.31.1

