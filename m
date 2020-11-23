Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FBD2C0D8D
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EAF89ECB;
	Mon, 23 Nov 2020 14:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4526F89ECB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:34:04 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w24so17461580wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2X6f3r1AMyTvYQnEJG6RFCLQoqcoeXFdGnWiV9Q2OU=;
 b=vHBonhWeMJX1FhFSTdnnEBfkcXDYw8w95Oaan/JooqYoJbfso1Fh/08+/F304VHmWM
 QHlFzAY9nnvB1bfoWBmf+4X+8W5z7vq2e6kPY8eKYC+IhqOnqx3x3j/C19t1W8ZGOWl+
 N4IxOOH+uaNUzon86w96/0mRf0QxuDMShM5wloWRKuZ4O01dOqIMcxbOYWCth5/CNRjD
 x6M4TWL1JhYTtGxsQtI1k2WuUek72lFJ0MKuJ00ciDV4Geo+zqvt9SgFYk5UbtsXcUUL
 lpKJiV5bTv64XCnW4v0q5Xm3gkU+AxbnsjIpp4dO9UD3uuQd2eITPMxTffPf3xCeF/ML
 Q0+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h2X6f3r1AMyTvYQnEJG6RFCLQoqcoeXFdGnWiV9Q2OU=;
 b=OgUNfsGVeL7Ex24p7VmTQe292Xw+JskM4FNWq1qCI37mAdNHhzDjwpbABTiyhBgdxN
 hj0DR1DNE2psgDr4lANcQcZdpzJVOqpKVrtTsySeAl5hGRk4j1cHJW/R2cT6DtFYWeu7
 ldBh1H4vwfgJSmFwGy9Bnn4LHppjasfR++2etRluhUXTBgr/hRcxRhnCRbiaokhDg/Z4
 yfMfmmtilI8xlygPoDxOb6XWWDhJK7e8o/rZ5n37/Z32SY+dZFjRMFF/USNHkkl7EWA3
 +1XtRGiEUsE91Jr+h4rSngnFGgcZ/ZlmbNL9HVJ/SUSwrvk5Ee1gRIh5ew0gW9U0zSln
 Jemg==
X-Gm-Message-State: AOAM533XmCHP++7ETT5Bx8PmtkljjeOfw/RZixkg81IkhoJtNbvxCIfj
 CaRZUKycz2jbsLahQHBQMvgIpg==
X-Google-Smtp-Source: ABdhPJyUmHHMKYCP4p/pZ9GX8zG9POVf/kx/9r5H9YZNAat7k4/el+eIzoYqsYebJWQxU1Je/ZZp1Q==
X-Received: by 2002:a1c:3d05:: with SMTP id k5mr25595586wma.151.1606142042781; 
 Mon, 23 Nov 2020 06:34:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
 by smtp.gmail.com with ESMTPSA id h2sm18126723wme.45.2020.11.23.06.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 06:34:02 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: sam@ravnborg.org
Subject: [PATCH 0/2] drm: panel: add support for the Khadas TS050 panel
Date: Mon, 23 Nov 2020 15:33:52 +0100
Message-Id: <20201123143354.295844-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This add support & bindings for the Khadas TS050 1080x1920 5" LCD DSI panel designed
to work with the Khadas Edge-V, Captain, VIM3 and VIM3L Single Board Computers.
It provides a MIPI DSI interface to the host, a built-in LED backlight
and touch controller.

Neil Armstrong (2):
  dt-bindings: panel-simple-dsi: add Khadas TS050 panel bindings
  drm: panel: add Khadas TS050 panel driver

 .../display/panel/panel-simple-dsi.yaml       |   2 +
 drivers/gpu/drm/panel/Kconfig                 |  11 +
 drivers/gpu/drm/panel/Makefile                |   1 +
 drivers/gpu/drm/panel/panel-khadas-ts050.c    | 876 ++++++++++++++++++
 4 files changed, 890 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-khadas-ts050.c

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
