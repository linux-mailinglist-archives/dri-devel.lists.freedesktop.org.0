Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D42374675AA
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD5C073375;
	Fri,  3 Dec 2021 10:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F26D73375
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:24 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id D92C558019A;
 Fri,  3 Dec 2021 05:54:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 03 Dec 2021 05:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=WZahf8+vLTHLrsggBHorEtLHTI
 WxDQNXGBNZIZ0ND4U=; b=li7Xe+/ANIQi2qbi//Uy44uJMTqbt+Gk5YAbizNxcR
 GXjl1FnAECPG60yzi3wcq1RJkxzwVebHO28eHKIAIyfO/PZlN8tmuPPc7W7CXH1i
 IUd2qSpjnFA42hfX/nbLLdMT+XBsbWG/Q0JWpl1cE35jAxHJlZkLtqRH9XZ0i2Uc
 qejS8hZ1O2ogJy2FlsYK237L8WylhAxCRaCjSoEpuYLQfnEtZ9hpQBwN4SNwtZAc
 +442o2CI5+dRx6L9xJiCATN3TbM8SISEde8xh0yGw/+G6WdZNpLJhwxiqT+mBzyH
 Zd+a1NUqMZDRqjeAhoDGf7JyNibQ1juQC/pZdkxtgJDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WZahf8
 +vLTHLrsggBHorEtLHTIWxDQNXGBNZIZ0ND4U=; b=njmmfY75lXyy02f25KSD6V
 ja30dKxSEV6kioyW9wKWiyBsWcCEGy/a6d63DhVLIB8hYCPuIAQLf2nvh8WOnS6v
 EikzkD7WkaXg70kS4lvvDJjc3Q1gvvjgE+64hnk3xFpMghPuc29ACzeMU0x7Xn0t
 +NQATYUI68GAXYlRMumm8dhd9o/igWE9xrwx4s7NKU0g04mwSQ1NSn0wIVlRsua8
 ZmFI0RdRDJp3qAv2RNKm+SAZRPwi1rnAdaDD2y9NCX8hcvn9id5g6E4krIA75IvQ
 p2Ia6VqLm6c2niydvb1uzq+PSRy0ISdi9AX/0BlDnZJl8Q+1KLvB0YeGKdBrUZmw
 ==
X-ME-Sender: <xms:X_epYfe1XzjJ0nc66zh_v848cUnXf6FG0Afy0Qq8dJI6NFmh4qVz5Q>
 <xme:X_epYVOA5jffJdMtcdL3iDYLIz7aNes5Qi8VFs0OrJazBl-eZbWp7kBGUEZbvahGi
 o1mGUu0neBwqOr4Mmo>
X-ME-Received: <xmr:X_epYYiNUyJNLUhVkaVJ3o9PxEVC9I-iVtKkCDBuIR-0_z_3HiI_efQdIw2D-yKc8LOEatvzpPa-SdaDsQa7xcoe6IDqubJFJWrYxgPFssYwbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:X_epYQ_f_lxBBH4GkSSQIi8oUS9ZHjTwTbQJb_aRx6_cBxit50KDVA>
 <xmx:X_epYbs3BHW66KOn581AtH_UIOMBI1yBlhNKXcQu6Rwsio96wq342w>
 <xmx:X_epYfFYKKgAk9qBfAxco2NKfqxesVIfGTNlldHUBRyJDgP_31uxLg>
 <xmx:X_epYZLhVWrWoZc5YSux8X0sC0fwRGqaT9FE-7i_PqCVHLjI3BnHNg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/11] drm/vc4: hdmi: Yet Another Approach to HDMI YUV output
Date: Fri,  3 Dec 2021 11:54:09 +0100
Message-Id: <20211203105420.573494-1-maxime@cerno.tech>
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
Maxime Ripard (11):=0D
  drm/edid: Rename drm_hdmi_avi_infoframe_colorspace to _colorimetry=0D
  drm/vc4: hdmi: Add full range RGB helper=0D
  drm/vc4: hdmi: Use full range helper in csc functions=0D
  drm/vc4: hdmi: Move XBAR setup to csc_setup=0D
  drm/vc4: hdmi: Replace CSC_CTL hardcoded value by defines=0D
  drm/vc4: hdmi: Define colorspace matrices=0D
  drm/vc4: hdmi: Change CSC callback prototype=0D
  drm/vc4: hdmi: Move clock validation to its own function=0D
  drm/vc4: hdmi: Move clock calculation into its own function=0D
  drm/vc4: hdmi: Support HDMI YUV output=0D
  drm/vc4: hdmi: Force YUV422 if the rate is too high=0D
=0D
 drivers/gpu/drm/drm_edid.c                  |   8 +-=0D
 drivers/gpu/drm/i915/display/intel_hdmi.c   |   2 +-=0D
 drivers/gpu/drm/i915/display/intel_lspcon.c |   2 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c              | 324 +++++++++++++++-----=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h              |  13 +-=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h         |   6 +=0D
 drivers/gpu/drm/vc4/vc4_regs.h              |  19 ++=0D
 include/drm/drm_edid.h                      |   4 +-=0D
 8 files changed, 290 insertions(+), 88 deletions(-)=0D
=0D
-- =0D
2.33.1=0D
=0D
