Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18904947FEF
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D841910E266;
	Mon,  5 Aug 2024 17:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="q93ht4NY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0084610E1E9
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:08:16 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3683178b226so5609658f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2024 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722877695; x=1723482495;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dn2RM+ZDso5lrlzPwSs7Bj15YQ8/HyMl9b3r4MixpG0=;
 b=q93ht4NYmMn2ndogd75fQFfH0yvsXugY8+lqjgYNOZn3MhbBdhvM6gn4eE8J+s/Xsc
 nJxiIRCcSQ+BhH+pwmeSwPyUNS1BGoUr97Z1mN+4LJ0Hfs4mZBjrAmEShKQzHpAj47uU
 Q64avol+o1fOi5VAvq28aNXFeN69XTdG5WhWkKpHXpjwhDHigLjGHqq0H3V2nMbO/2Fc
 tNP9p/2jZMJiAgScoVfGQ9Ej+tQy11uojrTTYJeUymAcBANFa7tvdrI2BvXSnMSIwAZj
 MhI2f/2HbXCfiYgXxecsH4TMKXxqErxbwINKmlWS4AI/E4EAh9Eb6as6s7LgIn2eYAQs
 Kntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722877695; x=1723482495;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dn2RM+ZDso5lrlzPwSs7Bj15YQ8/HyMl9b3r4MixpG0=;
 b=amYtjR2Acv/oojTX83k2fmfZA1oA3lwl5FNp69Ah2E+Qi6F1+/Ipl2bJ2UXIfrDJdw
 ez5Y6/rGp30mNiUJUQfr8SnejewwvQdpL+Kglag3Ez+dHuyrMvPPAUrrgzSN6cwf//On
 2DC9UsN+qGyZwMzb2mBXUayecweQM9CcTsNNLQEPpImWg1HqpjjRJQNzbiOlNiOtd0Jj
 plnqr4ldTAZgJcBSJ+0LqPaxRNVb1m2N8AzVHX4RUwgGs1WN1bxtCW2wNEZdlLUYgKrD
 sWbBFk/bwosGDUXp8OJ10XOw6QjKmHUsc52tD1IlV9Jt9BSZIJlxVlPqtr89KAt2yt1T
 +2gA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8LGefXC/K70XjzX02LCrPguktNt5q6xwJWKAbA8d2RLrg7mxtgytkt+w8YhkLOiNBwwRQFT2oaGYZNVtX1inp8bOOEkmvTjf0xRf74oZp
X-Gm-Message-State: AOJu0YxcYCkzjWMnlzAe1HUjvHpITvfJVT0+c5OWu5+lPpMDeRGT02Kt
 RjcZhYZqj1MIwfElSxCq4Q/WMKSKmax7IUGbJ8Vd3mCS2acD2g/fpB7gT9DmDA8=
X-Google-Smtp-Source: AGHT+IEKfqaTzsTmB3rUhwgud6SL21dlvmemD/eKkLdcJi1HLciZsIFIr1IV1IKmjvrbV+ISF/vxfQ==
X-Received: by 2002:a05:6000:1184:b0:368:669c:3bd3 with SMTP id
 ffacd0b85a97d-36bbc1615eamr8534064f8f.48.1722877695222; 
 Mon, 05 Aug 2024 10:08:15 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1068:b792:523c:3f73])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1e97esm10356486f8f.37.2024.08.05.10.08.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Aug 2024 10:08:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 05 Aug 2024 19:08:02 +0200
Subject: [PATCH v4 1/6] dt-bindings: misc: qcom,fastrpc: increase the max
 number of iommus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240805-topic-sa8775p-iot-remoteproc-v4-1-86affdc72c04@linaro.org>
References: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
In-Reply-To: <20240805-topic-sa8775p-iot-remoteproc-v4-0-86affdc72c04@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Tengfei Fan <quic_tengfan@quicinc.com>, Ling Xu <quic_lxu5@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=812;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XpvuieHO1Z/MLgIPyh1T3MylMHngpBvRq9vX5mwxZSc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmsQb7wyIX50x8zuR6LgQJLfn5HL7DJIr+01A8A
 ULFPU7Qxe+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZrEG+wAKCRARpy6gFHHX
 cgprEACxx/KpzkMNKR7wVSDY1Jhtb9RdgoDl1Aw9LGfqHdlfEvl1kmwTfvYgU+LlrHyUuKokwIG
 Xo8NbgB2vadUePQ32uvQjZ+5zr0tJIzalFtgAgc3BwkbMcVnt9/wRVkHByNuZHjE/3dBL1RzQB1
 KlhDJLFl6HIr88OCHjEELA6xdQ2ivABdiw8dpnoFyCutUEbWGfMJVd3BpjFum3vpjY1Ya7R234f
 vTzrZsbcE/Ea+FNU93s4VRslAy71tRcBgEPCxBXe4wRN1pvNk2VIe69R//xx8G7suZRi3YL1qd/
 zxjHjzAOP9AF+2TND4daQekDbQ0XMXcpf9mCkgncYz9e83lREcRc/8AH/5hQBdBUimD5n9cnowb
 vJ+ztfWws6i+YqNP7y/+jKYXYbTF4zfOMg+4Tfe7c98MCRKA2KFplALp2njy/o1oGBaJRl/C+fN
 Q6WMTnNAwtHtVUMCXpZ0cZblg2yT7LQ9Y4i59cvqMSk0J1wfG++RoDUiys5Wm0jDp4fsMgUnAOS
 zxVUesEajLtKT2Phum44owvQaH1WrjhoWeLqIY612lLStDYWOGaS4+cXTEdyOsMyPyrqfZirFdk
 qiSRoFspIYLFVgPt49IyZNrl81vJrqmFO1o6OoRT6ac7vDTYVkXhhCWYQxyALyr4XJ0MDF/DM0W
 oXI1HjBh0/NEq1g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The fastrpc components on the SA8775P SoC can require up to 10 IOMMU
entries. Bump the maxItems.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index c27a8f33d8d7..f52931c0035a 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -81,7 +81,7 @@ patternProperties:
 
       iommus:
         minItems: 1
-        maxItems: 3
+        maxItems: 10
 
       qcom,nsessions:
         $ref: /schemas/types.yaml#/definitions/uint32

-- 
2.43.0

