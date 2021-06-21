Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC5F3AE3D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BED89D5B;
	Mon, 21 Jun 2021 07:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7EB89C88
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 06:44:49 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id y4so5872527pfi.9
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Jun 2021 23:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MByV6cpfz5xYL+DMP3l1hiWnj/Gzo6aYK3LpWdzWngw=;
 b=b29mzE46OF31Q0CDVIkCAi2dK/16TmoZc6FE32WuI0K0eE59eopnCwAo/XS+aCT4GD
 vB678ZVcP9xoXMVTsUk/OR0Mp4ts1fhMvmiktvVyUyAQTpBttVz8JcQwp4b1Tdconwgw
 8zZWW7a9Xn2iGmAREWcAEk1GMReMXDFhOUGuG5ciepZCDjsZIk+ArbLPLDhRJy9/mGdh
 zW0hRFKpx3RbUO24fU/jL3PEyRpQhlckS0HPgcphPygMzI+PY49rzRGCrpTxkecJs8q2
 zy/GFkZ04RTUajYooN0PEQZQKFt5xsLgIJa5cBfu8VOd3Gdtpi0WXSeUA6RDAdJVgT63
 yZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MByV6cpfz5xYL+DMP3l1hiWnj/Gzo6aYK3LpWdzWngw=;
 b=ZsNFIwgJKQ7PCf21SD+EDch6Qmdk45lOn1Vxz2jJmbfLZ2z2qffd0n/PmZC/a2c1tX
 s48as7rTm/+uy2F3c8lG5yHPQ6eT+2BB8fZZ6gtBh42wX6hGMW+qrAPfBch4WDctSIny
 8giRGYVx3E/SGUTGGH3UcMowFCV5eCD78VWJtF1uGAYxUsEachZWoQvNGEBLX0UOQstM
 SIDVn/+FCZFm/4+AL9hwt8kw0tncwfDvUV37adQ++Gokd+NcGdwCBjnQB/35ZYNr0V4P
 K5V11bqDPyspYlPOz8afXsTytQdwVHkCpxKX0p76p9Awyd1XMR5EUDu7EdNz2BAduTVz
 obsA==
X-Gm-Message-State: AOAM533ES48BK2cRDjm3i/I0Y+MKlAPa+Kxmj5/EwoRnT38uoJWtFMgp
 iDKE7/oPaoZdRA4WdBCioxTKYQ==
X-Google-Smtp-Source: ABdhPJwH4/eLR8eUZGuKN8dGXC6akwtVCwhZ4Ipv8+e+H+PA4zXKM/he9uNlz8M414i8BGg/A2nyGQ==
X-Received: by 2002:a63:ed08:: with SMTP id d8mr22298931pgi.373.1624257888998; 
 Sun, 20 Jun 2021 23:44:48 -0700 (PDT)
Received: from localhost.localdomain ([240b:10:c9a0:ca00:61b8:26ec:dc30:8823])
 by smtp.gmail.com with ESMTPSA id
 o34sm12744450pgm.6.2021.06.20.23.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jun 2021 23:44:48 -0700 (PDT)
From: Tomohito Esaki <etom@igel.co.jp>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [PATH 4/4] doc-rst: Add virtual DRM documentation
Date: Mon, 21 Jun 2021 15:44:03 +0900
Message-Id: <20210621064403.26663-5-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621064403.26663-1-etom@igel.co.jp>
References: <20210621064403.26663-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 21 Jun 2021 07:07:50 +0000
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
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, Tomohito Esaki <etom@igel.co.jp>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 Documentation/gpu/drivers.rst |  1 +
 Documentation/gpu/vdrm.rst    | 51 +++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/gpu/vdrm.rst

diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
index b4a0ed3ca961..bad0226de972 100644
--- a/Documentation/gpu/drivers.rst
+++ b/Documentation/gpu/drivers.rst
@@ -19,6 +19,7 @@ GPU Driver Documentation
    xen-front
    afbc
    komeda-kms
+   vdrm
 
 .. only::  subproject and html
 
diff --git a/Documentation/gpu/vdrm.rst b/Documentation/gpu/vdrm.rst
new file mode 100644
index 000000000000..2ab1699c2f42
--- /dev/null
+++ b/Documentation/gpu/vdrm.rst
@@ -0,0 +1,51 @@
+=============================
+ drm/vdrm virtual DRM driver
+=============================
+
+Virtual DRM splits the overlay planes of a display controller into multiple
+virtual devices to allow each plane to be accessed by each process.
+
+This makes it possible to overlay images output from multiple processes on a
+display. For example, one process displays the camera image without compositor
+while another process overlays the UI.
+
+The virtual DRM creates standalone virtual device and make DRM planes from a
+master device (e.g. card0) accessible via one or more virtual device. However,
+these plane are no longer accessible from the original device.
+Each virtual device (and plane) can be accessed via a separate device file.
+
+The virtual DRM driver doesn't directly control the display hardware and has
+no access to the physical bus. Instead, the virtual DRM driver issues requests
+to the standard DRM device driver ("master" driver) when the hardware needs to
+be controlled. The master driver is modified to notify the virtual DRM driver
+of interrupt events from the display hardware.
+
+Plane position and size
+=======================
+The initial position, size and z-position of the plane used in virtual DRM is
+specified in the device tree. The position and size of the planes are set as
+properties and can be updated. The name of each property is as
+follows:
+* vdrm_offset_x: x-coordinate of the left-top of the plane on the screen
+* vdrm_offset_y: y-coordinate of the left-top of the plane on the screen
+* vdrm_width: width of the plane
+* vdrm_height: height of the plane
+
+Virtual DRM Functions Reference
+===============================
+
+.. kernel-doc:: drivers/gpu/drm/vdrm/vdrm_api.h
+    :internal:
+
+.. kernel-doc:: drivers/gpu/drm/vdrm/vdrm_drv.c
+    :export:
+
+Driver limitations
+==================
+1. Each virtual DRM device only supports one plane per CRTC.
+
+2. Virtual DRM doesn't support hot plug connector.
+
+3. If virtual DRM has multiple CRTCs, the initial position and size of the
+   virtual DRM planes is the same for all planes, since they cannot be set
+   for each plane in the device tree.
-- 
2.25.1

