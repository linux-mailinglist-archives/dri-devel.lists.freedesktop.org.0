Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F043B72C1
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jun 2021 14:57:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0921189C83;
	Tue, 29 Jun 2021 12:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF65989C83
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 12:57:43 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 4CF6558042D;
 Tue, 29 Jun 2021 08:57:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Tue, 29 Jun 2021 08:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=ImpdMfm6rY8i7IauUUBmjht3SN
 FjYJewqKyRyx5rljc=; b=ikvRPDe+ErZPg9bHLBrJwdOtmZfM/5bXV1j1I4nDT2
 Gaece65IN0fN4kcBuqgRl9qKXj+qTx84aMhwFJmV2F/65yJu4xau+dMA7bPPEgYB
 lQ2ZCF9TfdBLVawVQoGWM65k/1QLpWyWT3srhzTpzZA83e/HDFN/wq3e9uBgAqvB
 qirtHyIpLZlh1zoHEpNQ6vpOyKolFtkp9RSm1IqvyiHwMDe2TOQOf6flQYm3Yymy
 WFTUSJ9r4m7kDbY7O8AKhxrw5KPCqmqOjI2h0aRvxALDJdjzjIt0+yOIReV5Xw+q
 XbzEKVZAu9iI44x8hu4a4Ceo//3etcVMBNFlp8R4Ag4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ImpdMf
 m6rY8i7IauUUBmjht3SNFjYJewqKyRyx5rljc=; b=f1TqrvFTK7YAPaCpRBeOLE
 CGp723eZkkH1dki4pGC5NUrJjwcfynXNIql94nuWIsBXvjti9BQV2WiO3dFxuG0i
 baKYDG7yOasaPGyRM/JhMyxcIeA+MV9QI3jk7XW0znWWfW/ONePyWUwYiEaeD63B
 EqGYQwh2TWChd4cqCIbw1jBzIQaWSWT+ABiWUz24CD53KVzMn8znix95bbQd93LV
 eXrXHYtL1oS3FMmnTjAvYIwfQB5AS/3eGVFPDkqubcP/HaAUbPZ4rFaLh66H0sQE
 f9XbEcaJqKAAMSx6pwHeAiZl6x2sZaGY03/zs7UmOz22JmT9uIQg46KHSc3COv7A
 ==
X-ME-Sender: <xms:wxjbYF0H9Nk8yngRH3DCb9dduf0PdS6kwoo-AfQ-7KJNxBX9N9dkvQ>
 <xme:wxjbYMHMNsPLEdJeOsG33Jb7AQ2Xb-rVh9kXGV1Z2Rik3_1TUdcyIV3wRU8I6OiXi
 lyxtCXKwfGQUFVKqzE>
X-ME-Received: <xmr:wxjbYF7slnF-f56UcNNNTi-ydDQHdCRuUmifaujBHBaKv5CpLvn1zneJcue-5m_WnpzJCPphqXVWn-aatZmZkWjk36Y2rxQwQtRR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeeitddgvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wxjbYC2EKqWW6yf7IUbmvgImBUBXpCHCam338-7u6N1HPaYw9Lq3wQ>
 <xmx:wxjbYIF5mqHltSKZzvOsbSG0rPCGjG561KtlhNxUqtDBDCUlilPOgw>
 <xmx:wxjbYD8-wvk0yRalLKJrqGSAFTLChoMyt4Bq3PzmTNmdrGx5bIEvXQ>
 <xmx:xRjbYGV5oi9e1X88EJkfoUfRKRbfTQTkpkVEJEEz5DfYF30wz12_-A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jun 2021 08:57:38 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/4] drm/vc4: hdmi: Fix CEC access while disabled
Date: Tue, 29 Jun 2021 14:57:32 +0200
Message-Id: <20210629125736.414467-1-maxime@cerno.tech>
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
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Tim Gover <tim.gover@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
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
Maxime Ripard (4):=0D
  drm/vc4: hdmi: Mark the device as active if running=0D
  drm/vc4: hdmi: Put the device on error in pre_crtc_configure=0D
  drm/vc4: hdmi: Split the CEC disable / enable functions in two=0D
  drm/vc4: hdmi: Make sure the device is powered with CEC=0D
=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c | 85 ++++++++++++++++++++++------------=0D
 1 file changed, 55 insertions(+), 30 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
