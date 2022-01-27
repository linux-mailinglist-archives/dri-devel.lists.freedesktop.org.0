Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C049E430
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:10:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5810EED7;
	Thu, 27 Jan 2022 14:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5703010EED7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 14:10:24 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id 908565805AF;
 Thu, 27 Jan 2022 09:10:23 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 27 Jan 2022 09:10:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=mKFrBXoJeel54I24vWS4GKLAJ9/gW3SPFEwXyJ
 xGss4=; b=u3QHHyBspusPHT6nxGOb31jjRuGl+9jnOrLxDMDXrNMlciD2mHA4uE
 E6xfaF9rHAmEL5R1A3O28SPpF2M2x94iMGYwPdYczxrYn5WCUAekoWMrTvu+p6gj
 uvqpiZyyoYZk5LSnIGf0fzUevOf/u5tDQpZcNPJic6wxx7ylZohmBREZAWaz8QOk
 ZHPf+neoUOF41jif+eAjfkvcjiPxYuxZVcwufmj70VgUsIuXw6qfAf9RMGHyr/mZ
 6C1LpuUPZUpDGeBzZhyjFU2JDhsnk0vAHSr2SfSqlSCBCdPuLicGpLXBzni/RXO+
 6ISt9mezBj+YxOmcR4LdAzIUrxY34zWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mKFrBX
 oJeel54I24vWS4GKLAJ9/gW3SPFEwXyJxGss4=; b=MCX1pjLupuif7qPnQ2kep7
 smZOMP+jzMQjollBi6RndNLSk99mmnTmJCy50gWTRA0rNjyd6CQEgKbuaTVzDZHk
 bAQ3heDGfH0PhnJ6uX3UgTnyKEnnYWKRsdmi4wmZc8m9K0CoMheDKWkBkmWHIezz
 kUNkv1tJTdB2NVoo2ZxTxP/SO4OJY1Ecwz3ApKn6/mvFjboXR67bkkyRrxypXayt
 gJ7ISaNDu5Bdw/wCsPOLIQNu40zL00ZyggGCwB/2ZwJ3ZnISch0Gk71CjyQMDuxl
 h42csNYL9z89TnpoQiyR/r6hLCDedsM5QBWkadohiuNM3g8Hvhkgf8fYs33z4hWg
 ==
X-ME-Sender: <xms:zqfyYXB_wTFkNhhZVAoAfOcEFEreIi42_olW0iOsQ8ujY1cZBAVSMQ>
 <xme:zqfyYdj-F-sBUZlUPdtESPzJfTMtakqb4i7YIOieI2mjSv0H74N8kBployY9xrHRW
 gHttv9QwcR4GqJ2eJo>
X-ME-Received: <xmr:zqfyYSnqrd6jMvINWBaznqhh6AjFWFyNuP52Wsm9WNXwUYJjStpp_EW2UFnyLnKJ5H7o_yK6ZFeeid80af9U-JZsL1OkE_rDeSgLjus>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhmvgcu
 tfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrthhtvg
 hrnhepteetledtudejhffftdeugfduffelleelheejgeegffduvddvgfdvhffhlefgteff
 necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:zqfyYZz1HMHHQKdVvKWWt_W0NodTGdK10uUCaghUxsY-tyo1ffwbcA>
 <xmx:zqfyYcR_Ei6PXP5qxa6pU-1hq-KPfjU6nta5ZeiT_wMC70tAxTyNGg>
 <xmx:zqfyYcYaQX41fyRMjcYurggtOnBc4slz_fqNSCtNlLSQi06eo39Hrw>
 <xmx:z6fyYRKL6MwsujxG87LFbYXElAWwtKoX2ftHLf3WBD5HoCewPrL2cQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 09:10:22 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v5 0/6] drm/vc4: hdmi: Yet Another Approach to HDMI YUV output
Date: Thu, 27 Jan 2022 15:10:15 +0100
Message-Id: <20220127141021.302482-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Maxime Ripard (6):=0D
  drm/vc4: hdmi: Move clock validation to its own function=0D
  drm/vc4: hdmi: Move clock calculation into its own function=0D
  drm/vc4: hdmi: Take the sink maximum TMDS clock into account=0D
  drm/vc4: hdmi: Take bpp into account for the scrambler=0D
  drm/vc4: hdmi: Always try to have the highest bpc=0D
  drm/vc4: hdmi: Support HDMI YUV output=0D
=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c      | 401 +++++++++++++++++++++++++---=0D
 drivers/gpu/drm/vc4/vc4_hdmi.h      |  21 ++=0D
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h |   6 +=0D
 drivers/gpu/drm/vc4/vc4_regs.h      |  16 ++=0D
 4 files changed, 409 insertions(+), 35 deletions(-)=0D
=0D
-- =0D
2.34.1=0D
=0D
