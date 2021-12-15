Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9AF475575
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:51:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 504D310E251;
	Wed, 15 Dec 2021 09:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B8110E255
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:51:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id C64435801D3;
 Wed, 15 Dec 2021 04:51:19 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 15 Dec 2021 04:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=LoABpmPSCAnztFtCTgeHnKeUKn
 dp7F1ja6+WusHM+uI=; b=GRct1MA7qksaPNnl8yeAofhKQIT49KaQfTB440let0
 f5sBuXZiS6rCOTFwlURtjwfxcVpXGw3dUFWB0uUQK/qvWuZ8htZR7jnHHWTSBmar
 uOlGk+ChmPxAYO65i8w2hbtIcR7ldFvyvEq1puVtPhS+heSc1I9abhethLLmtAbr
 A21zDgctBgzdgMmyyOP7ENOND3nZmfQI3bBlIKh/Tt0zU+lv9GwT85knDlTLPu8d
 +5pFjyEQ4ZWx8orJpk6DtkjrWbIOWFovv4VovYh1D2+Qe9qSi1qpJ3jqWcmNrUag
 sJojmaaJY/kxLkJ6IfEqTCO8b0nNf6oLAaK4FBEtXRmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=LoABpm
 PSCAnztFtCTgeHnKeUKndp7F1ja6+WusHM+uI=; b=D9T/mdgD5R/+e7RBwM9Wv8
 ZIo/oxqps8gW2DtXpTUCYycxXlvJfaxj9rOlfEt2pGh2GXQ+1ONSJvsVq2Nc77G9
 BIkEWnE5bM6mKa49/Ez2Jvw5hUZWVOpSp0qGM5kcIN5iiGjJSMFmLNPNx8i5s9a2
 vUBjQ7qLbeD8JDhdl2tzuA8hwJgXholq28qv1ld8uzF73+FIux/pR1KI+pmyK50n
 /8DuKmTBP7vCV42DAQP7OVHDDk0qxS41vhgozPHFl2zNKLfiNGiXHzac+Jp+zyJJ
 /+4E5KsEYJoyBpn0pd9+1z+a5kZulemxSUj1gpsPpa/QCtyWSfj8c4hk0pvNUDCQ
 ==
X-ME-Sender: <xms:l7q5YXk-RJL2ErwWEEGXqZLyCQK38vV5VyPLCWHpyFohLqRrxYVzfA>
 <xme:l7q5Ya1rsWRsgEVM6NonTm7lHlZtgV8LSe7hQryMyGSjh741vWeM87kvomMXzrGuC
 5Tk2QqXAVEzWRSCNlA>
X-ME-Received: <xmr:l7q5YdqeJIdiC1YNrjZ5WEvP8TpOKVm39uN_FwqvVM9AeedqNlZd-Sz7HNFvlrHSjMjLYyRjikt9kEkluwnLoPbsVvOrDwDqgwZqKlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:l7q5YfnqKjO6XBJgVlklFNZxOqUCMwfd4g7-QhCf16IBqxwGkOQz-g>
 <xmx:l7q5YV2GMSDNK3yIMQ-htewAIkCjVGPTG6qzHBOLJ7oYQCUWRhQUig>
 <xmx:l7q5YetfcDiB8exgyZRrof5un1FXVMqTCyjeOGyM2fzShK33G4a_xw>
 <xmx:l7q5YcuN_CN6nvtAitHuOQUtEwhaL_SpjhWsvywrQ3YnQpw6t31XPw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 04:51:18 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH RESEND v4 v5 0/4] drm/vc4: Use the firmware to stop the
 display pipeline
Date: Wed, 15 Dec 2021 10:51:13 +0100
Message-Id: <20211215095117.176435-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Dom Cobley <dom@raspberrypi.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
The VC4 driver has had limited support to disable the HDMI controllers and=
=0D
pixelvalves at boot if the firmware has enabled them.=0D
=0D
However, this proved to be limited, and a bit unreliable so a new firmware=
=0D
command has been introduced some time ago to make it free all its resources=
 and=0D
disable any display output it might have enabled.=0D
=0D
This series takes advantage of that command to call it once the transition =
from=0D
simplefb to the KMS driver has been done.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
=0D
Changes from v4:=0D
  - Don't register v3d with nomodeset=0D
=0D
Changes from v3:=0D
  - Support nomodeset=0D
=0D
Changes from v2:=0D
  - Switch back to rpi_firmware_get / rpi_firmware_put=0D
  - Moved the rpi_firmware pointer to a local variable=0D
=0D
Changes from v1:=0D
  - Use of_find_compatible_node instead of a phandle=0D
  - Use devm_rpi_firmware_get=0D
=0D
Maxime Ripard (4):=0D
  firmware: raspberrypi: Add RPI_FIRMWARE_NOTIFY_DISPLAY_DONE=0D
  drm/vc4: Support nomodeset=0D
  drm/vc4: Remove conflicting framebuffers before callind bind_all=0D
  drm/vc4: Notify the firmware when DRM is in charge=0D
=0D
 drivers/gpu/drm/vc4/vc4_drv.c              | 33 +++++++++++++++++++---=0D
 include/soc/bcm2835/raspberrypi-firmware.h |  1 +=0D
 2 files changed, 30 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
