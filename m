Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD9439835
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8627689F6D;
	Mon, 25 Oct 2021 14:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E7489F6D
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:11:21 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 2058A5805BE;
 Mon, 25 Oct 2021 10:11:18 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 10:11:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=cMhkYINLhu0Ap8PJdv82XWAOET
 u7iFWiVqmdE4356xk=; b=XChsQeVmioaPf2VO+vejq1+Gdc0WNbdJlUk/Kf1eWz
 JqzJWokDasWrsMSvG91rqsoZX2qa430HpkrundgrrQkrMwyG0YZ/qRaeVn8n/ReM
 DoztJPJKWqfLSiG4iCx2beRoke4FxWGTgpDQGSOft4CALPxsrquFNRjBAVKwhrMP
 qku5pkrr7q/RJzGmOwoA/jdmY1f2l6SLUaodn4uaJLObEH4Y6Jw8LslLR0WYAmd+
 U4YRU1/7MNkXbujhucj4TVA90lImaG1MT2zjKExRmNMMyt2kgg8zCnl4BKDuyQ0Z
 5ytD3eTbnoQ3ih90VG2A3PiPt2VTxTZEVyb7ZDQyXGlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=cMhkYI
 NLhu0Ap8PJdv82XWAOETu7iFWiVqmdE4356xk=; b=UiePHApIZJorB16rD1K8fb
 sdgjG12rxSxNbgB9JWVnALBqmy3O6jOxcyl/yHf4pj28Z2+pAIFRF+fFeu20UO+C
 NQa+++MHAYkja8Xx8CpyszjDMyRSe5wpIfqu/lvl/iLyGpbN9pVroI1oNmn6xeyS
 epyLMbLUEuBzzCMY+d/+Cs/D/kosdopwSloJvKhdO73fHIjwhVP1u/1xSt1v20Ss
 ZE5NTt22ziLA5GMd5O8loRVc02593GdyQc2LAXq9T8K3vIvvN93Il3fn9OEs5wfC
 rEf/sxtuIGjuzSU531/BdOG9RYcrr82s95prx9Man5vkVDsg1IeWzCrKdYZmNuxA
 ==
X-ME-Sender: <xms:BLt2YdAUi51d_7BdoTrLIPw5gi-thkR0XcMp1ysw0d3FvPOGDckxFA>
 <xme:BLt2YbjYoOAx_VRshLqz95wVtx7WsM3NrOtYsZd951kl6IN6Dp2nDeXbi9D0WtwLz
 4X4UtOsuODIeL9xaLo>
X-ME-Received: <xmr:BLt2YYnuMXhVALkGXxGOTtn1WxaNiXJaoDCnmlk968zXJpecxwvYbAD4wuSaGyOuOkLznNzQiW1veTCL2p7MBwM_si8sEQEF8A4v1T7i>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgjeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetteeltddujefhffdtuefgudffleelleehjeeggeffuddvvdfgvdfhhfelgfet
 ffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:BLt2YXwSwQIVG7dOcJym0OKS1fDfMXjQyslyq1hj4deYJfoPPOx2Qw>
 <xmx:BLt2YSQLZHEPKLAHXCluKLE0RJNXpySuAcV7EsEAMjjqZqpI7cSCOg>
 <xmx:BLt2YaaysSf1rxhydTjC4MEtcrC4opOtV7EiX18My8vCVW0yD6OoNA>
 <xmx:Brt2YT_KbzKhRdB3hYHPuA0BXDZucabd9wPllVOrC-4acEO81nolBQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:11:16 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 0/9] drm/vc4: Introduce locking and remove !KMS state access
Date: Mon, 25 Oct 2021 16:11:04 +0200
Message-Id: <20211025141113.702757-1-maxime@cerno.tech>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This is a follow-up of the series here:=0D
https://lore.kernel.org/all/20210924135530.1036564-1-maxime@cerno.tech/=0D
=0D
and the discussion that occured here:=0D
https://lore.kernel.org/all/YWgteNaNeaS9uWDe@phenom.ffwll.local/=0D
=0D
The original series aimed at getting rid of the encoder->crtc pointer usage=
 in=0D
the vc4 HDMI driver, some regression was noticed and the following discussi=
on=0D
pointed out that we were doing a fair number of KMS state access outside of=
 the=0D
mode set path, which is disallowed and unsafe.=0D
=0D
We already have a bug that was a result of that access which is fixed in th=
e=0D
second patch, but other instabilities might have occured without being=0D
reported.=0D
=0D
That series thus removes all those accesses, and add some locking in the=0D
process.=0D
=0D
Sudip, since that series changed very significantly since you last tested i=
t,=0D
could you give it a test run on the Codethink farm?=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (9):=0D
  drm/vc4: crtc: Drop feed_txp from state=0D
  drm/vc4: Fix non-blocking commit getting stuck forever=0D
  drm/vc4: crtc: Copy assigned channel to the CRTC=0D
  drm/vc4: hdmi: Add a spinlock to protect register access=0D
  drm/vc4: hdmi: Use a mutex to prevent concurrent framework access=0D
  drm/vc4: hdmi: Prevent access to crtc->state outside of KMS=0D
  drm/vc4: hdmi: Check the device state in prepare()=0D
  drm/vc4: hdmi: Introduce an output_enabled flag=0D
  drm/vc4: hdmi: Introduce a scdc_enabled flag=0D
=0D
 drivers/gpu/drm/vc4/vc4_crtc.c      |  12 +-=0D
 drivers/gpu/drm/vc4/vc4_drv.h       |  29 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 415 +++++++++++++++++++++++++---=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  37 +++=0D
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |  37 +++=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   2 +=0D
 drivers/gpu/drm/vc4/vc4_hvs.c       |  26 +-=0D
 drivers/gpu/drm/vc4/vc4_kms.c       |   3 +-=0D
 drivers/gpu/drm/vc4/vc4_txp.c       |   4 +-=0D
 9 files changed, 509 insertions(+), 56 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
