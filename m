Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63386F9B4F
	for <lists+dri-devel@lfdr.de>; Sun,  7 May 2023 22:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A5910E2E1;
	Sun,  7 May 2023 20:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E05D10E048
 for <dri-devel@lists.freedesktop.org>; Sun,  7 May 2023 20:12:22 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2ac80ed7f26so41162011fa.1
 for <dri-devel@lists.freedesktop.org>; Sun, 07 May 2023 13:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683490339; x=1686082339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L/6AzpdlSyT2u/DnJHcJ/Uua4yjnwn+cYMZI+Ho5YM0=;
 b=IMDFGq2wAGGD8tAQ4XxBVTRUqSkb+NVXsrdR5L3Jgb7FfzWMx1m0DUnOcXdsxTCa4S
 RSYCSadzQmSeqFpH8+2Kntv/R0Q8lTtWm4205FATqc5it3p/kxmw3QrnW8q53qpEE2ei
 0/NaZlRMhtwTzOc0sb25l9Xya7XXB4IKdK1peX5qCUsXGfAYbuQ3YnmcQfylNZLPVNsl
 9tro+mDgcx8GRRSzuzeYro2dalipORjhlqxs1W38RYOC9D8Mv2b6k+iFeunC5qBg5ziX
 MD2sFUfGzOn2IxaIbDK02osz67D94bgZ6Z6S5wenFNfRwsX0NNCeCnnP+LyT3yODMG62
 bmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683490339; x=1686082339;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L/6AzpdlSyT2u/DnJHcJ/Uua4yjnwn+cYMZI+Ho5YM0=;
 b=AAa8dPxb1F8T6QS7Sph3keBhDnEzIHk1Jf2wdbxfukdCgu46luPKqXn/7MGGWwOkjy
 hWUQCxLfruqeBxrwSXw+4a2krXZiKI7K1+2f74sXAFHZ2b6q86uBKG8fDWm7wRJfVfVO
 Td5uf8P9rYS+XKEfli8qoW1sLmQeQ2j5w2IR62g+UghAx/7UI5xEq+byBo/gky2B9djV
 ZJtJi7Oe/qQoVR2F2qT2n9WyNqf5u6R7vxdezNEk+16rV/FTC3mqVKygUDOX4DdJP6t2
 fHszy+JA7BNg3prumZWq4ZGql8aqFO/emT1DYJGeMUb5KGfII2VRWngPQWH6gubqPVL3
 94Gg==
X-Gm-Message-State: AC+VfDzwW7TgGpn+wq48fGfEaYwW1BBOE+g5D3ufL2Z89VaIdCp0wKQ2
 S/aEmziBLvW1M0AaWluM31wQKg==
X-Google-Smtp-Source: ACHHUZ4/hD931uwZc8408LWyMq2qyx8mNfsSRodp6QnULqL8JaYg54nQGXh+xSV3tnWvfjuaICEEmQ==
X-Received: by 2002:a2e:9990:0:b0:2a8:c32d:1238 with SMTP id
 w16-20020a2e9990000000b002a8c32d1238mr2356176lji.15.1683490339563; 
 Sun, 07 May 2023 13:12:19 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 f5-20020a2e3805000000b002ac74f5f022sm916522lja.0.2023.05.07.13.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 May 2023 13:12:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 0/3] drm/bridge: display-connector: add external supply support
Date: Sun,  7 May 2023 23:12:15 +0300
Message-Id: <20230507201218.2339014-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices the 5V pin of the HDMI connector and/or the ESD
protection logic is powered on by a separate regulator. The dp-connector
for such usecases provides dp-pwr supply support. Follow this example
and make hdmi-connector support the hdmi-pwr supply.

Dmitry Baryshkov (3):
  dt-bindings: display: hdmi-connector: add hdmi-pwr supply
  drm/bridge: display-connector: rename dp_pwr to connector_pwr
  drm/bridge: display-connector: handle hdmi-pwr supply

 .../display/connector/hdmi-connector.yaml     |  3 ++
 drivers/gpu/drm/bridge/display-connector.c    | 51 +++++++++++++------
 2 files changed, 39 insertions(+), 15 deletions(-)

-- 
2.39.2

