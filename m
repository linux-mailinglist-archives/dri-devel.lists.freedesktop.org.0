Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 946629B7DE4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 16:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3926210E8C0;
	Thu, 31 Oct 2024 15:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IHw4qBYt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76AE10E8C7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 15:13:07 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-37d538fe5f2so764185f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 08:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730387586; x=1730992386; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QK6XObohq4uefX4FllQNUsdSLzEjHl95slKcZ/jajZE=;
 b=IHw4qBYt2blqFXP8yPx9FtGHZltRzN056lWzoXabDMRs+FBhuCv7HnsRsM/r3b1T3X
 13zpZqQEjlS/ADZNb7B7dMTKSBPRWrL60PJ0/su6kGHeGBZPBxnZDRWrrVOsGdxGiCeQ
 wzYjyfD2bEMX+41iPj0arp9Zxmg1uRb/RTxqNH09xggB9m11Tc7LXQ8InzorsMDAjx4F
 lmv9QSHiLe2G48wo84an93tGr4hJOcnG+NUjq3NFLZj+SVkgG7NfdimvP6pspMPjqDHR
 BifNRsMF12/ZeG5hVzcXU/xWFBJH82lMFqWdS8bZYwaC3MVIACZ0V/6krq9buoZ+rP6k
 /58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730387586; x=1730992386;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QK6XObohq4uefX4FllQNUsdSLzEjHl95slKcZ/jajZE=;
 b=V/XU6FQUrnw+1tW3Eeo05WcJpTuKSUA8gACPUUsxGbnnD2AlQGCCEp0kE2k6IOinkm
 YwILL7gG/wMvGGmD0znjahqfZ7jWaTEq3QHEvypJ3uGCGNpdLrnspCD8XxYtGcQ2bEaw
 e6DX4NVitdbTzbjG3qe0nz3PBo3Ul67YcnLHnOIpHEZBpF901NlXtVxXRAjqcuP6dEq2
 9/rhIuq8dHK7M7Og6AIksfKpXm8yQDHOkHmAhM35yz9+HFpr1G2gB0vI6ef8KN6rLzTJ
 t3aBqlDb4UE2+9aWQxFcWOjoKHlw3DrFkODt/llh4HkmUWWczBdKMdSA6PXF+ykH+CGI
 FOGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHFzenGX/npwI3aj+78Nt42w21KPgFP/kFg0mPQbmKu3Ovy+hZnpQlB/Pqqp5ShNJ7Y28kKVeD+eE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4WU9UVIwihhvKThYQ9NiJce8PkB8lFrJ580w0rg5QqQ3woRha
 WVc3sdSTBlMDBrw4ShIsmLcYlahjZua+3vC2hgv5xu7NbjzDwnUw8HmYfzKJjKA=
X-Google-Smtp-Source: AGHT+IH/XyinT4aMIAmYRz/XaV52NMVVzbhuefR97ibNrrBU8D+UOohufjTYAz8u3fZprURgTQGTFQ==
X-Received: by 2002:a5d:64c7:0:b0:37d:4cd6:6f2b with SMTP id
 ffacd0b85a97d-381be7c6d38mr3172585f8f.14.1730387586155; 
 Thu, 31 Oct 2024 08:13:06 -0700 (PDT)
Received: from [127.0.1.1] ([82.76.168.176]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e734csm2418920f8f.60.2024.10.31.08.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 08:13:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC 0/4] drm/dp: Rework LTTPR transparent mode handling and
 add support to msm driver
Date: Thu, 31 Oct 2024 17:12:44 +0200
Message-Id: <20241031-drm-dp-msm-add-lttpr-transparent-mode-set-v1-0-cafbb9855f40@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGyeI2cC/x3NTQrCQAxA4auUrA3MtP6AW8EDdCsuxibVgDMdk
 iBC6d0dXH6b91YwVmGDc7eC8kdMltIQdx1Mr1SejELN0Id+H8MQkTQjVcyWMRHh270quqZiNSk
 Xx7wQo7FjHI4THR4zcThB61XlWb7/1w3G6wXu2/YDCFEeP4AAAAA=
X-Change-ID: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold <johan@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1865; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=Rn1RYLNCY+va9n7q8LPSyO8/hYLl0U5QTd9LaR9C9cQ=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBnI55w2gGvSWDHYern33C/bnQFSzNPqE4J8vopZ
 EoyMlfQF8uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZyOecAAKCRAbX0TJAJUV
 VgJcEACbGTPeHw0+Q/6YIPqnU7F3yFTCeTLPbJVrwZN2m/7kCuENAobZov43TD5zZG18pIx7ch2
 ecQLN/QlgWU6g0oll1X0ody4i6kKCsREC8ACcaSt6HhxFCCmY076kxQjU2B7VV3r0zLfl6Gy3ZW
 L7O86IZVvUTASSYBy3rrdbkhGi6JqUVJf7p3VM5ehGeuc/cdqH25LpQecwfOmq16OC6520DIFqH
 mch27QHafcyo+lBH4FqwaW+OE84jHhWHUUSPtOnJkj5m/nwNirepSoykqv0gT+YU0plToBHtFBF
 7xshbfaEdzDD5Y73PdB01xzcYWKJcBFd0Z7syDG/INa1w8xb3WclLBZNOP08LnITbDtMKqAJiyt
 Olv27jx+HU2H55J972oIw7rVhUbW4crjCHmrOfQOjHtASg3ZeY6cekuSSNU/em34/+uLs7P2OIQ
 UJg4BXEvOKhfc1+72APJ++dH+765KrsKLDoV1/LQ1Bh0LRbEWG26PkxuZbvA8ARQafNsFuWyyXe
 gca3pn4JJqcYzFUNHZS9vNChOotfgbe0DS2q8XeoQiH6w5CkgnAHJl7AP2DatujIiymGr8jzxEL
 Emzm22xV2yTlsIi0Ze2itmEIg/8E7n0HPhQOqDSYCdZU41Dsh8/wNITpjfCiP7Q0iCeg4yPBshb
 9qM/ZQtKSkxXFjQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Looking at both i915 and nouveau DP drivers, both are setting the first
LTTPR (if found) in transparent mode first and then in non-transparent
mode, just like the DP v2.0 specification mentions in section 3.6.6.1.

Being part of the standard, setting the LTTPR in a specific operation mode
can be easily moved in the generic framework. So do that by adding a new
helper.

Then, the msm DP driver is lacking any kind of support for LTTPR handling,
so add it by reading the LTTPR caps for figuring out the number of LTTPRs
found on plug detect and then do exactly what the i915 and nouveau drivers
do with respect to toggling through operating modes, just like the
up-mentioned section from DP spec describes.

At some point, link training per sub-segment will probably be needed, but
for now, toggling the operating modes seems to be enough at least for the
X Elite-based platforms that this patchset has been tested on.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (4):
      drm/dp: Add helper to set LTTPRs in transparent mode
      drm/nouveau/dp: Use the generic helper to control LTTPR transparent mode
      drm/i915/dp: Use the generic helper to control LTTPR transparent mode
      drm/msm/dp: Add support for LTTPR handling

 drivers/gpu/drm/display/drm_dp_helper.c            | 17 +++++++++++++++
 .../gpu/drm/i915/display/intel_dp_link_training.c  |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 25 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dp.c               |  9 +++-----
 include/drm/display/drm_dp_helper.h                |  1 +
 5 files changed, 47 insertions(+), 7 deletions(-)
---
base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
change-id: 20241031-drm-dp-msm-add-lttpr-transparent-mode-set-136cd5bfde07

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

