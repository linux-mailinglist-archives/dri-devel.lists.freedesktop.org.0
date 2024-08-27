Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E329A9620F0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 09:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C0310E4BE;
	Wed, 28 Aug 2024 07:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EMSMiuFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD8610E31C
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 13:22:25 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-2021c03c13aso41221215ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2024 06:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724764944; x=1725369744; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JJL+N2eLmHLpakG2qqkvm53peIMy90DFUbIm7rn1WZo=;
 b=EMSMiuFDGfj+N1TMJ3KTOtfEOlaQKGO8UgInwHXHLBuhE0F4xXxFhshhHhJSYpcY1s
 LPMxuYRq/YS+ETc6jkOnIp8ZVSZTgvp5IaZM5Wols+ViKMsX6A9wVSl0J3+gVpUdRRpv
 9/nlbN9l+39tOdNMbYn0k2kofE5YDsYgz95itrrZvpL2nQHk5hxNXPyL5cBFV6xZVdnK
 V7vD/x2mPK0CSkuCSzxeGlyYiv6xbxQfNTm4c7EXl9qRRXLe2UK1dhed4lFNNUNOO1uD
 c5xngqpdZGYkFoEFVyQR8vEuN0Ztg8ZSsNWiLeDC3gQ1h+kD1kIe4G+nKHCXlKwU9HSA
 IZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724764944; x=1725369744;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JJL+N2eLmHLpakG2qqkvm53peIMy90DFUbIm7rn1WZo=;
 b=R/8P/mD2QlGMxZW9WaT05EJgPsb5/qwpoNGXhRKLi25Rt/+MyGGxgUNSnRytwJrdLu
 is99WZmMVnpTVCZQ2NErpjCNntYZJxO14YSbbxL2lrw8Pxa7XjX1MJof8wqdnIi9D4sn
 nLEfYFIsV+GNOmZcnEOCl8S3VwvFZKEshq7knvH4fkNkqxV0GqvZb4hrAkTa26MvxEle
 T20sUtEf2rAdnkmlKfF1tVKLBIY4BCg9PZrUVIH0hwHakgShcORiPMsoxjz64ZyVSfU6
 VdK9OxfdxbOIIksVxIX+HORj6/JuvoS4hcw4w8SQ/JDhBeZs0TyXWoFF5SmdgeUcncj4
 YlKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWR6Kb9tMUEZnV+99oWRdNr6Ns6QvnsYyErP93Tei5MS4VsAeA1dQ8OGcfZgEutydcw9fWHrqVBcHw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywr1Izl8qrQuqUdPVI1wWtWYQf2q9yfx1GFfhkbdW/yD4UQB7cN
 cZaz5jtvsjX5FGepMT2CgjS5U1HuhgAWgPG9kPTYPquyv8OKLRmN
X-Google-Smtp-Source: AGHT+IH+gjePti/vhbU2OR07ibez0x8aiGAtC2+64qUjwk4+KfdD0ZNR/xV8p1UvVbBfp3B9hJPAuw==
X-Received: by 2002:a17:902:ce8e:b0:202:4363:b5a9 with SMTP id
 d9443c01a7336-204dddc4697mr47329445ad.21.1724764944480; 
 Tue, 27 Aug 2024 06:22:24 -0700 (PDT)
Received: from localhost ([115.96.151.110]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7cd9acdb54asm9320063a12.42.2024.08.27.06.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 06:22:24 -0700 (PDT)
Date: Tue, 27 Aug 2024 18:48:52 +0530
From: Aryabhatta Dey <aryabhattadey35@gmail.com>
To: liviu.dudau@arm.com, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation/gpu: Fix typo in
 Documentation/gpu/komeda-kms.rst
Message-ID: <l5wzytcamcc43eadaquqbrfqilq6ajfnnseh37c77eceamtw35@hhtdipi4h22c>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Wed, 28 Aug 2024 07:24:58 +0000
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

Change 'indenpendently' to 'independently'.

Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
---
 Documentation/gpu/komeda-kms.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/gpu/komeda-kms.rst b/Documentation/gpu/komeda-kms.rst
index 633a016563ae..eaea40eb725b 100644
--- a/Documentation/gpu/komeda-kms.rst
+++ b/Documentation/gpu/komeda-kms.rst
@@ -86,7 +86,7 @@ types of working mode:
 -   Single display mode
     Two pipelines work together to drive only one display output.
 
-    On this mode, pipeline_B doesn't work indenpendently, but outputs its
+    On this mode, pipeline_B doesn't work independently, but outputs its
     composition result into pipeline_A, and its pixel timing also derived from
     pipeline_A.timing_ctrlr. The pipeline_B works just like a "slave" of
     pipeline_A(master)
-- 
2.46.0

