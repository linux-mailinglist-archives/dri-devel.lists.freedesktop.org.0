Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382505E88C5
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 08:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 380CC10E210;
	Sat, 24 Sep 2022 06:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com
 [IPv6:2607:f8b0:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF4C10E991
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 20:41:53 +0000 (UTC)
Received: by mail-oi1-x234.google.com with SMTP id v130so1256803oie.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 13:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=1+wq+3K2PkWqFklFS4xV7hpwG2pUnuUolClONZusiAE=;
 b=BPKKTqn0xdWYDJCZ9MEOMiHsPHSKIjZ+Ey/b27I3ehhJHQKtt/kwnUWCxkQoMqO64I
 ODYRaI/oKco3W/+881a9V/scpFJUU+S7mt2VmfeZ/nMVheDL/Iqd1cmXmJVPOwIHayQy
 0eHQMxF0ZBrkuh1ce/yBs7piuXgZWgw2IvHU5g7St/KuY9l3+U4iqdR9YmbvCu9UrH/s
 VfK27ya+1LAI4KBfq178PbIPE73FFgAsarGAf1pjumLyKlm2LThY2LhnTnStYMABz/y6
 lRovc+WUKtyAWsr1Lq0Kbb0ZqBX2VdvpuxuSCZIzBnGSsD1UdY6ZH2LJ261RvKInF5do
 EbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=1+wq+3K2PkWqFklFS4xV7hpwG2pUnuUolClONZusiAE=;
 b=YJXIVOJ8fq4PQBaGFhoFh/F+v4n4xMsj9UnRidzsN1z7RcME9k6F7FDbuPKpA/XGD7
 iI2+QJGn6Lg4jEdgPJl/FuaQnON6BBW0Q7vXHeHnkF3Zr0ldSSQ+SVz13yNchGppmaEo
 tYnWzRrIQk4Ygt86q1hve1zeQbZ6LW4veQGLaLBva4fq7jVB0zTx7wKtXxCoFxlvVUPW
 wDxafc0eV2WKhJBfxIdHt7zHtvPny15Zrhydok2sL9W+b0lSPtGw2zUoJMxWDih926yZ
 K8G8JMN00d+U2fFr6vcwkLFmShn6Aw945S7KmC4fzdTgAiHAZGb9XJhxD5fd+x//8X1s
 hH2Q==
X-Gm-Message-State: ACrzQf03ItsqJv/mUDan34RaZpmfQOQZeDxZaGHQ4+9bD/PSwrT18JXy
 qdfqz2butsa30ebtyQTHPAU=
X-Google-Smtp-Source: AMsMyM7t4t2fOtVl1HJPJMHhulr6o/HTS6Bt1typz/uJEimotF3NxYh6Wls3E6TsbLIboKbTAT+axw==
X-Received: by 2002:a05:6808:f91:b0:350:ce5d:fe68 with SMTP id
 o17-20020a0568080f9100b00350ce5dfe68mr4822299oiw.166.1663965712921; 
 Fri, 23 Sep 2022 13:41:52 -0700 (PDT)
Received: from local.lan ([181.197.195.235]) by smtp.gmail.com with ESMTPSA id
 66-20020a4a1445000000b00435a8024bc1sm3755303ood.4.2022.09.23.13.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Sep 2022 13:41:52 -0700 (PDT)
From: Jorge Maidana <jorgem.linux@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH next] drm/bochs: Use PCI_DEVICE() macro
Date: Fri, 23 Sep 2022 17:42:20 -0300
Message-Id: <20220923204220.2760-1-jorgem.linux@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 24 Sep 2022 06:34:43 +0000
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
Cc: Jorge Maidana <jorgem.linux@gmail.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove never used 'driver_data' assignments along with the enum
'bochs_types' and make use of PCI_DEVICE() to simplify the elements of
bochs_pci_tbl[].

Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>
---
 drivers/gpu/drm/tiny/bochs.c | 31 +++----------------------------
 1 file changed, 3 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index a51262289..e476c4883 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -64,12 +64,6 @@ MODULE_PARM_DESC(defy, "default y resolution");
 
 /* ---------------------------------------------------------------------- */
 
-enum bochs_types {
-	BOCHS_QEMU_STDVGA,
-	BOCHS_SIMICS,
-	BOCHS_UNKNOWN,
-};
-
 struct bochs_device {
 	/* hw */
 	void __iomem   *mmio;
@@ -693,28 +687,9 @@ static void bochs_pci_remove(struct pci_dev *pdev)
 }
 
 static const struct pci_device_id bochs_pci_tbl[] = {
-	{
-		.vendor      = 0x1234,
-		.device      = 0x1111,
-		.subvendor   = PCI_SUBVENDOR_ID_REDHAT_QUMRANET,
-		.subdevice   = PCI_SUBDEVICE_ID_QEMU,
-		.driver_data = BOCHS_QEMU_STDVGA,
-	},
-	{
-		.vendor      = 0x1234,
-		.device      = 0x1111,
-		.subvendor   = PCI_ANY_ID,
-		.subdevice   = PCI_ANY_ID,
-		.driver_data = BOCHS_UNKNOWN,
-	},
-	{
-		.vendor      = 0x4321,
-		.device      = 0x1111,
-		.subvendor   = PCI_ANY_ID,
-		.subdevice   = PCI_ANY_ID,
-		.driver_data = BOCHS_SIMICS,
-	},
-	{ /* end of list */ }
+	{ PCI_DEVICE(0x1234, 0x1111) }, /* Bochs, QEMU */
+	{ PCI_DEVICE(0x4321, 0x1111) }, /* Simics */
+	{ }
 };
 
 static struct pci_driver bochs_pci_driver = {
-- 
2.30.2

