Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEA6915B9C
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 03:23:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E36110E11E;
	Tue, 25 Jun 2024 01:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="A4CF6qCJ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="M9xgx79/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817CA10E11E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 01:23:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 5B2E41140214;
 Mon, 24 Jun 2024 21:23:46 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Mon, 24 Jun 2024 21:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1719278626; x=
 1719365026; bh=ys+1zZVloT/gls+QxuvRvXMQGJI5jghGSzU2+KtdtYU=; b=A
 4CF6qCJiFWrx49ZQFRT+kEC4JaidhvO/7xFwzqpd4NUxFxKPT0Q8bKksDRNiyp2K
 t7MFm6e6YbZK24H+r1xPphM4abeni+HFb49otomGtVZ6DK+iCM/AlcJzLjurxOFJ
 c6PBlmIoph0kbavmOFwTdQ7lj/kn5UxUuToNSdbqG7hR2NBhWzC2oQYEAv9ilXRu
 GKAgZIFdur2ke6+srbnDyPYayKtfYXIwYDU5JGBIPu6BbMOW7hO5REL46JDf7k+4
 Ega2WU7vPDbhm+gbHZPz49MeWkCT/l16cpO60HMWb610bS+YJJza+8P5XGaYIQgw
 J+QTN+DiRsSHw8IgWvbqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1719278626; x=1719365026; bh=ys+1zZVloT/gls+QxuvRvXMQGJI5
 jghGSzU2+KtdtYU=; b=M9xgx79/tc5kCutE8JV0ubl7LaAWxnkyMqX03MwlHRUj
 +dRd1GMJf4ypkFpw8H0sZnU2jdBRpvyBhsdz1xQkxZADpRTQg4wjyDLFjEBUlHXg
 iQA5w/63dgfuV9ZVexXfIhq5ilmUFY2z5YhC4RSYvY+z/d7vIpImFNIQXCsCpn6K
 Up5PNU3YJLlxB5L4+fI5myLgLIBG7Y05IYqBvaTmtMmmaz8Jdm28tuOueWgS3uni
 u1sSEvaN7hXiG8ltVX3jBRf00E7KnUpk5yc9pgonTKuQt9Egrgvj4RRth71BvQiV
 hLwN/O1plO/eCRUPru5NhB7gvQ/uOUUqEKceMcN9HA==
X-ME-Sender: <xms:IBx6ZjCtc13Ox7Rrx12BNLUTSe0X2OMR-7EgW4EmQtAwlDaGX4Mb8A>
 <xme:IBx6Zpj5D0jhCsV0ig4jFSlDJ0TunCkNXEUk6mk-SQsHrD-uxjfeBWtHQwE1OSbA4
 olEoJjFQTScjDYPuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegvddggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
 rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
 ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
 ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:IRx6ZuktjOgjetPyTMtvj7GYcOKv3ICn1NotCnSstMwhufd5ujalwA>
 <xmx:IRx6ZlxOnprEij5IaOuCaqtLzMPaudzaD4pZQoNfUxRXF2DRaUoN7A>
 <xmx:IRx6ZoTJ4VDn4LtjqykkfIHWmZu8uTc-Ub7rw_9of6KNHwtnFGkqFg>
 <xmx:IRx6ZoYBxglP6Uxgm_hX9YuOwhdQ8S0uUkYqYqjhb6rlDhjvD5joJw>
 <xmx:Ihx6ZhSoIjiEg_VNW90Q1_wsy1IN40yMoByg5CqZ_bd0QJfdaFAYKtO7>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id C0238A6007A; Mon, 24 Jun 2024 21:23:44 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <df6acd0f-e947-4994-b477-0ced838262a4@app.fastmail.com>
In-Reply-To: <20240625012804.27e55708@minigeek.lan>
References: <20240620113150.83466-1-ryan@testtoast.com>
 <20240620113150.83466-15-ryan@testtoast.com>
 <20240625012804.27e55708@minigeek.lan>
Date: Tue, 25 Jun 2024 13:23:24 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Chris Morgan" <macroalpha82@gmail.com>,
 "John Watts" <contact@jookia.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 14/23] drm: sun4i: de2/de3: refactor mixer initialisation
Content-Type: text/plain
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

Hi Andre,

On Tue, 25 Jun 2024, at 12:28 PM, Andre Przywara wrote:

Thanks for the review!


>>  		regmap_write(mixer->engine.regs, SUN50I_MIXER_CDC1_EN, 0);
>> -	} else {
>> +
>
> That seems to add an extra line, which shouldn't be here.

This was intentional to add some whitespace between the block of register writes and the next if/then block, but happy to remove delete if that is the style preference.

>
> Verified that the rest is indeed just a code move, from below into a
> separate function. So with the two minor bits above fixed:
>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
>

Thanks again!

Ryan
