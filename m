Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817A4BD8F6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 11:13:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9D310E778;
	Mon, 21 Feb 2022 10:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 580FE10E8EA;
 Mon, 21 Feb 2022 10:13:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id B78C75C0134;
 Mon, 21 Feb 2022 05:13:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 21 Feb 2022 05:13:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; bh=oRP7feGcvt0S2B
 HhyYfKf5umE1LYE767RyI+3Dam7VE=; b=uUGxB/6qRnnIHRlIZN5nHsdt84N/n0
 qn0MGkj2JtAF7XHlylcDmi4Cf58RWIACkgz9apoxwWAFPBDVBbUGyCaq46S//bdw
 XE9Qs1kcOZC2rNhosQwquQNm5dk4dw+CI8jHDtf8AQJHzDdeJXG4GPxdRWj9hLqO
 UWAJqsZ6Js1SfA1qk/HXSCKJCkjBj0EEgFuidgfxhYulpQT3sottrYYgMJftCqwF
 ku0QNDnX8oGZxyVBMTp8yMKQm3dl6Pf7TXahnB/QwFQLpFyvw65HRt9rgPtv6Daa
 9pA7y6LyS0FEVLhKe+p6AwThTbpyFNbWRIX29oY4Xe+IbRJtIDnCWBsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=oRP7feGcvt0S2BHhyYfKf5umE1LYE767RyI+3Dam7
 VE=; b=FpLyhgAOfzCs7/5hAMQz81j0LLjmRa7YRJV5l120Sr+eP63YMil+b/4Xj
 WJhFzzY0w05NyQHCu2Z9A2rbXTN7yKJ0qd5Oi6G6NMmjVyJMNXoDIw06VeGM/zcj
 jYPlxB/dPZEGmcSkzFy3toMjzDHMOxzl/VsdS7+/JZAMsci28tiz3RFtcbf4MhhW
 C8nZZj8WakNE+dCmfDTNvH5KtE134c4F6zC7bWa27YE9CbAmHz27i85bWC8eiONe
 q+Q4nHBTyQo9tLsjEO9/ZLwQ+CC8adtOlRScCBp9C6jDY/t97OJv6JNj7XQV3uiv
 rEk8cY17m7ogbDc8s3OJVu+ExZZnQ==
X-ME-Sender: <xms:xGUTYt02gO49nzNy_UZa_sposJXa0KIrAv7IL6vOj4ulIHSTXU1Jrw>
 <xme:xGUTYkEGlD-pQ8alpkpwxw1_SKiY8hMMnl_AcFwwA9BT70YEMTSHNGjWTEpCbMTqx
 lTiviQnmsaZd5QUNAQ>
X-ME-Received: <xmr:xGUTYt5n8SirAJR1v7PsCL9G1qDU5YjOeD3EPz0vgQZlhZSUCVZw_1XTSkEfMjNCdv7dM1S63ghutPPAu54SX92okQFsgQYnb38gk0c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigdduvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
 keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xGUTYq0Zptuw6j8nt5FJUh7jUQYiUiDnovK9vO_BoAaCHrfnS66WoA>
 <xmx:xGUTYgEhiq43ueRwasWLmxTnnvk9uQTjry7poZAc2iHgdeHEXA8BuA>
 <xmx:xGUTYr-PSTYorndopbw22HruKt5haAP1Zbt6C7gXq6tMXXC1cUAJWA>
 <xmx:xWUTYsiwKxvSlttcSQUJwOvlBjOlxAxWd6TZvDnnoH0rVYpRwStq5A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 05:13:24 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: (subset) [Intel-gfx] [PATCH 17/22] drm/vc4: Use drm_mode_copy()
Date: Mon, 21 Feb 2022 11:13:21 +0100
Message-Id: <164543839685.22069.11165406066608795114.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220218100403.7028-18-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-18-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 18 Feb 2022 12:03:58 +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> struct drm_display_mode embeds a list head, so overwriting
> the full struct with another one will corrupt the list
> (if the destination mode is on a list). Use drm_mode_copy()
> instead which explicitly preserves the list head of
> the destination mode.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
