Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AAC483652
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 18:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A3D89EB8;
	Mon,  3 Jan 2022 17:41:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64F989EB8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 17:41:12 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 e17-20020a4a8291000000b002c5ee0645e7so10921704oog.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 09:41:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJugq+q33UDGyDaDhmiuiGH6QULOKahu3StcjckUg4c=;
 b=pgsPDNP0QS3dOl4E1Y/qLj9qLxum48ESuvdEE6KYfnTMqlA02sUkHXzGpnrXv597a2
 tzwX7+lKMuTWQPsFUo6jVtzQkeD1RsrW/t+UCo96xihl5GloghXdkVUpdGz/JDwNkTqW
 p8ofGsl4Xs77ENKdRRyHgLjwJUfU7bdFFwXrHvV6AHb7qhHwGSkW7jtWSYAB8MGK5cbJ
 Y11hpzFCICOilz3U8ap3YzdkW6Xjl5GET6Swmle/t/v7yv48DQZpxZZrXb67prqLTwkL
 gZmFZsR/ERYT7RrUkQyXZClVL/WO1PmXsHQ99293xA8L68DfqvZLbkbIC3cHJiYL+mja
 KAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UJugq+q33UDGyDaDhmiuiGH6QULOKahu3StcjckUg4c=;
 b=HBtxmwJZ4Wybqk7h0p5Streglmd4i+bScDZ4gfD9i70ZTqUOIRR3mszcxDXkJG7yXL
 LLvaubUapqCjPluKKY0NoPxS/I98C1lt1xXdSZ01lTMVVq6Pb/NwAF5I7PNwDShlcUW7
 feRP9YlGfZ1dhGpLyYQKEzIv+nZsDo10tnuWYZV8rx9StAUDEM3FqwkI/F/X2eikwXbp
 WqfPC2bGKi3uihV1JImf9UpuQL96+FOgw/7VWYzzLVAs9cZE2sO6dsf+RJxYlF8c6H8G
 YkaPjli8WPcrxGpJiPcdKf5eHgkMCdbFXeUm56bvpDNkCSZywCLKh3R2ZB8mR+E3sXTZ
 l7yg==
X-Gm-Message-State: AOAM532psfZGDiI+cW87IfNdOSwMpOPsE/RI1fzfekGUHnTJbehqclLl
 H71ezIG6FlRytLF5C5alDNMCCMFppJQ=
X-Google-Smtp-Source: ABdhPJykAgfFlT/ukaKTo8t2ph+8QWknilIqmvUGv/JFq33bE8ke7SF1OcBMkC90YhJmJM/0gjYiFw==
X-Received: by 2002:a4a:a389:: with SMTP id s9mr29165835ool.4.1641231671866;
 Mon, 03 Jan 2022 09:41:11 -0800 (PST)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id s6sm9368864ois.3.2022.01.03.09.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 09:41:11 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Support Geekworm MZP280 Panel for Raspberry Pi
Date: Mon,  3 Jan 2022 11:41:01 -0600
Message-Id: <20220103174106.907-1-macroalpha82@gmail.com>
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

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Chris Morgan (5):
  media: uapi: Document format MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
  dt-bindings: display: simple: add Geekworm MZP280 Panel
  drm/panel: simple: add Geekworm MZP280 Panel
  drm/vc4: dpi: Support DPI interface in mode3 for RGB565

 .../bindings/display/panel/panel-simple.yaml  |  2 +
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c          | 29 +++++++++++++++
 drivers/gpu/drm/vc4/vc4_dpi.c                 |  4 ++
 include/uapi/linux/media-bus-format.h         |  3 +-
 5 files changed, 74 insertions(+), 1 deletion(-)

-- 
2.25.1

