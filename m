Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F3B60E4C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BF410E555;
	Wed, 26 Oct 2022 15:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C325710E50B;
 Wed, 26 Oct 2022 15:34:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2BB2F58020E;
 Wed, 26 Oct 2022 11:34:05 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 26 Oct 2022 11:34:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666798445; x=
 1666805645; bh=1T+7LmwysEui9fmTjQ2jT2uQZZdRAQ2dvrVSUd976IE=; b=o
 BHA9uC+T4rta9AjW1tIFE7JRJt2Sq3b/Be1eM2yj+25txLj+snhVlZh/g9eoCkYj
 j4OoQe7Y26L5IrXr5zstdHqIhayW/f2qmbdwEQydC9ET7yTsUHTEk0sYrJXHd5Hv
 lVuwxvR028QLJwplvnDC712COqVs3h3OCrHCB4einkDhK039n/HsV/jDkWtWV/uW
 uOhAa5AL41PDtUm2naloZSXQbJ6LXpnQ8MSpybF4dtmysoFNNaYCEhXeVlQRgkaI
 oHcOBvzyFZloDPAHn13caDLKHD+A5RAlqyxOye9zHkPK2HXp/Ir8SKVuVca+QA2z
 NX8G1M8aStT9sjDLAAk5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666798445; x=
 1666805645; bh=1T+7LmwysEui9fmTjQ2jT2uQZZdRAQ2dvrVSUd976IE=; b=h
 9kjxR5GpTLsXqxA4yq36eydTqZVdH22J/TX30KCcN+kkQhOEqtP6eB9uCPEnR8fY
 r76ujTbJ0zzMf9SlurVehA3ZGnxMCPqV8UBBsZh3+81g0Jt9rxYmf79QU0/jwCIG
 ImI79m0ZdEIlwUVyu/sNd5ZdBLyIQ1V1niwfTyqZsXe6UTRkofbW7uPVxuzQWve/
 8nbanSrtpsMoRQAsMI1CL9axRfo+SvP97qbTrDU8R1DpP/yoEq5Qb9NjKScCplOE
 9BR+ddaj/qcUkfPFwnlV9c+A2kMRgc1ZE8yBu/RoCXpl1B7d51HZOS60ITLGGUaP
 2j6CD4YTUd5ZJvZ4ToNRw==
X-ME-Sender: <xms:bFNZY3M_k0zZr1TeSkW9a4V-q80AJZarehC89QbfyBQnvFuEbNqm-g>
 <xme:bFNZYx9yrWXssm7lhRrvJUAnZEJQlechpM0N5Xj2JKdlQLCrX_x08-3a-Sy61jgGm
 yvJ54DAOii5T3IK09s>
X-ME-Received: <xmr:bFNZY2TJVS1NmMjt4umhblreF6u7uqwMu6N3ql_SeerReA1sEb_oWuMT6fS3i_nSjEHgXBxiq9WgSB-jMYi5IbaeqKgs2EbxbnDX54nMDDP9gg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtddvgdeltdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepmhgrgihi
 mhgvsegtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeefudfhgeevhefhfedtue
 evueeluddutdetuddtvddvgeekheelvefhteekteeihfenucevlhhushhtvghrufhiiigv
 pedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtg
 hh
X-ME-Proxy: <xmx:bVNZY7sDigX_F42keYldYV-Fsz26doQW9PnRRtyniHEjnYVZWsPKPQ>
 <xmx:bVNZY_dcxTFEXZaLEPF25_myvt5PxqHdYQgAreMsfRFYRO7Ty2DN3g>
 <xmx:bVNZY30bKemeK8QeikiaXvXZYacC74stTtuVxrOpMsII-A0K5jeETQ>
 <xmx:bVNZY2rIwQHEZXY1J1FYI8rRObwJmvUizrepjXBt-sHaKN4DbR3TAg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Oct 2022 11:34:04 -0400 (EDT)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 17:33:35 +0200
Subject: [PATCH v6 16/23] drm/probe-helper: Provide a TV get_modes helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220728-rpi-analog-tv-properties-v6-16-e7792734108f@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v6-0-e7792734108f@cerno.tech>
To: Karol Herbst <kherbst@redhat.com>, Emma Anholt <emma@anholt.net>,
 Ben Skeggs <bskeggs@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Samuel Holland <samuel@sholland.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=4600; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=kB8d4Q2Rea+o0SLUJtfAVmIRp8jA5wLsaZa5DDIbyWs=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmRwe7TL/xh2l7ifkGKyXLuhplXovZ6m2+8djRKSFX/7Eyt
 iCzejlIWBjEuBlkxRZYYYfMlcadmve5k45sHM4eVCWQIAxenAEzEqIaR4c2vb7EejoVpNXtXmul91t
 4iJnZVXfHHpV9JF/8Yejy6FMLIcLNp5U0zx9O2z21u3vOYPn35KyvBqMg9DkyGD3ly7NTtOQE=
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the TV connectors will need a similar get_modes implementation
that will, depending on the drivers' capabilities, register the 480i and
576i modes.

That implementation will also need to set the preferred flag and order
the modes based on the driver and users preferrence.

This is especially important to guarantee that a userspace stack such as
Xorg can start and pick up the preferred mode while maintaining a
working output.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Changes in v6:
- New patch
---
 drivers/gpu/drm/drm_probe_helper.c | 97 ++++++++++++++++++++++++++++++++++++++
 include/drm/drm_probe_helper.h     |  1 +
 2 files changed, 98 insertions(+)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 69b0b2b9cc1c..4a60575f5c66 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -1147,3 +1147,100 @@ int drm_connector_helper_get_modes(struct drm_connector *connector)
 	return count;
 }
 EXPORT_SYMBOL(drm_connector_helper_get_modes);
+
+static bool tv_mode_supported(struct drm_connector *connector,
+			      enum drm_connector_tv_mode mode)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_property *property = dev->mode_config.tv_mode_property;
+
+	unsigned int i;
+
+	for (i = 0; i < property->num_values; i++)
+		if (property->values[i] == mode)
+			return true;
+
+	return false;
+}
+
+/**
+ * drm_connector_helper_tv_get_modes - Fills the modes availables to a TV connector
+ * @connector: The connector
+ *
+ * Fills the available modes for a TV connector based on the supported
+ * TV modes, and the default mode expressed by the kernel command line.
+ *
+ * This can be used as the default TV connector helper .get_modes() hook
+ * if the driver does not need any special processing.
+ *
+ * Returns:
+ * The number of modes added to the connector.
+ */
+int drm_connector_helper_tv_get_modes(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct drm_cmdline_mode *cmdline = &connector->cmdline_mode;
+	struct drm_display_mode *tv_modes[2] = {};
+	struct drm_display_mode *mode;
+	unsigned int first_mode_idx;
+	unsigned int count = 0;
+	uint64_t default_mode;
+	int ret;
+
+	if (!dev->mode_config.tv_mode_property)
+		return 0;
+
+	if (tv_mode_supported(connector, DRM_MODE_TV_MODE_NTSC) ||
+	    tv_mode_supported(connector, DRM_MODE_TV_MODE_NTSC_443) ||
+	    tv_mode_supported(connector, DRM_MODE_TV_MODE_NTSC_J) ||
+	    tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL_M)) {
+		mode = drm_mode_analog_ntsc_480i(connector->dev);
+		if (!mode)
+			return 0;
+
+		tv_modes[count++] = mode;
+	}
+
+	if (tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL) ||
+	    tv_mode_supported(connector, DRM_MODE_TV_MODE_PAL_N) ||
+	    tv_mode_supported(connector, DRM_MODE_TV_MODE_SECAM)) {
+		mode = drm_mode_analog_pal_576i(connector->dev);
+		if (!mode)
+			return 0;
+
+		tv_modes[count++] = mode;
+	}
+
+	if (count == 1) {
+		mode->type |= DRM_MODE_TYPE_PREFERRED;
+		drm_mode_probed_add(connector, mode);
+		return count;
+	}
+
+	ret = drm_object_property_get_default_value(&connector->base,
+						    dev->mode_config.tv_mode_property,
+						    &default_mode);
+	if (ret)
+		return 0;
+
+	if (cmdline->tv_mode_specified)
+		default_mode = cmdline->tv_mode;
+
+	if ((default_mode == DRM_MODE_TV_MODE_NTSC) ||
+	    (default_mode == DRM_MODE_TV_MODE_NTSC_443) ||
+	    (default_mode == DRM_MODE_TV_MODE_NTSC_J) ||
+	    (default_mode == DRM_MODE_TV_MODE_PAL_M))
+		first_mode_idx = 0;
+	else
+		first_mode_idx = 1;
+
+	mode = tv_modes[first_mode_idx];
+	mode->type |= DRM_MODE_TYPE_PREFERRED;
+	drm_mode_probed_add(connector, mode);
+
+	mode = first_mode_idx ? tv_modes[0] : tv_modes[1];
+	drm_mode_probed_add(connector, mode);
+
+	return count;
+}
+EXPORT_SYMBOL(drm_connector_helper_tv_get_modes);
diff --git a/include/drm/drm_probe_helper.h b/include/drm/drm_probe_helper.h
index 5880daa14624..4977e0ab72db 100644
--- a/include/drm/drm_probe_helper.h
+++ b/include/drm/drm_probe_helper.h
@@ -35,5 +35,6 @@ int drm_connector_helper_get_modes_from_ddc(struct drm_connector *connector);
 int drm_connector_helper_get_modes_fixed(struct drm_connector *connector,
 					 const struct drm_display_mode *fixed_mode);
 int drm_connector_helper_get_modes(struct drm_connector *connector);
+int drm_connector_helper_tv_get_modes(struct drm_connector *connector);
 
 #endif

-- 
b4 0.11.0-dev-99e3a
