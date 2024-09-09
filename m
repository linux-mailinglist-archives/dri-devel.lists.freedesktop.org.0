Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74F971072
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2067F10E30D;
	Mon,  9 Sep 2024 07:57:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jbp6LMPJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6E610E30A;
 Mon,  9 Sep 2024 07:57:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-374b9761eecso2673356f8f.2; 
 Mon, 09 Sep 2024 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868619; x=1726473419; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
 b=jbp6LMPJDn9LYLtgWX6uZ5s1fXkHjE4CxHDdjppsSQWJlkMLCUk7azkvCAP2Qg6A0t
 1C9I4l/hlvVqOl/7dZUcCkNMG6e6iDtpFzJqYviV4lFArAhCbQz303FBlKmgOnjm1nkD
 ci/iYWGnPFzUxfrY+v+TrkxTPNgfbfhFlQGDxuQvmaEMpuaKejiYvTTHUgki1jR1OL0I
 V66/yTi9StqgMf1ZdtKU+pH67Rp4RwnVWL+MmXyM05RYEE85iohTiF0loWJzz/3T1xPn
 uuVP9q/CgJ8hKt8p4+RrR9qDGkllA73jbKDB6AsvBNhVJDXlbeEuSicpQusmddAJI2M8
 DhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868619; x=1726473419;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tns6DEsLLFvzNa6897gvKPOeII1INdIqfTx8WlLIAvw=;
 b=pLd0GjkkJlPd0NkIDfDsLZumgcTVyNOwRH4/U57F0pR2d86lr6Bt8bGWOM9DPKqUmb
 ltO+PvPT4qRUFdHVV5qLDu5cwVJ59B4ZFThA3a612OOCR4ttiMxzq7AdwsmXSwKSQRkw
 4WGrmt1AT4CKBmxzkF6cYndQeIknHjua1syEJ5wNtG/NIEabN0DvrFfrkpumUBg7XqAD
 gKVf+xAJhkPn0Qm4Se8RuOCvsX4MYCKHhc8qKSNrnD5NpVBMyjqjLCKFQnXOixbnFCCA
 Veyhew9HT2RdMiv9isTnTKp0OAP/26W7bm3ahr9JakQ/hqdvE3FEdNdD4nr8EXnhkVSZ
 vx4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaNE+126gdXymcxoLnY7WvoIsWtSKWmOJFM+MihnEI7voptLS7xqzkLrggyhWCIJaE60SYFG5Au/I=@lists.freedesktop.org,
 AJvYcCW/2Jm7LOA+ebSObHpN4SdU1tzt+xlnLcuSVKBQcaJ/VS758CtrHZc7vlTM3io/DTA4vgS7AvBT3r+Y@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHmY1b0DQCIFK+ihxR3N87KsWYpGPB+wwGOAFYYbnLEk1UqlvS
 5SkyPy4/JXmKTG5+gqF5ujjTWNOv19q4yzaODnW3iXIwOHIiAoQGCdxPZq/GA6w=
X-Google-Smtp-Source: AGHT+IFhnqv0adc/jPasshP9DFOYVF7kRZj6iEAk20wgpizKEHq4SVzWSg8dz/tDp3cddgfDjkxL9w==
X-Received: by 2002:adf:cd0d:0:b0:371:93eb:78a4 with SMTP id
 ffacd0b85a97d-378895c5b22mr6825835f8f.9.1725868619298; 
 Mon, 09 Sep 2024 00:56:59 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:58 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH RESEND v2 08/19] scsi: libfcoe: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:51 +0200
Message-ID: <20240909075641.258968-9-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Hannes Reinecke <hare@suse.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
---
 include/scsi/libfcoe.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/scsi/libfcoe.h b/include/scsi/libfcoe.h
index 3c5899290aed..6616348e59b9 100644
--- a/include/scsi/libfcoe.h
+++ b/include/scsi/libfcoe.h
@@ -15,7 +15,7 @@
 #include <linux/skbuff.h>
 #include <linux/workqueue.h>
 #include <linux/local_lock.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <scsi/fc/fc_fcoe.h>
 #include <scsi/libfc.h>
 #include <scsi/fcoe_sysfs.h>
-- 
2.46.0

