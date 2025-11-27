Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C67C8FE83
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 19:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C6AB10E840;
	Thu, 27 Nov 2025 18:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EXOD7XUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D7010E883
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 18:22:54 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-640c1fda178so2193813a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764267773; x=1764872573; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YKWiD1wozDvJbxoMDBeh7eVh+Lppci2WxPgnJe7OyQ4=;
 b=EXOD7XUpocYkMoxiudNaGP7C7D3VvnwBoGUsPEjwxm/6vcFLUhgVr7V+FdQ6YXpLC4
 hYRLcyq5iQj7PRFASGvPJUTLUXp6Q3ea0BAYjCH+CtjCZol2sKwTuj6jQiWwc3m8YYcN
 YWVzaoJChbl0yRRLqPDIPx5SAh95tqsIRwIrXGkpnI9olqmOBnWRSP+pwkCya0tsdhhP
 ggZXvx/RRang5SHChQZ9wK1Peqrr9IyRpJzXy4e44+ioju70oquPpME+r4WWZ2XLtyes
 eqv1ify2N6hrrS/wFbcmRjlDeaDRe7u1Ag2pJafVF76A44nRcEYNSpPnVX6VI8A1z0HT
 OQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764267773; x=1764872573;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKWiD1wozDvJbxoMDBeh7eVh+Lppci2WxPgnJe7OyQ4=;
 b=FBBMIL1Ci8GCjgCNRO2iCWjjMhaZ/ngah6wRxVxgs2UpKv8ToqkVtAd/AVDALgzTtZ
 4EjJiHLyzfrgSewMKu+HLPsCdUfvphaHSTOqXNDmC2AkrSEXVr4x+o9+s7c1PaOLInhv
 +zoKmVl+39V/A65N9IXFOVpJGh/aJwJMdIXRTlWZh36shRPv9F393IhYLDLyM0v61GH9
 DWSSK5NX2fDNSlgKshqaxzni6CpXZDrkEVrL7dqo34wqzEc+QGkHZzSFyi5jvjdrI/JM
 lKUHr5RQYHQJvJ+Ym07qUTp6O+qU6YZlGOQhzAXPfpMDDGbuPqyjTQVMDIfxSfAa6dEW
 2Xlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSVIgi2CT92J78VfP1OqEWKbpkqcuF8RPgIjx9DBC4wHNylxOljJeATMbszq37zVskXNTcoJidpBk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yws5KhQ1cTW5aDLd6Yb4MgWXUwmYu7TMePFntjddJjBTikZPL96
 /B9zPyORWlXKUZgb8N2VEZDnJ6TynDCw0LL1FT9nYmhUP6wVXyDz25c=
X-Gm-Gg: ASbGnctO7J/vgvTTHZ3Y+5mlt+C/NumbepcxSCY0XWpqr3B53ySd3IZdemEW/WXXaDR
 uqDVmZS6Sy9JNiV4MWSjO6VMDn3796vpjyPFzQCn+gpJ3lJgAqU6WF3wHjfxYY4JdEQsvedpYZJ
 h9IE8G3LysouQLIxoX7yV/hIq4hsmEh1KzIzgzMWatPebL0yQWQ53hoXx7IwiWZ3fuNiZ9xsk7T
 T2Ju7e48bJWm7d1LiruBvjoJbcCsKjbFQeejyrCYu/KAtdBineIARY7qBxgP+6Ubdv+2cIIRQ+1
 Xj0yn3Z2oAQBREWRXinYeXrrrCg+uCRKW8Q4lJmEFqMWKriStxf/D0CUu4p9iWTthQ/HXoBOiWG
 osos99Xlt+/beMDOfraUIJkZgP7+LMhTb1dX6VY/DIsQTRQsIqIZ/XvvNw3cfBLTtdFvHimFpiM
 534illIWDeRtxtfacNDASJ/VMzI7eFq+3Ii4fQXffoX23aHztu5CqVniGte7Lrl5TPZI1Cocc=
X-Google-Smtp-Source: AGHT+IHNZkrjfXQZeYu8VRMJ9sEdJ6dPxPLJBwgMuvhZaJF8dEZYgh3svLCKmEeVHuVu5VStsfQfAw==
X-Received: by 2002:a17:907:7f08:b0:b72:6b3c:1f0d with SMTP id
 a640c23a62f3a-b7671a469e7mr2207490166b.35.1764267773073; 
 Thu, 27 Nov 2025 10:22:53 -0800 (PST)
Received: from [192.168.1.17] (host-79-53-175-79.retail.telecomitalia.it.
 [79.53.175.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b76f5a25fcasm225084266b.61.2025.11.27.10.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Nov 2025 10:22:52 -0800 (PST)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 27 Nov 2025 19:22:35 +0100
Subject: [PATCH v3] drm/msm: add PERFCTR_CNTL to ifpc_reglist
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251127-ifpc_counters-v3-1-fac0a126bc88@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOqWKGkC/32MQQ6CMBAAv2L2bA3dUkFP/sMYA2ULmwglLTYaw
 t8tnLzocSaZmSGQZwpw3s3gKXJgNyRQ+x2YrhpaEtwkBsxQS4lHwXY0d+Oew0Q+CCobrWylUCN
 BakZPll/b73pL3HGYnH9v+yhX++sUpZDCYqOpyPIyU3hp+4ofB+N6WE8R/9aY6ro4lbXJlSJrv
 +tlWT494fwF6AAAAA==
X-Change-ID: 20251126-ifpc_counters-e8d53fa3252e
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764267771; l=1513;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=BYc9eG/7xNHRelEgOLZ8MfPdhDrlPnZeSwZLNF9pGgs=;
 b=osGbVboLLrVEabJOeT/IL8VrAcnOO/dmBJlLk38onTJZtWhhFZdcyojrab0K/BeIKlw776AVd
 vA0TxRCOXw6Dsyn0X1nHS+E3J8/x+O8k446JL/SfY02EMi4OxNZY32Q
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
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

Previously this register would become 0 after IFPC took place which
broke all usages of counters.

Fixes: a6a0157cc68e ("drm/msm/a6xx: Enable IFPC on Adreno X1-85")
Cc: stable@vger.kernel.org
Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Added missing Cc: stable to commit
- Collected Rb tags
- Link to v2: https://lore.kernel.org/r/20251126-ifpc_counters-v2-1-b798bc433eff@gmail.com

Changes in v2:
- Added Fixes tag
- Link to v1: https://lore.kernel.org/r/20251126-ifpc_counters-v1-1-f2d5e7048032@gmail.com
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 29107b362346..b731491dc522 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1392,6 +1392,7 @@ static const u32 a750_ifpc_reglist_regs[] = {
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
+	REG_A6XX_RBBM_PERFCTR_CNTL,
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,

---
base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
change-id: 20251126-ifpc_counters-e8d53fa3252e

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>

