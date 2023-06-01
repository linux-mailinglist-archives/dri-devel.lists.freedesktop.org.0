Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A7A7197BD
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 11:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EF9910E0FF;
	Thu,  1 Jun 2023 09:52:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E588C10E0FF
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jun 2023 09:52:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so683097e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Jun 2023 02:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685613148; x=1688205148;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y2bw6uNKVCI6U19iql+rCt1aF5z0wTrLKqO0P2Rc510=;
 b=NBbpBAxGKyQocr77i0a5t9E0m6mgAmxTb8m+WO6BDMNHYW75JXEHjbD1t0VURgKcj9
 HjBQAlVpd4OdztsjGZUWKxVnaGxWjaJiLP258pZ8MuhMsmyKMQp4W9jxEsp9KH1+kNlB
 CjIpZhNeuv7t3Ng9d1h/4PutJcdqISwooUjALm7HtDOxnDB6Cm4PofsyvyTodJdSU8TR
 e0bJ9z36R/q+D56SHRqLPMjlvwr1Z5z4mfuu5ExGjImT/fu8IZi7RLQmDBv54neyPW6Z
 O1IK3oY16+GqwFJfyYHYUQ+HEOsYgcpml18r3kPnSbCYX7lgO00Li6rRQs77hzclEUx7
 GmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685613148; x=1688205148;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y2bw6uNKVCI6U19iql+rCt1aF5z0wTrLKqO0P2Rc510=;
 b=UXk2DeVVJHeWtBR6Q79f32F2pYQwMTNh4vN8EN/4Y+NyHAR2GE/rN6aCUrjUK1J6Wh
 kztbO4YiGcdAhB7/W+JVmUHA6quNrRnAJ5d4YsYRTz32hFgqyhW9sd0qny2JqvRkPkG/
 CbdZYHi/qs+JBP00dc9k5RTs2UbbkVRlNRB1hmPm8YjaN9UHCppG1+xR78Ehvh5mt9F4
 YsyTvgUZDJDRirzXG1GTmbWDuhCnLPKlEXBPr8U4VQUJQLCAKrn78HU3Pm2R5SMRjbHC
 aWvKYa7xl02dSyCGZwy2w8c+WP5F+6CTk+nhTMkqzMT0i549TSHs6ZGPdLxvq7WuEanv
 z0mA==
X-Gm-Message-State: AC+VfDwDpyERS0P0AzX1Fpz0vqhSeDP1OwDcMCXCtw9zodgset4q3eq3
 5q8YWJFwWF/bjnng1ZjXQU8JDw==
X-Google-Smtp-Source: ACHHUZ7ifnNxUvcXHFlBUde/XloL6IFdXyMJGnTj8SYGCpikBvjKHcKlzjBvbFc2ay1bTenhMZw5fQ==
X-Received: by 2002:a19:7406:0:b0:4f4:c30f:fafd with SMTP id
 v6-20020a197406000000b004f4c30ffafdmr1127657lfe.28.1685613147802; 
 Thu, 01 Jun 2023 02:52:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d4409000000b0030af05fce4dsm9746150wrq.77.2023.06.01.02.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jun 2023 02:52:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] arm64: dts: qcom: add DP Controller to SM8550 DTS
Date: Thu, 01 Jun 2023 11:52:23 +0200
Message-Id: <20230601-topic-sm8550-upstream-dp-v1-0-29efe2689553@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFdqeGQC/x2NQQrCMBBFr1Jm7UCSEiNeRVxMktEOtGnItCKU3
 t3g8n14/x2g3IQV7sMBjT+ispYO9jJAmqi8GSV3BmfcaK7G4rZWSajLzXuDe9WtMS2YK8Zgx0g
 u+BwSdD2SMsZGJU39oOzz3Mfa+CXff+/xPM8fS169P38AAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=78Pn3vfQ0fnvRp/CVKWnUOhYpamMQ67eHI2wN4OuTBI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkeGpZFUd6USnWEtosfZ2Y3u+jhXj22us0IQenPVbG
 TiKsboOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZHhqWQAKCRB33NvayMhJ0SVqD/
 wLW2P7B3IdV2jqcWZlz6bm6adI8b/Js2FK7S0Sza/wBNtrwJP2t8aMiQxauAla/OH55p+6RxK3nYwm
 J+0i9NHYqkR8JScLagFlMVeV5h9gzNBhOShEMpkUXeQyGc4P/6eNC9dJRTtVZgAPLrMTzrnDmsfHk9
 P73Sj5cI451fEYl9sCyU61PCN3XmB6k9+rSrqeRWwKmsXKDENegQqAv3k0XZgT0IUzMuQRPbbSCK6i
 w0ATn39FVRWZbwCAydO12dfXIPPRhSTt+AX5TotkpCUdO+EfbQYfq/a9RVKghHjBetRKu90KzP0Ib6
 drKw29G9Cr3gTKrzU0rM2v+L3uOBPuBFFi/pUr6xCFCR5WhTBV1wXkQ8ftOWS9/UUG8YMZo5iFjJPe
 /l8BfuFOkOCCn01mwgwpek1Rtf1/FsaGXAmMkLoSSu2opGifmGPleqYmEjn5F5ThZkCQPjqm9W0kw8
 FB0NoTV97QsVi7j8Zg54WClz5x7rhw/v3khMxfnwBIPeeLIvDpvLXdIWJMP9Q1xFQBx7B0zXgDJwlw
 eiCBefKxRzt62ljn5qVPwoCCcGjYfFipb0PCWqlVEdCXh9Z6KapSxKys5/bHHU2hz4GvSEB7X+6yL6
 JVtifJz2SfM+HbO+c9bCfY9eDhqZGjCUUznaIHrB+OaxINqoVv23S1wBy33A==
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
Neil Armstrong (2):
      dt-bindings: display: msm: dp-controller: document SM8550 compatible
      arm64: dts: qcom: sm8550: add display port nodes

 .../bindings/display/msm/dp-controller.yaml        |  1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 89 +++++++++++++++++++++-
 2 files changed, 88 insertions(+), 2 deletions(-)
---
base-commit: d4cee89031c80066ec461bb77b5e13a4f37d5fd2
change-id: 20230601-topic-sm8550-upstream-dp-b713ba275d7c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

