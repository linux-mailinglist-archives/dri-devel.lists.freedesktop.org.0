Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA5A3C07B
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 14:49:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E1210E6B6;
	Wed, 19 Feb 2025 13:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CPbNviAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E6510E6B6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 13:49:45 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-abbc38adeb1so280745366b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2025 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739972983; x=1740577783; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kH0pAU2X6UA0aC7rynWRidtqvLm/P00AqNLgxfvX0o8=;
 b=CPbNviAbiweHCq0VU0Wpz8HIOTnJ4n6njfKJjVEyyLEyIMrqcxpNnh69BidsUFQIN+
 0T0Ffx9hVVFRm8WK0wMRGDU7YZBJXar7DcMViLI2AXGmtz8D3RrlxbUKSicp66S+Up9+
 yZGMB3d8eqXRXl5lX5HLoMK1GjSVD89ldEDrm07Mi7pGbFyPFUqWbOfCL1dpaHfs4dEG
 YeJfP5lVaY0HuiTcjBHwRXFXNgSkeDnSGPI0hAHPqplSp8bH5RTcxXPfLRRHDpTqv8Qu
 hdgKKGBFqSDJBvt6rEjBBTN3+z/w2vFUzmWh0z1NDJ0c022GMlXpwaUDq0IHlCSj5rsk
 vTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739972983; x=1740577783;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kH0pAU2X6UA0aC7rynWRidtqvLm/P00AqNLgxfvX0o8=;
 b=CgDnBO1zzz6ITcBK1wyWdOFPqsjLP17dvnamZa9cRGhExjPOwksxHZs9U+FMld6ATW
 PNxsUYuWBi//fdOWfR73QFPd3oY4a0LYybpCXBPA1ZtNn9iGKMo0iJBV59xcGNecM96f
 bjx0GBa6BwlxWrMbdfdSi03vr6fYumbWqvz/3rQWkDjbtxAT+7PcUD4T00QToXPWReOt
 3YQzuflh1NSWte+I8mjXp31E4Cdjw84WG7cgnL42DbF7uEgp/GPYWbynLiKZ3hOGv6Wl
 1BxihO08iHu9KrVqxVhvZbiQYfOQF1gZBM8GFikLnEwz5gWBzq7CvNjbJ3jna4FcYQOy
 maxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSorRlLDUrRvpzjT0tpvlO6nx1AFI/9ijWAW2/utl6og4s89e4v31NZmcxOP+aOvbGlaFIg5kOYxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhF39mrup6gtCSUZuC9wybu1/cfykPZfhxd1+8hlySw3F7RWFz
 mGZvExzZAE2DvI1NeT4pqiTV3lGKtA7EpcUc5UfnOCaPswHdpMPpPAIdi49wzfc=
X-Gm-Gg: ASbGnctVsE001EADPN6Htb4l1WgT26qczjpnTt2emsjEL6/t2KDqYki9N0v0mA3X+jz
 Bs37v6lNT9G3sCblMq+ii/2sDCN6gu5IpzbM2hJhYKARGhplIu3nY1oYOffiBzap1hF/O+cKycp
 B6BMzshpBqD88LR9ZuvNGxKo8BYqJ6hlCgODtbXiofoHSs3qwf6lz6grKUSD0I5GtC/ycBe+Y5/
 P6CjdBljAOy7URoYvp71aCnS3N83lZJN2gzFPmfDThnO+RgHrgrAb0DC0Df/oYmmlu9tRT/LJZr
 k99M7O35EGD5vtJTmaB5
X-Google-Smtp-Source: AGHT+IEh++Dcbz3VxYv3Ivg8FCqcPYBovAh++mRW2ZFn7DD63wkwuldCqvj/jtkuwogNSm04zdgAcQ==
X-Received: by 2002:a17:907:2d93:b0:abb:b36e:5350 with SMTP id
 a640c23a62f3a-abbcd059da6mr292239766b.44.1739972983435; 
 Wed, 19 Feb 2025 05:49:43 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abbdac1015dsm117494966b.127.2025.02.19.05.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 05:49:43 -0800 (PST)
Date: Wed, 19 Feb 2025 16:49:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jim Qu <Jim.Qu@amd.com>
Cc: Lukas Wunner <lukas@wunner.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Su Hui <suhui@nfschina.com>
Subject: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
Message-ID: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
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

The "id" variable is an enum and in this context it's treated as an
unsigned int so the error handling can never trigger.  The
->get_client_id() functions do not currently return any errors but
I imagine that if they did, then the intention was to return
VGA_SWITCHEROO_UNKNOWN_ID on error.  Let's check for both negatives
and UNKNOWN_ID so we'll catch it either way.

Reported-by: Su Hui <suhui@nfschina.com>
Closes: https://lore.kernel.org/all/20231026021056.850680-1-suhui@nfschina.com/
Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/vga/vga_switcheroo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
index 18f2c92beff8..216fb208eb31 100644
--- a/drivers/gpu/vga/vga_switcheroo.c
+++ b/drivers/gpu/vga/vga_switcheroo.c
@@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
 	mutex_lock(&vgasr_mutex);
 	if (vgasr_priv.active) {
 		id = vgasr_priv.handler->get_client_id(vga_dev);
-		if (id < 0) {
+		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
 			mutex_unlock(&vgasr_mutex);
 			return -EINVAL;
 		}
-- 
2.47.2

