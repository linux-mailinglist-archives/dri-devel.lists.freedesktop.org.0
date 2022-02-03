Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602B84A8738
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 16:06:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD0410EFF3;
	Thu,  3 Feb 2022 15:06:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769BE10EFF3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 15:06:45 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D61345C00DB;
 Thu,  3 Feb 2022 10:06:44 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 03 Feb 2022 10:06:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=1TJCD5VF6yUYZZ
 uxnhBq6rPLOBaGtxfZN0crMQm/NN4=; b=cCtb5pc73Uu30DJwbqVW9tdiRUtNiX
 Nw3uklAFRmUFU42zRVhIlvBeZt9XysB6X2auAeyPAuM+ONcNTkLMvgQZ3bZqtCVL
 8D/tmqRIj48LCZAUlZ16eWNkjwsrVOnPh2gx3hcNTgW1OSfuVq88gcDYVL9W9BQu
 BVSOOaV5ku5f9S/l4Y+HUua0CrfkgSNBO/BzTvdaq7ADSU4y2h1Vq4xCTfskKidz
 QQTt9luvyhnAY3Fx/5drNI9vMF73QHFoZRp1yNJ5S1gZ5UTkyOa8zNORS5RXmf0r
 b0NJzn7fn697tvFP2UejJnyNxyKMyGmrhL6pZ2LtJl8b4YHdHK8YeXTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=1TJCD5VF6yUYZZuxnhBq6rPLOBaGtxfZN0crMQm/N
 N4=; b=dsZUBHrF693Yoy9cBNDRw8UDybIcbJIn6IMxGhUMC0nEj7KzDYRAphhwv
 UUbbJ24vk2HkohDzgiNTQmzAV2A/SZsdd0tOGx19jyjbvAjJNNITQ5HX/2e8jMJM
 uGbdJUxKtSNWl1wKFobljlT0GOPSlqWeMMDXoBQweIU7sqRQLxb6QWauOJviEIFK
 n9vH5tFbDQFDwqUv2Tv3LuYzBVumg8EK0nKtoWLK33IMJNHUwe7twODJb0PI46mc
 6l/J86lmy3u3j1fdn2MugGm34YGrnFeQXjmK/ZviH12QmK66cWVHkFo+PGTa7g9T
 c5tU+rlQDI2LDhaI/VAGm7+L6YGlg==
X-ME-Sender: <xms:hO_7Yfloz4HoLuJWu_zdpddmu38Qbz4xxuWmqZEagINBcFr5pYm83A>
 <xme:hO_7YS2EIZnGalHXmgEaajUTPK2osu3XKz_N8b8Nr-uQX_lCSGyp-VhzNQKpbfF16
 IL385VmTW_lXJVsBJs>
X-ME-Received: <xmr:hO_7YVoN4iYqRpq9DOeHZQjf2mknF4A0DUi80J0U2OcMQ_wlIhMRznnVaugwR3LuffLs2DYkdWINHhjWmZO7XzgFzp6BwEonKwTh48k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrgeejgdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:hO_7YXn3GUaj9EteMRbuhIuuALkvOLA21K4ZtV2a0SXFQXjDNBq5VA>
 <xmx:hO_7Yd3YNHshORuuRyp_CrRwtNw16_8cJCVCql_V8RY9C0MP8132vA>
 <xmx:hO_7YWuA-QI-AqtJ98tgXm4hjACtxioLn71V2RqPfk-q0pAtUPAMDA>
 <xmx:hO_7YWIA96f2sfHcHOtGDmc9cW22nTuHbO4yHwFAPLNta1jRqtDFig>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Feb 2022 10:06:43 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: (subset) [PATCH] drm/vc4: hdmi: Ensure we don't use 2711 HPD
 registers on Pi0-3
Date: Thu,  3 Feb 2022 16:06:36 +0100
Message-Id: <164390079045.1265461.5004563512240759127.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220127131754.236074-1-maxime@cerno.tech>
References: <20220127131754.236074-1-maxime@cerno.tech>
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

On Thu, 27 Jan 2022 14:17:54 +0100, Maxime Ripard wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> The existing logic was flawed in that it could try reading the
> 2711 specific registers for HPD on a CM1/3 where the HPD GPIO
> hadn't been defined in DT.
> 
> Ensure we don't do the 2711 register read on invalid hardware,
> and then
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
