Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C7CD57A1
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C76C410E5D7;
	Mon, 22 Dec 2025 10:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="DijC7KBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E703010E5D7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:11:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B7AAE1A236E;
 Mon, 22 Dec 2025 10:11:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8DCF3606C1;
 Mon, 22 Dec 2025 10:11:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8ADD010AB0194; Mon, 22 Dec 2025 11:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398273; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=HmDVzyqEe/Jq+20MUVsc6IeQHVqNx5QgQOxY/IMi8X0=;
 b=DijC7KBlG8Cjl7hcxJRC4Qbk979zAa8sTGu5kuLIo/Jy3e61JzKFv2xhdngNR6d7ir6FqO
 UvOPYOMAl8IUfLpKrCt35fIr96UbFfEXSJ9zjy6QeL/yUiWilcONAWmXKt+ix76Pk5GNfS
 j32U9I1SEW9QzhrMFrx9aCTzbEXVVUpirEa7DuWJ6RJh0Zx5lpWdkbDPq18xjfb17gbWCA
 4Y+ffpIAac041rRLhOuDoHLXcPqsz2gPn+3m1oxw427iXVd2nhfpHMfBS8guPIAr5+2wdL
 s52MKT6F9FRq/Zpyx3bRS9eV5WX6LnkP7lNiLd2p/KrjXE7nzEqeHMu9ehBEFg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:03 +0100
Subject: [PATCH v3 01/33] Documentation: ABI: vkms: Add current VKMS ABI
 documentation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-1-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4636;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fKVcqX3gt9HWv3UrYSPLutXF0KAtxtD01MuzRGvxfOk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRk/7dPZjWG8ymYs690lI5XNikF3uUZ9I3XpZ
 qhES8XSgYiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKqgA/8DAfnpGDTv51JM8eswwjhrhZTuAm6cED
 KerAGakI4Wp6DHJ4j8HcJ5ma6ZURfbf5q4Y6bbCxem4YjGkHIYHH86Zm92uUzJ3puqgXQSPbS1O
 BDHg6FzSx3ggDEbNSkPqo7XHXrcJ4ktpBZ+k/5DT6h2+gro97QqQYdP7Lj9KVH6vQqqloKqfMlJ
 c2aRedJsNk02zWkhoM2LlJtfz9ayG46lUZJ8ZJ1XPgkYBF38fhgYHqqPJ7AYqgjm2mzZF+cqHdh
 /HHuSdQOfAeuXZ+MhjQVQMCVg5hEq9glgsv/7hVDW5dVnqhzafeZ9CPSmBw/z73cvgxFjVvsJl/
 7HUnkP6WzjjM4OoKiha8FINJ3c+nbZaM5ho6g2FYMyoiglHGuUNs+wgoXESzZiA5Q1rrpQRxdNo
 VS0JJNMw4pmOTm0/A5VxEYLLZSuxvkPugd/KRvCxmKYnt48H8hTP6daQU2IRSFnel/rjN0OVXwm
 1dvw29Ao9aq8IPlVB9Ii7/uOR6l8XTivjfsXKVqq06GBwPVyOpzos0GQVnoQjeHAHBTC3KZGupl
 ENYsfgle7G3EWkFTZi9XpnNhDlacuaq8+ot1+aVyn1AGtuYl6ngXNgC3lc1pDNAjyz2mDPbOi/g
 i5ZUFACTQhKWeBeSwmI5OMLrSGwco7BJWAYDiyvMJpKEX1Fk8fLw=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

VKMS recently introduced a ConfigFS API to configure new devices.
Add proper ABI documentation.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 Documentation/ABI/testing/configfs-vkms | 118 ++++++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
new file mode 100644
index 000000000000..0beaa25f30ba
--- /dev/null
+++ b/Documentation/ABI/testing/configfs-vkms
@@ -0,0 +1,118 @@
+What:		/sys/kernel/config/vkms/
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to created
+		VKMS devices.
+
+What:		/sys/kernel/config/vkms/<device>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to the VKMS
+        device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to the
+        connectors of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains attributes corresponding to the
+        connector <connector> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/status
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Connection status of the connector. Possible values:
+        1 - connected, 2 - disconnected, 3 - unknown.
+
+What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains symbolic links to possible encoders
+        for this connector.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to the
+        CRTCs of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains attributes corresponding to the
+        CRTC <crtc> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/crtcs/<crtc>/writeback
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Enable or disable writeback connector support for this
+        CRTC. Value: 1 - enabled, 0 - disabled.
+
+What:		/sys/kernel/config/vkms/<device>/encoders
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to the
+        encoders of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains attributes corresponding to the
+        encoder <encoder> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/encoders/<encoder>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains symbolic links to possible CRTCs
+        for this encoder.
+
+What:		/sys/kernel/config/vkms/<device>/planes
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains sub-groups corresponding to the
+        planes of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains attributes corresponding to the
+        plane <plane> of the VKMS device <device>.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/type
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Plane type. Possible values: 0 - overlay, 1 - primary,
+        2 - cursor.
+
+What:		/sys/kernel/config/vkms/<device>/planes/<plane>/possible_crtcs
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        This group contains symbolic links to possible CRTCs
+        for this plane.
+
+What:		/sys/kernel/config/vkms/<device>/enabled
+Date:		Nov 2025
+Contact:	dri-devel@lists.freedesktop.org
+Description:
+        Enable or disable the VKMS device. Value: 1 - enabled,
+        0 - disabled.

-- 
2.51.2

