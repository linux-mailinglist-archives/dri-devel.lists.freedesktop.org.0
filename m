Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3551F4EFF
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:35:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB4489C48;
	Wed, 10 Jun 2020 07:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6681089F85
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 13:29:12 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e4so25072807ljn.4
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 06:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PEfZn3c2yRr9PZgqQYrvPOR6TZg49oFLjkzjjmco2CU=;
 b=gMocHyoKbY8s3KY27r/gPM7ahRjfJrWrlIefv9GwfFiwBgAnkSrD/Y4ClxdrCE400x
 UHe1t2ukajZYmYdtutOirwXUqI0Rcy7wNeL52GtJ8aHMqKNgv7qyD9Aikh+c1uzdUWxQ
 MoFkYBej2u+ic66AKCXOMoI/7qKJTLMZROFA/BywCV3Yjpj36B+Y8xgbbMOqYWuRH7hd
 a7djhOaFRAX51tKSBx7O0fA8gEbxWuG9v+vhg3M72Haxe59+yc6db2Iqhv8FO9A86zyl
 YxF5j9m91kCnLqw5cfhY6TF/mHQoWpSCS2XxH5laV1g12EuD2cZOIfUADWXWRCMiQPse
 eY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PEfZn3c2yRr9PZgqQYrvPOR6TZg49oFLjkzjjmco2CU=;
 b=qkgLDMdiNKCq5y5zCVqYDB5E5EP1W9cHZoytm8KsGYZydLl78tIWryDWwQ9mTToz8e
 1bUmkrupUNxj/pya7Nv15B3dMMxGrLdzC3oAFkNyBrPn1YNnfqXgN1Edu71mKfMBi0Md
 TpofWj7LrIIX0EqZ7Q/Lh4xoRX1XGHqmIzbBwzRqXTXX83+3HdTBdONcijUr7GIbIJBv
 4W/LD6yItk6hzRnHx9Kv/Gu0UV2EaaKA5Q8vKwillb7+oLl8n7d5ovczr6lDBTygJiZ6
 uetbSs+FEeqcko2MfhOlowJPh2zxkV3x8UEuxExGTroeH1tmopNyE++N/QGPxKJJ81hh
 U7zQ==
X-Gm-Message-State: AOAM530Fa+BYdsDSVC0yjzm1NCFExUvTtjHNRdhXLgJE5aspZEGrlKhN
 yegvu+sh+Js6CwJfa1zsQKs=
X-Google-Smtp-Source: ABdhPJw3wFI4gGl66N5VYIG7NFbTVA2131x8iYMK5UmoPdVFPxobMJSK4oDOHxkg2HOX0YKr7qBWOQ==
X-Received: by 2002:a2e:9996:: with SMTP id w22mr687084lji.253.1591709350714; 
 Tue, 09 Jun 2020 06:29:10 -0700 (PDT)
Received: from localhost.localdomain (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.gmail.com with ESMTPSA id s8sm5069821lfc.83.2020.06.09.06.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 06:29:10 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v6 0/6] Support DRM bridges on NVIDIA Tegra
Date: Tue,  9 Jun 2020 16:28:49 +0300
Message-Id: <20200609132855.20975-1-digetx@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series adds initial support for the DRM bridges to NVIDIA Tegra DRM
driver. This is required by newer device-trees where we model the LVDS
encoder bridge properly.

Changelog:

v6: - Added r-b and acks from Rob Herring and Sam Ravnborg.

    - Rebased on a recent linux-next, patches now apply without fuzz.

v5: - Added new patches that make drm_of_find_panel_or_bridge() more usable
      if graph isn't defined in a device-tree:

        of_graph: add of_graph_get_local_port()
        drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence

    - Updated "Support DRM bridges" patch to use drm_of_find_panel_or_bridge()
      directly and added WARN_ON(output->panel || output->bridge) sanity-check.

    - Added new "Wrap directly-connected panel into DRM bridge" patch, as
      was suggested by Laurent Pinchart.

v4: - Following review comments that were made by Laurent Pinchart to the v3,
      we now create and use the "bridge connector".

v3: - Following recommendation from Sam Ravnborg, the new bridge attachment
      model is now being used, i.e. we ask bridge to *not* create a connector
      using the DRM_BRIDGE_ATTACH_NO_CONNECTOR flag.

    - The bridge is now created only for the RGB (LVDS) output, and only
      when necessary. For now we don't need bridges for HDMI or DSI outputs.

    - I noticed that we're leaking OF node in the panel's error code path,
      this is fixed now by the new patch "Don't leak OF node on error".

v2: - Added the new "rgb: Don't register connector if bridge is used"
      patch, which hides the unused connector provided by the Tegra DRM
      driver when bridge is used, since bridge provides its own connector
      to us.

Dmitry Osipenko (6):
  of_graph: add of_graph_get_local_port()
  drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
  drm/tegra: output: Don't leak OF node on error
  drm/tegra: output: Support DRM bridges
  drm/tegra: output: rgb: Support LVDS encoder bridge
  drm/tegra: output: rgb: Wrap directly-connected panel into DRM bridge

 drivers/gpu/drm/drm_of.c       | 13 +++++-
 drivers/gpu/drm/tegra/drm.h    |  2 +
 drivers/gpu/drm/tegra/output.c | 21 +++++++--
 drivers/gpu/drm/tegra/rgb.c    | 85 +++++++++++++++++++++-------------
 drivers/of/property.c          | 32 +++++++++----
 include/linux/of_graph.h       |  7 +++
 6 files changed, 114 insertions(+), 46 deletions(-)

-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
