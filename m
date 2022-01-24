Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F295E498556
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD87110E258;
	Mon, 24 Jan 2022 16:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F66310E247
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 16:55:33 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id bb37so26425144oib.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 08:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
 b=mId1FuR9s6iKVTGZis7QAHMNjgq7+dmxtx/O71+f5srxsDXSAkHFST2U7qaAE1kNKU
 b68G9KgODou9xVptCUToGPQpslvdwRVol6TpamJN6hmMthG18HbvI6GvZabmSM/G7nxm
 kYTIJeE57ooqyCTgFg0aYJiKAWA7K1JLqxZkUlsQ1VxliaoH9d+FBVdelrVrJ5wxPoNX
 4cTN+ko0ZhN3WFK4dIffP4OoVUN02j+8Mk2DTVGzuWxkKcptVIo6klSNBhMffK1n7lYc
 PL53hKQ2x/HL1U7kQTplFtNWX9YzGDtVjrlAyPXk/5VuHvegYexKV+eCXfm3s/Qag5bV
 5ICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nb+0LTfVaj8me5eEZibYeHxpIZnXgwjVRTYa6w5qhzY=;
 b=XmrLohen6sCelvEJu9s6rVM5moUR42JHUy6S+K/ARCRvpN+0K5jG/JMGQx/OV8N+vX
 9Gkd7eLPBhxPp4bxcIbNvHItx23AtPmspJ2TuMp+8jW0kQ/VvLXx4Bz3UDth0bsdn0av
 FkPsZgfw638BdRP4g0n0HOP6BO9451ylwOH8SJ352cR35ILyunVhNod9XcMpXnO+aWa1
 9X1uN5ewFeKjacQQzYZHQxr59JzlPdzQ9WjuH6nGCDxveQOC5VQXtxehqWaw8qVlFkMF
 H5u6q1I5/WFZg5vOxScoPXbxmdPBXuS3Ox0hsnVutwDUPxYVKREkRxmHLj5nNj3wZmhy
 79Bg==
X-Gm-Message-State: AOAM532magQVBDCNTYHwLGjH3VJ2hmWo/g+s086Q3TkbS69J5ORjaWn7
 4n4QwAOkayE9ERiTeLN5hHMUpqZMwbs=
X-Google-Smtp-Source: ABdhPJz48xQEpDnzAfNH9d2m9/rNA2fDFnsYAKb2fr0KpNIVlYrxB0yJfhNQ/UdiZjS7xIh3hv7VLg==
X-Received: by 2002:a05:6808:120a:: with SMTP id
 a10mr2166141oil.160.1643043332255; 
 Mon, 24 Jan 2022 08:55:32 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id v22sm4418370oot.10.2022.01.24.08.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 08:55:31 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6 v2] Support Geekworm MZP280 Panel for Raspberry Pi
Date: Mon, 24 Jan 2022 10:55:20 -0600
Message-Id: <20220124165526.1104-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, Chris Morgan <macromorgan@hotmail.com>,
 emma@anholt.net, airlied@linux.ie, robh+dt@kernel.org,
 thierry.reding@gmail.com, mchehab@kernel.org, sam@ravnborg.org,
 linux-media@vger.kernel.org
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

