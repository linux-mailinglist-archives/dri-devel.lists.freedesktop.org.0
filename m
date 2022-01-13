Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EF348D969
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 15:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C64110E18A;
	Thu, 13 Jan 2022 14:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642D010E18A
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 14:07:28 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id B34715807F5;
 Thu, 13 Jan 2022 09:07:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 13 Jan 2022 09:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=GmPJ7tQA5ojNXm8uBcLgzGRP89
 ZMcV8QV2d3EOeFzek=; b=V9rU5o/KpBq0mSx7An4efky2JoZ2csGhLPnuvffgcv
 SHbK7WchbSZwZV9GHZZYZrukgd9GuN/04DCuVAphNKXhdZtUb1AaElrzOEo8T3Bp
 ipKBKi28sYQogIjEI4KVeZ6NwqX5A85f5iMzlf+8QfXzrOnjKoIftybKa0Mg0bp0
 3MfNNwnBODQxfrGOvcx4Vy17pvKTnSowCrq3RWz8Kl96vtugwBL+tIGsOXeV7x1m
 ML88UBMDPTzuibq0XruDoBF2o3Jk9lLi7DIVrPmDhdStC2D7ZiInd3zjl3oWK2Ms
 cHTV+D2xi7QZnKeqZFXpSB007kGYVenldKr5KgqMxetw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GmPJ7t
 QA5ojNXm8uBcLgzGRP89ZMcV8QV2d3EOeFzek=; b=G0Xc9fYE3je6erLiljUnEQ
 BKfeGsOVJbjD2RoB7nPU4YFdJhlfjAIcuajA8yWRXy34npQGxyV83+KAcElJzSl0
 Jn8g0rfYpoFamVHbbneXW3yzGb7BuzKnkeawjPen6br7cR5QxT6hUlbQLYAQ4nuy
 LUn7spKaLadNbPVAho9KPsTOz7zdIVt0asI//y8oP1gi0LKO60yfQhSiHNSXZahQ
 0TDG5MpQmErT4Z6BKUc/7MLgu6lUMbCvRCL8zgerhv4qR+EHYC1RSNoX5GKJovUH
 9Z77PPftAId1m3TGhtsY9xsqGXvx2Xa2Cq9xr8Fbg00cYsRfw3YyY1Lpbd30irdA
 ==
X-ME-Sender: <xms:HDLgYc9MK3nHJHhb8io2zl3dKmMHmzhJA4UjbfLzrrd8CLv5BrQWcQ>
 <xme:HDLgYUvKOxf8VOJaJZE_h-FjqMRH3qYhltLhEJpaGTAmDnSJZcrIeE7AQkQXZCw5X
 CePsAEkZKkrSNALvO8>
X-ME-Received: <xmr:HDLgYSDcuBqw-EHR9pywb-Wf6lLXE6BucqAaUMJLQsxByBBiSN62kBKkoC9HsJLl20IFMz7TPKLeBAFpcwInshu4F8PZsZV6WanncGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdefgdehlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeevudekjeetieduffduheeiveelieevfeffhfehhfejuddvjeefheejhedtuedv
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HDLgYcfl3Wg52wyBrp9yzZSwENDHXOwvYsjs-NOiPiwSvCt_CVYcIA>
 <xmx:HDLgYRNko6T1y56LT71mBxwuhN3R50c9WbjbUCG8xLZsJFJhU4BZBA>
 <xmx:HDLgYWlK5SHPVGjMlY6Tv6ehElypcAOle0nu3et5P1PakLnFVptl4w>
 <xmx:HTLgYSEhRx1tM0K0bb3VhLHiynk5N4Vz-vtGMFLzUvzxvkBWE-Vc6Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Jan 2022 09:07:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 00/16] drm/vc4: hdmi: Yet Another Approach to HDMI YUV
 output
Date: Thu, 13 Jan 2022 15:07:04 +0100
Message-Id: <20220113140720.1678907-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Maxime Ripard (16):=0D
  drm/edid: Rename drm_hdmi_avi_infoframe_colorspace to _colorimetry=0D
  drm/edid: Don't clear formats if using deep color=0D
  drm/edid: Split deep color modes between RGB and YUV444=0D
  drm/connector: Fix typo in output format=0D
  drm/vc4: hdmi: Add full range RGB helper=0D
  drm/vc4: hdmi: Use full range helper in csc functions=0D
  drm/vc4: hdmi: Move XBAR setup to csc_setup=0D
  drm/vc4: hdmi: Replace CSC_CTL hardcoded value by defines=0D
  drm/vc4: hdmi: Define colorspace matrices=0D
  drm/vc4: hdmi: Change CSC callback prototype=0D
  drm/vc4: hdmi: Move clock validation to its own function=0D
  drm/vc4: hdmi: Move clock calculation into its own function=0D
  drm/vc4: hdmi: Take the sink maximum TMDS clock into account=0D
  drm/vc4: hdmi: Take bpp into account for the scrambler=0D
  drm/vc4: hdmi: Always try to have the highest bpc=0D
  drm/vc4: hdmi: Support HDMI YUV output=0D
=0D
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |   2 +-=0D
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-=0D
 .../arm/display/komeda/d71/d71_component.c    |  12 +-=0D
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c  |   2 +-=0D
 .../drm/bridge/analogix/analogix_dp_core.c    |   4 +-=0D
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  18 +-=0D
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  16 +-=0D
 drivers/gpu/drm/drm_edid.c                    |  39 +-=0D
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   6 +-=0D
 drivers/gpu/drm/i915/display/intel_lspcon.c   |   2 +-=0D
 drivers/gpu/drm/radeon/radeon_connectors.c    |   2 +-=0D
 .../gpu/drm/rockchip/analogix_dp-rockchip.c   |   2 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c                | 522 +++++++++++++++---=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h                |  26 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h           |   6 +=0D
 drivers/gpu/drm/vc4/vc4_regs.h                |  19 +=0D
 include/drm/drm_connector.h                   |  18 +-=0D
 include/drm/drm_edid.h                        |   4 +-=0D
 18 files changed, 552 insertions(+), 150 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D
