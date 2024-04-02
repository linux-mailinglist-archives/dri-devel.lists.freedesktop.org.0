Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13829894F40
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 11:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAA010FBF0;
	Tue,  2 Apr 2024 09:56:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lWTQZAvQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD0D10FBF0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 09:56:48 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-56df1dbb15dso377574a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Apr 2024 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712051806; x=1712656606; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=718ZM86+71A8BdEVL2GnpD+8wX4z74S1znydXwGnzcw=;
 b=lWTQZAvQatQ8XzbKi4UWgZn++++G7t0mHjTs3bjoTu2KxejRor2wLvuq/cg6OABJNa
 G/81J6+TBw9ZNfcKZP2YcT9Yr4n/H660y6GJ0SU2Fye9U5Qn2T4LlRdR7eh7fp7Ozua6
 sqZxFlo6yIPV8dOQmaDqO5JIUEFlNgiJlnn61kKD/eUm4tabB8F2QV94tpLdR0bkRjTX
 +fvixDUFv5TuJ/HLeMcw05OEQu7q8kNX1+jxA4KNVk+ZNAcOS26NP48EpRYW1nu6FiLs
 bXnNdY6ZabT5McxEsxxN95bet/jTPMUNiBax3mOtyVejtO7id9vR7/NCLs2KuOOXjype
 ZQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712051806; x=1712656606;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=718ZM86+71A8BdEVL2GnpD+8wX4z74S1znydXwGnzcw=;
 b=muhy0eI6b72gLdPut9Wuho3NB3YmjOdYq64tj8hyCcT9Z3kI8+TE/BRG8HT6A7zfc0
 /uTZ4VgSf15T3aED/1cvGEz0jLHQPyb3EvTFXqb4Vutnl+dEpxP+eDMyb7aKIWOtBjny
 UPftKExAh6pFuka4oWur5i9x5NE9SMK6KgpUKDCZa/RLGwdDoux3Ev7NT4FqDEoK9BW3
 f7Xg1lnSD2EdbAYNqPWsO/5su/4imdhD5c/wVaKAaJHev81gP+jlIfMhN1kP/wCM2f8Q
 zTl4gIG52V6br5xj8UFe12roMtZwPkjX0omR51pvtNDnw2R1XIkpMAmA6fRzUFluumsK
 Uxhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMNERKeZNkRV4hFUjoZf8LaGefJMOWaG81jBtamVKLJynCJQJUkM9n/dnt9cliggFdKgzpcNcX3JHr2fRHAQj+PoYS7TbDXEyhadJPyNb5
X-Gm-Message-State: AOJu0YzEXUyZlnhRXfBXew9qiepbXui1Og2isrrHQYYcShd3RowEmn2q
 1nryFZ+VhrzDI95AnekQrD1+IkIfi05dUonFLqsRDbDiFZcQyeNGws+jPo8qP+w=
X-Google-Smtp-Source: AGHT+IEJjgwUkgIFH8v8m5U7taah5woPEVoICpVprECTBBshSjtqYr7X1fMj5MRpzZPnXQqCG7ctQg==
X-Received: by 2002:a05:6402:4311:b0:56c:197a:76e2 with SMTP id
 m17-20020a056402431100b0056c197a76e2mr9137367edc.0.1712051806315; 
 Tue, 02 Apr 2024 02:56:46 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 dh25-20020a0564021d3900b0056c09fda4e6sm6726525edb.54.2024.04.02.02.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Apr 2024 02:56:46 -0700 (PDT)
Date: Tue, 2 Apr 2024 12:56:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/panthor: Fix off by one in panthor_fw_get_cs_iface()
Message-ID: <62835c16-c85c-483d-a8fe-63be78d49d15@moroto.mountain>
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

The ->iface.streams[csg_slot][] array has MAX_CS_PER_CSG elements so
this > comparison needs to be >= to prevent an out of bounds access.

Fixes: 2718d91816ee ("drm/panthor: Add the FW logical block")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 33c87a59834e..181395e2859a 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -308,7 +308,7 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot)
 struct panthor_fw_cs_iface *
 panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
 {
-	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS || cs_slot > MAX_CS_PER_CSG))
+	if (drm_WARN_ON(&ptdev->base, csg_slot >= MAX_CSGS || cs_slot >= MAX_CS_PER_CSG))
 		return NULL;
 
 	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
-- 
2.43.0

