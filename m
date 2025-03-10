Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F64A58CBE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 08:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E51D10E274;
	Mon, 10 Mar 2025 07:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="H65XTLmq";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="UG9NfcuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from flow-a1-smtp.messagingengine.com
 (flow-a1-smtp.messagingengine.com [103.168.172.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A2F10E274
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 07:22:46 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailflow.phl.internal (Postfix) with ESMTP id EF1C720144D;
 Mon, 10 Mar 2025 03:22:44 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
 by phl-compute-07.internal (MEProxy); Mon, 10 Mar 2025 03:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1741591364;
 x=1741598564; bh=J3sQCA9DV6phIpiLDA9JI9hyBB3YMuMwciQ5P6V/ybU=; b=
 H65XTLmqz5qqZeAmNdbjspDs4350aSTpjHT3M0l79hDMl4pnq2pe5PjFjK98dCwv
 o4LrfOeYYEDjkMaoDLHe88BSZrhiSJdl5IeWm8j1Y5V1cLKRqLWVUJgDtKi3AqWC
 KfuRma0iaGw+QcjCNImKXIR0+Eey/QuwGWzHp6NTvtwDaKGZZKlGkiEAkuF92KGr
 pO9m14kWbgKum5NvRFnxzdcu5loSw067bd2SrtA5NEDdn09Jr1WgKpfMC0kXMiyV
 gySoW7yibIaEIvsQ1wRt/mQUUrE+75ikoTj3/4sr/IHS3726Hqs5z8Gi4oJhQMa6
 xX3GPhTPoAZ25WWOWHZm4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1741591364; x=
 1741598564; bh=J3sQCA9DV6phIpiLDA9JI9hyBB3YMuMwciQ5P6V/ybU=; b=U
 G9NfcuGL1pSUTtjpSHWgR7DtaRlOQQcEfxFpbFhGPWHrFQ72V5NqMHJoDTKyxndw
 2azGp917nTShs3jYuUCDjUk/j0yF/Dkyz8td3bEeyPjOVkVvX8PVbU3vbTjZCGWl
 rlRzl3GTL+Hbwm5fcmWrqIw2i4p43osRuubAsklPeSTD4uODiVOmZjMN5CmBP/qD
 n3i79b7PFhg3h+UucgxAepa2G3BCmKR7ZSWs0RMmvepSamdm06VCk3q272zrAZ0T
 hErjLISfVFplQVNus9lPhlIgK5TcLYttPnCIjOHExATCmHsyMn7LipJqEEosu6Ee
 juTt0ySZvua262WfAFfkw==
X-ME-Sender: <xms:RJPOZ6mBamNSP9M62JjinqZGhLUwhetd7MpHVJQ8c2akNeIW7jFsfQ>
 <xme:RJPOZx0nmWLSy_Mz_QN0eTDK8IgqkGq_CCsfYR8or1flR3vYZCUEaMlep8G4KNv5v
 LGmwhLzeoRM_LV54P0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudekjeefucetufdoteggodetrf
 dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
 pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
 gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
 tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
 gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
 feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
 evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
 rghrnhgusgdruggvpdhnsggprhgtphhtthhopedvuddpmhhouggvpehsmhhtphhouhhtpd
 hrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgt
 phhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtoheprghlvgigrghnughrvg
 drsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegumhhithhrhidr
 thhorhhokhhhohhvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhinhhgohhohhgrnh
 dusehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhgihhrugifohhougesghhmrghilhdr
 tghomhdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpdhrtghpthhtohepsghroh
 honhhivgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrnhhivghltheskhgvrhhn
 vghlrdhorhhg
X-ME-Proxy: <xmx:RJPOZ4oNdsCVwdwBC1kejn_hiUWULMuszBBeFu3P1XFG2SOVcQq4Yg>
 <xmx:RJPOZ-kriW5mwdM3YFKa1QEM4zUdOrhgF9EjCIQihVWPJAXdavqkqw>
 <xmx:RJPOZ43M6hITEMrBvmPyYXUHsNOjK4DlkC__GIdg4uCgnY9xPGHwlQ>
 <xmx:RJPOZ1tioloLuOdFS7WnMtHjOWPdjL7vMzeeieApRc97UPovDDeF5Q>
 <xmx:RJPOZw4mIeXgUDIjrdONTNNcGYk--e8ZCokZRYbNMKAedh8jYizIJJyJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id ED50C2220072; Mon, 10 Mar 2025 03:22:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 10 Mar 2025 08:22:23 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: linux <linux@treblig.org>, "Lee Jones" <lee@kernel.org>,
 "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
 "Sebastian Reichel" <sre@kernel.org>, lgirdwood@gmail.com,
 "Mark Brown" <broonie@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, danielt@kernel.org,
 jingoohan1@gmail.com, "Helge Deller" <deller@gmx.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-input@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <26cd328d-efb6-4fab-969a-320a3968ea29@app.fastmail.com>
In-Reply-To: <20250309193612.251929-1-linux@treblig.org>
References: <20250309193612.251929-1-linux@treblig.org>
Subject: Re: [PATCH 0/9] Remove pcf50633
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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

On Sun, Mar 9, 2025, at 20:36, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> The pcf50633 was used as part of the OpenMoko devices but
> the support for its main chip was recently removed in:
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support")
>
> See https://lore.kernel.org/all/Z8z236h4B5A6Ki3D@gallifrey/
>
> Remove it.
>
> I've split this up based on the subcomponents to make the size
> of each patch sensible.
>
> Dave
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Looks all good to me. Whole series

Acked-by: Arnd Bergmann <arnd@arndb.de>
