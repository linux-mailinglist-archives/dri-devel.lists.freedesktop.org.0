Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B153A0768E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A1610EDB7;
	Thu,  9 Jan 2025 13:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FlCPTism";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BE510EDBF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:08:55 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3862de51d38so33540f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 05:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736428134; x=1737032934; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
 b=FlCPTismwDCbJ3DbZIckaNC+yDCtJ+mScy3PMM2KbVGQ0LnaEPMEl+dCeOjZhmuzFG
 hHrAONqF4glPCjzVGYr4dXrLUG7jlcHKVrkHd1QQ479csxGp09JH4LRdxWLL1MKfu0GE
 sDhV8FRX71Snvr9sLJu4n6yqS3/+CH6y7/3y/JlIj1o4/B/0SmvGMF3qQ8E8mU0moePY
 /DYvlSyCRNYkd1mqKQVvXePfgmUO0U5CeTcI7ks7PUTJJZ6leMBpprbXg/tb+5RLO+p4
 TEAE0yi+3z0S0MEOU+aOt2ybNFcbwcHxbB2oaZrwCvn9r64yPyPJEjoppNl17B14Bznf
 OSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736428134; x=1737032934;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HAwXSbZcFpOuQBHVRwbOUqZidyc0Shw8eVGCnAwERkg=;
 b=XDxuW78DA0bZkeSq5LBd36duzOp0KXQZG+lW3UKu4Y6uKy+rtcJksZKiW32hPXiWaU
 VAY5fNySaK6+667gBxc7GjoesZKtN1imclp4k1+mN2sukmM3fNoMhonaVOaGpdzVn1x3
 XnH24v+qrI+zpGBAP/rR5ehz1e1iClUiE1+YnlJEMZulW6/+zK5fI4yXjAjM3dYZXgOS
 X4SETk0F/ZWMM5DBvY6H5kHETXNN6erEM3iDHCu0+czEIs45i4dzRREzC9AFQIgcSH3w
 ww0Jk9Y3RUXKbe2soHYHh20UvtDTBetxX+aNvbdmHjrp3CbZH3BhyjtyP+RIGrJ5skQ7
 fw1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxZJAT6qyU5CE770Y+VjHQ9Ki6MAPwUM5AM4IiDPISittcWDuY0Eh6ABfCZIe+xzcEK4iJycN+fTo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmzXCIafIdguBNoL7TUW9QN1BvsNnv7D6BM/gytnteST2/L2Rt
 ALNAiqEo8UfPLWmZe06vxVb3Oeu0bvzpZGA0XJkpjJrKkA76+K2WKlBZz07wSi8=
X-Gm-Gg: ASbGncsrLuy2KOdQwyASX/U5Bz3y3En+PkY992+kF5Cj3VE20LJjmlSEXorjq33N6Wq
 wWQcjH4QuBfeVy1Z99IILSV+h4MhD1F3nxmMkH9YNaatZDi1kDkVVujDGpD9xO4bOf0KPwdwcfD
 2iFgK1BcUaT7kanvpKcERt+QcGXHgctc5cDMbrQ5xT3AQIyh/EeLtqCSuVWnEk4FlOq+PgSYwej
 7SZwMSbwWKvYKl1qATEu9I/wL7jHAJniTMaCx02OnCx30XuKxtE3DVMzE2nLnKnGCE/dsKx
X-Google-Smtp-Source: AGHT+IFekAJfZ1r1j5ou01UtJ2pm9x8oWNHKGsEwHqG1dqXNL1gke6trAGeYBFEtMo/IFRDiYllmVg==
X-Received: by 2002:a05:6000:1f86:b0:38a:9118:c07f with SMTP id
 ffacd0b85a97d-38a9118c3b0mr622654f8f.13.1736428133846; 
 Thu, 09 Jan 2025 05:08:53 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b8124sm1789167f8f.81.2025.01.09.05.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 05:08:53 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 09 Jan 2025 14:08:32 +0100
Subject: [PATCH RFC 05/11] dt-bindings: display/msm: dp-controller: Add SM8750
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-b4-sm8750-display-v1-5-b3f15faf4c97@linaro.org>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
In-Reply-To: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=978;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=K/LvPsSs8jLRaKqgMy3wwlLWJHnMlL7FxoRoOu4sBqA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnf8pUHbntjy6x2AhvPYpgI1kBN9V7w7MEQiYl/
 rPb84qWlxmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ3/KVAAKCRDBN2bmhouD
 17RqD/4hZXSqV0jNHcMfDu9r71R/0vF5qrxffDcSEPHA0ERcI+DSVBWXRRnXK8YURGPCUO/z1mr
 NZGDCnvKLrPaqgUsf9TnC9yXI8HsNj4lK+A4SVR7OveLYDXxrLrgiIjDmMWlfEAL21UAbanIdKk
 tTlINKr4K/C1l3uOebu+krY6mFnp+XDp1hTcjnGENBnSirRYdaSwDSq/V6mN1fHmH+S1iBPN5hC
 MVpP150qJRMT3UOpdg6CTuUXTt5x7qbIHiQuoLeaOiYNZ80q4p7q0Gx4hrdZektK6tpS2D0SRjG
 h95B0lCZ04NobyUfQLDAet3hLDfQFx4Juq+/FBkLZhu9iqjXyZwFV0RMMYuSTn/bG8adBb5vW+K
 Igj7hp2GDQ78csiMSqdxUGjE94J2UTxm/XyoJdgspSKUGOOLS9RqKgaXUb08whzFsz93x+KQ9Af
 RhLJr83uNjTs1x4WotcKgc0V4j/h76uinnsFlyAJmTg3TicgKliWvyDA35ys/VTmaGgv5P0Zrse
 loR0pchrIBTw+qahv2I43LUAQgRsCe1C9h1Um0xF8iohOISpH/MtHJZzE48eHUHfrmMNygOuBWv
 xJG36m7t6ZWZBJZ+0ZQ9PGRRJTEpKm/h8ivFzyLx+g5FBewmCsLpMcgJDqaZ0Uv1DkwDbId9jf5
 5Ah7CzGw5aHokLQ==
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

Add DisplayPort controller for Qualcomm SM8750 SoC which so far looks
fully compatible with earlier SM8650 variant.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e00b88332f2fed2fc33f6d72c5cc3d827cd7594e..a4bf9e07a28355c0391d1757fab16ebe5ff14a44 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -37,6 +37,10 @@ properties:
               - qcom,sm8450-dp
               - qcom,sm8550-dp
           - const: qcom,sm8350-dp
+      - items:
+          - enum:
+              - qcom,sm8750-dp
+          - const: qcom,sm8650-dp
 
   reg:
     minItems: 4

-- 
2.43.0

