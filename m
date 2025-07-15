Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A42B06992
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 00:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EFFA10E715;
	Tue, 15 Jul 2025 22:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jvvpVscm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C14CC10E715
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 22:59:46 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-73ce7b40d7aso199073a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752620386; x=1753225186; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OFDftDinGJeWeNvMt3z+fTzSOMnuJXF888WFq+QttdM=;
 b=jvvpVscmIhW5WQdBa29moTPeVcCltUzAv9KvTVUVB580P64OPPwjkdO/z92OsbW4t/
 IF9mkrqHf6zWTLraYu6jFKjAfLC7jDxrnNY/rsxsCM/TOCsVWMbkF9y7l43NTwLfZBGK
 QWXBNSoo0I1awGzP7Bwui667k4CPMrvNCqGCixYOAsnrIxcryiH0HxLFvO/rRZtUN02N
 XfOPvzZEgBs9Toovxd1qyGKKlIjJXiLNdW+fZFA89FiXOyN+4sxByas7tpffxT/okO0o
 SDt/dgs4CwuU05SmWvv2xVRH+E4djaT4uvWfTsIVZNnOBwtWBeQB98kVY+ca/taTMC7Y
 7AWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752620386; x=1753225186;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OFDftDinGJeWeNvMt3z+fTzSOMnuJXF888WFq+QttdM=;
 b=GDla6RhNVw2i4Vzk8SAJj6d/7Ph6LIe0AU9s/9qnBRVoXTkkZVf8G77/Qhi2Ke6ITM
 ClqlTiE3QNmFMUiUkSfig+YQod5WzZf5tutojWT2bbLDRZWZlglBzyZV9JNBucIIMQpQ
 ZsgCllra2PZPxvT1GMWDxGSEY7VpKMjVCen6jzTu0Y3nUwOVUAE9vd/0+Rme6Y8TyOrw
 z/UN8nKHs/FJ01cf46gPOCoEPA2aTfpkCqUHIVKPmcctggjbbXtwbAPUzy/u/khab/5O
 HFTmUOwAuIqF6QDhtmD2Nve8bGB8iKp2VEPs911xPyd0f/52lfF1FTGrUPRlVQN1Msgd
 STSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDy9UMlkidalPFhPJH7Oxt7KYmV0xT8JeDfNOKF9ue7vbrzRAlv5TKu5bLjgBo8D0EnlHg7u9fw4k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywjz6AAjN4Jqm0RDgK5GIj8kGFBWTFQh2mcqQ/AGPQAQ3SbJasK
 Mwku/+f3pyfKFjfKS3uc7EYlumHW3/4sOoxae/1/IMuRklqHb2pM6NdMjXOu6Fjr4G0=
X-Gm-Gg: ASbGncvKqyAs/+hh22LOqHruxDmKfk+2CkCQ658TL+AI8rXAaWn3QbuzH2/W+7kAPOW
 3C4tdHJTIWrByyo2TbQ3XZn+4/0QNSlyAtF2HXwZnfUbQfGhJj8C5yCRxTeqw0DKeBkc1cGBCg+
 Nbabsj2Ui6FWjkFUVwMXh1JHBnOgASeZCZMalz5GIIBw8d8yRXvPcKhlPSkjLXlIhUaFvDiA1to
 X8JSE95Zcwoi2pf/xysZ8INhDaH6YaCQbGjEPa6m1erAxcFa9b1TPycdrRgaMDiAmzXJEKbwzPj
 +n+ulHlHKqs3itYANrH7w2CR27MEIE6Tbp2arU3/p/XMPWICdLNYSi/kr9FUynNbk2Ays4r09wM
 Bhgrva8bCSt3A9BdXwHl0MrLBhzsJ
X-Google-Smtp-Source: AGHT+IFowfVX3G4HjzfwSYl1lhCis63CfINpQgLZSZ3TnKOciDf8Pn3iqvnmzXQdfCjFJtdK0DYWAw==
X-Received: by 2002:a05:6830:98:b0:73a:8a05:cd3d with SMTP id
 46e09a7af769-73e5734d2c2mr3545805a34.0.1752620386019; 
 Tue, 15 Jul 2025 15:59:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
 by smtp.gmail.com with UTF8SMTPSA id
 46e09a7af769-73e541c3a6fsm1022866a34.57.2025.07.15.15.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 15:59:45 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:44 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix a NULL vs IS_ERR() bug in
 xe_i2c_register_adapter()
Message-ID: <65825d00-81ab-4665-af51-4fff6786a250@sabinyo.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The fwnode_create_software_node() function returns error pointers.  It
never returns NULL.  Update the checks to match.

Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index db9c0340be5c..1f19718db559 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -96,8 +96,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	int ret;
 
 	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (!fwnode)
-		return -ENOMEM;
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
 
 	/*
 	 * Not using platform_device_register_full() here because we don't have
-- 
2.47.2

