Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D704A7B0526
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF97910E50F;
	Wed, 27 Sep 2023 13:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC33D10E50E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 13:19:08 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99c3c8adb27so1431410266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 06:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695820747; x=1696425547; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ex2j1HgBhR1f7+T8Tw8OuGpDZVU+3dvDfXhVV1inwiM=;
 b=zkMAvPpZs+SNbUuoYoAhGePMtY1tBojy7Rsrfr64tt/OG70sIXTyKlgjO4Ugm77buF
 k3FTT1iMwQAqjJJkhK/819ze+a1zUComGRE9wvY4w67+BZSXwVcZiKt5T4Giw3378/my
 t23MxafcuZAfuPtgLj+JzHQFnwERu3SkJsrnwXNzjxdBLuu68qFvpaNWU64subcEl9ye
 iYuCaNUendfeAf8zXivONOvCoUc2HIUXz4rb38a+Rs9GDIbnsKJtnurJDYPcmf82wUnl
 G7MjKA3ERb+o5+uzquSoJsQKdGGC3nOA+h7FXUxO+olgnR/Mx90fNLZt/452dcgNeCpb
 xJWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695820747; x=1696425547;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ex2j1HgBhR1f7+T8Tw8OuGpDZVU+3dvDfXhVV1inwiM=;
 b=TsM6XoxPhX+EmqopzcCkXVdZXX+rAovf8I+GaBfAdSzUadrbl3cMgLoTYyxv0juArD
 zWalkTecQnVn+KEwWhLmxFoPes1NHtXkPw3xpwSQ5uyjBzsweoa3ls041aZFl9cLAzH2
 ySOhcPkiVtRfqeWkzFJxU/Ud1T6hNa2GHtzZxGwOw/JAJKf56GDjkzX9Ia5rY8ydaTN7
 UmRYFVr8BWWsPy1eybTnx3FDKbzCP4gyfwLH8NH43pu3UgTK46QQb9kZCkKdpO828NFP
 vRu+hEWPOq4cywnKS9hvG5/eX9Lt1847fnWLYiGjz+HoAvl92rRxolcBqZnz/9cfKN5/
 d6KQ==
X-Gm-Message-State: AOJu0YxEyDEMZs4D/sTua5K8bVKvm3bdHDfbbGeBU4auXJSmGsuDCxxu
 eksf0MmlcnxSF2UGeCIvMhKKGg==
X-Google-Smtp-Source: AGHT+IGu1wbqk0GFZX73piIbUS2jzIqtwNkAydKLJwpjj4a/7CTd7GSLrjBK4RB9WdRKN9Vy71i0Kg==
X-Received: by 2002:a17:907:2714:b0:9ae:68bf:bf2 with SMTP id
 w20-20020a170907271400b009ae68bf0bf2mr1572481ejk.69.1695820747090; 
 Wed, 27 Sep 2023 06:19:07 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 md1-20020a170906ae8100b009ad8acac02asm9369335ejb.172.2023.09.27.06.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 06:19:06 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Raydium RM692E5-based BOE panel driver
Date: Wed, 27 Sep 2023 15:19:00 +0200
Message-Id: <20230927-topic-fp5_disp-v1-0-a6aabd68199f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMQrFGUC/x2N0QqDMAwAf0XybKCtbFV/RYa0Nc6A1NJsYyD++
 8Ie7+C4E4Qqk8DYnFDpw8JHVrBtA2kL+UnIizI44zozOI+vo3DCtdzmhaWgv3ubjBki2R40ikE
 IYw05bZrl976rLJVW/v4v0+O6foj5ieR1AAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695820745; l=836;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Mn59zuX+Tdfbn5rVObYzOLlA/VLiJznWMnAdWQMfYA8=;
 b=NzCtxa23q/2zxYt92xRQO7kNc4G/KZmOcaxHWz5/6n27ZskvfSWBTIAy7Gqa9C+ha1ag9+eix
 6V03J2YinCKBoLCiI1wCkwKyt5ddjE/A4BTLPESBKMbEO634TIeqTuj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Fairphone 5 smartphone ships with a BOE AMOLED panel in conjunction
with a Raydium RM692E5 driver IC. This series adds the bindings and driver
for that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: display: panel: Add Raydium RM692E5
      drm/panel: Add driver for BOE RM692E5 AMOLED panel

 .../bindings/display/panel/raydium,rm692e5.yaml    |  73 +++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c      | 496 +++++++++++++++++++++
 4 files changed, 579 insertions(+)
---
base-commit: 18030226a48de1fbfabf4ae16aaa2695a484254f
change-id: 20230927-topic-fp5_disp-7671c009be18

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

