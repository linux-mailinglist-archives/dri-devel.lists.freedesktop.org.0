Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D069AA51
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 12:29:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A7DD10EF76;
	Fri, 17 Feb 2023 11:29:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0410EF6F
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 11:29:12 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h30so970267ljb.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 03:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XojccRYQ3011ah7si5AMINb0QDSJoaYY4S/gS49bAfQ=;
 b=d9mmn2OTk/EYtKzs7v+DxSB16T2vfV1NHmLvqLgwPlTjquDNsqHxuK9jF+FCcA3mzX
 TVVnqmft78I2uOrHGtz9iRydl7/plZR7+p3rmH3sxdPO2xRmoDq7F7myhOImySzgsVwW
 1/pHz1+rlJCXAQUtfCfU7fO96u5pBWQpe0QZlTslSOG1mOAQj5T+NsI0V+h7tr2iY5aI
 o7jsWKVRdlFMGalH3/XPeJDrKOztWKndZvsr50XsG8Fk+9i0y3TL+7ZVgvq9OjcQmGqy
 52Nv4TF6l4CBk9qeuFmF/J2Fg9suV8zo6oxj5nsMmIw3+bbWTFG8YXnfH/vqaQ5Ty2IT
 t1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XojccRYQ3011ah7si5AMINb0QDSJoaYY4S/gS49bAfQ=;
 b=WXVmCBvGSUirc1TgL6PrQumx4sQXhWIsX8N7oEsDND9revQe+Xt4c86549rsV1QAkj
 /sSSeN1rop44Z6C0PWir4MD3tF0vjNKsqpMWYXzBoHZjJm9MLVg7JaTd26BVhvuNU3oX
 anAsTpS6kvsqR6Hd28BZH6AkYVIodyPQX8CqGyIrV47BnYnfYvtjkCMxkU1ZnaXQji68
 ODR0hu7KBRlxO4FJu7S7V7gUbvRRJlN5A+422WrsxmK1L1HlEGO0rPu3WWZ0ZJ8QZIC3
 rS4svphImcoEMyoqJaaBOMF5vUTjZj6RllUybpxX7B9V8IK6N5ZmbQMC+EYqvLwWeXkZ
 h8SQ==
X-Gm-Message-State: AO0yUKVrq3uEXRec6wB/7LpyqTn8Q/waEJKjTVe+gR6p+qF//AMUKhe+
 Brws+A3w45G4pn5W2BmOpbfXOg==
X-Google-Smtp-Source: AK7set8CH5VWqiM0itp6QaTpj2Bh8G3+5JJvzXf3luR0pRoB2Zg+dd8f+V3RhYdbkKYMW0hGX0LJwg==
X-Received: by 2002:a05:651c:1548:b0:293:806:dd74 with SMTP id
 y8-20020a05651c154800b002930806dd74mr141142ljp.46.1676633350142; 
 Fri, 17 Feb 2023 03:29:10 -0800 (PST)
Received: from [192.168.1.101] (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a2e9546000000b00267232d0652sm564505ljh.46.2023.02.17.03.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Feb 2023 03:29:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH 0/2] Add support for Lenovo NT36523W BOE panel
Date: Fri, 17 Feb 2023 12:29:06 +0100
Message-Id: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAJl72MC/x2NQQqDMBAAvyJ77oImUoNfKT0k6VoXwiYkVQTx7
 y49zsAwJzSqTA3m7oRKOzfOojA8Ooirly8hf5TB9Mb2ZpjwlwtHTCR5z1i8UMLRxacNbiS7ONA
 w+EYYqpe4aipbSipLpYWP/+n1vq4bpXMJJnkAAAA=
To: Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1676633349; l=770;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DdW0OelSNZcoEzI5MdU1ai/Q4yYiDtAFZdvB/j6upxg=;
 b=T3zW0WVtkxl28K80ifzKQaqjIZZ9dQHy/VIGnPSWYviFs0++ssUuborzX7qPinLQ5gL07tIzVH8w
 QwaApCdBBAHjHdL1+zvyDiUtAtB9AnMR0WFGMJxmUsof9LU9HACd
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver and bindings for the NT+BOE display panel found on Lenovo
Tab P11 devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Konrad Dybcio (2):
      dt-bindings: display/panel: Add Lenovo NT36523W BOE panel
      gpu/drm/panel: Add Lenovo NT36523W BOE panel

 .../display/panel/lenovo,nt36523w-boe-j606.yaml    |  60 ++
 drivers/gpu/drm/panel/Kconfig                      |  12 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-lenovo-nt36523w-boe.c  | 751 +++++++++++++++++++++
 4 files changed, 824 insertions(+)
---
base-commit: c068f40300a0eaa34f7105d137a5560b86951aa9
change-id: 20230217-topic-lenovo-panel-48c63b84e3f8

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

