Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF3FAE2931
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jun 2025 15:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966F510E2A6;
	Sat, 21 Jun 2025 13:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dzj2y71j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E62110E259
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jun 2025 01:56:05 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6097de2852aso3105162a12.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 18:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750470962; x=1751075762; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kKDXqmPoJsPGYezIapXfVxiBd+2xBchIauyV0qRr0zs=;
 b=dzj2y71jze16z5mLubX2VbapuQayvUODSkDzoKUiT3Xn5QoIMbZiN72mfcYX6fK1Xf
 0qCdfKcBS3wXWjIOrDrqW0ZqgjLIRIqlwiPsIq5x6eo4J7U0GUaeORBxDGX0rh+q2n4/
 NXPYv7jKMNanTVekFeqnM0CSKDI4TwF0XkbCVJa0bo28Z5JEXUoPy+lvA5V8aWPwGs5t
 /vPbP3kD5wTP7LA3V4bPC1yYIGoUlh5ZJ3BRLeeoZszKPFp+KGvh4LZ3kebZF9d9OytZ
 JuJpcogLuEYPjvlMluapNeDAOckVetIlvxsTMaKQAfuSjs7RmmHAfokTmmq6yZuRVZZl
 /5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750470962; x=1751075762;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kKDXqmPoJsPGYezIapXfVxiBd+2xBchIauyV0qRr0zs=;
 b=uRSEijMSqSPuxS0MFDt+wccpzmHKSSJD609om88vaYSpocvUAwbg2mAXQwwf1rk/gU
 IYWmxCKULzzw8GmSgYFvxFna86y7073qEG2fBm+IVhLmwCOflOvoEI0CbhcIN4OiD7pO
 7ML5I873TKR8MndNW+Yk3XxjCM37jqwGXae91kJUusqUttnz2PuRYt1aoKSL0hYltLSy
 KOh7RaJ1lVfwhXdCM9sgfy9h2RcclIQQ/fr2UnftlVKXuGJv1lBQAKbtWH7DyluuhSt0
 INyNnbjhPhqbQiTvLVUTxT8IKrJU5hBCT55COb8ZlOItdEmVJ+bDsF5tTBvxbt7EH9wB
 yjPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpRP3BALJ0guytuumn/4TJ2ZSPn2l6M1DX/4iJC09hKTpf+rTsmtW1kpYjHfScwFKbCR5rUHdlViM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBmDNf3LH+Xu+7XhdWVVxaGkvFoM4hl5+tidjZvLabMQPkkltf
 wrCXSTO5eHxr7MgBFf4suLf+I0D0NbKKSfsbjylXjdz/RC/+xygV6i9K
X-Gm-Gg: ASbGncswXrqlx3NubmsQ7YfDB2Vk2g5cDBTA5EAEmhCscoDybD4oUAXhce01sUx6SGo
 /QPs6nP6vIqT38WvuJ8NvygKuP9CbbYfB1Vd7d8ZXm1XhkJCr6j6JR5BKuMCVgdLHfS9lz+EmAj
 HGzQKUKpsoVusmTtWB4u2aEOWADhdKf3hDUrXy81ukV5WPS5Wf37jHSx6sCBfh0S9PSZaNL6V+P
 LrWcx9SS9UccPOcF0v5ryhhxu3FkA8aPjzaQmehdxfQ6I/Br4gOQyYRyoG4lHXfOLXq5ozGC4cw
 98M6Hu7ytK3pClcnWILijiSrIMvpD2H/xpH1Rym97fz4Tfr58IIj
X-Google-Smtp-Source: AGHT+IGQGwSpHA5R2GkgVuxhxeakJNAhknYlOERPI26+5SNqpQm9QsPJZiVyJDRW2GjfxvolypcWcA==
X-Received: by 2002:a05:6402:270d:b0:606:9211:e293 with SMTP id
 4fb4d7f45d1cf-60a1cd2fc42mr4103401a12.9.1750470961830; 
 Fri, 20 Jun 2025 18:56:01 -0700 (PDT)
Received: from localhost ([95.85.21.12]) by smtp.gmail.com with UTF8SMTPSA id
 4fb4d7f45d1cf-60a18c94acesm2252267a12.44.2025.06.20.18.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 18:56:01 -0700 (PDT)
Date: Sat, 21 Jun 2025 04:55:52 +0300
From: Ahmed Salem <x0rw3ll@gmail.com>
To: airlied@redhat.com
Cc: lukas@wunner.de, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: [RFC PATCH] amd64-agp: do not bind to pci driver if probing fails
Message-ID: <c5kqcudzrcafm24nr5ixgalhxdkxl3uoueerjlp6tbksj3hzy7@klytjugpkvdm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Sat, 21 Jun 2025 13:44:37 +0000
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

Commit 3be5fa236649 ("Revert "iommu/amd: Prevent binding other PCI
drivers to IOMMU PCI devices"") had an unintended side effect in that
when looking for any AGP bridge, driver_attach() will try to bind to
IOMMU devices without preemptively checking for PCI_CAP_ID_AGP
capability. This happens during agp_amd64_init().

As a result, driver_attach() calls driver_probe_device(), which then
calls really_probe(), raising this critical condition:

 pci 0000:00:00.2: Resources present before probing

With the device being:

 00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
	Subsystem: Advanced Micro Devices, Inc. [AMD] Raven/Raven2 IOMMU
	Flags: bus master, fast devsel, latency 0, IRQ 25
	Capabilities: [40] Secure device <?>
	Capabilities: [64] MSI: Enable+ Count=1/4 Maskable- 64bit+
	Capabilities: [74] HyperTransport: MSI Mapping Enable+ Fixed+

As pci_register_driver() calls the device's probing function, the latter
(agp_amd64_probe) tries to find the device's PCI_CAP_ID_AGP capability,
and returns -ENODEV if said capability is not found.

Do not attempt driver_attach() if agp_amd64_pci_driver.probe is non-zero
to avoid probing already present resources.

Link: https://lore.kernel.org/all/aFJOLZ88KIH5WBy2@wunner.de

Signed-off-by: Ahmed Salem <x0rw3ll@gmail.com>
---
I'm not quite sure whether I should have maintained the linked
conversation's Ccs, so please let me know if I should Cc anyone else.

Lukas, kindly let me know whether you want me to add a Suggested-by
trailer as well.


diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index bf490967241a..e6a0d09e115a 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -768,10 +768,15 @@ int __init agp_amd64_init(void)
 
 		/* Look for any AGP bridge */
 		agp_amd64_pci_driver.id_table = agp_amd64_pci_promisc_table;
-		err = driver_attach(&agp_amd64_pci_driver.driver);
-		if (err == 0 && agp_bridges_found == 0) {
+		if ((int *)agp_amd64_pci_driver.probe != 0) {
 			pci_unregister_driver(&agp_amd64_pci_driver);
 			err = -ENODEV;
+		} else {
+			err = driver_attach(&agp_amd64_pci_driver.driver);
+			if (err == 0 && agp_bridges_found == 0) {
+				pci_unregister_driver(&agp_amd64_pci_driver);
+				err = -ENODEV;
+			}
 		}
 	}
 	return err;

base-commit: 11313e2f78128c948e9b4eb58b3dacfc30964700
-- 
2.47.2

