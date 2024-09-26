Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FFA987A66
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 23:17:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35D5B10EBDB;
	Thu, 26 Sep 2024 21:17:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eKSKdiNH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37AB10EBDB;
 Thu, 26 Sep 2024 21:17:03 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a8a7b1c2f2bso209582366b.0; 
 Thu, 26 Sep 2024 14:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727385422; x=1727990222; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
 b=eKSKdiNH6Iwnhwj0GiBcCl+3ikswnHFHv3T9IH66z2wE9BgWCN36m/iw7CCUWv4R1E
 9tJITObh89kD6Ph4s3hxKr+beddUXfcp9TGohhPvBcapxrzUizDPvlHJv/LtdS0zWtKH
 rYev7adZvkErR9tB7cuNX1WpJ+zDQdHTUasp088atbLX0/d5oMyl/SI9k6nMRcyt63jq
 exQXV3PDPS6vrPpc5DskO2dPShbDpiP1ceIWFvvQXrA+LA0oCSYPoKIQOGwA/AX7Eo1V
 Fry0+MmlqtSB4N60A2ioVmVyE424zpPyyvm88mzEiAnquqxgi/RNQUWpa2O8IuBeIh7P
 Os8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727385422; x=1727990222;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DtlKt6idkJAcSVx+NWk8duOZfO6okh0MSeZqXt1n944=;
 b=bJSIFcGbtaoI1aYCa7hFJINC6mt96FstzezFz/MIQEHOXviMb5R3E1HIUBmaxip/7j
 n/Hk7xlG8U4j1ErGixrqIjVxoSzDwEWP4xhYrk1y2PH8rt+kZKCJgTIEjDlJQnEJjnQm
 kS4+F9MhxBflxCUxGFAPC7MI/7rZ6eR5kvdtRzxhUyr/ByNVZfXDZtcO5LHjlrrJiU3v
 mqf4oV6R9t8BpM98XLUpFp0GEEkDvXJnc3V+CbWnxbbpLNVOy5rEfaFlqLTTEF+82kzg
 7yJY48sPbBCmzY7wWkJ28QpzjOWikWFkUyp0rZRGbxG4YP2TNrRyNeaTQqZyr21Bz2uH
 oifw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVko2rv/vUNbqp1Nboo/crBZP3ujqKbPavSpAL5Mi0mytVs/hROMx50+3Vot2K9xampWEDCH5PlXQQt@lists.freedesktop.org,
 AJvYcCXsRzzX2hVUQ7k7A33zbn6/RL4poKetmokLoz8ObXVcqpQsIbZqF9yVImFQorUFaqlJYsq918Raqho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI4TlXZP6GjBthRHBYbR5FG+IplrLG8ZL346ODnkWkwQsvaXSp
 DL7Lto2y9nEFqXylN+orUc1F+ZOjimUqAD9HkBymTo60dqrLAq5E
X-Google-Smtp-Source: AGHT+IFeG3xQe2NUPb0TWY2IpSWyUWxXtqMEEggeGF8jV+8iSTppPXNsjqibA2NC+C8f+F4+2Kaaqg==
X-Received: by 2002:a17:906:4788:b0:a8d:2ab2:c99e with SMTP id
 a640c23a62f3a-a93c4aa6a5bmr61656266b.55.1727385421887; 
 Thu, 26 Sep 2024 14:17:01 -0700 (PDT)
Received: from [192.168.1.17] (a-lu6-5.tin.it. [212.216.221.196])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c297b7d6sm38862166b.162.2024.09.26.14.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 14:17:01 -0700 (PDT)
From: Antonino Maniscalco <antomani103@gmail.com>
Date: Thu, 26 Sep 2024 23:16:46 +0200
Subject: [PATCH v6 04/11] drm/msm: Add CONTEXT_SWITCH_CNTL bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240926-preemption-a750-t-v6-4-7b6e1ef3648f@gmail.com>
References: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
In-Reply-To: <20240926-preemption-a750-t-v6-0-7b6e1ef3648f@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antonino Maniscalco <antomani103@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727385413; l=1479;
 i=antomani103@gmail.com; s=20240815; h=from:subject:message-id;
 bh=HrcVfm6GphW+dkH2/eI9roTkaCaCbkN7M4JC5UFjlfM=;
 b=ec7LoUmEJAjOmebgibx3u60S+UsCHv4BwpHYl/Nc/7q9K7NGp9GiEBLqx/gvyNu6Wv+J7Suz2
 nQnm9jESmN5Cejmax/JV9YxHfosajsFLUgzIOl368HKPOvv+/ryayTH
X-Developer-Key: i=antomani103@gmail.com; a=ed25519;
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

Add missing bitfields to CONTEXT_SWITCH_CNTL in a6xx.xml.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8450-HDK
Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 2dfe6913ab4f52449b76c2f75b2d101c08115d16..fd31d1d7a11eef7f38dcc2975dc1034f6b7a2e41 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1337,7 +1337,12 @@ to upconvert to 32b float internally?
 		<reg32 offset="0x0" name="REG" type="a6x_cp_protect"/>
 	</array>
 
-	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL"/>
+	<reg32 offset="0x08A0" name="CP_CONTEXT_SWITCH_CNTL">
+		<bitfield name="STOP" pos="0" type="boolean"/>
+		<bitfield name="LEVEL" low="6" high="7"/>
+		<bitfield name="USES_GMEM" pos="8" type="boolean"/>
+		<bitfield name="SKIP_SAVE_RESTORE" pos="9" type="boolean"/>
+	</reg32>
 	<reg64 offset="0x08A1" name="CP_CONTEXT_SWITCH_SMMU_INFO"/>
 	<reg64 offset="0x08A3" name="CP_CONTEXT_SWITCH_PRIV_NON_SECURE_RESTORE_ADDR"/>
 	<reg64 offset="0x08A5" name="CP_CONTEXT_SWITCH_PRIV_SECURE_RESTORE_ADDR"/>

-- 
2.46.1

