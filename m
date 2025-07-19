Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78045B0AE2D
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 08:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7597710E1CA;
	Sat, 19 Jul 2025 06:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VFVItW+Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A9510E1CA
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 06:33:41 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4ab61ecc1e8so20730161cf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 23:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752906820; x=1753511620; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cXaJ24zAIJTmkWcz3v1aCR8t8NRrBr0nO+ngi72VLwM=;
 b=VFVItW+Y7/nXPJxCdQ0LNdP2DZPp6sEfOUVDS0cKuyYBQBeK+Ip/Q43GjuzFrrVPbC
 ecNoTnhOssvLQfsNrgDynp9m57sgqisdQ7e9bJ4qEAIaX5iXdXJ+xG+svuyXzpBCnfgP
 dIRZHTKJZm3fhSsBZ0fMDUfLDfjogNW9QAILImuU2dP76NpOoBC46VG5nOIh3bZs2wLa
 fS502VPIryN3lYS1vr+cXAyEza2IbtoDbvNMTA/j55TkoQ0EiM2iddK5zr2cjlCcttZo
 Z4v6wurFaFKpfH3Ta3i3CdFIimEjlhQ2lYH2r9X/4lqyo/LfENGSNIboGhLH4b06YaF6
 VBAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752906820; x=1753511620;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cXaJ24zAIJTmkWcz3v1aCR8t8NRrBr0nO+ngi72VLwM=;
 b=XL9MMM+KSppe98Nk3MGvAoncmMgQ8bA39Mjls9TrBS9ZWthIWkpTQRQQBGH1OiZZT/
 zafAtsW2Fou9+QSxQh2PdSV4H8lpweO1Pi/NQpBa+xyYKjX5NgzZNFj4uqQ8Ahgxq93J
 ACE6RHZ34Mow+0uJ5VcWhxesV4+6mHk+OjxQayWn+ddqOPdlkn4ULfwIobhBvqlYmSU8
 D3H5qrjPr8WWhtzB8IK94L2EpX7117vDNYD+6u6E58eTTC1UP64WaylGQgFHhJEcuQBw
 qrNCULsMUXV6YbJHmFGBrYSlvhu1LZdHjjlhb6tK+oOF2uryq9TIDCI1qZ9aC52PZTMu
 rz7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGfY5nH2u8UcnbUT/rYQrpT1u4KQvXlB8/ff6xS7ISj+lwrj43zHa8waUXuF+P/Vcyv5QFmycobEA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwABzsb4RPkCbjfue+pO11R32e+AQHqIqf0vNaVq/zEm3Vl897J
 5u8emrFby4IeI1uOzHuE+23N/4K+WfZqmDuByuUnIEruDEUWGyGk1MVX
X-Gm-Gg: ASbGncvy8WKSgxQNKt3YgB13/Fv2lZaGtIDimvQQBe3ofKJZnM8FahRtiFYfeR8ex0Z
 es33aMAzMkYA8uG/IddDm5nUX/Vw6T27m47T0l/3XtgXQXVaY5t38sgiIN7eX1AM2CAhS3VG6z4
 huD8DzVyibHKockYQBuj2xzKfBA9T/bhvLjekYFFg9S5cORY/yUqi8UPXy9TPxhyrGMvz4uP2kL
 AothYOGJYbQmrAeQTpzwVLeCmZke0/qM7PCyQFqH/OSzjL4L9KQeffhyet2MmqC40gR/tHnILMv
 y6UnGbd0Vl9nA+LeXcMLyBB4+Jj9AxmtEuS8MhseyWl5pLTWYHP7w5OPDQVNbQQdQ5di/SDers2
 BwE1129zBuJE/Xw==
X-Google-Smtp-Source: AGHT+IGHoRLM3yEIflabiLxKe+ERpQynr0njQZYhILbGU4PETBCHd82wLaFifZLAnKxnQcMa1CzZjQ==
X-Received: by 2002:ac8:5753:0:b0:4a7:7b5c:90a5 with SMTP id
 d75a77b69052e-4ab93c50799mr232155751cf.7.1752906819928; 
 Fri, 18 Jul 2025 23:33:39 -0700 (PDT)
Received: from pc ([196.235.158.242]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4abb499fea2sm16217111cf.22.2025.07.18.23.33.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 23:33:39 -0700 (PDT)
Date: Sat, 19 Jul 2025 07:33:36 +0100
From: Salah Triki <salah.triki@gmail.com>
To: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: salah.triki@gmail.com
Subject: [PATCH] accel/amdxdna: Delete pci_free_irq_vectors()
Message-ID: <aHs8QAfUlFeNp7qL@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The device is managed so pci_free_irq_vectors() is called automatically
no need to do it manually.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/accel/amdxdna/aie2_pci.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index c6cf7068d23c..3474a8d4e560 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -520,14 +520,14 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	if (!ndev->psp_hdl) {
 		XDNA_ERR(xdna, "failed to create psp");
 		ret = -ENOMEM;
-		goto free_irq;
+		goto release_fw;
 	}
 	xdna->dev_handle = ndev;
 
 	ret = aie2_hw_start(xdna);
 	if (ret) {
 		XDNA_ERR(xdna, "start npu failed, ret %d", ret);
-		goto free_irq;
+		goto release_fw;
 	}
 
 	ret = aie2_mgmt_fw_query(ndev);
@@ -578,8 +578,6 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	aie2_error_async_events_free(ndev);
 stop_hw:
 	aie2_hw_stop(xdna);
-free_irq:
-	pci_free_irq_vectors(pdev);
 release_fw:
 	release_firmware(fw);
 
@@ -588,12 +586,10 @@ static int aie2_init(struct amdxdna_dev *xdna)
 
 static void aie2_fini(struct amdxdna_dev *xdna)
 {
-	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
 	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
 
 	aie2_hw_stop(xdna);
 	aie2_error_async_events_free(ndev);
-	pci_free_irq_vectors(pdev);
 }
 
 static int aie2_get_aie_status(struct amdxdna_client *client,
-- 
2.43.0

