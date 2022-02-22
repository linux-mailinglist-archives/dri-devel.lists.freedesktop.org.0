Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C44BFF03
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:41:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438A10E853;
	Tue, 22 Feb 2022 16:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C762810E850
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 16:40:51 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id AF1645803BC;
 Tue, 22 Feb 2022 11:40:47 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 22 Feb 2022 11:40:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=Tn+rubXQBMuKzzKmJmt0Hp7xxWqoqR00+5kGTA
 Cp+xI=; b=SAZ0xQIb8d7PXZfmBtUSSWCdRMzL8jm6xM2wY4DM8oWlZq4YUbIulr
 b7bj2TocaHEH0sQqyDLEJwh5Q4PQKH8ETeZtGEx2myUy23+sWBAIdpr21UvPfccq
 w6h0DjLySSLPrcwqvagWMiDxFR6FDIJ+5ZaoJl5z9Yo4sMfXA/PMgbYo6q9alBLJ
 zzInqIgBkzOA5wZkXexBrjBu0Yl73J4Bi9n1R8pc26xOm5naSDu8Wx8cWlU2GBGU
 UBYKJ8zJAPY5TVzRD98vKUVfID4uQOX+bw4iWA4U3Mgq14sqOGQMKJXHKXNf+/eg
 Jj+UT1ng8jkOO47JT6aGMlB95dy0JoGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=Tn+rub
 XQBMuKzzKmJmt0Hp7xxWqoqR00+5kGTACp+xI=; b=cNttFD7AbBXkaf9KSUKkp3
 lP3bXWRbxzx+COyHBrJmghYVrWxY9Bkhi4eKQ2yR8xe+V5zAqs0uoo4CYbWSP/dX
 n/eOkw3aeY6CAaOXCRCKp3fKtBMPnYGac7hkeDk1hGMncqpPZZYxQTDtk4PM1GgO
 Tif98odsNU4gcqlEFqA3SdIS4IJIxYzkjolmT+8932xVab/2ZLtcyDI3MbazaY9N
 NSNXTKmzps8G51zhH2CrQQNak3bTwI8K/wDqP9DRSOG4Y1sjy3KlJff79EZYQsZ5
 UJvaWOGymV3XN3yEO8kJT9ABFRhuqB3HaS5rJT0xtLvgYfvMp16Unu4aldStyBrg
 ==
X-ME-Sender: <xms:DhIVYp2TxHLQgieJW6qXQ76TDjdFxFFySNjFBIobTEWE8haNNPnV9w>
 <xme:DhIVYgEEBP0n-FRkCs3sV3zdmUAy6UKzd32dlLRwT-hMn_12iXQawoK3MxFHIlTrk
 QQzl0xV--_Kj4M4vPc>
X-ME-Received: <xmr:DhIVYp7ymtz_M0n44u650yKosFuomGwCiFa59wbiTSu9MdCgnzUrv5CpZUorsLABTfSXNvug-EdzOJuWUzTqiBnNbsQ52DevPP-jSLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeekgdeklecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeevudekjeetieduffduheeiveelieevfeffhfehhfejuddvjeefheejhedtuedv
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DhIVYm2tfhZJ36bNUsYSTHAp4srFN_2erJsjGmAFTgjdrb4Rmzjffw>
 <xmx:DhIVYsGJfwbD8jbxp4jdhMIH816CP-yQ6AQv8sHkiGpZDK5DP5hijQ>
 <xmx:DhIVYn-p4zZGM3RFCYS6V7hkazkHD9QiBPgJTD8GVUeJ6JWkIiXSCQ>
 <xmx:DxIVYk8OUAFZdFlSwo4Y4k7jua2VgMJnaX_cHRihD-3eIxUs5hwBjw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Feb 2022 11:40:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v6 0/7] drm/vc4: hdmi: Yet Another Approach to HDMI YUV output
Date: Tue, 22 Feb 2022 17:40:35 +0100
Message-Id: <20220222164042.403112-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Werner Sembach <wse@tuxedocomputers.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,=0D
=0D
This is another attempt at supporting the HDMI YUV output in the vc4 HDMI=0D
driver.=0D
=0D
This is a follow-up of=0D
https://lore.kernel.org/dri-devel/20210317154352.732095-1-maxime@cerno.tech=
/=0D
=0D
And the discussions that occured recently on the mailing lists and IRC abou=
t=0D
this.=0D
=0D
The series mentioned above had multiple issues, the main one being that it =
was=0D
a bit too much complicated for what we wanted to achieve. This series is ta=
king=0D
a much simpler approach with an ad-hoc solution.=0D
=0D
I think some parts of it could still be moved to KMS helpers (notably, the=
=0D
output format enum, and the helper to set the infoframe for it) and structu=
res=0D
(the output format stored in drm_connector_state). This would also interact=
=0D
nicely with the work done here:=0D
=0D
https://lore.kernel.org/dri-devel/20211118103814.524670-1-maxime@cerno.tech=
/=0D
=0D
This can come as a second step though.=0D
=0D
The other issues with the first attempt was that nothing was reported to=0D
userspace about the decision we made about the format, and that this decisi=
on=0D
was essentially policy, without any way for the userspace to influence it.=
=0D
=0D
Those two points however are being worked on by Werner in a cross-driver=0D
effort:=0D
=0D
https://lore.kernel.org/dri-devel/e452775c-5b95-bbfd-e818-f1480f556336@tuxe=
docomputers.com/=0D
=0D
Since it's a KMS decision, I don't think we should hold off any driver as l=
ong=0D
as it's consistent with what the other drivers are doing.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
---=0D
=0D
Changes from v5:=0D
  - Renamed pixel_rate to tmds_char_rate=0D
  - used do_div when necessary=0D
  - Used limited range YUV matrixes=0D
  - Rebased on current drm-misc-next=0D
=0D
Changes from v4:=0D
  - Fix a clock calculation=0D
  - Rebased on latest drm-misc-next tag=0D
=0D
Changes from v3:=0D
  - Rebased on latest next=0D
  - Fixed build error=0D
=0D
Changes from v2:=0D
  - Rename the output format enum=0D
  - Split the edid_hdmi_dc_modes in two for RGB444 and YUV444=0D
  - Remove color_formats modifications from _parse_deep_color entirely=0D
  - Fixed comment formatting=0D
  - Fixed mode_valid that would always return true=0D
  - Fixed max_tmds_clock handling=0D
=0D
Changes from v1:=0D
  - Fixed an EDID parsing error for YUV422=0D
  - Fixed the scrambling setup when using a bpc > 8=0D
  - Added some logging=0D
  - Fixed some build-bot warnings=0D
  - Fixed a number of HDMI specifications and EDID issues=0D
  - Try to max out the bpc every time=0D
=0D
Maxime Ripard (7):=0D
  drm/vc4: hdmi: Rename pixel_rate variable=0D
  drm/vc4: hdmi: Move clock validation to its own function=0D
  drm/vc4: hdmi: Move clock calculation into its own function=0D
  drm/vc4: hdmi: Take the sink maximum TMDS clock into account=0D
  drm/vc4: hdmi: Take bpp into account for the scrambler=0D
  drm/vc4: hdmi: Always try to have the highest bpc=0D
  drm/vc4: hdmi: Support HDMI YUV output=0D
=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 429 +++++++++++++++++++++++++---=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  23 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi_phy.c  |   2 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 +=0D
 drivers/gpu/drm/vc4/vc4_regs.h      |  16 ++=0D
 5 files changed, 427 insertions(+), 49 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
