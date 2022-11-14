Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B978E6277F9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 09:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B336310E082;
	Mon, 14 Nov 2022 08:42:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6A810E082
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 08:42:28 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 92D3632000EB;
 Mon, 14 Nov 2022 03:42:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 14 Nov 2022 03:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1668415344; x=
 1668501744; bh=w57Bc9UTDIEJ4cfpiy7aLmeMfmO0XFUxL/hhIzBHxs0=; b=i
 ktgMx8Kzq+DK2bXFwoPLEs5Jjm+G95iDh8RIPb/klW1Eiq6gp88WGRQQ6d6cesQT
 dPN1jjtjMnWZ0lUAkBnQgUnftgIz6NH2UKpViCklHwAUY71qZPoV/q11HFVMqxMg
 yf7EvC++zKvi9ONjyYmYappRovc6s7yTvezAVgCa3fsTpEP0MR1skoeGoZhgu/6p
 PtvsUo4LfJRPISFBm8XNkBHjG0v2NL3MCg2TyG4PGUsBe23U+PElEpH0KUJQELi4
 EpxkPjYTISr1Ke7uIzclMsE2YO3KV+45jOQfH0vzHR+OBEtHxlHksqg+GsMbRxKn
 OCh962Xm0JWtjMaRuITUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668415344; x=
 1668501744; bh=w57Bc9UTDIEJ4cfpiy7aLmeMfmO0XFUxL/hhIzBHxs0=; b=J
 DPHvGAPvb/Hq2Kkr+JjvY2kZN0jPLlQA2nTjxgTbn0bsB1uCaT4C154/GqUp7RAi
 q8PHWxIpHG7VbxeZfcuUmYlp6zmGMnbbiZCCxHNl5+OmjR3rKxDe4iOzYcwoUyom
 8NV0oGY5BRAsKmNkcYiZeFC4TLdB6bbPcE/WW1os8PjnNwlRQDGII7EU6bgfPqHE
 N1jrrt49xVaGkJjIESO1byRCl7XGrOiBZl5ObTSHuqjW5SORZCWqDhkwKRIgqeG3
 RvWGmMeLSnMGXJyKUiTVNkPzA/1XPPQQXd/M1n/W0B5jCSbPWixqpDKNscaqxRl5
 y7lNwP5XpuPnUP5EnbWnA==
X-ME-Sender: <xms:b_9xY4j_vho1N480A4VB8w8oUz0rvHafk9nL8NJ2w2xeBjNoignGxg>
 <xme:b_9xYxAZPcZmMWcaHYIOr_9DyBu2E4Aoc8kA5lrDwuJDgNxeVPJjp_659TYGM2iZi
 ywAOvv-RP5AfGPxt0I>
X-ME-Received: <xmr:b_9xYwFkqD4T1ADuRMuLFF9mgWnRL2h_wl5pMYtGFzzoP3HvswlLAWS6wq5h-at4lH77_eeUalFu8_tLdJkQySOutgOoV2sD2xTqECgxM_B4ew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugdduvdefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevjghfuffkffggtgfgofesth
 ekredtredtjeenucfhrhhomhepofgrgihimhgvucftihhprghrugcuoehmrgigihhmvges
 tggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrhhnpeeifeeigeelhfehkeeltdetje
 etueelteeuveekueevffduhefffefhhfehgfehieenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:b_9xY5TmWkti1MC71DYLFon7DokD97auJgZm5sftupj8DHf-dSZN4A>
 <xmx:b_9xY1zpkOWhsW3jiT3S-nOf5fLJGrfJtiCARi7GBk1T9sywg082Ag>
 <xmx:b_9xY36gElrz07iFt-khnG69w1-f5Kr6Hu_QGj6uxNO7Rz1NFWemuA>
 <xmx:cP9xY4rTtRG-yT-Rti6qeHz4gzmsH0hM4TGa1eT_J4UfA-4uy0X60g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Nov 2022 03:42:23 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: José Expósito <jose.exposito89@gmail.com>, mripard@kernel.org
In-Reply-To: <20221110134752.238820-1-jose.exposito89@gmail.com>
References: <20221110134752.238820-1-jose.exposito89@gmail.com>
Subject: Re: [PATCH v2 0/2] drm/vc4: hdmi: Fix pointer dereference before check
Message-Id: <166841534136.121063.4135603044253245364.b4-ty@cerno.tech>
Date: Mon, 14 Nov 2022 09:42:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-99e3a
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 emma@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Nov 2022 14:47:50 +0100, José Expósito wrote:
> v1 -> v2:
> 
> As suggested by Maxime, I simplified a bit vc4_hdmi_supports_scrambling()
> making it receive a struct vc4_hdmi as argument instead of a struct
> drm_encoder.
> 
> Also, variables are initialized close to where they are used in the
> second patch.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
