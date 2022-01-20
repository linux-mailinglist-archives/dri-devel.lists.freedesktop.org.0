Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127EE49512D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 16:16:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FB810E3BE;
	Thu, 20 Jan 2022 15:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2356E10E3F0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 15:16:31 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id C5EE32B00152;
 Thu, 20 Jan 2022 10:16:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Jan 2022 10:16:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; bh=hxQJ/I0bDKZbykvhFcknKH9XvlIXm26nKrig08
 Zwumk=; b=RbBX1cXgU37acgS1BxVmsSb7C1K1wsdqIWSqRJZ9GKPW+Zt4rOCjtR
 f8Er9z9gveRRcspBntjeH+1PPbhz18ofympsIPZnloTiiUaxdwkcTHEzlUJ18iOQ
 zQ7EFpSPTKws2IgLBjgj3fpH5J4iYBixYYFVEw3XAlyDd1YfwFwUwugnHa0/tkUd
 7tuQvuk1A15khm0fkIaLb90KxHVUkMsm97uvmvejNc1h/gXG097hSeuST8ulEUKL
 OeABfxlVQhdBS9lthvcxRPYN/IBpsx/zqL5nV+WEXUI7x3wMZuVbUDy9VjH4kcjF
 HT66S5rsSnXc4nIRWsUC/ate/wganFrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=hxQJ/I
 0bDKZbykvhFcknKH9XvlIXm26nKrig08Zwumk=; b=QEXg/PYL+gQqWVQikUZVG7
 kq/YRA2OUdYhxcZys/DkYtia3zbIDtK2z+qMY3WX2lqIKm/m2w8z8/SYo/5esO4u
 LkVpEH/3b455VbzUAfk3gUSTpx4uSwVyzH7FOxXAsXrnxpSyR4aiSXRxR2Cf+0BW
 23mgtM/EB8B6QLZSrI95q9eSDCUP5189aCqKov0UaDfUytJSdL/dtzQB6MTi2f/5
 VfjtJ1v+VckzqxDL507f0YpCX2DJh6ZotqQzaHgoIJteo83Qhdojen6b7A68OBwp
 hwFoK3TJOefxtHbblQ66TXR3F5yh8IwuQcUVdD8ubGnYG7M9zJ2SoPwR793UhT3A
 ==
X-ME-Sender: <xms:zHzpYXNZ9gRzQ_yFB98Wz8LPhGXRJxjnFhWCE63xSAduP64xawXSQQ>
 <xme:zHzpYR-EO-nlcy7fzD4a8wHHMM0eyWKYqdJ3lsaWCUTZihRHgRNr4efsIDSrirDOX
 qAOr8ApqmsUtlH2cWg>
X-ME-Received: <xmr:zHzpYWRz_2wrf0O9zKMxh7fm_PrcgG02scu4oub_ucQFvlFmOEwyu9LoxEkYeUxgJB1bcjp4nzfiLbsdMjMGVL4RuxQ1LlcMC4bcrWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudekgdejvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofggtgfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepjeevudekjeetieduffduheeiveelieevfeffhfehhfejuddvjeefheejhedtuedv
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zHzpYbtlg0cN-OQqZKltFzGCKHSTAGwX_9oxUcoc9rys20_EAzZ2Rw>
 <xmx:zHzpYfcWAK8UZoU2q8FjdlfnFdHINTGL6jACm_ajyno5EugWnomLqA>
 <xmx:zHzpYX1NRnYuf0h3BatdjLAXSYzr01tRpFVOD1jfcrazD1wFwu1xrQ>
 <xmx:zXzpYQVVhgebdnV1GVSVBfCA1DUw2qZcM9gbTbv-_eSko7wn-7O_Ksv5sSs>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 10:16:28 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 00/16] drm/vc4: hdmi: Yet Another Approach to HDMI YUV
 output
Date: Thu, 20 Jan 2022 16:16:09 +0100
Message-Id: <20220120151625.594595-1-maxime@cerno.tech>
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
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
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
