Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32855F09C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 23:54:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0159F10E82B;
	Tue, 28 Jun 2022 21:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014C510EE5F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656453253;
 bh=6Te8ZbTcfQX1nsID2hSVBb/vZZrbuGEUVVlfrQfFfXI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aaPeCZXv36f0zF9ec5N6qaPYEfjxIeSFCGksnl+2RaY6EHwdnfXg2Wq5zdtyRguou
 IurA+WnBjrRKJWUnq3iF+1N4A0A3DdL+5Dko9QgM9pe/xQC/6yj9wKUvQtrmO/OC7m
 BTTHtCuq5UQITR8pqz6Ha32eSOJGGMkOyrQyh70g=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.0.5]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1Mqb1W-1nJzrH2lGa-00mcqG; Tue, 28
 Jun 2022 23:54:12 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/32] drm/via: Add via_display.c
Date: Tue, 28 Jun 2022 16:52:25 -0500
Message-Id: <20220628215246.19706-12-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628215246.19706-1-kevinbrace@gmx.com>
References: <20220628215246.19706-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q5Cl/COzSwhnE95XIqpnyXHPdUFL0d8dMRcs4EMRNEGjbaSERfr
 LAy4mM4chr1E4cWsU45FEutQ79+79CLJW3ihIx8NWISvbHgW5P+akh3PoOQPPBo3x5llfSq
 FPfskPTZSbViDFO5CnenYOS9f3M8ABdkq+vugK88LISwVNyKDMwQ9bMSY7Lm0apB2VCiUFk
 i+KCUuStWT84JfeBgJutg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:z5JpsHztlHM=:GwzlhEt74WHPdiLz8uR8pm
 CLPSoS3LRsi6BSCgyR8iGZTKby6/KYKlFO5ZbcnjP8W/mk/0l5ME1wfnTADDxHe08qvYhati+
 6ZEcrU2tJR1ug7SNOXOzd1WoINkH14s0EKtPmMZXJ32xnAwUph1rzaAyCliF8fz6ficDOT+zp
 1BHczaHWWxXGCehB65TuxHcCwBOPrjkbO/QgM19w2VftNTPYluVpcxDqiaxfH1G0rf2KattpQ
 HQHP88W37GBXDG1PCpf+SXAETpAwn2q8fK94RGc6g5zvVb0y6DqkjrGxUka+jowew20j0NdDm
 Cj3dnU//rU1z4nxEiezSzBBaaRJst/Cod/1v+50nqoz/hJAakYXaseCkL6X6LxlQX/WRq7mW1
 8Beu3DGGZHV1qhRqRK6aRAGCvp0A2IkzmTvX+zCha4I9lE1/07z9/vzZXNsxnOqAQSkYxYjXc
 HG3pbE1vJXM6Edvd7DpilILTJ+G4MzPVpbvu5ya0NNMfN9oP2d5p0g5+BP1DTfb07/6ZVfDjd
 0bM1KAuItG2TI7JLTFJ6QgEbmi2z3SVXN9QaqPf27zi57gclYjH+r7zULPs95kVdOspC6vTkq
 d5u/a1K7s9epjxIVI3Un3DyrOaEiyVdG9MnD76+pDBoOu3rMTJnrYLeUc79nFT6RAVVBiWNm7
 Irh+4qCXc7TWWZMkrGd8pwX7jb82uwYdPewkyYnk1tcNjkxlBqsPedyGp3nvvzVl4yLZYfQi1
 e/KzE8nxbYBb3Zf1M4wgiKv+XKo6H5OhD8i75QD5TuxgC5Gu4Bwk18oWVG8HW/2hT9XFFecK0
 ZEGafzoRLc4V+iDKOhKh4ScIV5qaHwnHM+fOwF8hQwyZHiyQNLWUG9vSxDMStgCirueLlqeEd
 7BWm+NCNuwb7OQROqeyoLI9IY7iEnD71iNu9U1FykBGHyMjkAFy5Y2PY0Ofx99toLbfcYrvsM
 dkc2q1Eln3E+xcnoCGrCcEqKoPQ4up1T63gvEZ58fuCMmvBq3WKeRP+KLtqtHolfeY7p9yzYv
 bQj31CYOFuWtXTZ5R68CCuDAaNmE4AWem6LqC8uMugEWMKbX77pdGNtPSel4o6GN5VkcLmoTU
 SbQ5MAtEEUIWe/ybPeYrnfpJlc32HCJ+T2NBDC+3VWG9DEDDdtWT56MRQ==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 drivers/gpu/drm/via/via_display.c | 125 ++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_display.c

diff --git a/drivers/gpu/drm/via/via_display.c b/drivers/gpu/drm/via/via_d=
isplay.c
new file mode 100644
index 000000000000..2f82764038c0
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_display.c
@@ -0,0 +1,125 @@
+/*
+ * Copyright =C2=A9 2017-2020 Kevin Brace.
+ * Copyright 2012 James Simmons. All Rights Reserved.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sub licen=
se,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the
+ * next paragraph) shall be included in all copies or substantial portion=
s
+ * of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHOR(S) OR COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
+ * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
+ * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR =
OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ * James Simmons <jsimmons@infradead.org>
+ */
+
+#include <linux/pci.h>
+
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_drv.h"
+
+void via_encoder_cleanup(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder, struct via_encoder, ba=
se);
+
+	drm_encoder_cleanup(encoder);
+	kfree(enc);
+}
+
+void via_connector_destroy(struct drm_connector *connector)
+{
+	struct via_connector *con =3D container_of(connector, struct via_connect=
or, base);
+	struct drm_property *property, *tmp;
+
+	list_for_each_entry_safe(property, tmp, &con->props, head)
+		drm_property_destroy(connector->dev, property);
+	list_del(&con->props);
+
+	drm_connector_update_edid_property(connector, NULL);
+	drm_connector_unregister(connector);
+	drm_connector_cleanup(connector);
+}
+
+int via_modeset_init(struct drm_device *dev)
+{
+	struct pci_dev *pdev =3D to_pci_dev(dev->dev);
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	uint32_t i;
+	int ret =3D 0;
+
+	via_mode_config_init(dev_priv);
+
+	/* Initialize the number of display connectors. */
+	dev_priv->number_fp =3D 0;
+	dev_priv->number_dvi =3D 0;
+
+	via_i2c_reg_init(dev_priv);
+	ret =3D via_i2c_init(dev);
+	if (ret) {
+		DRM_ERROR("Failed to initialize I2C bus!\n");
+		goto exit;
+	}
+
+	for (i =3D 0; i < VIA_MAX_CRTC; i++) {
+		ret =3D via_crtc_init(dev_priv, i);
+		if (ret) {
+			goto exit;
+		}
+	}
+
+	via_ext_dvi_probe(dev);
+	via_tmds_probe(dev);
+
+	via_lvds_probe(dev);
+
+	via_dac_probe(dev);
+
+
+	via_ext_dvi_init(dev);
+	via_tmds_init(dev);
+
+	via_dac_init(dev);
+
+	via_lvds_init(dev);
+
+	switch (pdev->device) {
+	case PCI_DEVICE_ID_VIA_VX900_VGA:
+		via_hdmi_init(dev, VIA_DI_PORT_NONE);
+		break;
+	default:
+		break;
+	}
+
+	drm_mode_config_reset(dev);
+
+	drm_kms_helper_poll_init(dev);
+exit:
+	return ret;
+}
+
+void via_modeset_fini(struct drm_device *dev)
+{
+	drm_kms_helper_poll_fini(dev);
+
+	drm_helper_force_disable_all(dev);
+
+	drm_mode_config_cleanup(dev);
+
+	via_i2c_exit();
+}
=2D-
2.35.1

