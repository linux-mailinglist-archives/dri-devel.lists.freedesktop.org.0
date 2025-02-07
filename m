Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F757A2C460
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 15:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB60C10EB11;
	Fri,  7 Feb 2025 14:02:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dKuooKBb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6AE10EB0E
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 14:02:29 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso14032805e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738936948; x=1739541748; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=InbuS/CYzZdN7pnMEKIr+CtCUcWjZ9PfYIqG/HLZbPg=;
 b=dKuooKBby/DMArNTV+q6ZbGNxNHyV5tCU0EeHn1MHYUf42JVnCk369icaEoWN9vpJl
 VK1mwcfYGpWmRDfEPhoYKG/cjRwrNMxAPqlhO4kruVFvYo1sTSbdNto1bLShcfs8sgMy
 3XyWNOxPIoEQuzQEMNLr1HYTS/qeZD2/xFSX3kqapC6eIUfTWhPhsQxdPDc7KUFoqH1Y
 /QVEYsLEGX2PfE1nEJM33qkk5irjulh4oc19WfJd0VLOsdD0QnQVKH1G75pX6gxT31zB
 5P0pY7RAFYLcHFGO440gC92+1xS2E6p/PgUf4MlfFsEkEQmMjOw5EWlYP9StstAgNiqA
 7zQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738936948; x=1739541748;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=InbuS/CYzZdN7pnMEKIr+CtCUcWjZ9PfYIqG/HLZbPg=;
 b=lAa+E8oKe8VCbs+dkgcnXCwEJv7T5ydCBPJOQvChrQWxM8O2yndQsUYoz6iYyuivpq
 RoOEDMx2oOb+62mJ+vWk7/rkuFppHsYcfN07jA8NlfHNRvO0AJk3y51AZ0tCnJXOuXyg
 /XqdxoP6/G4V0P5FkGGlJdOg4TDmB8kh8KldcsdvVgqEYcP+mVXDLyxit2pG82tg493b
 gl3ZWiu01GCZTE/bsxgu/FbD9RxK9pDwx0F45EUEKFk2/mOYRkS7Lun4CnPTPhCKjn1V
 uAWfL0RFK4cFWW0l2nC1mbuxtgK+wrHED74DVTHtG7CZzJUqOs015gS3F+zOZT1M2Wms
 iyjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTZG94HetOfz0QsCHGIeH/OxP1rhfminZrqqUAtlyRQs7iZnESA37CG+ERVmh0fXZydJyhwdlaBiU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDV+L+Bj87AI5AMO/AOQVOxUERX8DB2gjskDEbGODB8GtTzGUN
 URqZKjnok2L+Rh3f62fSoMzQyumRpSMPt+xEez9oZR9zlCiP1bnzOoYoa/W5Ppo=
X-Gm-Gg: ASbGncs7icSiUMbOj6rBIGingluHWXNUietbumGnPpar3DmmkfbWfQNgn9DwXgS6FXQ
 9wys9o56e3SJ7WYfuLv140dersFIr06KPjt79NLj9Uix5mTIOXbTODoA+t83R37XjQHMXQhjppX
 zZgYJsY0OT+AoAH20M/WZTEf1qlsu+S3iC1z8+9stuYLKUPBZtDU37GJgFJv+PO2ma+Wvv4wU6m
 wtX8Ut4BfWZrfZ6YmEQpVpFV9Dlz1WiJV/IzSoWoAmOiqcJt94HeH7/B0FgJsKoTuYihZho8uIU
 7jsXUkdhSEk+A4Llh1ku9NbJiT/+vYNvbYf5
X-Google-Smtp-Source: AGHT+IGixxfp2vVnu0wNY2WrQxScXmsEJRpI+NlNtNPSw4o2xKrKS7GRX+gjA8je7436JMFa8YwqLg==
X-Received: by 2002:a05:600c:35cb:b0:436:a3a3:a70c with SMTP id
 5b1f17b1804b1-439249b2cfbmr26167995e9.28.1738936948229; 
 Fri, 07 Feb 2025 06:02:28 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9652bsm57384605e9.2.2025.02.07.06.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 06:02:27 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] dt-bindings: display: qcom,sm8[56]50-mdss: only
 document the mdp0-mem interconnect path
Date: Fri, 07 Feb 2025 15:02:24 +0100
Message-Id: <20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v2-0-f712b8df6020@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHASpmcC/52NQQ6CMBAAv0J6dk2pFtCT/zAcoF1gE92SbkMwh
 L9beYLHmcPMpgQjoah7samICwkFzmBOhXJTxyMC+czKaGO10TWkMJMDeTer1fD2IkCcMLrAjC5
 BT+yJR4GBVvD+VtvBmIvXVuXiHDHr4/ZsM08kKcTPMV/Kn/3vs5SgobGmL33VIV6rx4u4i+Ec4
 qjafd+/kOYojOcAAAA=
X-Change-ID: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=yHmpriYTThEulo6xT9RHvGEqSO7uKIIyE1xA3fKVsy8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnphJx9MTyEErowqwBRaSGtJfWWc4eXnA12SCLXliH
 XBvP4GqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6YScQAKCRB33NvayMhJ0SWjD/
 9nJtrSWVCNZt7y5dqdR0Pp4pdlGN62cvsLbDQWSdEqiWdpIB7X+az0j03zA9PESyf5A8z7+CuAaZ+l
 tppmpfNoYnIGrvZsNphVxY7Zdah458L/B+ICXhMilgSpXwF/KoDHeGjYBa4lOFCEUQyyDID9WNqXCh
 +W+YHPwCitfohGL6SyIK2JwxYWzCFSxryjK+dR4BHgl+lpR2mji2iYV0z4hvH/AuuqPnvo2xwKn5cB
 4Mh0+osbG8BOoefF9Tb1wCfDjq8SCd0lArr1xruGwVuu0W0teHygXaXl0Xq5MRCoWVjNFAe/spvwEX
 dyWPE3Y0mEvROqrDVLvY1FGbqgDBeqwZS4etuoCpifaJXanako4XLpQRXpXJ35iUBceeYyzjJDy1K0
 Fy7y+lY5B8aS4YTyDeC6BEPyr43i3MWKnI9V08Oh06oJXsMbb+cGo05GIzJ1dIl0X+tbhgEwvk0JXK
 z1uPTbq1ExxCD3DQ/uWYo+OUWgKsiVCBVRmb0yKt7qECvNnyh62qysBjdxj7I5bfB6Bfa9ghfxX7Cl
 n+keYwI1rafwusC0WCtHYvRTpKCAZgKWR0Eb/yYFgKA7S+UW+UWDcBL+KfEa9Gg1H0nB1RH5sYSlnE
 wYimISrkGJEwa/A0ZUlwQvv2CkJFFPlYTi/L2Jk+EmwGfeXyGlB930r6HpVg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The mdp1-mem is not supported on the SM8550 & SM8650 SoCs, so only support a single
mdp0-mem interconnect entry.

This fixes the following errors:
display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
        from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- fixed example in qcom,sm8550-mdss.yaml
- Link to v1: https://lore.kernel.org/r/20250207-topic-sm8x50-mdss-interconnect-bindings-fix-v1-0-852b1d6aee46@linaro.org

---
Neil Armstrong (2):
      dt-bindings: display: qcom,sm8550-mdss: only document the mdp0-mem interconnect path
      dt-bindings: display: qcom,sm8650-mdss: only document the mdp0-mem interconnect path

 .../devicetree/bindings/display/msm/qcom,sm8550-mdss.yaml        | 9 ++++-----
 .../devicetree/bindings/display/msm/qcom,sm8650-mdss.yaml        | 4 ++--
 2 files changed, 6 insertions(+), 7 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250207-topic-sm8x50-mdss-interconnect-bindings-fix-dd975f223d05

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

