Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8676FECE2
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 09:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3DFC10E5AF;
	Thu, 11 May 2023 07:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15EB510E1AF
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 07:32:45 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 601E65C084A;
 Thu, 11 May 2023 03:32:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 11 May 2023 03:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
 1683790364; x=1683876764; bh=wYFYldVZ7F6H2DOpsymRO/OM8vDYBZCnRDN
 SUpMOjpE=; b=e+RYGBqnkGYFVQEo2Mac00EHhWQefHpqIMtmXgDynoceEB6PhIO
 2shdgrz7H0fIvxJW4MImc2s12FN49MaDCKhORtZcOSUr8pp2Kopy5wxKFOatkdaV
 +VFevbWkFI86HXZO+fk0Dfk8C5/04XwWA40lOIN380Q2XTQYL9yK20Qt7/SE455w
 6NArPYlrAbqehZXYZt/77evofgzO/0BESWyvaqIU7woK+usMj6/9EWq0B9eIBeyb
 iJ59LznmTG9nqhe3hXIBvYuyJ4QQCFZzL/jm1MZQeoOqJMg9bgSY6cnRS9kEiSiE
 o/uIFG78u2eOvpmv3DQ3EN6GkHdYcpidxrw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1683790364; x=1683876764; bh=wYFYldVZ7F6H2DOpsymRO/OM8vDYBZCnRDN
 SUpMOjpE=; b=k0CrTwxQd8aP88MVJO8COQ+0xCOYfjH/wWc6CfsXnFOeK4rDyfM
 oD1ljUCBVj1KqsVWyVjmxHKkP226T7TcVE1t8wj4TSWlT3SL6iftJySJy9D8rGHM
 KOzAvzkvKOLYA3Gad+EiXgb1/AZZ/OkmytE8XvQ8k0FQGaI9Wau8EWSNYlq5xbRA
 4j9shG28HOOjWaZqWGAJCUVVmG2UqC1zm8hid3f6MCoHyHoYT3U72kW8vcDYcxn0
 m+G/KwrW60Ydwxh+Tr9ZIAQ/cGDFMlM22urAqc6jC58GfnDIYZ60PseX9GecAHKc
 Cc/p5imo2FqNztI7/I+hqrKywoOeiWwbz7g==
X-ME-Sender: <xms:G5pcZEMmEq1XBfUXxBbjl9ASO8tlS7556n_lfgkZyYWfRNfry4kEzg>
 <xme:G5pcZK-Y1KblLowMMv7sVbzW7bUsFw7jKq7jDpNhGR9x28I-bUEa5jqScOLG9hvQY
 RlJvYnivhO32spf330>
X-ME-Received: <xmr:G5pcZLSUZoSMiuX32lqPLQD8U2oc7DOvZDp0Y9sdFWm4eFH2fxti0zSd5gTUeUFbPbz0hdVEXD7UMXFQuYJn5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegjedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevjghfuffkffggtgfgofesthejredtredtjeenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeelieffgfdvteejjeeujeeiheeuvdetieegheethffhieefgeelkedu
 keetgeeuffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:G5pcZMt0GvwW2Cb5HrpgRdcJ2ShYGfK6ZYyWKMxFtgL4vSetDTfYEA>
 <xmx:G5pcZMfgmQ0WoF9qbb2vBkAt41jz2jevbFbQG8-EaKlKKlP2x8Kc9Q>
 <xmx:G5pcZA0b0lQORNGKW-uF2MDcggltMrpzwgdjC6VMsqmHeAFxB-TM4g>
 <xmx:HJpcZL_qFPPAolowwQd8r5ZwD-8yRumotup1QCkzD4tbZZEI_zBJ0w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 May 2023 03:32:43 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 XuDong Liu <m202071377@hust.edu.cn>
In-Reply-To: <20230430112347.4689-1-m202071377@hust.edu.cn>
References: <20230430112347.4689-1-m202071377@hust.edu.cn>
Subject: Re: (subset) [PATCH] drm: sun4i_tcon: use devm_clk_get_enabled in
 `sun4i_tcon_init_clocks`
Message-Id: <168379036200.796072.421403145532970427.b4-ty@cerno.tech>
Date: Thu, 11 May 2023 09:32:42 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
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
Cc: hust-os-kernel-patches@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Dongliang Mu <dzm91@hust.edu.cn>,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 30 Apr 2023 19:23:46 +0800, XuDong Liu wrote:
> Smatch reports:
> drivers/gpu/drm/sun4i/sun4i_tcon.c:805 sun4i_tcon_init_clocks() warn:
> 'tcon->clk' from clk_prepare_enable() not released on lines: 792,801.
> 
> In the function sun4i_tcon_init_clocks(), tcon->clk and tcon->sclk0 are
> not disabled in the error handling, which affects the release of
> these variable. Although sun4i_tcon_bind(), which calls
> sun4i_tcon_init_clocks(), use sun4i_tcon_free_clocks to disable the
> variables mentioned, but the error handling branch of
> sun4i_tcon_init_clocks() ignores the required disable process.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime

