Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA93BE580
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 11:23:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B8C6E044;
	Wed,  7 Jul 2021 09:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0316E044
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 09:23:03 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 366202B0091B;
 Wed,  7 Jul 2021 05:23:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 07 Jul 2021 05:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=pcBDIxfNeTOeQ2pKpHMkyzsSuV
 YDhmiWY34Ct3Y7dW8=; b=yBKUDRbhInBU5zSDK/Hj/4XzjZDjO/xs98eALWwt7Q
 q+qkB7TV6zY0Fit59EmdoKPu0d1Fxp5SZU6XqvKjXTrZ8XmcCY8VBaKgkMmtLeIc
 YL1sTstMQDtF7xCKytexJGsyiQV3o+vd/DsJcteyYZ/jjpFqH1XUsdwx9SY/2Sk1
 9AMdyp2B/7k7jCKFOAJf1EZkInBYu3vzW1yMahrbUCOodSXvAFWT6J4sCvrzQm4e
 0tu0w6zbdb7Huj0pttP3Lmw52LGpmUa2UZHXNXFr4+ucsiZK7N3guI5i9e1Fp0dn
 pazn3TFWhQtcXOuynFS37blWN3LMQFrvmZUu+2Mn/JlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pcBDIx
 fNeTOeQ2pKpHMkyzsSuVYDhmiWY34Ct3Y7dW8=; b=WD5pzdRJifPibr3xXhI/5B
 K6H3f1rzVwc8K+XTjeVS4XoQqXk0SbtwgrH3qPYOYHLqoBnDjxFL+KH0NFEMUvi/
 nbps6/kdyRBiaQTtJKx5Pj9Js7PHmgWtFcIntkIhw/t9/QwLaPgVMaBTVD8w1Sgm
 S0lOqvSuKnD5ZCG45YxFgqxwoAlMMpdqs3k9MTDhwdUc+i3kcSYQKrMMVGwNX+gP
 Zri4s04QzLF4rKe9OGzWSqQTcgi0XADZ/L8l3DpEUVM4mrZ3hx+C+CaKZ8c07pIo
 Up4hBp/BLiwOjUJrHDl/AQaLBbZ799SSdBxVWoEIkOnBRE+UVTVzqzvHBkipRjTw
 ==
X-ME-Sender: <xms:dHLlYAlMDAgMgkSCJkmbq_IHcaNjSPZ3aSrOm9vEjfCfLlfXUHwRPA>
 <xme:dHLlYP2RzqdDiowWFp0exNH-5yK6arF5d5I0E-F41xptYZxhwvm-H3tBnFVcSe4lg
 w9qFC1gm1LzSPbM_sk>
X-ME-Received: <xmr:dHLlYOrOufyV-iSK4uLnDZZBtlc9YurwaqM5q6a0BJ0dv8hQBYfJ5W4RJ8hZVW3fG6MNPTmjDBhgltwT0iOXcy3v25BHxNvUP1oL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddugecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:dHLlYMnBnnsJXfiVE0FTO8LJ-Il648wGG1l7eRpk2j6KdexfUZ4F_g>
 <xmx:dHLlYO3cQnSdOs8lRiMZ44BnAM4euki8uvuI_ngrSTdiJPYs7Wve-A>
 <xmx:dHLlYDubV0T_rfj6h7l21rZDZnz-WFHJ_RjixASdwhHeMMEF9ZHuSg>
 <xmx:dXLlYHG83B3DuPuvD7NujyS2A5bYc2QiNrtrCS3lbWikLSpm2jABkUmlBKo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 05:22:59 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 0/5] drm/vc4: hdmi: Fix CEC access while disabled
Date: Wed,  7 Jul 2021 11:22:52 +0200
Message-Id: <20210707092257.1465109-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>, Emma Anholt <emma@anholt.net>,
 Tim Gover <tim.gover@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This series aims at fixing a complete and silent hang when one tries to use=
 CEC=0D
while the display output is off.=0D
=0D
This can be tested with:=0D
=0D
echo off > /sys/class/drm/card0-HDMI-A-1/status=0D
cec-ctl --tuner -p 1.0.0.0=0D
cec-compliance=0D
=0D
This series addresses it by making sure the HDMI controller is powered up a=
s=0D
soon as the CEC device is opened by the userspace.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - More fixes=0D
  - Added a big warning if we try to access a register while the device is=
=0D
    disabled.=0D
  - Fixed the pre_crtc_configure error path=0D
=0D
Maxime Ripard (5):=0D
  drm/vc4: hdmi: Make sure the controller is powered up during bind=0D
  drm/vc4: hdmi: Rework the pre_crtc_configure error handling=0D
  drm/vc4: hdmi: Split the CEC disable / enable functions in two=0D
  drm/vc4: hdmi: Make sure the device is powered with CEC=0D
  drm/vc4: hdmi: Warn if we access the controller while disabled=0D
=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 123 +++++++++++++++++++---------=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 ++=0D
 2 files changed, 89 insertions(+), 40 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
