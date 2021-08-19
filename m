Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8293F1B0A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D1C6E984;
	Thu, 19 Aug 2021 13:59:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51AEF6E97D
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:59:39 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailnew.west.internal (Postfix) with ESMTP id B02042B00560;
 Thu, 19 Aug 2021 09:59:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 19 Aug 2021 09:59:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=WeOGVBQq6iP3tN4+YB3IfpyTJF
 tv7MLMNgGBh0iNUrw=; b=2aaGpTxizbAsJxle2NCopSZUjW+t1R2tPQCX90UHPR
 rBjqdauhnciKv/4v+Zmo6nOdzMbklGXT2jcPecH6CtYFwDdIqZ2zSbPkvnSh2mXx
 EjxMPwgb4CL+x0oKyT2MLW/xi8SsIgP/5vwiOhUR+m+c1mpYXQqBHVojs5YuhQLU
 hLXfrNbdHLweFt5XVnX6TqUjeC6GBnH5OS7Ux6+vCXsteR6cBX1g7aNafV1LQkQR
 +nF1bDiU9jjnwEVNkwa2+bVUfp66w4PlhrVvY4dU8CAywe2UKw5c2byQT+gsIEkM
 ZWNDK+Bld35jtahu8j064ducf9N3kaMIuQyR2OmfjoFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=WeOGVB
 Qq6iP3tN4+YB3IfpyTJFtv7MLMNgGBh0iNUrw=; b=uhONl4JUuuJyWSnpApX8Z1
 e+KlGicaDkseEJgB+OmMlz3SK32+qAJPcuyYlDg05lmhaEws52kMQMiaBSXnt4bI
 xy9ZrkEryvi6YHDb1LB2JRkXlfz9QOZWUI2a0h+VbUIo6AnHEZKFvc5EIXaagBeP
 mQqZhGRIZ6bfV7S9RTOjD3IPAAAjWV/RTYDSO3NnuFpHiTwjyb/jn0l+aNLdeOlf
 zW2wfHAYREaN645rZCdiIVziu7glIpGgOs7854+hGxXDvRNV0MFGvzCyWSYMJTKw
 R6maZPTJAnnlTdibmZ3S76qAYCEzW/2KKh2VL1BROxdytAGEfh5gEGxa1Njdlz5Q
 ==
X-ME-Sender: <xms:xmMeYcPxEncFTcB-koGBpFyEPh32q085TM3GdiNVI-3JrQQpIKdMdw>
 <xme:xmMeYS8-APonkvuSoOkpy60lMiyupX0nAVYA6tgnrGmz9ctliW_YMQfeqzL1L2x0m
 AGIeoLy6nWtqh480y8>
X-ME-Received: <xmr:xmMeYTQMrbZXK3zxISIUDg9AVHHHbRWWMUV2pJrn6F-otDytvdoBuYFdJyqy-hUeUbPKFdSmdI7TDzzWAe-b-6FxH_ariIF5DL1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeilecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xmMeYUtWeN0VzAx6dUlsehNylv0K3HMtAqG1mcNBOkqxFyvH7fzbJQ>
 <xmx:xmMeYUfkKz3oQqfEjB21JovPMfdBLk_UHx5MFbQ1aOqNeugE6jT2AQ>
 <xmx:xmMeYY2YIv_fDGOnmzAAkFV_XNMbR0TxXTINLEs_zR0A-wqLlhXGRg>
 <xmx:yWMeYXvPsiz5xUTFF_SW32g8GWJsUqHz-BpXGDg_rpTGS9sC6CNd5vtzruk>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:59:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-rpi-kernel@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 bcm-kernel-feedback-list@broadcom.com, Emma Anholt <emma@anholt.net>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 0/6] drm/vc4: hdmi: Fix CEC access while disabled
Date: Thu, 19 Aug 2021 15:59:25 +0200
Message-Id: <20210819135931.895976-1-maxime@cerno.tech>
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
Changes from v2:=0D
  - Rebased on top of drm-misc-fixes=0D
  - Fixed a build error=0D
=0D
Changes from v1:=0D
  - More fixes=0D
  - Added a big warning if we try to access a register while the device is=
=0D
    disabled.=0D
  - Fixed the pre_crtc_configure error path=0D
=0D
Maxime Ripard (6):=0D
  drm/vc4: select PM=0D
  drm/vc4: hdmi: Make sure the controller is powered up during bind=0D
  drm/vc4: hdmi: Rework the pre_crtc_configure error handling=0D
  drm/vc4: hdmi: Split the CEC disable / enable functions in two=0D
  drm/vc4: hdmi: Make sure the device is powered with CEC=0D
  drm/vc4: hdmi: Warn if we access the controller while disabled=0D
=0D
 drivers/gpu/drm/vc4/Kconfig         |   1 +=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 125 ++++++++++++++++++----------=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 ++=0D
 3 files changed, 90 insertions(+), 42 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
