Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95A3472327
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 09:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E918110E6B3;
	Mon, 13 Dec 2021 08:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8EB610E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 08:27:11 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id g14so48570047edb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 00:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fairphone.com; s=fair;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qNVJJUEkc7Dcqq+w3jXBP/JOAXOW45KnRjiowBHvGk=;
 b=lGsG+RSK6fKMObsJQ7Iti5lpYgJ6YDHFJh2yVwO4XuHD8dveHSTYe/H5vctCR3EceI
 XqKuogxu2fO0A5lqmYqIOpALu/ZAlwyN5MpiGyuxrhGT4dFdyWMvGpLMx8bvZsddP9hp
 uygNMnJ/yqA/HLuo9RxL3P+UaNjwUw8FVJxoH5ME1qus3y9LosZQt6MPD+Go9ivr+x+I
 5NBCzSlBofWA0sfijE46EUYppcRu4UKN9UbgQuwQlhr8/MVWSyaIoK6EGtTLTPMvbQQ1
 YS5aqS6H4kpadwXpvOh44y1zf//CCrxgItwxZNG/CI17aEzqwFI/8ITqQJIsV4zBY6wg
 c6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9qNVJJUEkc7Dcqq+w3jXBP/JOAXOW45KnRjiowBHvGk=;
 b=WYRfwivy7PtGqG3VwzgP+LYwu08rjv4mZTZQBRbj8rf+BeagoJDGLzSrvNZjfz//X3
 llxL1Y2vtvjqvl+8WusaE0ogHSqWCMIHuyw7XOt9kav6BVMoK/GuYyB9SztC+yM2Fd09
 e5PIKSQA+QXV6EtMpuMj8Qdxl5TGxOMbNdCnxv5LwzVhrbLg5XYtlvKwyH6b5bjMA84/
 VPsoHuxyBe+cyJF6c7sW/k5a6d5pBExYmswuVjMFBAAOj13jUQR02bI1WTsIx8kmh4aE
 WH85lSM1gx1rRH+SzD7lyjeivcFH478/EWkInFi40aTJejFnEsyEa8I/FVr0jjBd2YTn
 vQuA==
X-Gm-Message-State: AOAM530VfPCu75uGVeoxYHtxMfLKuPExxfpYalVuqWjgn+OA/h4nJSUV
 ao9L/5+GKC0MNXRB8ahDiUczaA==
X-Google-Smtp-Source: ABdhPJzJQzH9IbD0iKwzxP+OhiHo4OBp+NQ23YW0riJPC6Agdl1/DHF8upIV5V9+Kb8bNnWCgPyEyg==
X-Received: by 2002:a17:907:608f:: with SMTP id
 ht15mr41645248ejc.300.1639384030231; 
 Mon, 13 Dec 2021 00:27:10 -0800 (PST)
Received: from localhost.localdomain
 ([2a02:a210:20c5:8c80:7d0a:cd68:c339:f426])
 by smtp.gmail.com with ESMTPSA id b11sm6062432ede.62.2021.12.13.00.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 00:27:09 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 00/10] dt-binding patches for sm6350
Date: Mon, 13 Dec 2021 09:26:01 +0100
Message-Id: <20211213082614.22651-1-luca.weiss@fairphone.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Dec 2021 08:43:56 +0000
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
Cc: linux-fbdev@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 linux-phy@lists.infradead.org, phone-devel@vger.kernel.org,
 Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, linux-pm@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 de Goede <hdegoede@redhat.com>, ~postmarketos/upstreaming@lists.sr.ht,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds compatibles to the dt-bindings documentation where it
was missed before.

Finally, the last patch solves some further dtbs_check errors by
modifying the sm6350.dtsi to match the binding docs more closely.

Please note, that the first patch from Konrad is a resend that wasn't
picked up when sent to the lists in August 2021.

Konrad Dybcio (1):
  dt-bindings: arm: msm: Add LLCC for SM6350

Luca Weiss (9):
  dt-bindings: firmware: scm: Add SM6350 compatible
  dt-bindings: qcom,pdc: Add SM6350 compatible
  dt-bindings: phy: qcom,qusb2: Add SM6350 compatible
  dt-bindings: thermal: tsens: Add SM6350 compatible
  dt-bindings: usb: qcom,dwc3: Add SM6350 compatible
  dt-bindings: watchdog: Add SM6350 and SM8250 compatible
  dt-bindings: arm: msm: Don't mark LLCC interrupt as required
  dt-bindings: simple-framebuffer: allow standalone compatible
  arm64: dts: qcom: sm6350: Fix validation errors

 .../devicetree/bindings/arm/msm/qcom,llcc.yaml   |  2 +-
 .../bindings/display/simple-framebuffer.yaml     | 12 +++++++-----
 .../devicetree/bindings/firmware/qcom,scm.txt    |  1 +
 .../bindings/interrupt-controller/qcom,pdc.txt   |  5 +++--
 .../devicetree/bindings/phy/qcom,qusb2-phy.yaml  |  1 +
 .../devicetree/bindings/thermal/qcom-tsens.yaml  |  1 +
 .../devicetree/bindings/usb/qcom,dwc3.yaml       |  1 +
 .../devicetree/bindings/watchdog/qcom-wdt.yaml   |  2 ++
 arch/arm64/boot/dts/qcom/sm6350.dtsi             | 16 ++++++++--------
 9 files changed, 25 insertions(+), 16 deletions(-)

-- 
2.34.1

