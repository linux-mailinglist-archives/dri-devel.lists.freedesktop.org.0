Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C65BE976
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 16:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7AD10E6E6;
	Tue, 20 Sep 2022 14:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D482710E6E6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 14:59:08 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-127dca21a7dso4532925fac.12
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 07:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=NKDb4mEV1NgzYDPJkcOe5fAJAJzSY/M1cS3RRnmZuws=;
 b=J4HQFAkbzDAS5TFjIiERcadXFk1t425zk5b4YKZYOnRIwyL4RbyrQUG7LeqVPRPJQc
 rEBGs5syvspnTMVDRMRnVu9iaKk35XDubmbHHCnFHqOtN5+mhmy/jEonIerOSwvEEQcy
 2ELa962TF1EHTh6expD8tevfEtf9HsTcDqX9NeNa6wWrI0IVVtoZYAOIUIATPTKf/EqO
 y61IU3UuxcozwouGnc9CRT9Q99gmxVgqBW3JRhv8k8PJqbscMwUKWn4wc0AXOsnOGtIH
 V+2363dBw0oraYIgfqem4i61qw29fpw4LmVdI8R2R7MGPy4MEnA1qyxHQ5lu7n7t0L2Z
 wnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=NKDb4mEV1NgzYDPJkcOe5fAJAJzSY/M1cS3RRnmZuws=;
 b=6pOd1seo2GKZ0rNV0WltTnMyAXdqjxakHpH347KgQ64I31tRFJjkil9YGAjrbzYNoZ
 rWVZY0vUeOdL5LnfAUCYblMpj+LazXoWgYVye6f1BGMp25+2qCDkgV9Ql3ChZV6of7O4
 iDHyxSomTUWHBhrtOpD/3VN8MVWZRo2EG4HSdNLIJQCx7pCGI34ESPdJGy+N/HZf1UOr
 z3KgVwx93ZYLWMz6Qfo8Qkt/oMo2l7fqT7p2phOx2JsdaSQVJ7+CLh0FCpf12ebAUrLm
 e64JhdMGRJuTIBgqyOHDPvfeiklpZXKf4WWc7oycNXvp5mNPboRZT3jAR6U8l9viqTyA
 ZRCg==
X-Gm-Message-State: ACrzQf2rMbia0h4h9viKoDW/KD11V5e7hMYNR4mQXZGQ9nmL8wQPYANC
 vQ60UieCrs5eDw7n8idaUfQRModUuIY=
X-Google-Smtp-Source: AMsMyM7wt45OWBip05OWWwFw1tVKo/M8Xt+I1KaMFSDO6pwgcbCzyKfq5PQrPuCX+xrWqNEzKyI9SQ==
X-Received: by 2002:a05:6870:ac21:b0:127:f5b2:6864 with SMTP id
 kw33-20020a056870ac2100b00127f5b26864mr2236464oab.298.1663685947787; 
 Tue, 20 Sep 2022 07:59:07 -0700 (PDT)
Received: from wintermute.localdomain
 (76-244-6-13.lightspeed.rcsntx.sbcglobal.net. [76.244.6.13])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a05680803c400b0033e8629b323sm203156oie.35.2022.09.20.07.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 07:59:07 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 0/3] drm/panel: Add NewVision NV3051D Panels
Date: Tue, 20 Sep 2022 09:59:02 -0500
Message-Id: <20220920145905.20595-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>, robh+dt@kernel.org,
 thierry.reding@gmail.com, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the NewVision NV3051D panel as found on the Anbernic RG353P and
RG353V. The underlying LCD panel itself is unknown (the NV3051D is
the controller), so the device name is used for the panel with a
fallback to the driver IC.

Changes from V1:
 - Changed compatible string to the driver IC.
 - Updated documentation to use new compatible string with board
   name.
 - Refactored somewhat to make it easier to support other LCD panels
   with this kernel module.
 - Added support for 60hz mode. Adjusted pixel clock to ensure proper
   60hz and 120hz (previously was running at 124hz).
 - Added vendor prefix for NewVision. Anbernic vendor prefix added in
   https://lore.kernel.org/linux-devicetree/20220906210324.28986-2-macroalpha82@gmail.com

Chris Morgan (3):
  dt-bindings: vendor-prefixes: add NewVision vendor prefix
  dt-bindings: display: panel: Add NewVision NV3051D bindings
  drm/panel: Add NewVision NV3051D MIPI-DSI LCD panel

 .../display/panel/newvision,nv3051d.yaml      |  55 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 drivers/gpu/drm/panel/Kconfig                 |   9 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-newvision-nv3051d.c   | 513 ++++++++++++++++++
 5 files changed, 580 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/newvision,nv3051d.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-newvision-nv3051d.c

-- 
2.25.1

