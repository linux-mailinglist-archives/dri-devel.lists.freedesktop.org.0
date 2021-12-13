Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C74B4731B0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 17:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88BF10E741;
	Mon, 13 Dec 2021 16:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17D4210E741
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 16:26:38 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 646B75801BD;
 Mon, 13 Dec 2021 11:26:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 13 Dec 2021 11:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=5vdEa6qIK+Pl4PDMRRW/BnIuTi
 qM1tXz1szVmprOufQ=; b=E4Rm6TPv+/gWTMBHDKeQaB+qamWwV91QnxxbT3myib
 ZhhxS6fygzykWcCDIeOivfKGgPuzdze8sLZxZ1TefAIBbUsR1uYz0e7fBZO6dT/f
 wOFc+Xd+hnRyuYovVCwfqQOjkpcTb43iEA+6C6m1drvyMS44L+waIsvzlMaefNqZ
 hcifneCwx//cLOI+QuZK5KvjRMOPakqrled7PwKXcvuqO0zsQ+1O6Mzg51nUZW/6
 8lCG3YamNPeLO1VYpdIveQHU6RV+Z04fYgx1rTnVK2Wwy+riyA5pujGjv1rEvdh2
 paQ6ZoGeXit7UhXaAhYifSrBzPLsg0IuQukEVDyoAn5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5vdEa6
 qIK+Pl4PDMRRW/BnIuTiqM1tXz1szVmprOufQ=; b=dol1zxjFi6MhlAIVTL5YA2
 NqF98qazN5XBkyNHtADyMd+vv/vTuEGIa3WCg0ZJmBDhCJuRKxjeSze7MEeOrstc
 9Up/pGle/FEUk2+DsYI++tAka5ZnxK4qwCRpHcS3G6Zxh6ep7Z0L370QEXQIhQZc
 fLaAdmTu5NljblnbB7Bi5DE9t49xLUZzYpy2QK4aOPqGMSNqF+9Az1ACWvsyKMDY
 zmsjEg/oBWSvz53v0Rm+id7O7qbVNvXR6GloyxtAesTzg1eQOqWUiwChfSG9d9KZ
 Vz8EKOW/seGf0mkO4M6l7SlRn5Y30gvf502BbCIgauHpuAjcPbvn7c2rySN/w/0Q
 ==
X-ME-Sender: <xms:PHS3YYSiVmG_TqPSo-hA7iZZIhEQxUh4m5XR6k64y_Wa6W-tahzrvg>
 <xme:PHS3YVzmi9n7N7auDwfNPRkm1xXsm6JXaa838wcynXunfLOIt6Y-ENC17kRe9Y8xC
 9zviLFK3AMKFOZ7sn4>
X-ME-Received: <xmr:PHS3YV0VuG2b8IODb_4GnOCMrk3D1dhF3C05MqRePvATjg2iVW1ZyIk258grud8-MqbUhoB893aVLHVaoQFTRlvOt_6Qhs42PT1WluYi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrkeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PXS3YcASMre1FYXeWy8hd4FLF2qF90gy2JcEn5ulU4ntrTb8gGW2nw>
 <xmx:PXS3YRhAbgLOMS6tLcztEX6_Lp5dvhnIyal0lccjULlBqwKI3phcVA>
 <xmx:PXS3YYp2jX0Iuva3HmY0-7wOxnOWAmpxkv_o6X3Op0YVnweAXqlDjw>
 <xmx:PXS3YaZgICCfHDAUCHK9u2dMUBNvRw8Y7mnV2kboIMSG_SGOQ-RuQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Dec 2021 11:26:36 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Ray Jui <rjui@broadcom.com>
Subject: [PATCH RESEND v4 v4 0/4] drm/vc4: Use the firmware to stop the
 display pipeline
Date: Mon, 13 Dec 2021 17:26:31 +0100
Message-Id: <20211213162635.252582-1-maxime@cerno.tech>
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
 drivers/gpu/drm/vc4/vc4_drv.c              | 50 ++++++++++++++++++----=0D
 include/soc/bcm2835/raspberrypi-firmware.h |  1 +=0D
 2 files changed, 42 insertions(+), 9 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
