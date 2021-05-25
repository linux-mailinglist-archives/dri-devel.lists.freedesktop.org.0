Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD838FD80
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7755B6E817;
	Tue, 25 May 2021 09:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26CDB6E053
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 09:11:05 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id 0BFCC9E2;
 Tue, 25 May 2021 05:11:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 25 May 2021 05:11:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm2; bh=ihjrZyupxC2RY6LoFXxJCvJTHQ
 9fJ9jSbr/clQHZS30=; b=pQeXP5AIk15bBOd/X+o0sOjoccxnmHsiH5psfIdsGm
 pDrEzLuifnSZoayrcHu5lzOEVDsOMuh4TqqA/khZ9Tvkyb1oDMTXOPVUp9dMPJ5U
 1agg5ZzwlIrMwDHUZAXzvvszeZQKG4WcenIe5LkZcXy1LhnuTo550TpoHm2JQNtq
 Mv0NM+4ZXwwpA2qDIRVAz711fK2ML3xv7kVZbxN6R3Lq0T4uaz/F4K53WVRNsVGb
 lwUY2FnSbc/AnppofPjVuFIYPx2fUJaojCcSC60hTwQlzqr/pVMzNpRmsOzkVQ0+
 HlxzmUTj22XMzJsq5ZcKetamtwQZBkEU3yIvnpPH8Z6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ihjrZy
 upxC2RY6LoFXxJCvJTHQ9fJ9jSbr/clQHZS30=; b=dsT1bzI4VX4yQaQAdk+pBK
 Ok9iwk7+5gjLjT7b+G6CpeGZ0dj0DNVHb1ef2Jo1CWN+CX2/pRgEv9bSSUAXJ/dS
 Z39fNiTKhZQv6CJWCqMnqNpMIwYmkrpw/4s9cylZFU2hon8HP0bo67GtHe3Ne0wn
 0MzJ+J+7TnQgrSaOYi05cNPgcsry3MjJaRap9Byi/q85gMjYz0iiRqdsFm0t06b4
 gRXMFwBEahGK2Vmji/CzWsdSV7CXdrXfOncQbZXWBaUlEPfStI0rJNHbFS6ZqGBa
 fRUu8gtmpNTG/nQO2hDGjQdbicKtGGjlMeviOTMpun7lah7rS/jt06zxpId/5OCg
 ==
X-ME-Sender: <xms:Jr-sYPdZjgWyHon9VloJrKpIgRm_QBFIYpkH7tf3OQQcjjQS8LfI2Q>
 <xme:Jr-sYFNUGqxyEVbQy8glragT-Ddl5Ypz295XmbKIZvXniaACSrUBtYjDkmGbjY7jb
 A_w5DiERA1sAgQvcZ8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekuddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Jr-sYIjR3JxI7jsowegRLQy-GFbLa3JTOb844xTk575txUUNvyrQoA>
 <xmx:Jr-sYA_TiIwkLzh6DDQU3v-EFQksLMWz7yGeNf-QlS1iyi3lFhBuLQ>
 <xmx:Jr-sYLsb-ZMk8spN6s3UChRxpSQ49WHCqBUq4Q_J4hYqXYPAgor3UA>
 <xmx:J7-sYEMSwSF8-HH0RSmo6SeGrvlSPP5_gpYdPvaoh14aG3Qxu1kS1RJnwlE>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76]) by mail.messagingengine.com (Postfix) with ESMTPA;
 Tue, 25 May 2021 05:11:01 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/3] drm/vc4: Fix for the HDMI detect power state
Date: Tue, 25 May 2021 11:10:56 +0200
Message-Id: <20210525091059.234116-1-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This fixes an issue found during a rework on the RPi3 where we would=0D
end up with the detect callback of the HDMI connector called while the=0D
device would be disabled.=0D
=0D
This unfortunately results in a complete CPU hang on the RaspberryPi.=0D
=0D
The documentation doesn't really provide any expectation on the power=0D
state for various operations that could be performed while the device is=0D
off, so the first patch makes that clear. The next two patches make sure=0D
the device is sufficiently powered for detect to run without any issue.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (3):=0D
  drm: Mention the power state requirement on side-channel operations=0D
  drm/vc4: hdmi: Move the HSM clock enable to runtime_pm=0D
  drm/vc4: hdmi: Make sure the controller is powered in detect=0D
=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c | 45 ++++++++++++++++++++++++++--------=0D
 include/drm/drm_connector.h    |  5 ++++=0D
 include/drm/drm_dp_helper.h    |  4 +++=0D
 include/drm/drm_mipi_dsi.h     |  5 ++++=0D
 4 files changed, 49 insertions(+), 10 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
