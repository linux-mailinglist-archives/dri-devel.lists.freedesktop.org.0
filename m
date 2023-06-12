Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6111F72C9F7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 17:26:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CDE10E2A9;
	Mon, 12 Jun 2023 15:26:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FAB10E2A8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 15:26:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f6e1394060so31796765e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686583605; x=1689175605;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5P6+8pmTJQLaqWt4MUFVq+5PvmnK6Tp4zadrKDEVXSQ=;
 b=tLfhRqVs9oqzS+Y1IqhytTHrq/m3vnm80B4X/2kLq4hslqWlgi4Q3lZS7Ka64fFja0
 80YPD3k2HoJy6cOcuwyREZKV8HfN7TFwLtai8PzNDw0ykYpsLnyFDU80vaHUU4UrcSA/
 by+pDk5ANP6xHWKXuwY07O/SYnKIlAJvz3a2zJNgzjTyOY0IDn2PXCM/YkU6YHVFRiG7
 b4aLEOoRggjKi6oMFmdZjklBwfrH+uLCaVqEmbnIJVyx5JrQD+AdKoxjbWE8xDXRU0FG
 n6hfw2ThtY2uODaYUT84roXi5OnJL8dLoZ5eXo1tvMWM9MJ+wHpt7wM6N1Efo1AEn+K5
 86Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686583605; x=1689175605;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5P6+8pmTJQLaqWt4MUFVq+5PvmnK6Tp4zadrKDEVXSQ=;
 b=dSPgRBmXwmNLs7l2a8uDhs11oOkv3DWk2GPbNTh3VXZ2JwPda+gTVZuzZqUI4y4WVB
 6ei1h9C741FRhGZdPTKW4o4IMWBkFpwtb2tqfjaxGnXV0nPLWp92YXM++3FBhGIzFgdb
 zrd7EmeZG609s8inGjEfEXUeYETE81XzOMurcPShUi7Fi4dldscBPxsuckgcU944HzLs
 9wE9bhWDyrfjWdIYQ0GBHzTag7AwrQLJlcIKYV8dOXqPV5O8BWP52mwI3IVBYwJZVKqP
 tvmDNPp5EXKNiJsDJavG3T/YvYCz1R4BQQOPX4Xjx7kR+sZTd90IwdCfQBKouuvZdbxz
 BsrQ==
X-Gm-Message-State: AC+VfDwWgt3XsgLRGqJLqwI0ZKmFFj2r15SX4Fj48Uyrye4TpgjJv6B/
 MaCDizlWZ6ypLKxTUhVgwhG1Fg==
X-Google-Smtp-Source: ACHHUZ7tlDghlBElknARzhW9kMKJTU08lYOJVj1qD+XB4mG5i6ArEJi4sNH8X9gXNKJ0ReGZXve6QA==
X-Received: by 2002:a1c:ed06:0:b0:3f6:6c0:7c9b with SMTP id
 l6-20020a1ced06000000b003f606c07c9bmr5814123wmh.15.1686583605340; 
 Mon, 12 Jun 2023 08:26:45 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h17-20020a05600c28d100b003f080b2f9f4sm11816344wmd.27.2023.06.12.08.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jun 2023 08:26:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] arm64: dts: qcom: add DP Controller to SM8550 DTS
Date: Mon, 12 Jun 2023 17:26:39 +0200
Message-Id: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC85h2QC/42Nyw6DIBQFf8Ww7m14BNGu+h9NF4BXJVEwoKaN8
 d+L7rpzOSc5MxtJGB0m8ig2EnF1yQWfQdwKYnvtOwTXZCacckFLymAOk7OQxkpKCsuU5oh6hGY
 Co5gwmivZKEvy3eiEYKL2ts8CvwxDHqeIrfucvdc7c+/SHOL3zK/sWC+UVgYUeI0t8rKqpRTPw
 Xkdwz3EjhzWlV818WzCSqmK0doqqf5M+77/AJsM11kgAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1164;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ayKn6WheH5FdabGEJjntjR3yOgkFhn/speI04A6A4v8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkhzkyztTh6XSPGSMwGklxOTNxJ3X3WeVqU/krzzOI
 jqA3By+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIc5MgAKCRB33NvayMhJ0br/EA
 DMIse3IASeATO10GX9H02mDu5Zgm1Zej/bLOHbNcq5o9E8liWsf4tkbIKQIUkcJjVyI3EtpjuENAkI
 peHxAvpJMXP1NqSk6fmQkIYAAVXGOBBw5PZkTMQNZp+0PkjVtQVvND2tXbi+QtgZil3al6PkwuyYRE
 c4fsp2SSPYM/9MSteU16FICMiM7QA57Ndb9HQBl/p2cWALJi1icBCBOGW8Vtw5vh17FhleNPqeF46V
 w2m5c1BPcG1icgW70YG6qD6ttH8dumlM1OY9HOTCZX/DD195ry82oCj14/i86uVdRKJiqbn3FvKPnT
 DNaOL60yDkFnUUe5Eq1nOpci3sBJo4iuBwLeCcEJPojF7FISTaMerezIyFH+XCGdsBo4/OR0JkpfOM
 Df+vtU9aUHiyv4EDDAT02GCCWQBULo9QQYf7t3tLsS3LWVylgZZWjNiQEdtcaKBoBtpRRV9Q69d07s
 cVgs+9DxntzMHH6etyazr4zRnL0WwaWxLzXW1ViqKTw4eMaS60F9GRLjjlIgi8zEjOBlAsl0kJYgsl
 612QxHfwdskDgmKglnhRqqCbzNaEDB3+/zdXqo9GR0WQ1nFMTwPM7mtwf8xuMiggZ8K8yOeAlD2XjB
 Q7QWhVx3ASjjaytEVDHA5D1ugW9gGMSNomM6G2qUhoTUdvHbCxAhJgSSbY+Q==
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

