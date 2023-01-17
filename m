Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94D66E46C
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 18:07:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7E010E2FA;
	Tue, 17 Jan 2023 17:07:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBA3410E2FA
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:07:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3E3E3581CF6;
 Tue, 17 Jan 2023 12:07:00 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Jan 2023 12:07:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm1; t=1673975220; x=
 1673982420; bh=OBgdXpJBXM8o0qloG5WjFFCtSTsxtIOycEpkPC9isio=; b=f
 NfbTJ5s4+EOpk6I2z8hIGqJtcR6GzivpJNNxhcIwkeBx8Qp7LfF3orN0ERntE9mU
 KmYzbkLS1wrTmSNGPPyLL+FDIjMlXKo36yAoo0I+9HgraAWW/J1mDsAd5C0bzl4v
 v6Jopc1Nu0QeroyFOW8Ji6Je8YWtgFQiWsLDJEbok6u8SIy3DGoUi3nm3ym1jTJP
 b2sVAK/35wSniidyxhyv5QHaNmiSzVNaFro3DvgzjlTgCXYCzNEHfDZU9mJgvQSU
 gamZeoGvlGqervqs9RCwejpsT5OqLwexnNayJmfhG4WS4ZJxFcVaG+escLAGHlSL
 Fa/QOLpv7rHxRYIprLU6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1673975220; x=
 1673982420; bh=OBgdXpJBXM8o0qloG5WjFFCtSTsxtIOycEpkPC9isio=; b=k
 ZRRoyPjtgG86dS6URFKZnWY+VWgNuk8kSq8wwpFWVwhGBkotqSEv4N1nkPTr1Djd
 4wMXlJyf8UJPsU7VITbKyzAJvNLH/LcN9ejR13AEb8rbjhNV5exytRrFICVRxkTi
 w/b5YFWxjo2X3yWuRfVvcSBdPbKBlRLoEGb/l4fKVpsL3GYchWPvjNtDhUc9hyXY
 VpetE0tHWRnp0fuSTGBnIBJ2ncOSjLUn00HVBlflNh7vf6k3rc6F25pYJwo9+2Hs
 xeR2FY6qhGu3tYclTS3/htU8vIuzpNKBQath5RyrNWJwupXQTAeEbUFi7eUmRl9a
 eKIPofpDiKLMPqHHlYj/A==
X-ME-Sender: <xms:stXGY5RV2BB9622TowvBI0tsQ7TEo3LjMahnJl6jVlgIJ2JVOq-GQg>
 <xme:stXGYyyEZQ1M1sMc1eyRCpMJu-Kuv3c8wn7h_oJI2xyBmBOJ1e1MYa1gIfoBiBS7j
 IyvPnlla-E0dy-XagY>
X-ME-Received: <xmr:stXGY-0m6eAGgmVwNcTwy5PyhudPJiMtlB5AmcPI_kn0G9bco6iKq3_k05j3RjsGXqxaBVew4D6LklU64TIGpsmgqjZPPVzo1vSsEOlPcWOmjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtiedgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvegjfhfukfffgggtgffosehtjeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleeifffgvdetjeejueejieehuedvteeigeehtefhhfeifeegleekudek
 teegueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:stXGYxDtnen6LWxSsc2SiTR045WdZZZ0KrBtsusDJRxnc_SuRUa8Rw>
 <xmx:stXGYygUPgIS7ckQ_mMx1ySriSwla10nfqKW4pzfOxTi87UPBZI8gA>
 <xmx:stXGY1ohUYBCtGKxb4zWzAXxH6Mszy_Uwqz-_zRDsigp3QVh_tLqMg>
 <xmx:tNXGY9TJq_HbUCIk66GC3_FrRWMijjfbNOtKU1w_bhkC8faaYKC8yg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 12:06:58 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20230117165258.1979922-1-arnd@kernel.org>
References: <20230117165258.1979922-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] vc4: fix build failure in vc4_dsi_dev_probe()
Message-Id: <167397520092.2619750.10136491549623905687.b4-ty@cerno.tech>
Date: Tue, 17 Jan 2023 18:06:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.11.2
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 17 Jan 2023 17:52:51 +0100, Arnd Bergmann wrote:
> The bridge->of_node field is defined inside of an #ifdef, which
> results in a build failure when compile-testing the vc4_dsi driver
> without CONFIG_OF:
> 
> drivers/gpu/drm/vc4/vc4_dsi.c: In function 'vc4_dsi_dev_probe':
> drivers/gpu/drm/vc4/vc4_dsi.c:1822:20: error: 'struct drm_bridge' has no member named 'of_node'
>  1822 |         dsi->bridge.of_node = dev->of_node;
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
