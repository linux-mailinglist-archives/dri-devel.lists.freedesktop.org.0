Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D37B334BFDC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F2CE6E10A;
	Sun, 28 Mar 2021 23:56:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 786B56E10A
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:56:03 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id 7so10922313qka.7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZDOzS1vRcWtTYspKStQDHl39R8ItwGtdALzS3MH5haw=;
 b=BzAd00k8G81ySOORFH4ZYZ1bB3RbAIhMFXIV1td9cqvEo3UX3T7K8yDs0BLbUNs6dC
 G70pZ49bAzdfN5gPoTXAyB2FSNpShLDrz7XUsanKWuxMQrhE9um5pz0Eh9zXb8CEGvFR
 jProIh3TzVfDeb19gYLYfk5ihXrjFf2yWbMRIoNvoxWoNIfCyhIw+Kz9BsCPPMQa48D+
 /s97ueBJTMSjpIujqIKbMYw5vTW60f47/GtkTVffiOEP9zXV5SaMf2r5PpRh7pMqROjm
 DF1/IGaESef8EHnGmyWKekR0S17ktc8qfK44vFx3jKgxW3NB7Ado6xEEMvZo+NhRg8K7
 3Z5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZDOzS1vRcWtTYspKStQDHl39R8ItwGtdALzS3MH5haw=;
 b=kzbRB1LhgcohHXo3lybV01UGtc7AjKozUft39/+9lsnu5NS6/Y23Qvawzw0cyFY7At
 Zv0ozU62Z3IvD2PaQWWK+b9xj60W9PrMSElQ5MqG8dUGUBh1SYZ9YT3R2RMuCZ7HS9hB
 3XOiIdXDvE7EPp14FbkkQrOrcUkTUilAso2aRKthw7BkZGClJCzWqrITVbCN/W48OU9M
 i8Ee9JXuxKpsLBt9SBSSBUistzHKnWrQtkixYJ+1YHrJXgk5K/U5L53ZB6ss1ntPRPnT
 POJ68GvgVEx1/e95H6vMv5FLwUteAeVHcJVfKLbso11JixhVj5dx0IpdaoAmJX/x8Mjv
 TFOw==
X-Gm-Message-State: AOAM533YmG1I+WFqNCyhdfCEtr6Z0Lr7fmcvYEclHevG99kzrq9ACH2D
 BRdg8xZ8QFZTyHuZiCTl/Yk=
X-Google-Smtp-Source: ABdhPJypSYspQV6VkWopPpkt2zOnTgc+JiYwp3Y6rFrbq+R2YCZW03mpS3QNcfpuRFem43a0O2MkwQ==
X-Received: by 2002:a05:620a:110a:: with SMTP id
 o10mr23876269qkk.281.1616975762740; 
 Sun, 28 Mar 2021 16:56:02 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:56:02 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 01/30] acpi-dma.c: Fix couple of typos
Date: Mon, 29 Mar 2021 05:22:57 +0530
Message-Id: <c461490c88fdc6a18d264a283e5c69642ffa2859.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


s/exctract/extract/
s/avaiable/available/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/acpi-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/acpi-dma.c b/drivers/dma/acpi-dma.c
index 235f1396f968..4b1d5183bf64 100644
--- a/drivers/dma/acpi-dma.c
+++ b/drivers/dma/acpi-dma.c
@@ -100,7 +100,7 @@ static int acpi_dma_parse_resource_group(const struct acpi_csrt_group *grp,
 }

 /**
- * acpi_dma_parse_csrt - parse CSRT to exctract additional DMA resources
+ * acpi_dma_parse_csrt - parse CSRT to extract additional DMA resources
  * @adev:	ACPI device to match with
  * @adma:	struct acpi_dma of the given DMA controller
  *
@@ -293,7 +293,7 @@ EXPORT_SYMBOL_GPL(devm_acpi_dma_controller_free);
  * found.
  *
  * Return:
- * 0, if no information is avaiable, -1 on mismatch, and 1 otherwise.
+ * 0, if no information is available, -1 on mismatch, and 1 otherwise.
  */
 static int acpi_dma_update_dma_spec(struct acpi_dma *adma,
 		struct acpi_dma_spec *dma_spec)
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
