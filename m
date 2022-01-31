Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D574A4DC8
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:12:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF22010E1F7;
	Mon, 31 Jan 2022 18:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE2510E1F7
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:12:31 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id x23so28727415lfc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdIVNwv67nmAZn6Meg0bs0vVT2lvEaPKcRD9PPeIdYY=;
 b=LRrh0REUWFjKtcauuGh5jfhwq1TtfPUpAStoxGh1BuSp7MsRpHJTISGtIbjRnH7L5i
 eeyqNbaTmOSlbfURgVH5suiBUeL6SE7xSWvhAw7/2usSofMOgQ83xlWtlULaE//UwSX+
 f2Kor2JCpnHUhVr3qcY94IfepImszFbyz7xXm3+U15ruu+VA7gA037hG9h2XFqP/iMO1
 ByX/j/ASQjcUx0XeNHZe2L2h3pZ7TEozWncTnL4Q5fS/e4GQgX5If5u/d0n942B8YXnf
 nDOgrwW8XJcy+mG1XyDknjG/U9Ts6ikFSR6bGxIv1avfHVyZnaisFFwveo+kqVXl8Kcx
 +JDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdIVNwv67nmAZn6Meg0bs0vVT2lvEaPKcRD9PPeIdYY=;
 b=31wHNUyQVimfDtXKaUWYZKVX8h8aJyv06TFUOXPUYWswnSbX80izHSUbdvZmn5+joK
 uv0I0j8A6v9FhdU1+1Zyvh0J8kLbDVIlbMWfcpYoFs8q5N4v0gyikeRNMRD0fjbf4bwX
 DKMIX3xGs3QuMj55y7+2WbPf2IEUAgVVe7VQDT/4RKgXbMUtsX2XqpLBoUd7pNx1EGZU
 dxzZI0ktPxY6AAt00OTF57AJ1/zpBQkIJzjzFTr27EoGmBhIIs/DlQt5/NTEyYwkFrdx
 +WF+1FgcSQTFiq+KtEkUs0hq2Uk9d8mnzIWZ100srevxhrusMJac/px4rgJ/jaNyDvS1
 EmWQ==
X-Gm-Message-State: AOAM532oY8RLjRw0nRtloD8asN6+YJBJy9YJMe0GvXAPr5YZiJNx9ZD6
 RnC/pjRmen/P1PmOH8zTkws=
X-Google-Smtp-Source: ABdhPJyArIphe7sL0+h3OTFg6e6Oc0MyMPpil5i3WNsyQo6pmmqGBZ9Unfn1LqzepY2cXIixtyIbFg==
X-Received: by 2002:ac2:5190:: with SMTP id u16mr14837853lfi.257.1643652749969; 
 Mon, 31 Jan 2022 10:12:29 -0800 (PST)
Received: from localhost.localdomain (109-252-138-136.dynamic.spd-mgts.ru.
 [109.252.138.136])
 by smtp.gmail.com with ESMTPSA id r17sm3391297lfg.237.2022.01.31.10.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:12:29 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v4 0/3] Support Sharp LQ101R1SX03 and HannStar HSD101PWW2
 panels
Date: Mon, 31 Jan 2022 21:12:05 +0300
Message-Id: <20220131181208.27101-1-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series adds support for Sharp LQ101R1SX03 and HannStar HSD101PWW2
display panels that are used by Asus Transformer tablets, which we're
planning to support since 5.17 kernel.

Changelog:

v4: - Added r-b from Rob Herring that he gave to the LQ101R1SX01 DT patch
      of v2. I missed to add it to the v3 by accident.

v3: - No changes. Re-sending for 5.18. Device-trees of devices that use
      these panels were merged to 5.17, so we're missing the display support.

v2: - Added ack from Rob Herring to the HSD101PWW2 binding.

    - Updated LQ101R1SX01 binding, like it was suggested by Rob Herring,
      making LQ101R1SX03 directly compatible with the LQ101R1SX01.
      Such that ["sharp,lq101r1sx03", "sharp,lq101r1sx01"] could be
      used in DT. This removes need to update panel driver with the new
      compatible.

    - Improved commit message of the LQ101R1SX03 patch.

    - Added my s-o-b to all patches.

Anton Bambura (1):
  dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03

Svyatoslav Ryhel (2):
  dt-bindings: display: simple: Add HannStar HSD101PWW2
  drm/panel: simple: Add support for HannStar HSD101PWW2 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 .../display/panel/sharp,lq101r1sx01.yaml      |  7 ++++-
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.34.1

