Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0807ABB2D6
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 03:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B070C10E1FA;
	Mon, 19 May 2025 01:27:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="sTxILT+d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbg154.qq.com (smtpbg154.qq.com [15.184.224.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 293F610E1FA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 01:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1747618024;
 bh=HICLe6kVYfHxQosMAWfBiGfk8HLTkoJiRdDPSs0zKGM=;
 h=From:To:Subject:Date:Message-Id;
 b=sTxILT+dqEbdHTEDkxfQ4gAHtg10L7ev9Vd/SyAQ3bq+0YEqJM3qgA7lVrlzy7TaN
 WsPSVYSXePXoXRF2SA8dIFwMrr8uv3pzHMjC5sRHgIcgDvsIZi9W9A2i4TBfhae9aw
 cx1FMlUz3kMBuvzY8yZUw8FjntdUY9/hJaV9wRls=
X-QQ-mid: zesmtpgz7t1747618022ta4b8f366
X-QQ-Originating-IP: 7G1uptdJJorXsZPmkObXhl/zsV7bqPGJiWN1BLGTKso=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 19 May 2025 09:27:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6823201925033719388
From: Chaoyi Chen <kernel@airkyi.com>
To: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dragan Simic <dsimic@manjaro.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] Convert Rockchip CDN DP binding to yaml
Date: Mon, 19 May 2025 09:26:30 +0800
Message-Id: <20250519012632.94-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Mutteg8H72qD0e3+xNdYv7CPv9n3fer6jIlYOhSBxwS1Qb5035U63Bo/
 ChGME7AodpRWzJIwmr3+jO9bGVKQS+OrfFMPczEqQ6w6hJVsuNUe9pHrlgsJG75KgfQlwxT
 Xq6C6iC4AZm/wZ6j10KgedSTY/8R/BOy783WubRqSygWJnEXHly3+8hErm+GMdY/ORhN+sJ
 bcyYylgyCzi/ZyI8dj5ysHqGp8rZQK331Lmn0evKAtF02F1iht7cVgiCHeIQQLRnbO/4tf4
 QerPhb4G9NyXHbvnmv9PyIVjJacw8a5FgrkU4+/OSNJdgkAYzCsboZxlkE+EHRO9HbDjX8V
 xsWqID5Zaw/kbhzBL7diMy7WsK0lnmJGcZTifx4JwlLfndhgM4zxos3yVcCMH13JA3OGeid
 cqjp53GKw4AS5DCDrlwHpepNKwZwqHotjELhZh+XlCKCxKAF/cZjNgankS5RC+43qRoIDnp
 NmSyLa5EfngwpacW03UUdvbgjAyDuYJAIyHaWvs45Fpy8rqEHCGOOU2zLbXSC2jquBUatjJ
 /CjF+MbLLyijwioJB8NTecc/mNJ9oyO9+0S8N7x/UoPWXcrAH6f+keuaiUhrzSqUowDECsW
 3LubinxmUPl92ZYgM7zNTVsIfrjT16vr/jTfszswJZyhjFSSQZax6sljt8+9jWENLW2y4uq
 TIoHSkH8ASywe5t6JrQM8O762hp/TjpIPE/Uafl+2wjulvVKOntxLovtTyUmYNewm37t1cd
 EQbk7/ikBLT79mUC5kClsnjydzwvOVkfFnng5MvYCpLDfvXC5NJwXTxHEvE1/WiQBbkAuvR
 zVCT3wNHccw9JWNEaJD51ox3v2N3cHzUXsV84NibiADupxzstvZTLJExj304Q/6LYzj1mTp
 vbvkh/EW5wO6LF6pBYqRRlljbMZorQXJobWhNCtStXL6LYLWlJ59KpvrLCKdgLr/kS+KZFi
 ll5JzuyhOGxcV/L041anxZzZ5n9G2LfnZQzyoHH3i+YtmKQ==
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

This series convert cdn-dp-rockchip.txt to yaml.

PATCH 1 try to improve coding style on the existing rk3399 cdn-dp
node.
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml.

Both of them add new port@1 node that represents the CDN DP output to
keep the same style as the other display interfaces.

Changes in v4:
- Link to V3: https://lore.kernel.org/all/20250513011904.102-1-kernel@airkyi.com/
- Add commit about port@1 node

Changes in v3:
- Link to V2: https://lore.kernel.org/all/20250509070247.868-1-kernel@airkyi.com/
- Add more description about phy/extcon
- Fix some coding style

Changes in v2:
- Link to V1: https://lore.kernel.org/all/20250508064304.670-1-kernel@airkyi.com/
- Rename binding file name to match compatible
- Add more description about grf/phy/extcon
- Fix coding style

Chaoyi Chen (2):
  arm64: dts: rockchip: Improve coding style for rk3399 cdn_dp
  dt-bindings: display: rockchip: Convert cdn-dp-rockchip.txt to yaml

 .../display/rockchip/cdn-dp-rockchip.txt      |  74 --------
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 165 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 174 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0

