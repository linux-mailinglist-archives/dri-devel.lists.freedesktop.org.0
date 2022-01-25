Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230449AFCC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 10:25:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8785710EDF0;
	Tue, 25 Jan 2022 09:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B468610E972
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 09:25:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1CDFC580692;
 Tue, 25 Jan 2022 04:25:43 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 25 Jan 2022 04:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; bh=A3G4Xr9WwTcmG0
 EHFGzgjlsI9OYKBS3kdBam5vx/l54=; b=grUrb7AoZRZ7j88MfA0Yppyvj+tLpS
 M2s1+IffyY9hzQhwil14r13denxJnOzxR657EbdqQdEiEz3SG7FHgdxJFRQN8iq2
 tYoc6/2Rw5rXprg6LpfQErv7XV+iVFGM18uRAfyS8Fn+qt8go6yb4xZ/55TbD5bH
 5caK7qS5/6kY7vGbBxjVRIgbxLvoG3YprqK9vE4C5fODrOETGyvGDy/4GtPD6IA/
 skOuvci8xA2HdL/rnEn/ASr+ryVuazAHA73OvDKJekTGH4TuKBwat1I+a0BOywTl
 WbLMEZWaUnVqTRElrhfirxWx7f7cXpMy79q1ADVwkPkTrfXKchJVm2Lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=A3G4Xr9WwTcmG0EHFGzgjlsI9OYKBS3kdBam5vx/l
 54=; b=enOTlFxIBWfLki0pHML7fRT06bwQWp+52o9bmxoR/TbmbZwQ8dKmDwPHw
 nenX3wm2/nWQJGiyRdgMWq5NMfhAqxsxUr1aHCOTvAoyr98nnfJXcWdt8YiExEAJ
 p0B+Csk4X7WMXNwYWPnCMkWUQipADSCY59V2UVxg8PYiW/7sLNMZpXSbfUXlXk0m
 aEX+OQwSyBz1lSTsYB48CwBlwzFyZ0+gbMRaA+XcOdgfUit5OMWo5sqAP1v8UFzb
 OsUyuQhzjzaDW04wHP7/23G0sCVaov7RoJqnKW6jmTg0oa+8RRJDsXaW24PaKbU2
 TaAlOKrm/BXNck5GQqI0FySiYunKw==
X-ME-Sender: <xms:FsLvYZdXZL1JaRwbTE3kHFh4NO1eyh7mKCKu0SyzF1_m25taxjAj_Q>
 <xme:FsLvYXMRlcNoqxe9BQYwHUajXug3iHcsxz1vjVl5CHqFZnHwp5URg_xNfD1xL4wnh
 hROd8-FLAPUsC1-QMs>
X-ME-Received: <xmr:FsLvYSgYivtXajOyWKyJk07UjSeewQ2f0V8ITjKtKGHMqDlL_U9TPXlUSnc5OUIDMWgqVyb2eiHfBnLL5sOMW_8nXsvDlWU2ZaIP6VI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvdelgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FsLvYS-lQ2VwjjDxvQA09GrXC0UeBNQXjB8diLmMEPcQm_8yRO-YoA>
 <xmx:FsLvYVtTzSn4EKY8HYmJ3Ev18pe8fYqVqRj3BxSFujNfRLaJ9zdF1A>
 <xmx:FsLvYRHcGohAZZM2_rPqygR1sk85vQ_kaxC_HJ_fnGm-2kwHuU810g>
 <xmx:F8LvYbJv2NMbYriqrr3v5xu44EovBP7RlBgrQ2EfnY2CYwlYBiWZgQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Jan 2022 04:25:42 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: Re: (subset) [PATCH v4 10/16] drm/vc4: hdmi: Change CSC callback
 prototype
Date: Tue, 25 Jan 2022 10:25:19 +0100
Message-Id: <164310270997.583056.5164307634902396381.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120151625.594595-11-maxime@cerno.tech>
References: <20220120151625.594595-1-maxime@cerno.tech>
 <20220120151625.594595-11-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022 16:16:19 +0100, Maxime Ripard wrote:
> In order to support the YUV output, we'll need the atomic state to know
> what is the state of the associated property in the CSC setup callback.
> 
> Let's change the prototype of that callback to allow us to access it.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
