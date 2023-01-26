Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5E967D2B6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 18:09:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7158C10E2AA;
	Thu, 26 Jan 2023 17:09:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D919E10E2AA
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 17:09:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 73E515C043E;
 Thu, 26 Jan 2023 12:09:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 26 Jan 2023 12:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1674752959; x=1674839359; bh=gq8oLyYgH8
 4nvePeqaj8P7EbKq1ftFoCwR8UL87bIYo=; b=UrFFEoUQNYayThb1nLTUB86oNQ
 5MAOCi0aMLB24U/4Qg9um26W6Extmhf0h7H7WFr26zNYDqqAnvEC07/yn/T4hEgu
 YlsPerWapnJtv2uGNXlzcQzbbhTgak0wD5M22PmHh0E27kpERS5oGjMonUpzn8Y1
 x7Wk/QlhNez1F6hablUkblDLDl7TXjJSjz8dP4LLdbLiJnB010k0nfHwYKh4Kkdr
 0AaUBNImx0dLQj+bRhFFOtMexjubUlnVkAR0gDn2J6pLx3lZyZucP/6JKnGUsrB0
 Pbfouvx0sAIoUoDx2hipcQ9lhpcQL+TWYhrJYLAIjgJxIkZhzoJIRhiuGpZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674752959; x=1674839359; bh=gq8oLyYgH84nv
 ePeqaj8P7EbKq1ftFoCwR8UL87bIYo=; b=ThAiYZ8J/I8xelcLovWwtP8abMq2z
 DqiosZKBGJ5tDGfDVKyrSAIzYmhF1kSfHl8AUp1jADmv1EcH5VqLBSmw9dFEDaXu
 xqVJUYvwBn/5fEsf68pJWzxrKDGJOmqYh7Fda42D3DPr4J2ti+vVjAqaHLB1ReFC
 Nbs/+tzkX8P71vMqSs+T+uNyLbHTnCY/O3wFBDdZIvB3nafYUdXkRYB4rYjJBlOV
 e97ccqS7Mw0VxKU5UkSNrYSA/BOQvd2R8veCAU/pS1wPJTZFsF9iz0tux15LXdjg
 Q23+EmZl2WMzBPDM8HAuV+B6FEdGVsn/8UWEnLe6KPQ2L5LIwMWiw6/8g==
X-ME-Sender: <xms:vbPSY6fUfwt3uOckNoJSRsPMdx4dShWy7UWKnQVnNAjCmkH_mzfzFw>
 <xme:vbPSY0OxZeIUe90I0FZBErwaKpwPf_MhzYnelPd__EOqG2LdomX6JfG98OcIsRnwm
 k6eJLoy-GXN2L9jYTE>
X-ME-Received: <xmr:vbPSY7gDsz2MVkCsMvS81TXTq5nNBZJTQewS9vQorNIwWl9wIwSlJtGPB1pOd7yO0WYeVyBm08w4jH09u8xSeY8qHRrYdnzdUQzNvlPGOuDBug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgleejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhephedvudehieegjedtieejveeiledvteeulefhvedvkeeuleehkeevffegvedv
 ieeunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:vrPSY39RE11DDj4oqtMc39B1tM6tSjVNccnnv9Vq2NOP7WKkjW7-Ww>
 <xmx:vrPSY2uRyXvsCHRMcmBFCd36-lE3rzPANi23c2VuzFrS39uQdD6TlQ>
 <xmx:vrPSY-GoAycvWKZqkUyCgKbljVXILvpi63tiS-eVPJadArRRyEB6wQ>
 <xmx:v7PSY3-816kK-Y-TK1aBPjDxmxG1ydnAT0on2o4605mnjSJknjxL7A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 12:09:16 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 0/4] drm/vc4: hdmi: Firmware clocks cleanup
Date: Thu, 26 Jan 2023 18:05:46 +0100
Message-Id: <20230126-rpi-display-fw-clk-cleanup-v1-0-d646ff6fb842@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOqy0mMC/x2NSw7CMAwFr1J5jaUkfCS4CmLhJC61iEyUqEBV9
 e61WLzFvMXMCp2bcIfbsELjj3R5q4E/DJAm0iejZGMILhydDxdsVTBLr4UWHL+YysvGpHNFf80+
 urMnd0pggkidMTbSNJlC51LsrI1H+f2L98e27fIrNsWBAAAA
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=U9eolbaMAC7R9IXkVJ9lSBBeSMe3NsbCd8smJA/NZRY=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmXNn20V/SQ3/Tvw32zeRZBNQEF66bLmJ7fHZC/53niujDj
 mgdcHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZjIQxdGhvY3SY9O7kysf1zwyeHEHd
 PG5uXx4osWpMy/0ayVMO222hJGhi1FJ/STbFb5+xYnakyWafu+e+EsPXX+1yE+98+yPVmlwQgA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

In order to accomodate the Pi0-3 using the clk-bcm2835 and the Pi4 using the
clk-raspberrypi clock drivers for the HDMI clocks, we piled a number of
workarounds over the years.

Since 6.2, we've switched the Pi0-3 to the clk-raspberrypi driver, so we can
now remove those workarounds.

Let me know what you think,
Maxime

To: Emma Anholt <emma@anholt.net>
To: Maxime Ripard <mripard@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>

---
Maxime Ripard (4):
      drm/vc4: hdmi: Replace hardcoded value by define
      drm/vc4: hdmi: Enable power domain before setting minimum
      Revert "drm/vc4: hdmi: Fix HSM clock too low on Pi4"
      Revert "drm/vc4: hdmi: Enforce the minimum rate at runtime_resume"

 drivers/gpu/drm/vc4/vc4_hdmi.c | 46 ++++++++++++------------------------------
 drivers/gpu/drm/vc4/vc4_hdmi.h |  1 -
 2 files changed, 13 insertions(+), 34 deletions(-)
---
base-commit: 9fbee811e479aca2f3523787cae1f46553141b40
change-id: 20230126-rpi-display-fw-clk-cleanup-19d1b051a04c

Best regards,
-- 
Maxime Ripard <maxime@cerno.tech>
