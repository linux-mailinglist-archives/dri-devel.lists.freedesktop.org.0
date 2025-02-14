Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1C7A35EA0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 14:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF8E10E308;
	Fri, 14 Feb 2025 13:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n54HhIsD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F17E810E2DB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 13:17:58 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-38f29a2c6a2so220562f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2025 05:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739539077; x=1740143877; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WTkVJFJYdKGE2V15GcqWFnLtubHjV8Mv7nfMRm+EoPY=;
 b=n54HhIsDuCggN6EAMDDFKlhM2dj28Da80Z6QllZG3HJCOwZo/9YjcYCwJaNX9zAffB
 oilOfdabmZckRJMBYlS7OviJHTdVwPgzrNslIfNUcHq7eeteKL4Ds458gbOo+FgEoCX3
 NG6hfQly3kMCZxUIV/vs2Xy2MbqQtISdKetgbSzifkzIxf2PaMZ9AXBi2UVBb/z2HZXV
 SYCtNzPELy0fwoM1BWvVVmWOGEbQGMPHEF8BYmtEjVL1T+bw8iusSyzUdtlXJnr+XwdE
 wq9QT8fZ0qqwWCBMjPuWhGRPKmSgP9Rq56DnOfCxiaMIG1rgMWfW2FkfLHY4GhgmPqaC
 BUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739539077; x=1740143877;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WTkVJFJYdKGE2V15GcqWFnLtubHjV8Mv7nfMRm+EoPY=;
 b=PsPgSu0edochBMJwYGlsnYnQ5oILCgfel/yjGzLyfYdl2n9sFxGECfdWSDFWNEKMWj
 rLcIOxUbTb9lNLTFoa4VKt93x3HNf/rChJi3bEgGiXgLxez5v4hW46q1yVSEkfw2GnSi
 F7+rVa2spVisnqi6UnMhl8gQ5Qy4lxmwQvWWAf3X69Tj1djwvUAoqIkUi4BHAggmbLLg
 MkMnku1K6qa2xJ/OemraLQE3f4nSs7VdSU8/1EKSej3iWbyP1xicWV3BPTQlhK0rcTAB
 NjyQtRqWjfFzjWSYJ4apZJtvTzhT4EPHe6v1AutqNoDA1uH1gcMkOP9VCpuhLhpLgSdK
 IqHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+SGKaDGtb5+SgPtP/iozpXXQBHMeEoQO1ge3reYImfgi+hG1ICGN8FM+5st+++ZAH7vosLLcGVJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFT/or/m2VihGqYQuwvS9Esec2woRCchtb7O1drcL6WIFsXL5C
 6HGCycebaNr/YqAzlY+6tmDg7JHg5OK2S79z/8Qk9463E9bLA0gbtwj9AHQxnOM=
X-Gm-Gg: ASbGncueet3Gbbd5YolyWFcs7DdYGKaUJ9IFhBJZEUaK+AgNpldHtzgxR58cWHLLn7n
 4/3avJ9w3supY6enCFM/xNK+ipe+U/7bcrWPSpgmPeg7UpenSVJhiHnulVio2y5Cd0DujBiUCRk
 z2HKGd72xJitXMhzCi/+lLDEUFDQ6eoAoL+EMLyKyAUnqQGr5cqYepB7T85mUssZl6qM2vYgxO6
 GcsLTdvKx2rLqyTCg1Qo4o01rGD5kYatnH9FHLRdARuTpFMjoUNgcbTsWWnLpOSfk43RBP5B58i
 gMYvabTaEHVRcv1gYVPGwBODOepDIf4=
X-Google-Smtp-Source: AGHT+IH+EYmWeA1LWeRvivFdhkovV3JXAQXGbPQOMp0OcWg5nbCX0fAoBV+Te8py0Y7dhNTltTi0vw==
X-Received: by 2002:a05:6000:400d:b0:382:4e5c:5c96 with SMTP id
 ffacd0b85a97d-38dea30a188mr5168291f8f.8.1739539077391; 
 Fri, 14 Feb 2025 05:17:57 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5655sm4607690f8f.77.2025.02.14.05.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 05:17:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/4] drm/msm/dsi: Minor cleanups
Date: Fri, 14 Feb 2025 14:17:43 +0100
Message-Id: <20250214-drm-msm-cleanups-v2-0-1bec50f37dc1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHdCr2cC/32NTQrCMBBGr1Jm7UgSiUVX3kO6iPlpB9qkTDQoJ
 Xc39gAu34PvfRtkz+QzXLsN2BfKlGIDdejATiaOHsk1BiWUFlKc0fGCS17Qzt7E15rROWODDPb
 0MBrabGUf6L0n70PjifIz8Wd/KPJn/8SKRIGqlyFIK0R/0beZouF0TDzCUGv9Aok/QK+xAAAA
X-Change-ID: 20250106-drm-msm-cleanups-ddacf1fc3ba5
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=822;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=L+i2ne6USMbeouYgvh/Dzg8b8EW24qOMAa2/YMn7bNg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnr0J81HBnDmsvJT7ZOq36M79xw8Qu67Y1oNk06
 cD5OWAmN8aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ69CfAAKCRDBN2bmhouD
 19uGD/9oGzLoFf2LW8iOUbXHjLuJFp73CsojzoPu3vV66wBuA26yHbH6IuKC7nishtJxp4vva5F
 MRNY+e/lBhDOua+fbak/wzDBvWePwnGCcpZULffj611wOZT99CRPMjXjOleHSfTMtx5gxQqXIvO
 NH2ciOwgZJR6eVIDzXWtxkrQYLKimA0BVCdVe/jk43at0Hyib9Tk77g/w/geCmRex8+Aa1TjE7j
 s8HaboZH2FgKAjHltfmTlUjT3PRvPbjMe0rs7LkKL7jg4TTPhL/ol1shTCIsGhMl0J1UCZWrpWO
 Ry61QJTIzPFKdUEZZoKO+H03PoZfhZ5sGa30O5t5AIYjLlKvFqqC9ZE5enzi+cvgAwl044ln+uF
 qlJzsfy6Uoj+5E59sRLf1scEXX2cpsJRyZppq9mpE2G+8/WUPhTk8bn9Jfa5mhXVg4y2d+hCUa8
 dDuhsmzRWnPe9fpKI72iKhLW1VokXkWI5zdg5/JmEjUYYvoj5apU85HYlf74l3yemQfuARUwyTf
 s5Dm/yCbzBXvjDL08MLsceQoqLkDSEzpFpIAhNqBEjKdQilegsu1dyvBhl6WI7rRQwOTreUMylY
 VPfYNb+8r+Q0Hn3HsidsL61wKqwESAkIAiF1uofmeVBoKOhw2pE1QfhtcNUBpKAsh7Fl/7hvu+S
 XuGceCz2ooIa8Cg==
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

Changes in v2:
- Patch #2: Update commit msg
- Tags
- Link to v1: https://lore.kernel.org/r/20250106-drm-msm-cleanups-v1-0-271ff1c00795@linaro.org

Few minor improvements/cleanups why browsing the code.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      drm/msm/dsi: Drop redundant NULL-ifying of clocks on error paths
      drm/msm/dsi: Simplify with dev_err_probe()
      drm/msm/dsi: Minor whitespace and style cleanup
      drm/msm/dsi: Drop unnecessary -ENOMEM message

 drivers/gpu/drm/msm/dsi/dsi_host.c | 158 ++++++++++++++++---------------------
 1 file changed, 68 insertions(+), 90 deletions(-)
---
base-commit: 88cdcf93795d293aec92218477e6f857cce9156a
change-id: 20250106-drm-msm-cleanups-ddacf1fc3ba5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

