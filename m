Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30765418544
	for <lists+dri-devel@lfdr.de>; Sun, 26 Sep 2021 02:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 360916E47A;
	Sun, 26 Sep 2021 00:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7AB16E47A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Sep 2021 00:10:14 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id u8so57069265lff.9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Sep 2021 17:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wI/B1QbBsMUky/GPfD/gCa3nRV2caTIcqbfrTW2zFx0=;
 b=KNbF4BtGTWMOM57nTC8DlIn+uJz8JcSfIthKwdPWcTb7lZIYi27TfYlm3qdcnz6Mjh
 eUiwv850lQYtX89zXjmAyADNs3OD7BmNG1AwfmsnoqDdZUmHvJoJe3C8zasHzqXB+qK/
 R1hj1lisxAC9QRaclu3ZpEIpPaj1zP63L9oeR7nfH4YJMfYI6HTfHZgPIGnVWsxlal8E
 vRG0b+ls1OKwWqcfnHV9LKuZLUs0IwpForq2fmBXCzDnKSgEmKBgo0AxKpN9gsawSjEQ
 OoXIM/ULT1qmy0Ddtk12rM4AZDZGgqh4Nhwh/2kCtXKIWA/uQZtVvUPkp7S1KQb9lwBk
 JnuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wI/B1QbBsMUky/GPfD/gCa3nRV2caTIcqbfrTW2zFx0=;
 b=Qmelq0aoZ6mHquIcevfwa6uv5sdqQHoDRJBhJF86G8BtDyJc9+gTIz7LTVgPBQBf7B
 mSbWmHFRIjXNDzXy/89pTAX6U3wBdnYzzbVYnF8BUt+R35j8ik7D45pv11mJax9Z4VxG
 IDK3wDVpqAO7Ir3Iy+HRFE2YVQvCwJ5EHHlgrzqIkDPjD5OkB97gWIScC/Rm4+PJSpnq
 megXEQT2WDw+jQYGPA7TsEVoljqv1Rw5gVrxCivqBF0UUsHXteTPKDM0wkig9dBHz2Ng
 2WUVsPt1aKNuEwBjNQoRSVTwD9cHEV/lZYjisrpYPAFGIFk+ZjzZBsk6cDunDourjNb+
 S/Hg==
X-Gm-Message-State: AOAM531cf9LHMv1571VcoQhflq4pGHya/pQODEdYe6kiFB7R0DF8Jt27
 CDfU+rI40NzkZK8cO87pnaqYGA==
X-Google-Smtp-Source: ABdhPJy0tioXXM4zqwYpii94wVmnk4sx5FjGj294JKpZFGTB3MaXXuupdneTxtxUPr14qQKXDrRmIQ==
X-Received: by 2002:a2e:8110:: with SMTP id d16mr17797829ljg.290.1632615013177; 
 Sat, 25 Sep 2021 17:10:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s7sm1261878lfi.130.2021.09.25.17.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 17:10:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 0/2] Add support for Sharp LS060T1SX01 panel
Date: Sun, 26 Sep 2021 03:10:03 +0300
Message-Id: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add driver to support Sharp LS06T1SX01 6.0" FullHD panel found e.g. in
the kwaek.ca Dragonboard Display Adapter Bundle.

Changes since v2:
 - Add missing power supplies used by the panel according to the
   datasheet

Changes since v1:
 - Fix the id in the schema file

----------------------------------------------------------------
Dmitry Baryshkov (2):
      dt-bindings: add bindings for the Sharp LS060T1SX01 panel
      drm/panel: Add support for Sharp LS060T1SX01 panel

 .../bindings/display/panel/sharp,ls060t1sx01.yaml  |  56 ++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c    | 332 +++++++++++++++++++++
 4 files changed, 399 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c




