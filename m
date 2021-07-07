Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE5E3BE493
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 10:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAEAE6E05D;
	Wed,  7 Jul 2021 08:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25596E03B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 08:47:53 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 2E47F2B0092F;
 Wed,  7 Jul 2021 04:47:50 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 07 Jul 2021 04:47:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm3; bh=Sap5yEJLvsEs9oIiWGd/FTDixg
 4quuoId3pRV5q786k=; b=UqKrMfatst28bYxuhtcGmC2TMqoAiPYKFeUNN4KlmC
 sM3m4oKxf7ajSA4mcA3CD9yFIf1PgjeGd+XNt9OUUBIqveTF+xCq8JbFQpAl7jKF
 vn641Rg61rp1nHNb2FtsQX54e+dxhjVlRQAvt7wGUftoKa6RNHA2vNqBh4gUMTfV
 wJjhwo/vPBkKuAGz82i0tUWEVa7oKk6iZFBkm5q+RXc8simQxHoXTSpr/pQqW3A5
 BSXIMGFPXupMA4cf7i7k0fu+B3sLpXqocqu2F7DMH6rVY5KNff30QC37cxvpooyd
 AU7oeoUsHwFxTz/c4RxsXeRthJZV7SEjcMlUin4M4+8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Sap5yE
 JLvsEs9oIiWGd/FTDixg4quuoId3pRV5q786k=; b=shOnhYIucuLhFAWO8jKGp6
 CZPCY0gC1UdepUNYNnLf7u9ozd2vuhjny4GqTssAohJ4RJh84tlgZVdkREBn72ju
 +dqPN5h6i31XY+76b3pW53Kq7xiFdlcQ09mW2NJSAOKysjRI8vaY3Iz+jy/XjUBR
 Cznos4gZZA0yggt5KXa+1/jsvUUk8AcF1VhlWZ9KUnnF6v5NsvdaRzjISpkrIOG+
 axcOAjM8T34WC+yb4iNWXqtbib6KMxI4KxqlXw1xjPQiFuG/MdIRWCGTv1FJj3hx
 /5mt4X2IbV8kGAymktvKKAwl3734zI7x6hso6Dz3eUz3jUOl6u0VVhiCEA2M5SlQ
 ==
X-ME-Sender: <xms:M2rlYEByrPOKh1EMNuHNdz1V_dcC8imRLhxpVMN3-uhM3E3ubiHNtg>
 <xme:M2rlYGhBCMo7BtZ3h1olKOMkon20sJpNQg-MYxaFT2d7FY1ASFABeyFWw_yXTz7gR
 VOrM0DSivduN9t0C74>
X-ME-Received: <xmr:M2rlYHmhh-MtwKbUXWyDwSjDvcSYgzgTR-qU6L98g0QSd6oG4Cf5Hos7ZIZSRTnPqp037vdJkxFIjK80iCFNx6hN1XWR5N35GW2N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrtddvgddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteeikefgffekgeekledtheduteetjefgkeeuvefhhfetgedugfektdeugeffgfef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgi
 himhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:M2rlYKziQcoJOS99okRapgMCMPq-NAO6OWzHSneGVcR9Cr99Dk0Tfg>
 <xmx:M2rlYJTPh6qUOUfN9JTgM8Y9PBigZbLBysUN6kb1CTtCh_72I9rS8w>
 <xmx:M2rlYFb2qNUf_2z0AIIPk343OJ3sF60pDnmLCXcn0U1fc0cOOGmx4g>
 <xmx:NWrlYFre2CMS4hqcEJGX-aNR_C_IMk1gsHaha8CDTBqPfS8DzHWmFwi_QSo>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jul 2021 04:47:47 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 00/10] drm/vc4: hdmi: Support the 4k @ 60Hz modes
Date: Wed,  7 Jul 2021 10:47:35 +0200
Message-Id: <20210707084745.1365390-1-maxime@cerno.tech>
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
 Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Emma Anholt <emma@anholt.net>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
Here is a series that enables the higher resolutions on the HDMI0 Controlle=
r=0D
found in the BCM2711 (RPi4).=0D
=0D
In order to work it needs a few adjustments to config.txt, most notably to=
=0D
enable the enable_hdmi_4kp60 option.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
=0D
Changes from v5:=0D
  - Fixed unused variables warning=0D
=0D
Changes from v4:=0D
  - Removed the patches already applied=0D
  - Added various fixes for the issues that have been discovered on the=0D
    downstream tree=0D
=0D
Changes from v3:=0D
  - Rework the encoder retrieval code that was broken on the RPi3 and older=
=0D
  - Fix a scrambling enabling issue on some display=0D
=0D
Changes from v2:=0D
  - Gathered the various tags=0D
  - Added Cc stable when relevant=0D
  - Split out the check to test whether the scrambler is required into=0D
    an helper=0D
  - Fixed a bug where the scrambler state wouldn't be tracked properly=0D
    if it was enabled at boot=0D
=0D
Changes from v1:=0D
  - Dropped the range accessors=0D
  - Drop the mention of force_turbo=0D
  - Reordered the SCRAMBLER_CTL register to match the offset=0D
  - Removed duplicate HDMI_14_MAX_TMDS_CLK define=0D
  - Warn about enable_hdmi_4kp60 only if there's some modes that can't be r=
eached=0D
  - Rework the BVB clock computation=0D
=0D
Maxime Ripard (10):=0D
  drm/vc4: hdmi: Remove the DDC probing for status detection=0D
  drm/vc4: hdmi: Fix HPD GPIO detection=0D
  drm/vc4: Make vc4_crtc_get_encoder public=0D
  drm/vc4: crtc: Add encoder to vc4_crtc_config_pv prototype=0D
  drm/vc4: crtc: Rework the encoder retrieval code (again)=0D
  drm/vc4: crtc: Add some logging=0D
  drm/vc4: Leverage the load tracker on the BCM2711=0D
  drm/vc4: hdmi: Raise the maximum clock rate=0D
  drm/vc4: hdmi: Enable the scrambler on reconnection=0D
  drm/vc4: Increase the core clock based on HVS load=0D
=0D
 drivers/gpu/drm/vc4/vc4_crtc.c    |  60 ++++++++------=0D
 drivers/gpu/drm/vc4/vc4_debugfs.c |   7 +-=0D
 drivers/gpu/drm/vc4/vc4_drv.h     |   9 ++-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |  20 +++--=0D
 drivers/gpu/drm/vc4/vc4_kms.c     | 126 +++++++++++++++++++++++++-----=0D
 drivers/gpu/drm/vc4/vc4_plane.c   |   5 --=0D
 6 files changed, 164 insertions(+), 63 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D
