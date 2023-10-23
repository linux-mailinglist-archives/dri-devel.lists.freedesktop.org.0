Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 381CA7D3804
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 15:28:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A87510E029;
	Mon, 23 Oct 2023 13:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A0910E029
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:28:02 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50797cf5b69so4527110e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 06:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698067680; x=1698672480; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2urRTeG3ufYgcsCQiPb5uV+eiXVppkz+Tw64mxpZfeY=;
 b=c+vy0ejmOahyFXtL4yhMBmCa2rC+7VhQ3YXSBWI3JC1u7WmFVShXPdW56lP2QrcuCE
 TRApZMkgkizUtyaSdmRGj7fWSGpwDBe2WJOig5QME4uMwkLIWId/h6YtZ+1Hc8LLeZpp
 paPyM7QomlrEqqILkiWyqQ2fPpet/nVNd67eEZZOIJm9DppngqkSDstH+SHDcq0Iwuyi
 RP7iaBj05ODmPMwPFD7iToQ1xJcmc6D0cxp1/bcEeaZ6jtd7ShIOJh5Eb+M1QHf5dyCb
 P0B3if6WHWVZqSbAPXApFzpmzGZ/89OpRxwgda/Vagu6oOcXRiSxh19yxQiAKXvwZUg3
 0IRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698067680; x=1698672480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2urRTeG3ufYgcsCQiPb5uV+eiXVppkz+Tw64mxpZfeY=;
 b=eRm7jGzHmQfEn/fm/aa6oqxVApiZIZppCOrzIyZTqLUu7qUJyUiHW4iLuf8WOdicGg
 AxlhUK88UiuRzMw1AV2q1i4esWhgERjrUnB7KVzNf563b9QkOnLCGDoy62qmW5C8FBs1
 RN0dQY6z+O38THoy3YAZM/MX+xxL2NfRWHaf0Xur3oRhUzzM34fck6qzC4Aa95NLCXox
 Ju/Oz5xOL0fXupmICdy+Vf6OYQ3JUehZ2nYFZrHK5DdXaEAJan4yGNYWQLDJeZVKECom
 e5ELM7COZ36/MiAhPJ7v3FUJB14Ygx0qhraT0neaK2OrSFSfnpmf98bnAo2M1Eo8CdZ/
 KMAA==
X-Gm-Message-State: AOJu0YzpODaZTrKWfvxQUQGmYp/e0nPQWyyNU1Lh4EURuAqoeUNuwLQh
 iWFLRKXQPJ+hDoPZZyqMXuU=
X-Google-Smtp-Source: AGHT+IHoOqLfenpIDVx8JfQwy19YnxYvRmL3hM1j1nZMRcsvojnGLGLzBNAhcIvEp+gdH4N+YYLicg==
X-Received: by 2002:a19:5e1c:0:b0:503:1aae:eca0 with SMTP id
 s28-20020a195e1c000000b005031aaeeca0mr6397211lfb.44.1698067680102; 
 Mon, 23 Oct 2023 06:28:00 -0700 (PDT)
Received: from localhost (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net.
 [80.193.200.194]) by smtp.gmail.com with ESMTPSA id
 o3-20020a5d6843000000b003143c9beeaesm7785417wrw.44.2023.10.23.06.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:27:59 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: David Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH][next] agp/amd64: remove redundant assignment to variable i
Date: Mon, 23 Oct 2023 14:27:59 +0100
Message-Id: <20231023132759.666224-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable i is being initialized to 0 and then again in the
following for-loop. The initialization outside the for-loop is
redundant and can be removed.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/char/agp/amd64-agp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/agp/amd64-agp.c b/drivers/char/agp/amd64-agp.c
index ce8651436609..47bd3b8a54b4 100644
--- a/drivers/char/agp/amd64-agp.c
+++ b/drivers/char/agp/amd64-agp.c
@@ -333,7 +333,6 @@ static int cache_nbs(struct pci_dev *pdev, u32 cap_ptr)
 	if (!amd_nb_has_feature(AMD_NB_GART))
 		return -ENODEV;
 
-	i = 0;
 	for (i = 0; i < amd_nb_num(); i++) {
 		struct pci_dev *dev = node_to_amd_nb(i)->misc;
 		if (fix_northbridge(dev, pdev, cap_ptr) < 0) {
-- 
2.39.2

