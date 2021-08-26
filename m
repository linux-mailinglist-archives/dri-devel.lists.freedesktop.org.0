Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C774C3F8604
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 13:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3677F897F3;
	Thu, 26 Aug 2021 11:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E39897F3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 11:03:18 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id e15so1560126plh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 04:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3GTkuPL4UPMLgrAEYs+HYFaqq9yL68gOnVhfKgDpcS0=;
 b=uE+dlzMOnHocysgzJwV038c07k5ja66wtp88Sqz7UzU1Ffz7QSEemUzSwz3RQ6gLtk
 qVFLRmMuy2lOSbiFSOR2eym0R/detKAmVD/0Q3x97SwaIZyMjzbtZL6GBaNVvnpXZTm9
 +AaZ4P3fRtfz4HXVgvFap68Y23Fuzwgq6Hbo6kB3/NVZCSyYdTgm8HrVRRcUrdXfcDRJ
 P4WEwVE31RbNo0hQfbbRBa5NlhyOfNpVR9C79BzQqvZ5fuhsjTXEQzYsVtYKAuRTTSi8
 J0ZRQaPA51LfeIKVJUwa7L3loqp5BLIRV9ak/VOgORlf3zQ7go+dLWMEyyPlmaxWSpne
 FTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3GTkuPL4UPMLgrAEYs+HYFaqq9yL68gOnVhfKgDpcS0=;
 b=e1vr0pLKi1k9G2gWuxH7lCS4Man6frgjM0H2IribTKhJSxicCy/Vn9qEmPLzRVRkme
 uq2AQipYdmBw0DUmniddpWXPkwgropDkL0lmrBrXH0OMYLIiOiQbfZvxvcyXlvx6uAhb
 dmfkkWhtjZLnyn3HpR7gnLyEetJphZ9A95pNe4W287w85t/GYY3sX/ZI1RcwXPS0DOPW
 smKDg0Hgn9zlBTlhCLRA6qr3DqBsH/GqnFEmKXhCaLkZt1mtDRUngJ5RmuSCalsaRura
 UUw29OGReBY3av15o7jdf5QhPVcJ+DRlgpnnxWw4tuChJLVniZwRGC04TK37Nm0HeqHa
 azTQ==
X-Gm-Message-State: AOAM530sUwvRmruQFa8PTBDdyCFSc7qOEjoQJXXrg1SfHCn8SfR+2yfQ
 lEXOXmkTLetQ/1uwglyEn8m8mw==
X-Google-Smtp-Source: ABdhPJz7PjiVM/hnpM1SvmZRprpOEgYGpJHs0Z9wVbYVPP2UpuQKyIf+3eAHcmNgoNZtsCrnsCsi8A==
X-Received: by 2002:a17:90a:6a01:: with SMTP id
 t1mr3675857pjj.31.1629975798328; 
 Thu, 26 Aug 2021 04:03:18 -0700 (PDT)
Received: from yc.huaqin.com ([101.78.151.213])
 by smtp.gmail.com with ESMTPSA id z12sm2655335pfe.79.2021.08.26.04.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 04:03:17 -0700 (PDT)
From: yangcong <yangcong5@huaqin.corp-partner.google.com>
To: thierry.reding@gmail.com, sam@ravnborg.org, airlied@linux.ie,
 daniel@ffwll.ch, dianders@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 yangcong <yangcong5@huaqin.corp-partner.google.com>
Subject: [v3 0/2] Add driver for BOE tv110c9m-ll3 panel
Date: Thu, 26 Aug 2021 19:03:09 +0800
Message-Id: <20210826110311.613396-1-yangcong5@huaqin.corp-partner.google.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml:

Compared with v2, delete pinctrl in examples dts.

-            pinctrl-names = "default";
-            pinctrl-0 = <&vdd_reset_1800>;

yangcong (2):
  drm/panel: support for BOE tv1110c9m-ll3 wuxga dsi video mode panel
  dt-bindngs: display: panel: Add BOE tv110c9m-ll3 panel bindings

 .../display/panel/boe,tv110c9m-ll3.yaml       |   81 +
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-boe-tv110c9m.c    | 1303 +++++++++++++++++
 4 files changed, 1395 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/boe,tv110c9m-ll3.yaml
 create mode 100644 drivers/gpu/drm/panel/panel-boe-tv110c9m.c

-- 
2.25.1

