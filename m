Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8CB72DADE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 09:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B4210E33E;
	Tue, 13 Jun 2023 07:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B2610E340
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 07:30:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f8c5d0b19dso6456485e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 00:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686641420; x=1689233420;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PBDkCj6IzOprmvk0wsDqFhkKf1Z88p1shaiXxO1NVss=;
 b=g/f6Nuxm5umr8221WLg2gB6WuAwwRdelfM9cp7jbHsFroUbgvCny5Hin0PWP1NCWqN
 KmSQRXoc6iNaLWPW9F05YFj05Ze4Rn8yrKbiV1qLJ6PQgX/BGVLN2orFyf5kXoNcQiGM
 wJagHXFxVbAyj9LvhM7/C/AI7+p6h9/eaD2lbPclK34C1kF/Nqn+ZOh6Qqu2rfVnAjU+
 2Pk9P6HMInUEl1/snHf0J+y3YsGu7lYTVHufP5dMYcXGf32N/xCNptna+ugKoOVBFWte
 aXDbRDgjnA1uZLWfIZ/YrPWm1QFvtE5kqtoctvorUMIaRTy8yhiY5ceKD7PbfGpx7X5D
 nbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686641420; x=1689233420;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PBDkCj6IzOprmvk0wsDqFhkKf1Z88p1shaiXxO1NVss=;
 b=a4aFTWy30IVDY8Kxq25i+FhHEAi4gJrsCo4XLOEMoGJgMxzupXsJFRVbFRgWWQSr0t
 jOo9kV8UofoFoj8uxeG2cRZ9FKuzqphc07Xo74zUWv7csJJv55GkWQLpFtp7Pxkn2CQY
 yvYZdwBseU/qBi8EinBbe9G8oNc/VCOQrdKxwPRZtJMTA4NxdLQagGbKG2ZL+lmXr5wA
 skwq78iuMFXxRBuvNna0W/MyU0pqe7cD8ouDBhMMzyavoBrdLBcmLYrSok/6YuqokoIJ
 VX+Q+u9m9ELXut8Qu+4Mkjw70u1hj/4+yT8qLKgZrfvYAHAstyeHmwAbR6dQGR/WxPp6
 F9Zg==
X-Gm-Message-State: AC+VfDwhas+yI40C3j478O61SndSmfztIK7WpGKb+JGHfO3q5cuGq+vK
 MkT8CizoGcmp8Y0qQuwkVxkCvQ==
X-Google-Smtp-Source: ACHHUZ6GhVpOh89E7wzRUZl8GRroyUGL8JF6b5FpJb/rSQKDuOUL+eUZZiMjzNbPPBGSLWTlVjOZ/g==
X-Received: by 2002:a7b:cb88:0:b0:3f7:e4fe:1dd7 with SMTP id
 m8-20020a7bcb88000000b003f7e4fe1dd7mr9485430wmi.13.1686641420564; 
 Tue, 13 Jun 2023 00:30:20 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003f17848673fsm13474453wmj.27.2023.06.13.00.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 00:30:20 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/2] arm64: dts: qcom: add DP Controller to SM8550 DTS
Date: Tue, 13 Jun 2023 09:30:11 +0200
Message-Id: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAMbiGQC/43NTW7DIBQE4KtErPsqfoKBrnqPKAvADxvJAQscK
 1Hku4d4V3Xj5Yw037xIxRKxkp/TixRcY405tXD+OhE/2jQgxL5lwikXtKMMljxHD/WmpaRwn+t
 S0N6gn8EpJpzlSvbKkzZ3tiK4YpMfG5Du09TKuWCIj/3vcm15jHXJ5bnfr+zTHnhaGVDgBgPyT
 hspxe8Uky35O5eBfNSVH5V4k1ArpRk1Xkn1TxJHJdEkGUwIvXdadOaPtG3bGyb9a5lqAQAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1315;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=8DvxRryXQQQ0y8Oh2tMAV/xSohwX06++G2+ngE4ucu4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkiBsKTJOKtHi2EI9K2dRfEfI1j0+AEfmWgTRgqqGl
 BTBUvuuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIgbCgAKCRB33NvayMhJ0ZjJEA
 DJm9dMBNEkuCdJ3V0k54VYU3+fm2YHKjKvaokmK9lT0WHXfQ5ABko38xxGcM30yozhSFcOYLn+O1Oa
 +PpY183grbzvysTLCfD0/uhAm8euXU/AFQAB5Qzpsm+v7gMSqQP96eXVSV498GA2EDB+ZRa3wlDitc
 5zUXSD9+nw9dxySsePDHZzWt+7GdCBSMUTBDnaXpp+VS5tFgk/UbVdNpUZ4B1a3eyHjbv7blKFyYs9
 eOmjYmNGYuMVd3mab/17OvihVinkileSwI+hbyDhRPV2aLsFOXnOptoSTcPOx2HGZUxuGf5Bhfobt9
 Ec4PgiVgwsU2gDd0YsMF1EbPgpBDcpdanesTjae7ews7tC9yU5PquZTGeZnaEtf5Jd/bErbEYvTviM
 Y/hesIorIfPnONdmQIkutTQqqEvIHsp7hJLJV7bBcTUM+6xTYzbQeC0RaPNocET/5XJm/rFWaN6dVv
 yMdqkdWVcLnMdx8bCJGw+Ss67mA9WgwpVis55V7A2WL8SlkMC4GV96ine9E2RD3iSmUuJ/CbrtvSUd
 oDvLsL06kOeaL7rJwxWVLGI+kxTJ6dMKXm6pPP0ricTmTytaxDCabGH8Z8Mzyc57XK1JvaLNFeQBMR
 aSYtPpsKhbqJt/wJyGZIRN7zPIiEfPNLdfa3C9ccoEzaZZAhWCq1JNR0wDrg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DP output is shared with the USB3 SuperSpeed lanes and is
usually connected to an USB-C port which Altmode is controlled
by the PMIC Glink infrastructure.

DT changes tying the DP controller to the USB-C port on the QRD
board will be sent later.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Added review tags from v2
- Link to v3: https://lore.kernel.org/r/20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org

Changes in v3:
- Rebased on next-20230609
- Dropped applied bindings
- Link to v2: https://lore.kernel.org/r/20230601-topic-sm8550-upstream-dp-v2-0-e8778109c757@linaro.org

Changes in v2:
- Added review tags
- s/lov_svs/low_svs/
- Applied fixes suggested from Konrad
- Link to v1: https://lore.kernel.org/r/20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org

---
Neil Armstrong (2):
      arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
      arm64: dts: qcom: sm8550: add display port nodes

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 95 ++++++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 5 deletions(-)
---
base-commit: 53ab6975c12d1ad86c599a8927e8c698b144d669
change-id: 20230601-topic-sm8550-upstream-dp-b713ba275d7c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

