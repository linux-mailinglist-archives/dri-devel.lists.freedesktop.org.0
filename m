Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C507A5AF3B7
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 20:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B17D310E10A;
	Tue,  6 Sep 2022 18:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4A910E10A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 18:36:48 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1278624b7c4so12106136fac.5
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=Z1SqG+a+8DfOkCdpVOkTG6jpiKiwPKwZbGJ/NvH9zs4=;
 b=JdJ2NT0uiXpqf5EZKNm0bxqTxxxbTDsTsOEjLl/ERVAJl4LSOew/53VIJ7UiP/0y87
 vpKci++JK4MDH63C3m2R6IC5pyfaiL0oQzoiA9Vsv7eXDw62Yg40i90rijP1OwRguLYJ
 dyfGoX+Ffz3Byz7Uchl27QA1qeLT2jIpBbr0Xer5uU6qhsewZrMK8hJoOmBFGvUyfA6+
 /RPqnx/bwcDwmHrZemB2wk3tAmN1cMmOIpDnsG7qAhin/OZGsA4nzWfaz0+7q/yKs8q9
 6MgupjGYm4swyXKtshksjnWy34To1chWJU2WgxLiDhDFp9YBPagaxq+JrtvkBbGuK2Tc
 4EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=Z1SqG+a+8DfOkCdpVOkTG6jpiKiwPKwZbGJ/NvH9zs4=;
 b=8NPWk6xpy+PclqTfYMznoxokOvts+4w0goiPdVquicnxoe/5LI/h0RMsaYz0fBCa0T
 qnBRGPGN6sjnTMBijYLbdXDrCQr6NbWx4YKs0j/4LyDotYhKqMwNj5+BEJGqhRWmX/4Q
 FS/hsRR5/anryO/1xlpVPWydnZqfJjKhoWG2dpezwCzFrSaQPZuhL4gn3/TwKhlA7r+q
 AepwVzBRMNdRYHs8KAxEfqIgMp3yPjL9ioOtodhv9SqPynt5SB57MlpqfSf7mjMDrlBK
 nhnbVccbzq4gz9ZIuOos01uopymS2bCQ6lj2lg8JeudQzrVMnquQzDSnXFdaXyPz3XJa
 +r6A==
X-Gm-Message-State: ACgBeo1LmAs+aBbpxYAp9giHuU46gs1cjnhGqpNbIjD2qJqO3ZSE0TMY
 NXHPEDx/oJmEUjDeEDxL8FCEJMOmULU=
X-Google-Smtp-Source: AA6agR4eG2gUySXWRhQRTLVJSOimLirf7HoJpzO9x71BGGlX/jujnp0ZC7E32yGKHh8Frkdp+l7z7A==
X-Received: by 2002:a05:6808:1246:b0:345:b825:fea4 with SMTP id
 o6-20020a056808124600b00345b825fea4mr10045198oiv.261.1662489406042; 
 Tue, 06 Sep 2022 11:36:46 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 j22-20020a9d7f16000000b00638ef9bb847sm6158887otq.79.2022.09.06.11.36.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 11:36:45 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/panel: Add Samsung AMS495QA01 Panel
Date: Tue,  6 Sep 2022 13:36:40 -0500
Message-Id: <20220906183642.12505-1-macroalpha82@gmail.com>
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

Add the Samsung AMS495QA01 panel as found on the Anbernic RG503. This
panel uses DSI to receive video signals, but 3-wire SPI to receive
command signals.

Chris Morgan (2):
  dt-bindings: display: panel: Add Samsung AMS495QA01 panel bindings
  drm/panel: Add Samsung AMS495QA01 MIPI-DSI LCD panel

 .../display/panel/samsung,ams495qa01.yaml     |  49 ++
 drivers/gpu/drm/panel/Kconfig                 |  10 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 .../gpu/drm/panel/panel-samsung-ams495qa01.c  | 468 ++++++++++++++++++
 4 files changed, 528 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/samsung,ams495qa01.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-samsung-ams495qa01.c

-- 
2.25.1

