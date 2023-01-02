Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9F65AFB4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3622A10E2FD;
	Mon,  2 Jan 2023 10:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C52B10E300
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:40:29 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id D6CE92B06824;
 Mon,  2 Jan 2023 05:40:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 02 Jan 2023 05:40:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1672656026; x=
 1672663226; bh=Ve0dhCsZ3AWZgreN4d0rPY7cd1sKg+VDKqD5t4tpiyw=; b=I
 EWpvRLLHyyw5lJeTLOeRSxUkleOh2/+rJG9tZ+HDYAzOrWQuMzcjlg3DtesvgsAc
 0y6kdkUAY4isgL1XGUWOUYNbw9E+CD3LqU0DluJI/2jA3pPDIIFofnQJG+/oHnM0
 zKHkXRxmf9eoEOw74I6B+r34l/qu0YAmXGuMn++2OAWgDh8pAT1yrBQNdonvqTgM
 1RLItPjlVyyNKHbk9mqOgSXCp5w284CoZLPVqXcnX+ytBrPwoxr52gkwpKHtCRMY
 iW/J3jwRP2EcUMeHMMLieSiyiTi0ocCI6XjHEH84tJvrrnxARUKzv5LvPhlMiy6R
 doEq5U5cnzIo2cO1gnhsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm2; t=1672656026; x=1672663226; bh=V
 e0dhCsZ3AWZgreN4d0rPY7cd1sKg+VDKqD5t4tpiyw=; b=lYWVCCyUKGcw9XVWf
 QgwMF0E+Oh279xxvErvJT7uRIxJxTwXXjWho8wVq7Yxj6FacmN7AkKNEgisYNrwH
 zTkUNX/7lyEfbmv5nd+xcnn2iHt42UfH9L6LiFPvn1z/8kfWe7hiOPQcTuQsir7u
 AqGlFpgKUXKBVMLgvjB+ASwxFCbcKQEJY04QmjkzUyZoVI0OSMZhN7vfFxvs9/lc
 9SHHBGsweGpR6Xoc/4vFI9JS/7KkEKpCiHF6YAyUpf/JcZOShVZytH1MvDGo+yb2
 R/aYbk8yDacy9anudJj3Hix2VQ71r9GFD/MVkHUvisjtx8OsHrGUflB2RZKuTSWk
 c2DmA==
X-ME-Sender: <xms:mbSyYygsuG-KVGbz0YsPNmHNYJFbqslnTTQuIbQ0I13QWvoXhF4uzQ>
 <xme:mbSyYzDZ7LXCCzwlaDW7zWGnxDmi-elFzw5wiWE6Ojm4ilyJOoUWLSdt8ro8ljV_P
 OdkRQixVvoHVO07Q88>
X-ME-Received: <xmr:mbSyY6HxmRBA6yLrQ8y7pakzHS1gatjyFa16gu4p2LrJvEGrPBUkRiyR0kYtG3ln6Rttu0NsWFYEkvxa8tyFRxQKv6JVa01t2Atgil7X98q2EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedvgddulecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfgjfhfukfffgggtgffosehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptefhlefgheduiedtfefhjeejhfehlefgieduueegtefhtdehueejgfeiveej
 geelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:mbSyY7Tz8QNWY0w2500-9LZlpfzuzRHquUlro-4XQv_X_sSbn0npvQ>
 <xmx:mbSyY_w_LA0k7G8vmU3mUdw0ZyPNPFpQZ4tKT9IMwRytLXNKUTXU5w>
 <xmx:mbSyY55CimL9ip7x3uwRJfprMs4gw27IM8gvp8zE4DgzhKDXC1v9Dg>
 <xmx:mrSyY0ycVP3aq8yfYA4t3g9ITr3gqWDJNRgubuRpmMTWHe1MinC9WdVYjek>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jan 2023 05:40:25 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Robert Foss <robert.foss@linaro.org>, 
 Maxime Ripard <mripard@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20221222185213.3773336-1-dave.stevenson@raspberrypi.com>
References: <20221222185213.3773336-1-dave.stevenson@raspberrypi.com>
Subject: Re: (subset) [PATCH] drm/bridge: panel: Set pre_enable_prev_first
 from drmm_panel_bridge_add
Message-Id: <167265600486.7906.15139152246534241957.b4-ty@cerno.tech>
Date: Mon, 02 Jan 2023 11:40:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Dec 2022 18:52:13 +0000, Dave Stevenson wrote:
> Commit 5ea6b1702781 ("drm/panel: Add prepare_prev_first flag to drm_panel")
> added code to copy prepare_prev_first from drm_panel to pre_enable_prev_first
> in drm_bridge when called through devm_panel_bridge_add, but
> missed drmm_panel_bridge_add.
> 
> Add the same code to drmm_panel_bridge_add.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
