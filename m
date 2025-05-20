Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C517CABCD6D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 04:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819C010E486;
	Tue, 20 May 2025 02:48:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=airkyi.com header.i=@airkyi.com header.b="A0vd+xL8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0410E45E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 02:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
 s=altu2504; t=1747709272;
 bh=IKcs6b0AA5ZZBJLb1JtJdqM/QeWUh0JfrB8WikrPpnA=;
 h=From:To:Subject:Date:Message-Id;
 b=A0vd+xL8L7JF4hzQE9GwoXpQMtaZao+VO1zYQ4KQ0HXzVMxHhL/jVGH6vxTdmAQ5T
 6zqOCO/2CoUWCYedzgRnA1g148BgNA69VLBhbVhc6o0bkEzrnfAXRxVbKmpzwLjeZa
 MHT3i5gW1Xh79QNruABEm5KwOk+/b9wJU8+F6868=
X-QQ-mid: zesmtpgz1t1747709270tfc1b7ec2
X-QQ-Originating-IP: KB9lR9nSthPiIc+Nf/1GP2Tikw3ty9gNZQUC/A0vEPg=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 20 May 2025 10:47:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2345042519657141149
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
Subject: [PATCH v5 0/2] Convert Rockchip CDN DP binding to yaml
Date: Tue, 20 May 2025 10:47:16 +0800
Message-Id: <20250520024718.142-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrsz:qybglogicsvrsz4a-0
X-QQ-XMAILINFO: Nzm/ywkHpQhPfwad78O6VrRfoMxmCXDgc4pun7aRlmNTCKXYubt18I50
 mIsktJo2Wn4RbOu8TZDygphtItM50VvVOhy2tNy+YO+cKe3bNBndUV1FgQh19IIV2up6409
 jZm/O5+TSxMWuY8IeaibeTzNfs2mTIFdDg2IYHwuCuynNu4Dl1+wTk8+CGwucb/DIwdKiuV
 2t/xpar56UlZTRptOf2ah8ui3Uh5+Xl9iKnWA58NNVdp7j/Dq1GHr/rOAtCtCwBzuZrhOQo
 agCuku8Xt0rVvV9R70QMqVBhlFjpSpn05NE5asgFTipiHwywb2ADF2VzMpTC3FDY0hTtZox
 ZFkZpRVf781+P7DeqNRjC4AUOskAVKItbrCMjPzcz93gf6HF8PG+KSgvka5zIGea8537kvr
 pqcV9GLtJM3zg2RwUcuLkmLOGARDq4dAwW0jmv56DDoIrnUy2vin+M0VEhoOFmf2l4QtsoQ
 VLvR+6J8NftXCsD9k7r0JsDy4SdsIaQZWwR7EmAjBmg316JpNIWel4mEc4nTi7iKOi1Bs9u
 YReANYw8UbvlZMsiv9hbWrGg0agqrQ/ExxM6CS9EFHdy8brHT6fxVix81Wnhmd6T8STaVt/
 j6PcV4dBE1x3W4k6RqN7MI5x9EszLJ0FMEFTQ2v8FhCitM7wr+MriWVunYWcziPNJZOalwI
 iBO/vvW25UlFvKrXmy9Cnyr2HAKJEKEv7q9h6raW/Zf50M9bnlZRb0TdFqM6KfDYB8dBgIW
 YwJKLsu6RJGANRyYPhOCoirJD3UO60lzehN5It4IVBqrt2hmHGzqvHjIkDiugIXV8uHnhEG
 mxsf5uYQ2a8YT4kJ8gEg3UxXGS/OfiLZAWpYLrb9J2Vhioqa01q9bKf6Y7+PEbvP/C4Scnx
 UULaJvEwgxLCsqL9fNzRz5JmCvDqu49TADmRbxyJnfTopCt8njJ6qOYWMJAizvE8kx0mlbX
 Dm4RPh7rqf0Zy7QxBOp/gsS0kerdOESEH+6lTIDBvYqE+8It1R7aOG/KQ
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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
PATCH 2 try to convert cdn-dp-rockchip.txt to yaml. It changed the
constraints for the phys and extcon properties.

Both of them add new port@1 node that represents the CDN DP output to
keep the same style as the other display interfaces.

Changes in v5:
- Link to V4: https://lore.kernel.org/all/20250519012632.94-1-kernel@airkyi.com/
- Fix constraints on extcon and phys
- Add commit about changes to extcon and phys
- Add "#sound-dai-cells" to required properties

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
 .../rockchip/rockchip,rk3399-cdn-dp.yaml      | 168 ++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi |  10 +-
 3 files changed, 177 insertions(+), 75 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/rockchip/cdn-dp-rockchip.txt
 create mode 100644 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3399-cdn-dp.yaml

--
2.49.0


