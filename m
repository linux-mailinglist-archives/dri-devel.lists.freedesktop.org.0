Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70E3AD3A47
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7E410E56E;
	Tue, 10 Jun 2025 14:06:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="u0SmQbGy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304D110E56E
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:06:19 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3a4eb4dfd8eso442567f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749564378; x=1750169178; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=u0SmQbGyiDpV8Rq3BDgkkhO1GOeHNny9y/Zfgs2+LO8HLwCaJeYveiG2LlSD+GPOsx
 hd6PpQucDqA8jS6sO2rJ6ZTIPCVl1lh8BW+vexUjpbIRXpEUMP9G4/9rNzRkgzhveucF
 5vEyn1PqHOa0tT1i+w0dQIl1zGh+XZ1WtFcLp9l2/J5yDONdUiId89QsO/YddjVPiAEl
 h8ccy7VKLyS8vr8bWshMme/mrkb1xpnKmxPSWHEDj600y2rAkMa5OXMYg9LEy0GTpE+L
 Ei4SJBO9JBD6PS8iwvPJ/sGor67yBXzcx0g7v4EbPM6j+6oV9ijrVGXHDxqRNfpCF+xY
 iChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749564378; x=1750169178;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LYwgiUzq75NuT9nEk3WuZ2BIh7wkvlMFp5zrsAIKP/U=;
 b=THgN0iexd4EAJeg099F0CQu4dJX6N1kFmuYqF1MsBfPFBOVAh+LqdQIpVhnwRQmfz9
 /EvIbv8eJm3V7y61Mmfn0yzuFnv9+mMVM+hawoew/n73YyBIdHu/T3blmbNPTpcXD/ts
 SQjVRVlaDz+qEtqDzQKrku3KU5UlXxl9AHem3oRIC6/fl9v+LCmk9pzwhomRU0HcACjA
 FdutmV39HhLsd/eGV5A510mROUtmDM9H63GExKvA31jPu0xws1gfHnirUosw2j5oc8a9
 WnNeAeYyCWp4jUNs7EuDdSpy67ME6ZXP4PR81tPXoElwHku1y6eZf6B9Bc8IPAOwSNfp
 iYGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4HC7dAByxwxpd2SQf+RbLqjuMduz3BI3f95fEHFUR/E6dmOD8nrTMkiqBE4mDXrC1KjVgwL5JZis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWMkaJIdoK0UPLONwV0ZqbycfkoJm3HbSRHev8RgQ8ODXjTKys
 KwzCfcMgHDc11qNr25CcfLagNP2VZjPj1Px6z8tag74ELxMBmmK2q6z8n+9nxXw2t6w=
X-Gm-Gg: ASbGncv27wBMROoHxWVfwpmgE50RN6o61OdkWsw2LF5BRN1cGx2IcqpBZBRbqrd+wdX
 tknHKBCmkljhVbT5iEgj4gTRgXgkeDBohEVosHNFXUD/GFJjZ01MFE5p3QDG3Cc1vhcey3MNo68
 /MbJVbhW5rDu2acQ5Dh29g6Qk6ee2P1uaFRymrKTZjakrm7QlGOHkDX805vVBBveFd0tsdOFtpa
 kV8EjpmcbBM4lUYa5BKkOMrV8QmDRlks16toiqD9dO6lQLqyiOmHrCkDh7fTiZn2XXGdDVLRFpq
 nmgtw/nZJYrupKsb3TAsRT5WD26B4uzXjZUrjHhkOjatgCZr1hNETVNefZ2iOmQoqEaB3GP7iLm
 ELNZSmQ==
X-Google-Smtp-Source: AGHT+IH25gKgo8d1gYAXhu9lWH0BmA+6Au/NMRgukcCSeLR32XCsUqrr/CCJpz5l/lsXeticymgVQw==
X-Received: by 2002:a05:6000:144a:b0:3a3:6e85:a550 with SMTP id
 ffacd0b85a97d-3a533143e5dmr4792126f8f.5.1749564377666; 
 Tue, 10 Jun 2025 07:06:17 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53244df06sm12734469f8f.69.2025.06.10.07.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 07:06:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 10 Jun 2025 16:05:42 +0200
Subject: [PATCH v6 04/17] dt-bindings: display/msm: qcom,sm8650-dpu: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-b4-sm8750-display-v6-4-ee633e3ddbff@linaro.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
In-Reply-To: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-clk@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=943;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XU5572AbRAlL2dnAZKnz9YY70ssdWL7hBDylOur/otU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoSDvC2lB3lIxtbsNFzyWORfZgsGtzg3s+vk35z
 /dPmTfPLbuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaEg7wgAKCRDBN2bmhouD
 134XD/0d1lSSjv1+CB5AgL0VUzorFocmxjRuPcFE2sJHZWxqDzRNRynQD6x9VAr0Shl9tFORtxC
 8DkQQ2uR4ZjnjhvnhSAa/ki40J03d/MdQWr6HeJwlAaCVKGO3B6dqzJRtaIMHwO2JtVVfqbN1BM
 wXb1lZhR/6McXk51ULNzCqwhSU9tl6gERabgsEPNT7LI9SkhRQ+/a+MutB3gNFY3GuS3qFccz2Z
 DvPmibAcl1AO4QRoEsNdKLW23BFqfHhpRsGiRnNC0JHbrp4tOZo7MmAkxXyNilN+kDNRwjyHurD
 K216/cd9UAvqhzDo6FK/0rq1EjL3IvPNsVhCrrLSX7QbS2IC8gqTdkVlnfFY0KL6giNbJ3/qL1V
 VY0UMPgEDQ+uVNdz+cUtP2YYJbmL3DeaXKvxXB3Pjwd8krdc6dTmyfoOEcErTIwSBaCPwqeI/Ob
 Y69EuoyarJ1KY8eRVyRpIcgceGRW63D/Dg8eEtyrWgEH3K2hgQYPaP4Arcr7PniTIiFvEc/A9jE
 9Jj0bugI1whaH/BsqGp6Kia8VdabiQ/Is2hkHxmzpsAczNAvrXE+Bu07GQ1A/SWUTUDrwaEWp6W
 8NaUYft0uDbjzb6ISM8zwKArfCc82KutxoiV8Xf2Vgvq9L0bVcxR9w68Hc8YbkO80ZIwwnThDPN
 6iDFXdGLfdUJKkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add DPU for Qualcomm SM8750 SoC which has several differences, new
blocks and changes in registers, making it incompatible with SM8650.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index 01cf79bd754b491349c52c5aef49ba06e835d0bf..0a46120dd8680371ed031f7773859716f49c3aa1 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     enum:
       - qcom,sa8775p-dpu
       - qcom,sm8650-dpu
+      - qcom,sm8750-dpu
       - qcom,x1e80100-dpu
 
   reg:

-- 
2.45.2

