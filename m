Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB6F475904
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 13:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6126F10EC80;
	Wed, 15 Dec 2021 12:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E87C10EC7F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 12:44:15 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.west.internal (Postfix) with ESMTP id 56AA62B00252;
 Wed, 15 Dec 2021 07:44:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 15 Dec 2021 07:44:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=2338BSmEzy1xJRNZewyEw1F9F7
 suTu/Nz2WV9iW8UXs=; b=JOx6xnD44ku0qKWHk99350GH2yCkyMiD3fg38roFCq
 x9FtdJIc8uVe+hdY5BQLlaQWNrnNSxl9FWlsjObbiBrXoexckseWo9GQsZl+Vang
 bLQhRPfbNrZJ2qr6AKRUP4uzt7jFG187kLSV2Wxc9jmZfguU7Dtyvib4sDEZWnEr
 650yRth/1tk7V6mANZo712VOoWgyGKauDEgR+NpUzXQbFaJEmythMS9DHz3r1tEh
 QoXByBc3kdowoUTtzvh2V4rQUq0AtC6yKUQw+tRXy26R9ACVIizWwhUBqCVmJ1LB
 cQKGxevvF815WdKv/Ro5gJ+JQffP49W/4AKGu3Ts5Vkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=2338BS
 mEzy1xJRNZewyEw1F9F7suTu/Nz2WV9iW8UXs=; b=cM/mxOTYfFXqeFnBzod1wC
 KNgjjBr/tuLa2q5nhmxESrZqeeXEZRC2vBzhwnyGFNNweDRGs5YnZpk4Geqe0U9+
 A9/dphc/Oba1SHiWcBkNmc1hu4xtg4mqxURtx6Nc4SjeFGEH6gntdouLmlfe44Ca
 4gsW7ms3P0bpsQx8D9Df/FdqUzLjLY46pGMbkP8KIy6AmoCcJU3UHKlWeSMiatAX
 YI8Wy+T3U9FE74wpoZn12FdY/IcBP0dy20AMZMPJtUbfl6fHUpNCVDQFfzuc/bDV
 taRhnfThqkEhS7awIqUifGJyqZBREvYVCCCBQiNJaCiwNW5fn+uGq+6okCnTRfVw
 ==
X-ME-Sender: <xms:GeO5YWjfMQRZ-RjZQsUx8Oyj6BMaZAFtgCOu7rVSVojHPm-w9yOMXw>
 <xme:GeO5YXCryQNog6KSUeGN4OzL3mV_u3zGDwA_O8zQ90b3e0IP3G0l1QM9SI6lmOXoy
 RDPXiY4tWOrN4jAM5M>
X-ME-Received: <xmr:GeO5YeH2hO_kaO03_zDLNkR9Os8Sq9zbcg1xLtmka0oQ5nFI55inYzoLEONr2J5_yfpjR9BEktR2NCSOOmGzje-b09004C3pLmpqXyY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrledvgdeghecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:GeO5YfSvumvQu8TgvOPJnzh3gScRD6ZJ2RgKcIRIb6o7zT1mmpA7Ug>
 <xmx:GeO5YTznxaEkuSqpPXG9xRr1nKoV5Ll4H69mexJ7MNhcFUG4wJdIyg>
 <xmx:GeO5Yd74OWPtvEWsJuUiJxbYpqF4ELAIRH9SsArcm4Nu9sxOcEMDpA>
 <xmx:GuO5YYrApHaJ95aXkRIHUNSygaHe-BrnaiYx-KQ1YPtlXiXGK5KRaCjnt1I>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Dec 2021 07:44:09 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 00/14] drm/vc4: hdmi: Yet Another Approach to HDMI YUV
 output
Date: Wed, 15 Dec 2021 13:43:52 +0100
Message-Id: <20211215124406.340180-1-maxime@cerno.tech>
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
Changes from v1:=0D
  - Fixed an EDID parsing error for YUV422=0D
  - Fixed the scrambling setup when using a bpc > 8=0D
  - Added some logging=0D
  - Fixed some build-bot warnings=0D
  - Fixed a number of HDMI specifications and EDID issues=0D
  - Try to max out the bpc every time=0D
=0D
Maxime Ripard (14):=0D
  drm/edid: Don't clear YUV422 if using deep color=0D
  drm/edid: Rename drm_hdmi_avi_infoframe_colorspace to _colorimetry=0D
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
 drivers/gpu/drm/drm_edid.c                  |  13 +-=0D
 drivers/gpu/drm/i915/display/intel_hdmi.c   |   2 +-=0D
 drivers/gpu/drm/i915/display/intel_lspcon.c |   2 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c              | 519 ++++++++++++++++----=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h              |  26 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h         |   6 +=0D
 drivers/gpu/drm/vc4/vc4_regs.h              |  19 +=0D
 include/drm/drm_edid.h                      |   4 +-=0D
 8 files changed, 495 insertions(+), 96 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
