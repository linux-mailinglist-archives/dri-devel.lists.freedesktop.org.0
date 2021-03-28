Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A29734C005
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 01:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78DE6E1B2;
	Sun, 28 Mar 2021 23:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9706E1B2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 23:57:17 +0000 (UTC)
Received: by mail-qt1-x82e.google.com with SMTP id l6so25795qtq.2
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktllqx7QjnWspPMzXQ7sjhNooDB0vIxKm9ezXXcwic0=;
 b=f4QMuwyF5jrdPtMVo2+9CGy2hpnU6X9VG5or5cpG0i5tKec8GXJPvfE2Lpfk2UtaIc
 ESCMfIgnWL/UzyeGdrF5UBJ0iKYk2Q4qnsji667z2vAPF+u8CnsV9GYOtBno/G+/nqdq
 ZICRcmrtcXLksFUAwiGUvZpBxgizflQwSbKEaSuqDRxIqIeES2reI+kqyNZdZV2qHhv+
 GRJOMDGRqxSXoEJfkRzo2Xs8jWRYDGz0wMjhbIHXsUbZfochhQqfqzobUs0jKKMVgs/y
 AgbCDh9rd/1jlkPabHd0/Hk9bEm2jgro2YGuiorbB8cCG4HdzN8B20aMcPA+NJLNEqs2
 eH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktllqx7QjnWspPMzXQ7sjhNooDB0vIxKm9ezXXcwic0=;
 b=UHtoW4eB1+XP4LMKj4FCP07M6XxLhdiyHsP9XvmxYIJXdrHF3QlIZRXsdq96sBOTjd
 p2tcPEyBS2BKayc4Hiv0/OpiuhpMsbgYfSO+trjp0P2Sod568loYCG6eBs6zgVFL5fGD
 tiXdk7xEaUbSo0G2i8Gh7FqfQeC0Ffcu0v8FyRmJDBkgbWsI7WEVRrqJ5sMbZIaYJ4Z0
 196MCkdirmaJInBQKMJ5Y7llut3wtt0D07opUYqIGiVM54NKuYOkMh1DBKWLh7MqUiVO
 W5LbuB8Y8Lfb3KFqzq6zEO23EqN/eaYj8k0Rp/tEy6TGtb9F00aI5TZ0OXlnssEkgxBO
 gmUQ==
X-Gm-Message-State: AOAM53329KLA7RIb58SavmEJW9t4vcsGRTnG93C0gceKMzrieVqHuBbo
 TL26rGSRBl8AHDQI4yFMRTw=
X-Google-Smtp-Source: ABdhPJwxkLWZ5bJL30+ltWO6L6GdjSR/KZBPmPBB//wO0w+nDIDxzLuRqwzNpg9JihsmsPxrBn04TA==
X-Received: by 2002:ac8:7776:: with SMTP id h22mr21395212qtu.325.1616975836988; 
 Sun, 28 Mar 2021 16:57:16 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 16/30] st_fdma.h: Fix couple of typos
Date: Mon, 29 Mar 2021 05:23:12 +0530
Message-Id: <e116ad3d06c03a655e4f8940ebfa4650c860ef3c.1616971780.git.unixbhaskar@gmail.com>
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

s/transfert/transfer/  ...two different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/st_fdma.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
index fa15b97a3bab..702b21021124 100644
--- a/drivers/dma/st_fdma.h
+++ b/drivers/dma/st_fdma.h
@@ -41,8 +41,8 @@ struct st_fdma_generic_node {
  * @saddr: Source address
  * @daddr: Destination address
  *
- * @generic: generic node for free running/paced transfert type
- * 2 others transfert type are possible, but not yet implemented
+ * @generic: generic node for free running/paced transfer type
+ * 2 others transfer type are possible, but not yet implemented
  *
  * The NODE structures must be aligned to a 32 byte boundary
  */
--
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
