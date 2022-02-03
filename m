Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D33FA4A8737
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 110A410EFF0;
	Thu,  3 Feb 2022 15:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BABC10EFF4
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:06:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 822A55C00FB;
 Thu,  3 Feb 2022 10:06:42 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 03 Feb 2022 10:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=YuYWb5SmUWg2LF
 zgMWweE1/3N+rExuz7GGCbPXQIB9Q=; b=jWSCnN8ME6Q1NhStpI9qwG54rmc1rr
 yvu0+WAo1bVrQglRRlq41v9yhn4yGmgOWGzQZkY+aX4yg9kWGegRn02Z8t4XaTh+
 A12k4Ze0wK9/Q+Q4L5ec4OcD1pVTtd3+pLIUVGyCiVMEiKrRnb2P/pa8jpYC7jbG
 fzRxgOz9TF1noTjO2rVP8nYh0VUSR9a0uyTdryDJ49EcqYKXnmZWU/W1IiB3q84W
 b/OHSoAQ2Y+ZjG2NrxDjOxwcBC1mcIypt2EdWXBS/iLBGZ15YV7lFCMZyZqi2lnO
 L6mHMlEkn67uvBjEx2oRwlNZCBpKdFKSN0U5lSVf5doIvWESmqu5j2fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=YuYWb5SmUWg2LFzgMWweE1/3N+rExuz7GGCbPXQIB
 9Q=; b=OXGcXyAuyC08FjO54ntXnrt/6gENvBu4sdK193Gmvb4yPKZmg+SPWvnsL
 jWRP0zYBJw4+dXhhqvgSM7ODM9geV9ZqbQMs8YqvPUdC7O6jNKkJ8Sw6p7Zf31cE
 IM2hoSGoOjpuW4xAo/0SeCZl9qyDwGJ187cfSJvDrzgnywnJGe5IEXRgwJEm3YqA
 CCWsy8Ztd+3t24v5Hp+Cdp2Qn8z5jM9HNAk+v/SQ9gMf6G50NLyQthT6xxZOjKzH
 bgmasS2mfcdnX5D7irONAkclDm9XEAssRgWYWwqMB5sQFLLnrtuEmIt+/Bf4STLl
 GB+N9hPjhiAu3Ez7da/XJ2i5wFNxw==
X-ME-Sender: <xms:gu_7YSL_2ClEs5nPvmCpmAn-hJ2AY0eGZ_Z45pPFrOZ4Nn51o30-ew>
 <xme:gu_7YaJJ670_k88wDvTigBtFb0t2ic37LhbtXKBqRpPk2oe1jWM_-bzb24D58iEeD
 MuuzL-Y8-3F0DqOoSw>
X-ME-Received: <xmr:gu_7YSs-DpZgUJY98BGkQ_bYq-VS7HafJESiDrX52nEdiV6zx6zim1n-icNKSvvEER7E0PXmnL8NQ27R6bnItIW6QrgfvzOGC_9lGEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:gu_7YXaGco5PMf7MCpKIfIKinSnbuKfA2TlRWhC79lK85bjR9tJ0lA>
 <xmx:gu_7YZYInRAc90wEXGIekLvTH63P7j2sCfDL2v1YntnnXgGU9K6YZQ>
 <xmx:gu_7YTAIwqcukNU69eX7qEafDhzkH5vfGln1wC7vI2EJSygLdbzlGw>
 <xmx:gu_7YXMHRbmYgHd34uTbMarMmS2Smu05c5naFq7p3Tc5OwccTQdxRQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:06:41 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Don't try disabling SCDC on Pi0-3.
Date: Thu,  3 Feb 2022 16:06:35 +0100
Message-Id: <164390079045.1265461.4896845825613801791.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127134559.292778-1-maxime@cerno.tech>
References: <20220127134559.292778-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jan 2022 14:45:59 +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The code that set the scdc_enabled flag to ensure it was
> disabled at boot time also ran on Pi0-3 where there is no
> SCDC support. This lead to a warning in vc4_hdmi_encoder_post_crtc_disable
> due to vc4_hdmi_disable_scrambling being called and trying to
> read (and write) register HDMI_SCRAMBLER_CTL which doesn't
> exist on those platforms.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
