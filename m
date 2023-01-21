Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 754B967675D
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 17:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD0410E03A;
	Sat, 21 Jan 2023 16:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4A210E010
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 16:24:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 o17-20020a05600c511100b003db021ef437so5700789wms.4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 08:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YN0RgsGY5sjGwWchYqHougYTE34oL9zgVxdSvXbiA+I=;
 b=axs0MMcnoNP58RZQ0NnQKFxcaprb/RIXNjgNOzL6Ntr6HXXK5XkH+IjMLEIe1BQ4t8
 uHU32xccS8zpmJt+2inu9E7omuQg8IsrTKOWjylFTchtEoYlrV/md/E4WjmdRqztUPui
 CLjVRAJBnA+zyQPh8+2hSnwDtjY6YRsUvSaGrglIBM+iZUbGR2z1v7hcurAuo5hZrbab
 JVdPO7ZUTqBeEzHlliyEl/+A5lZroKlSqIxE17QDMJkyBCRnhlW007rlHe/e3d+PPKDi
 IR491Fz2OFXvByAedeasXzfLAAXDlO3AZZfjKogGLYLGis7ILZwWw5Kztkv1ce6Mr1uU
 BAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YN0RgsGY5sjGwWchYqHougYTE34oL9zgVxdSvXbiA+I=;
 b=rCENrwCft58rodbPUrGlam22VbexXjL4AXeAWZi4SJwzcruyD/GAIMQGpUQQndh8vy
 w76gMXgnx2BQAxKtvnmL0X0ku+pHqciWL/d0MvUsR/RxTkCPgQfao7vBxkFgIhdvfroC
 384jj+9Do9NXecshKvR2QIQGomPAWxJXfAt7PSxGh9E2wiCwyhJF6AU99Sa4DgAA+Vsu
 IIfvw+GO4jcvPuWe+rO2pfX7rnePbLdiEaPGQGNmhHUigNKTa1cPf8sX5DGQT9+r54Gk
 E88Ydtj0bkGwU5NEV0snMzYvc03/brvaAUOV5mmJgkjzk0TZM8Hj+aau7Up05C8j8dB9
 pk+A==
X-Gm-Message-State: AFqh2kqJKXnY8PDtoZ8RqY+3wsUoGLlFtsPmG63vna8Z586/r08797HJ
 BIr80NtDB9ybh/s2usuvx74=
X-Google-Smtp-Source: AMrXdXueG+30f15FM6ZNJFdngtP8IrOmcwx4tufP2MpKVjvv5woJcynb6f9jfv42oBWUVemFbct+Sg==
X-Received: by 2002:a05:600c:1604:b0:3c6:e61e:ae74 with SMTP id
 m4-20020a05600c160400b003c6e61eae74mr19145049wmn.4.1674318263594; 
 Sat, 21 Jan 2023 08:24:23 -0800 (PST)
Received: from localhost.localdomain
 (2a02-8428-46a0-7c01-43c0-f52a-beed-541b.rev.sfr.net.
 [2a02:8428:46a0:7c01:43c0:f52a:beed:541b])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003db30be4a54sm5831443wms.38.2023.01.21.08.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 08:24:23 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul@crapouillou.net, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Add support for the AUO A030JTN01 TFT LCD
Date: Sat, 21 Jan 2023 17:24:17 +0100
Message-Id: <20230121162419.284523-1-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v3:
  Reworked the few init registers that are used for hblk, vblk and standby
  Use of dev_err_probe() instead of dev_err()
  priv->panel_info = spi_get_device_match_data(spi);

  restored spi node to dt-bindings that was missing in v3
----

Changes since v2:
 - added macros for stanby mode (untested, please review @pcercuei)
 - added SPI table_id
 - changed description in the bindings to describe the hw more

Changes since v1:
- fixed the dt-bindings maintainer email adress
- dropped backlight, port, power-supply and reset-gpios as they're
  provided by panel-common.yaml as pointed by Krzysztof Kozlowski
- changed reg: true to reg : maxItems: 1


Christophe Branchereau (1):
  drm/panel: Add driver for the AUO A030JTN01 TFT LCD

Paul Cercueil (1):
  dt-bindings: display/panel: Add AUO A030JTN01

 .../bindings/display/panel/auo,a030jtn01.yaml |  60 ++++
 drivers/gpu/drm/panel/Kconfig                 |   8 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c   | 308 ++++++++++++++++++
 4 files changed, 377 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/auo,a030jtn01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-auo-a030jtn01.c

-- 
2.39.0

