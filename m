Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBcUIl8/c2mWtwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:29:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A94AF73511
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jan 2026 10:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E1210EA73;
	Fri, 23 Jan 2026 09:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B460310EA6A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jan 2026 09:28:58 +0000 (UTC)
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.103.171])
 by APP-03 (Coremail) with SMTP id rQCowABXZ85EP3NppX1gBg--.20954S2;
 Fri, 23 Jan 2026 17:28:39 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Michal Wilczynski <m.wilczynski@samsung.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Han Gao <rabenda.cn@gmail.com>,
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Icenowy Zheng <uwu@icenowy.me>,
 Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v6 0/9] Verisilicon DC8200 driver (and adaption to TH1520)
Date: Fri, 23 Jan 2026 17:28:21 +0800
Message-ID: <20260123092830.4046009-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXZ85EP3NppX1gBg--.20954S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw18Cw1UArykGr1fGF1Dtrb_yoW7ZFy5pF
 42yFWFyFyDAa1aqrZ7tF109ay3Aas7XFWfWr47XwnxZwsFyFy5Xr98Ary5JFWDJr17AryI
 vFsYkr42kr12yF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
 n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
 kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
 67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
 CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
 VFxhVjvjDU0xZFpf9x0pRl_MsUUUUU=
X-Originating-IP: [112.94.103.171]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:fustini@kernel.org,m:guoren@kernel.org,m:wefu@redhat.com,m:p.zabel@pengutronix.de,m:lumag@kernel.org,m:m.wilczynski@samsung.com,m:luca.ceresoli@bootlin.com,m:rabenda.cn@gmail.com,m:ziyao@disroot.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:uwu@icenowy.me,m:zhengxingda@iscas.ac.cn,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:rabendacn@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[29];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhengxingda@iscas.ac.cn,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,samsung.com,bootlin.com,gmail.com,disroot.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,icenowy.me,iscas.ac.cn];
	HAS_XOIP(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A94AF73511
X-Rspamd-Action: no action

This patchset tries to add a driver for Verisilicon DC8200 driver, and
demonstrates the driver on T-Head TH1520 with its HDMI output.

This display controller IP is used on StarFive JH7110 too, but as the
HDMI controller used there isn't as common as the DesignWare one, I
choose to use TH1520 in this patchset.

The DC driver is written with other DC-series (mainly DC8000, which is
known to be used on Eswin EIC7700 SoC) display controllers in mind, and
uses the identification registers available on all Vivante branded IPs.
A known exception is DCNano display controller, which is unlikely to be
supported by this driver because of totally different register map and
no known identification registers. (P.S. the in-tree loongson DRM driver
seems to be for some DCNano instances based on the register map.)

The HDMI controller seems to come with some common PHY by Synopsys, the
DesignWare HDMI TX 2.0 PHY. By searching a few register names from the
BSP driver of that PHY, that PHY seems to be used by a in-tree dw-hdmi
glue, rcar_dw_hdmi -- an updated downstream version of rcar_dw_hdmi
contains all 6 registers set here in the th1520-dw-hdmi driver. Some
more suprising thing is that RK3288 uses the same PHY too, but the
in-tree dw_hdmi-rockchip driver writes the configuration data array in a
weird way to reuse the HDMI 3D TX PHY configuring function. It might be
valuable to add common configuring function and configuration data
definition for this HDMI 2.0 PHY too, but the current driver in this
patchset simply duplicated most configuration logic from rcar_dw_hdmi
driver (but with 3 extra configuration registers configured, which is
done by their downstream kernel).

Another point to discuss about the dw-hdmi glue is the placement of the
driver file -- because of the display controller being generic, the glue
driver is currently directly placed into drivers/gpu/drm/bridge/ .

Icenowy Zheng (9):
  dt-bindings: vendor-prefixes: add verisilicon
  dt-bindings: display: add verisilicon,dc
  drm: verisilicon: add a driver for Verisilicon display controllers
  dt-bindings: display/bridge: add binding for TH1520 HDMI controller
  drm/bridge: add a driver for T-Head TH1520 HDMI controller
  riscv: dts: thead: add DPU and HDMI device tree nodes
  riscv: dts: thead: lichee-pi-4a: enable HDMI
  MAINTAINERS: assign myself as maintainer for verisilicon DC driver
  mailmap: map all Icenowy Zheng's mail addresses

 .mailmap                                      |   4 +
 .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 ++++++
 .../bindings/display/verisilicon,dc.yaml      | 122 ++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  25 ++
 arch/riscv/boot/dts/thead/th1520.dtsi         |  66 ++++
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c       | 173 ++++++++
 drivers/gpu/drm/verisilicon/Kconfig           |  15 +
 drivers/gpu/drm/verisilicon/Makefile          |   5 +
 drivers/gpu/drm/verisilicon/vs_bridge.c       | 371 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_bridge.h       |  39 ++
 drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  54 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         | 191 +++++++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |  31 ++
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 +++
 drivers/gpu/drm/verisilicon/vs_dc.c           | 207 ++++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |  38 ++
 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
 drivers/gpu/drm/verisilicon/vs_drm.c          | 182 +++++++++
 drivers/gpu/drm/verisilicon/vs_drm.h          |  28 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 +++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
 drivers/gpu/drm/verisilicon/vs_plane.c        | 124 ++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |  72 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 173 ++++++++
 .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
 31 files changed, 2383 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
 create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h

-- 
2.52.0

