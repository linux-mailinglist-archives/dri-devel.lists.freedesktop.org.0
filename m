Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D90A755A2B5
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0397310F2DA;
	Fri, 24 Jun 2022 20:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0726610F2DA
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1656102802;
 bh=N21UouMX0PjBpgzwi5zMu0vky0OumvdCacubu3Nynn0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Nj+umWsH3KIDVirwvFT8W+amf7NxLt9kf1qxR0+YlaihmBuoBJrDhV4xOPp7+tRZY
 tO89FapKL71qveSnXSdO8Cji0xinK72eQwUF5gngsd7t3/rfNQMLH3GvgMcRw99f0Y
 k2gJ0VubVUahXZwpeI3PLF0n7fjYdkTKLrq8vRPM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([174.250.50.2]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1Mlf0K-1nMSZ304pu-00ikdQ; Fri, 24 Jun 2022 22:33:21 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 21/28] drm/via: Add via_sii164.c
Date: Fri, 24 Jun 2022 15:32:52 -0500
Message-Id: <20220624203259.4051-2-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220624203259.4051-1-kevinbrace@gmx.com>
References: <20220624203259.4051-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HGlbkK/vfBz8JjXii7vgwh3WWrFDCGCwSWWye51S/ZZkcBNCL2d
 r7T28ReM08UM0EFqHTD8gaAB9sZieYg5jtQAnl8YYca+zHbb94K63GJy2wtSJBEgFh9GRmE
 t4Jdtwixazp91tRZY/ep80SmrVu2JNidYoY+E5TpLQB/+kqdXWvJcraPGKr3Vb9cB+rLF9F
 h5N+dftUcWyMjz4bN08Pg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:an5giOUBReI=:6wXwtKZBMvf4/6g/AF0JDY
 40eX8rG8uk3IB/KpiKVEDd5RDAPPCOUi37yt+4yfBvxbKuacJS48Fko9jlhdfVVzjsN+/OT32
 PcDcAb3peVhc8Yt3CMIuUg37kUffzU7QQnBU3DyDgDNAkQVJDC4CvfDGjCILCctaPcT9+kPsL
 grQ2fP8W7F3BqGl+bgRKx1xPhC3iRfesBnw1I1kxla/iMSpZbrqSp+NJX5+MMlTPYMf208Cmk
 Zb+sXSJIEi8y68l0NKcaUQw//+9C4Gf6nzNoe+cYKZfulHCW4VWriu+uHbHkhoCkt/plYG48y
 CNqiIKyz5r3AZ50YufoVWDNLsPt9U5lgDMSV2GHmBA7tTzxQaQs2JaCJ870Fewxmth6gikfgV
 VCM0qQFcAzqg4knMiLymPvQCKvyFbKRKYSX6dVx/0ZulsZ9IbIO9Y3lsQK5vUmd7DWFOOOjgd
 17yRfUo8hYlkU2M57AUI2KwYY13KdVWGfi4HqkIgd+HEW8TlD23J9lnlTnUDxuzD9ISEN5E5G
 JXnQR9AVyGKtB7/lQe2Q74zPcrIp1W1r0qpidsF5KNGJLUgRXMx12MJ/tu9KMHv9kxgqfqyz/
 gv36jOQIhNNeoIL2MAADWY/t5GRGJ0lEQq4pSflL+G0BlIDQY8YWD5vzrScXqhG2XTYHRCU8Q
 A8FPNJFIKct7LoHmFjpL5GQM7LEdtixh5w8EVjdaTeC5b22qrQAvht72vqEjva0ksODgMfqAi
 qIngFbsm/Q7g5AJWfe9SorGNSFUlSa4JyH0H+qRq+Z8saslSQeaVbqs5L9zw+iQtDYNlIOOQx
 taiP4BxwLLtykXNWvPVru/VlquWPN7i17mfZvSOouwQYC/OEtiAfHMfVntwlvDZC4Ny0P4mdL
 j0KX6JbRLZUz+qxEp/XyWAsAJ4D9xoPkwP7x0ClgITGp7Z/RRAU9XQob/46yO3+a3rjGqBFxs
 8SAm3aga05BsbBXgx/B9C40OA/O875jqreEAZL2wvmg0jHGfFXzyGrds4MJyBVyUI0VDrZStk
 E2fHrdgnQ9QhM3nY314BiOGmXEmKBPfJgJ4U8w9MBsEkNZfFH12jFFyPsI63mEwX407PC2jaz
 KItI0CY1MQsauGHqvYPbkfRhJXgRjjBwSQtBlA8WHrvYehNS/ZAnx2Kcg==
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
 drivers/gpu/drm/via/via_sii164.c | 563 +++++++++++++++++++++++++++++++
 1 file changed, 563 insertions(+)
 create mode 100644 drivers/gpu/drm/via/via_sii164.c

diff --git a/drivers/gpu/drm/via/via_sii164.c b/drivers/gpu/drm/via/via_si=
i164.c
new file mode 100644
index 000000000000..76f8dd783eca
=2D-- /dev/null
+++ b/drivers/gpu/drm/via/via_sii164.c
@@ -0,0 +1,563 @@
+/*
+ * Copyright =C2=A9 2016-2018 Kevin Brace.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining =
a
+ * copy of this software and associated documentation files (the "Softwar=
e"),
+ * to deal in the Software without restriction, including without limitat=
ion
+ * the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
+ * and/or sell copies of the Software, and to permit persons to whom the
+ * Software is furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice (including the n=
ext
+ * paragraph) shall be included in all copies or substantial portions of =
the
+ * Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
+ * Author(s):
+ * Kevin Brace <kevinbrace@bracecomputerlab.com>
+ */
+
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_probe_helper.h>
+
+#include "via_drv.h"
+
+
+#define SII164_VEN		BIT(5)
+#define SII164_HEN		BIT(4)
+#define SII164_DSEL		BIT(3)
+#define SII164_BSEL		BIT(2)
+#define SII164_EDGE		BIT(1)
+#define SII164_PDB		BIT(0)
+
+
+static void via_sii164_power(struct i2c_adapter *i2c_bus, bool power_stat=
e)
+{
+	u8 buf;
+	u8 power_bit;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x08, &buf, 1);
+	power_bit =3D power_state ? SII164_PDB : 0x00;
+	buf &=3D ~power_bit;
+	buf |=3D power_bit;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x08, &buf, 1);
+	DRM_DEBUG_KMS("SiI 164 (DVI) Power: %s\n",
+			power_state ? "On" : "Off");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+
+static bool via_sii164_sense(struct i2c_adapter *i2c_bus)
+{
+	u8 buf;
+	bool rx_detected =3D false;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x09, &buf, 1);
+	if (buf & BIT(2)) {
+		rx_detected =3D true;
+	}
+
+	DRM_DEBUG_KMS("SiI 164 (DVI) Connector Sense: %s\n",
+			rx_detected ? "Connected" : "Not Connected");
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return rx_detected;
+}
+
+static void via_sii164_display_registers(struct i2c_adapter *i2c_bus)
+{
+	uint8_t i;
+	u8 buf;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	DRM_DEBUG_KMS("SiI 164 Registers:\n");
+	for (i =3D 0; i < 0x10; i++) {
+		via_i2c_readbytes(i2c_bus, 0x38, i, &buf, 1);
+		DRM_DEBUG_KMS("0x%02x: 0x%02x\n", i, buf);
+	}
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_init_registers(struct i2c_adapter *i2c_bus)
+{
+	u8 buf;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	buf =3D SII164_VEN | SII164_HEN |
+		SII164_DSEL |
+		SII164_EDGE | SII164_PDB;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x08, &buf, 1);
+
+	/*
+	 * Route receiver detect bit (Offset 0x09[2]) as the output
+	 * of MSEN pin.
+	 */
+	buf =3D BIT(5);
+	via_i2c_writebytes(i2c_bus, 0x38, 0x09, &buf, 1);
+
+	buf =3D 0x90;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x0a, &buf, 1);
+
+	buf =3D 0x89;
+	via_i2c_writebytes(i2c_bus, 0x38, 0x0c, &buf, 1);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+
+static const struct drm_encoder_funcs via_sii164_drm_encoder_funcs =3D {
+	.destroy =3D via_encoder_cleanup,
+};
+
+static void via_sii164_dpms(struct drm_encoder *encoder, int mode)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_display_registers(i2c_bus);
+	switch (mode) {
+	case DRM_MODE_DPMS_ON:
+		via_sii164_power(i2c_bus, true);
+		via_transmitter_io_pad_state(dev_priv, enc->di_port, true);
+		break;
+	case DRM_MODE_DPMS_STANDBY:
+	case DRM_MODE_DPMS_SUSPEND:
+	case DRM_MODE_DPMS_OFF:
+		via_sii164_power(i2c_bus, false);
+		via_transmitter_io_pad_state(dev_priv, enc->di_port, false);
+		break;
+	default:
+		DRM_ERROR("Bad DPMS mode.");
+		break;
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static bool via_sii164_mode_fixup(struct drm_encoder *encoder,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	drm_mode_set_crtcinfo(adjusted_mode, 0);
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return true;
+}
+
+static void via_sii164_mode_set(struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct via_crtc *iga =3D container_of(encoder->crtc, struct via_crtc, ba=
se);
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_transmitter_clock_drive_strength(dev_priv, enc->di_port, 0x03);
+	via_transmitter_data_drive_strength(dev_priv, enc->di_port, 0x03);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, true);
+
+	via_sii164_display_registers(i2c_bus);
+	via_sii164_init_registers(i2c_bus);
+	via_sii164_display_registers(i2c_bus);
+
+	via_transmitter_display_source(dev_priv, enc->di_port, iga->index);
+exit:
+
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_prepare(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_power(i2c_bus, false);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, false);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_commit(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_power(i2c_bus, true);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, true);
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+static void via_sii164_disable(struct drm_encoder *encoder)
+{
+	struct via_encoder *enc =3D container_of(encoder,
+					struct via_encoder, base);
+	struct drm_device *dev =3D encoder->dev;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+	struct i2c_adapter *i2c_bus;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (enc->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (enc->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (enc->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (enc->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (enc->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	via_sii164_power(i2c_bus, false);
+	via_transmitter_io_pad_state(dev_priv, enc->di_port, false);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
+
+
+static const struct drm_encoder_helper_funcs
+via_sii164_drm_encoder_helper_funcs =3D {
+	.dpms =3D via_sii164_dpms,
+	.mode_fixup =3D via_sii164_mode_fixup,
+	.mode_set =3D via_sii164_mode_set,
+	.prepare =3D via_sii164_prepare,
+	.commit =3D via_sii164_commit,
+	.disable =3D via_sii164_disable,
+};
+
+
+static enum drm_connector_status via_sii164_detect(
+					struct drm_connector *connector,
+					bool force)
+{
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	struct i2c_adapter *i2c_bus;
+	enum drm_connector_status ret =3D connector_status_disconnected;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (con->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (con->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	if (via_sii164_sense(i2c_bus)) {
+		ret =3D connector_status_connected;
+		DRM_DEBUG_KMS("DVI detected.\n");
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static const struct drm_connector_funcs via_sii164_drm_connector_funcs =
=3D {
+	.dpms =3D drm_helper_connector_dpms,
+	.detect =3D via_sii164_detect,
+	.fill_modes =3D drm_helper_probe_single_connector_modes,
+	.destroy =3D via_connector_destroy,
+	.reset =3D drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state =3D
+			drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state =3D
+			drm_atomic_helper_connector_destroy_state,
+};
+
+
+int via_sii164_mode_valid(struct drm_connector *connector,
+					struct drm_display_mode *mode)
+{
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	struct i2c_adapter *i2c_bus;
+	u8 buf;
+	uint32_t low_freq_limit, high_freq_limit;
+	int ret;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (con->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (con->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		ret =3D MODE_ERROR;
+		goto exit;
+	}
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x06, &buf, 1);
+	low_freq_limit =3D buf * 1000;
+	via_i2c_readbytes(i2c_bus, 0x38, 0x07, &buf, 1);
+	high_freq_limit =3D (buf + 65) * 1000;
+	DRM_DEBUG_KMS("Low Frequency Limit: %u KHz\n", low_freq_limit);
+	DRM_DEBUG_KMS("High Frequency Limit: %u KHz\n", high_freq_limit);
+
+	if (mode->clock < low_freq_limit) {
+		ret =3D MODE_CLOCK_LOW;
+		goto exit;
+	}
+
+	if (mode->clock > high_freq_limit) {
+		ret =3D MODE_CLOCK_HIGH;
+		goto exit;
+	}
+
+	ret =3D MODE_OK;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return ret;
+}
+
+static int via_sii164_get_modes(struct drm_connector *connector)
+{
+	struct via_connector *con =3D container_of(connector,
+					struct via_connector, base);
+	int count =3D 0;
+	struct i2c_adapter *i2c_bus;
+	struct edid *edid =3D NULL;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (con->i2c_bus & VIA_I2C_BUS1) {
+		i2c_bus =3D via_find_ddc_bus(0x26);
+	} else if (con->i2c_bus & VIA_I2C_BUS2) {
+		i2c_bus =3D via_find_ddc_bus(0x31);
+	} else if (con->i2c_bus & VIA_I2C_BUS3) {
+		i2c_bus =3D via_find_ddc_bus(0x25);
+	} else if (con->i2c_bus & VIA_I2C_BUS4) {
+		i2c_bus =3D via_find_ddc_bus(0x2c);
+	} else if (con->i2c_bus & VIA_I2C_BUS5) {
+		i2c_bus =3D via_find_ddc_bus(0x3d);
+	} else {
+		i2c_bus =3D NULL;
+		goto exit;
+	}
+
+	edid =3D drm_get_edid(&con->base, i2c_bus);
+	if (edid) {
+		if (edid->input & DRM_EDID_INPUT_DIGITAL) {
+			drm_connector_update_edid_property(connector, edid);
+			count =3D drm_add_edid_modes(connector, edid);
+			DRM_DEBUG_KMS("DVI EDID information was obtained.\n");
+		}
+
+		kfree(edid);
+	}
+
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return count;
+}
+
+static const struct drm_connector_helper_funcs
+via_sii164_drm_connector_helper_funcs =3D {
+	.mode_valid =3D via_sii164_mode_valid,
+	.get_modes =3D via_sii164_get_modes,
+};
+
+bool via_sii164_probe(struct i2c_adapter *i2c_bus)
+{
+	u8 buf;
+	u16 vendor_id, device_id, revision;
+	bool device_detected =3D false;
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	via_i2c_readbytes(i2c_bus, 0x38, 0x00, &buf, 1);
+	vendor_id =3D buf;
+	via_i2c_readbytes(i2c_bus, 0x38, 0x01, &buf, 1);
+	vendor_id |=3D (buf << 8);
+	DRM_DEBUG_KMS("Vendor ID: %x\n", vendor_id);
+	via_i2c_readbytes(i2c_bus, 0x38, 0x02, &buf, 1);
+	device_id =3D buf;
+	via_i2c_readbytes(i2c_bus, 0x38, 0x03, &buf, 1);
+	device_id |=3D (buf << 8);
+	DRM_DEBUG_KMS("Device ID: %x\n", device_id);
+	via_i2c_readbytes(i2c_bus, 0x38, 0x04, &buf, 1);
+	revision =3D buf;
+	DRM_DEBUG_KMS("Revision: %x\n", revision);
+
+	if ((vendor_id !=3D 0x0001) || (device_id !=3D 0x0006)) {
+		goto exit;
+	}
+
+	device_detected =3D true;
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+	return device_detected;
+}
+
+void via_sii164_init(struct drm_device *dev)
+{
+	struct via_connector *con;
+	struct via_encoder *enc;
+	struct via_drm_priv *dev_priv =3D to_via_drm_priv(dev);
+
+	DRM_DEBUG_KMS("Entered %s.\n", __func__);
+
+	if (!dev_priv->ext_tmds_presence) {
+		goto exit;
+	}
+
+	enc =3D kzalloc(sizeof(*enc) + sizeof(*con), GFP_KERNEL);
+	if (!enc) {
+		DRM_ERROR("Failed to allocate connector "
+				"and encoder.\n");
+		goto exit;
+	}
+
+	drm_encoder_init(dev, &enc->base, &via_sii164_drm_encoder_funcs,
+						DRM_MODE_ENCODER_TMDS, NULL);
+	drm_encoder_helper_add(&enc->base,
+					&via_sii164_drm_encoder_helper_funcs);
+
+	enc->base.possible_crtcs =3D BIT(1) | BIT(0);
+	enc->base.possible_clones =3D 0;
+
+	enc->i2c_bus =3D dev_priv->ext_tmds_i2c_bus;
+	enc->di_port =3D dev_priv->ext_tmds_di_port;
+
+	/* Increment the number of DVI connectors. */
+	dev_priv->number_dvi++;
+
+
+	con =3D &enc->cons[0];
+
+	drm_connector_init(dev, &con->base, &via_sii164_drm_connector_funcs,
+				DRM_MODE_CONNECTOR_DVID);
+	drm_connector_helper_add(&con->base,
+				&via_sii164_drm_connector_helper_funcs);
+	drm_connector_register(&con->base);
+
+	con->base.doublescan_allowed =3D false;
+	con->base.interlace_allowed =3D false;
+
+	con->i2c_bus =3D dev_priv->ext_tmds_i2c_bus;
+
+	INIT_LIST_HEAD(&con->props);
+	drm_connector_attach_encoder(&con->base, &enc->base);
+exit:
+	DRM_DEBUG_KMS("Exiting %s.\n", __func__);
+}
=2D-
2.35.1

