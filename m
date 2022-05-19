Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CAE52DA36
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 18:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F356310F1FB;
	Thu, 19 May 2022 16:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B6F10F1ED
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 16:29:52 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id n24so7038961oie.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 09:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
 b=NYj5CO2VsMSeZfNk5uQQDLZWkX1iD5+rTQlPxO2qRHZTTl85aPPJ06nmfxTMPs65KE
 u9DnkncSOpJMFJw7zRUxMgaFdjFqcO15dzXKBAuTgrQdzp4XtIuDikbxor3m9vHMkyJE
 bBPtwqX0ReAgQlPzMdLZcXyU2kIJ0VPp6m7kc+tPavyKFrUeiGUxIvBq6MciM2GJgL7b
 yHOMmU7x5L/3ic91Y62JHVbn0bM9DB3xIoAzVP1j0MLnSx+1yOrKtom3IDEeC3pGaQJI
 JB6tSgYHnmLUF4g5JTMh5YtIL2faD/iQSK2+WfD51liOK2vMxcd+RiuhZ4xkAL8sXp6q
 Vk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
 b=bLdZxvQup2F7tfp4jklNuIWhnhyNtdQ0LYRqZOE0x29Rz5KQpr77fSzEnV4CL3KQ5V
 2PU0wiornxCxILpLZFwDnURLyOwMG1zC1kv1rRECLiPcQ00I/c4lLjq4qJ3/+8iNTNoH
 P+LQ7Ze1pxeO95E3EpiJ+gl2ZVWQNeqkLQNF2XllKjuQWJd4B09rtM85ATOXCyYPIw98
 hUvMa8rTsnMgobb50PGJRt3JGOCXf2XU4SpkZ0uyR/KLmNro5GMs5/k8JONYGoKD0i+Q
 G62mLlGnEXRwLBh72ZgcJg+MHMcDSC9uadKo4Yh6VYnM7QTXNQLLKYnqKAbCQlchnz/s
 m7uA==
X-Gm-Message-State: AOAM531ZCeXX8GBaO+zkQ0LpR+kcKjFoZqHzEpCZpTSNfyW161i+CNE8
 sSFswATdCT9HCqij7p1doE8JJ8F8PxaaZQ==
X-Google-Smtp-Source: ABdhPJwDVr9wsNlcIGh7UsCVXq9QcbbDq+mPnQX5EXGmcbCwnYewaZLTbFKIopObZcvOGyloWf9phg==
X-Received: by 2002:a05:6808:140c:b0:326:cd8f:eb71 with SMTP id
 w12-20020a056808140c00b00326cd8feb71mr3296913oiv.257.1652977789643; 
 Thu, 19 May 2022 09:29:49 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870844400b000e92295f8acsm36562oak.2.2022.05.19.09.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 09:29:49 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND 0/6 v2] Support Geekworm MZP280 Panel for Raspberry Pi
Date: Thu, 19 May 2022 11:29:29 -0500
Message-Id: <20220519162935.1585-1-macroalpha82@gmail.com>
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
 emma@anholt.net, airlied@linux.ie, Chris Morgan <macromorgan@hotmail.com>,
 robh+dt@kernel.org, thierry.reding@gmail.com, mchehab@kernel.org,
 sam@ravnborg.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

This patch series is to add support for the MZP280 panel for the
Raspberry Pi. This panel requires adding support for Mode 3 of the
Raspberry Pi DPI connector, which necessitates a new media bus format.

This patch series has been tested on my Raspberry Pi 4 with version 1
of the panel in question.

Changes since V1:

 - Added documentation for vendor string.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris Morgan (6):
  dt-bindings: vendor-prefixes: Add Geekworm
  media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  dt-bindings: display: simple: add Geekworm MZP280 Panel
  drm/panel: simple: add Geekworm MZP280 Panel
  drm/vc4: dpi: Support DPI interface in mode3 for RGB565

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  4 ++
 include/uapi/linux/media-bus-format.h         |  3 +-
 6 files changed, 76 insertions(+), 1 deletion(-)

-- 
2.25.1

