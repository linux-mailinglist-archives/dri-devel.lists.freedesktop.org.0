Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD68788FBCF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 10:43:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCD210F2C9;
	Thu, 28 Mar 2024 09:43:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="wihrUVD8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F43310F2C9
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 09:43:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-56bf6591865so1126787a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711618981; x=1712223781; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E8hsC6NRPdxLP7lp60lSArweYtIzuit1meomkaj/K1Q=;
 b=wihrUVD8z1LvW+znsNVPIDnMnx3Ur7kVk5XDbMgWBPrh7E0cGzPlrOZtLHFfrr9Qm6
 hcvI3VLGHZqTocUdgTzebkEu7nYaDiBtx3lbuRWLnDy+YJk4oNiDy43/D6sUSzD/BRHw
 N30JnEQ9ycOCw9sOTnSd8ZE0xWK4E2PCgPxioO7bInLJ5ICc6+4mOmJmlXtGEBuF+kUR
 mTjy5zqaPiuXnvnJu81ziRL2qq+iNZNUKzqmsJbfqde2NvahSBVh4uziG6JUZf4W757C
 ZIKGRDqlYaCxS4yBqiNytNds92QYrLDTdDLA77m911TGYWBfCMxmNMZQp0jdq7ILLia1
 JADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711618981; x=1712223781;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E8hsC6NRPdxLP7lp60lSArweYtIzuit1meomkaj/K1Q=;
 b=IjAXLJc65GMB+jA92ewJVVsUohxoN7ECJTflgdPkqsELMUlrsVV2VJElu1iBDSdiyp
 VoYYMQYHb+iApbn3tPxGMMoibomQYPgcR+nAshN6DHbLuulnK8dgJfrWVUdH9Ce7osfx
 3Ves8Q17NvkCeHhLCOSbbdi8F14FJt1N7B941tTjvaq2gD4lkdpIJRuk3S+Hk04MVeOA
 tRjqwEwoc6zp8OvoTMyugy3CfOj/xiPVbJM9yVyp4gF11xv/LXVVw2l3AdSD9eCHcaMl
 C6NYa0ADz7nHGRrn9VBLGv2kNpYRXZrkhdiYzD/im3GL93Fyv2qUUo7YQYcgcYHQfpF2
 B8ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHdKFMsqXSaCcv/DVrOk1YW4b/5R8zb+bVdM4KMerdx8E5FsP4LmvkkLSu6PK28dP51AeRtV5clKGrmYgnFK4ItWmhHmbOoertf468/1zO
X-Gm-Message-State: AOJu0YwZN7GAjKgR4MlZcBVSyiSysTrJgtIMpYrjNT2awkru0ES/x8Kc
 k332TQGI0iWr+azPb0sxVDC4GsoedVdr+fGnYmGrCpBs7v/jgsfA/WMdOzb+h9Q=
X-Google-Smtp-Source: AGHT+IGZx9AnkUFMackC9AU36r/cR4Kcv7nBXW0BJa3Ktjw3YvY08GtNzCtirWitkr3VymvIRKiZQA==
X-Received: by 2002:a05:6402:348d:b0:56c:26aa:f786 with SMTP id
 v13-20020a056402348d00b0056c26aaf786mr40326edc.10.1711618980811; 
 Thu, 28 Mar 2024 02:43:00 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 l2-20020aa7c302000000b005645961ad39sm631362edq.47.2024.03.28.02.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 02:43:00 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] DisplayPort support for SM6350/SM7225
Date: Thu, 28 Mar 2024 10:42:43 +0100
Message-Id: <20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJM7BWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyML3eJcM2NTA92UAl0TQyNjC0NT4yQTEwsloPqCotS0zAqwWdGxtbU
 AQBFn8VsAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
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

Add the required changes to support DisplayPort (normally(?) available
via the USB-C connector) on the SM6350/SM7225 SoC.

This has been tested on a Fairphone 4 smartphone with additional changes
not included in this series (mostly just wiring up TCPM and the SBU
mux).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: display: msm: dp-controller: document SM8250 compatible
      dt-bindings: display: msm: sm6350-mdss: document DP controller subnode
      arm64: dts: qcom: sm6350: Add DisplayPort controller

 .../bindings/display/msm/dp-controller.yaml        |  1 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     | 10 +++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 88 ++++++++++++++++++++++
 3 files changed, 99 insertions(+)
---
base-commit: 871760455183dc66b3e185f8d3ed2184cc9fac25
change-id: 20240328-sm6350-dp-41238153b448

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

