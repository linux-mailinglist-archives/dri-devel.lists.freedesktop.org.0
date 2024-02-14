Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 891DC8554B3
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC8B10E4AF;
	Wed, 14 Feb 2024 21:24:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Df4QANPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1DB810E608
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 21:24:52 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-561f8b8c058so2486574a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 13:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707945891; x=1708550691; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uXAA6feqe7ITmVt5QxnaZYVqRK0lZp3lcWFLVwQYYf4=;
 b=Df4QANPtcma2PnY/++f0Sf2xH7+8tmNe1bnC8ERg3lsoOYnOfrxfu1N6EXthLsJTRe
 eoxtGCA8b0C68f+cntRJ/5I103txsvY1kOTVQh4d4qmHBBwWOHGJ/wpI8v0+MQ3Uzk+g
 LTjeqHzTUUajx3N8/e10EQmOi7zw9kixmVrqzD97PMSc5tqIu+icjCXQUDE8heu0ewDB
 KJMPdgN18wuEIt5OQfMIhRIb+R/5Qj9cGKae4Cz02A3AmZ21MnetyBGrm7AB5gSg0iNW
 E7YBFpJd8A4xGIaQZXZkOonoS7BRl2NRYBvpzybOOq057fhLbX91/LyAw6MNWRf4xP+8
 NqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707945891; x=1708550691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uXAA6feqe7ITmVt5QxnaZYVqRK0lZp3lcWFLVwQYYf4=;
 b=e0qBRPJ/aZhQH1DK/ndChnvNcIpBZa9sozog/fghHPKmqxVFxe7Akih6TtxDMq9z7l
 kxlmfuJinpABWOsHzevKdPyZj79/0AjWZkI95WQigAYW8uHefjPSqsg/FQ7hyuv3cpvW
 sLzfJAsRsaXY97458bNB8CbKq8IYMyA4YO6HCIoBQ6HTci3Yqktw/UlNUB9tLPV2+g9K
 XuUUQK86EbkPnMLkg/9I6PETIIP7mQYXbwNqu9FC2czcuTDldjpWrG1zmmozMaQfFZrL
 s8+XvNQBEBEu0RzSKIESgi08xUx9XAKsN0QcucYv4hTIUm83kbvK/OF1m9UmdR56znz6
 AOFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc5CNPBmxqR2XdkgNtKzUexBS0nTJS/kUtWRMysWxdeTDTM5PeHdN6USfDqw2Og2BKc8Ejsksc+JR/toyogfHXM12W3OqTwzWZNZzsxzUO
X-Gm-Message-State: AOJu0Yx8GbW/w0RxrlF10l/XvzZItwrYT/RQFPn3kr3NqRyg0Q1H6htt
 49H5pbpQNjZYVxsQvAbr5iyV4+ezxv9Fldlif2XN/ft2gutPOeQrdBkFAGgJknQ=
X-Google-Smtp-Source: AGHT+IF3YdfiAMlAsriS7KTo5dpnNgm0uvc6GEJADQtnnnPz3NJxhf3kY+qOs+OADKjIypSLqGno4w==
X-Received: by 2002:aa7:c541:0:b0:562:1a77:19a7 with SMTP id
 s1-20020aa7c541000000b005621a7719a7mr3030102edr.11.1707945891017; 
 Wed, 14 Feb 2024 13:24:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXU0qvhrDFreJ4oK2g+L9nd9ACNCWvB7bhwMxZfDHlCfVObh12ic5ACvPwjBNo6WRBIozr/FRupxZgVbmwKWdrS6vOC+0A14cQ0Y3k/wvZEuva9sopvhkzM+SLtupUac4XA6vzvvy/qlNLNFUEiNg9MFe0N4BxBjWptTZXOueN/Tz7qe6caLz+UTUgg4L3SsMWzG4IjYA0/jcbdlL1IxMKG8s2Ol/Fyj16mvMrFoHm99sjzGZaCPOUQHWDoDxRoFVuXngA4Mxp8YAf3/5Cjoyfy6aZ8tEgKxRvL+ei/SWyabNrZ6GcMrlh7JSRaM2D1lWxH08K1BGkGRuNzovN/hlvD+DL5S/4IgD4XZvI5boLjWSXa4aDg5MYnQtqpwqE+2W3Xe01H4WOOKnYWdlQhoPrqC+d+BBvZ3KOvTwRBubwy2DCGqPStgOksEzTYF/v+fmDnBF87KpUb5gAiYN0OWvlXmdeSI/wfGiAvK2Kr29Iq8hNgY0ds/lRnKs4JvEtqzPsIVQPuI3yU2v8npiHd3VyYoWZpPLoYMdUlHPAt25q+cMfIpObffM4aMXbRtg+5M0UK6C4SGnSRuPX7xp76snfCf/HivY1s9yINsyZabQLXTpi4jt1cMGA4oK+jLs8xa0XGhSXiJY6I6mg4/f+Ey2Ty5eWyn3S/J9z/gWPXbJ4+G5sX52zxwIz8x7OG8HFA4e4=
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 r16-20020aa7c150000000b0056399fa69absm257298edp.26.2024.02.14.13.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Feb 2024 13:24:50 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 14 Feb 2024 23:24:31 +0200
Subject: [PATCH v2 2/4] dt-bindings: display/msm: Document the DPU for X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240214-x1e80100-display-v2-2-cf05ba887453@linaro.org>
References: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
In-Reply-To: <20240214-x1e80100-display-v2-0-cf05ba887453@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=848; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=u4L61jxb3pk7DyZvt+6wEP3FQgg6lRJc0FDd03RRCBk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlzS+YTnSq40dkUznjxwa6aCG1BRHC+ieUtvEV8
 SGNKa5dRd+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZc0vmAAKCRAbX0TJAJUV
 ViaEEACcNVWat66Uto6xWPYY6++Hjv/g3VPUnkDooF/v2K8G5glMpa9wUbHB5xUqxjKXpxvt0+l
 us+AcR9eJeukGm2ZQXCiX2yXXFMcoIneLwYMPSkL6FdRNTac3KDnpNI8JEx+jr6hmzC1reyyeRx
 SBM33s1sZSWQXbGEZd0s3NytgfBkdO5b2TE7h72Z0odSF0fq88O5bpoPX23mFCiifSwpzgSekG4
 WNwOsS4iqv6ioHRI4hl+8FMRFyAEIkvSsXAfpCsWZ1cn/wrTTL5oK4avtDE27KkBEn3urnZZIAz
 TXOFd+Jh9sYBs33SZOaFLLSCbp0HhTQ162E8KAKoPI1tZDpReUWdn66f0p+X7l1NFDcGZhIyM7G
 loliKR5JXRmpr0ygJZiPUOxONV4aV1Wb7jcsC5/Hj1DCe6YXjSGIWqjU/4C8N++U6E7FnGH7gi7
 u6ozqw8c3zUVpHhA78Lrz2TPXiZbSDk9e5Her4MTqQKLan2oD2+EKBRGHhltIlIr6zGNPFRkjcP
 tzLtQPihFlVJxAASF0rO881NHqoNC+umPd0UUttpX1BEALENl2KWMu0R7uyAR1kt96Myy22Aeba
 5kc9CGAOQAZXM1RWUVaOIDd9CgPNKZ7LnnZhNyFeIeKkGlVaVylzydoY3zG4tKUps8x3U+UUQUo
 XMKleu5kRR7fL6Q==
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

Document the DPU for Qualcomm X1E80100 platform in the SM8650 schema, as
they are similar.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index a01d15a03317..c4087cc5abbd 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -13,7 +13,9 @@ $ref: /schemas/display/msm/dpu-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8650-dpu
+    enum:
+      - qcom,sm8650-dpu
+      - qcom,x1e80100-dpu
 
   reg:
     items:

-- 
2.34.1

