Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B9915BA3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 03:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F65510E2C0;
	Tue, 25 Jun 2024 01:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="intoOqXT";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="e4Rh51ts";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com
 [103.168.172.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8623D10E2C0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 01:25:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id B1E731380475;
 Mon, 24 Jun 2024 21:25:04 -0400 (EDT)
Received: from imap47 ([10.202.2.97])
 by compute5.internal (MEProxy); Mon, 24 Jun 2024 21:25:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-type:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1719278704; x=
 1719365104; bh=5orHIJ1SgWfhKjLRyW3vpA7KVnKZbE5sZL2J4Z32NeA=; b=i
 ntoOqXTp+K4StbK406BblHOcB5cWU/7zLQ3FKEREHOPcflB3Bdsc7+nqltZm8YL4
 bUaRakQnfrLtGyGGem2zHpzZ3Xy3gX/YgG9cOlL4v5672B+oCjIOFdCyuM3XfQZ7
 vgF8pIqUBxVlmbNf8N/VYGnaOa8i4wOUSoesBYyoutGM9U+5dHKbA0VThgY7cMU6
 U2tLYM8/jdi4pzhranA6VejNQthmOr/e9xRevizZAEzzg3hsJVouz86EdG2WPKyS
 5Ndg604gHSBdfNpW5D5UBZnqQ5wgsh66nPX+aEWGl/7rd6QthsHIiS1KaDrrbvCI
 Ct7f2aAuE1O9Tjt25M68Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1719278704; x=1719365104; bh=5orHIJ1SgWfhKjLRyW3vpA7KVnKZ
 bE5sZL2J4Z32NeA=; b=e4Rh51tsSXgHlB53C850AkKLSbTlCgUZhRpPRMs4HXsY
 uKXY2sbYD/d9FspeyDrKMSHxIkEYXLbcNrLQEbjSWQO/q8z4Y3O2HjLLmdQ6PBtA
 sYJIlEGM0xaJZRGoSI7CJT0JmqE5zMq/JAvgebKp9zUt0BAWohf+GgXN3m2RJQyy
 6pWmHy1Pq+SDGrz9lVdUCP4RBIi2m+XA19uHMg3ADUboetmb2QZjGPgV7ZpaBBeT
 07d7aRwcaZBkkYu5HQUgHSRFXN/rBFmlpmgtOA2bD9g5l1J1pvg7XshgTuMUfk74
 MsfUjYuRoxWK9O2UD9PG7j6DcW6JGGgUfqa5PERdsw==
X-ME-Sender: <xms:cBx6ZiVT6Z6-TgOgxaHF2C_TvHJ45rBibe5tyL5lnGxVCJ0J83nAHw>
 <xme:cBx6ZunAHU6ee8d-_oRtt1GQONWTZZiDl3GLukHJH4vCsoO9ni00CI76bLARBgKAA
 UFtob1-WLZ_HBj7mw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeegvddggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftfih
 rghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecugg
 ftrfgrthhtvghrnhephedvveeigedujeeufeegffehhfffveduhfeijefgtdffteelgfet
 ueevieduieejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
 homheprhihrghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:cBx6ZmbRKNoMEBUOVdVPAEoval1ptFcLPPYh3eJP5pe0n2rng0QTwA>
 <xmx:cBx6ZpU4blIlzZ0bB6CPxZxoGH7JC6tdv5rX2qa8fxIKL8I4DX2DEw>
 <xmx:cBx6Zsm5Y7uEHfj2Vf6p-JGzBSePhMI4fzG3XJs98kFLHMTmm-zovg>
 <xmx:cBx6ZudMk3Y4VR65Wykw9chHuxZ0vWU536IQomsoKLufB_4CqUW9Lg>
 <xmx:cBx6ZkEYnAZ8pyP-_AIDAMH5NZCsmgF38_TrWAna5O210PffNefjOU3I>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1EF4EA6007B; Mon, 24 Jun 2024 21:25:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <a65fb610-8958-474e-a07b-7b3ef8d61c65@app.fastmail.com>
In-Reply-To: <20240625013725.4c5a3e7c@minigeek.lan>
References: <20240620113150.83466-1-ryan@testtoast.com>
 <20240620113150.83466-19-ryan@testtoast.com>
 <20240625013725.4c5a3e7c@minigeek.lan>
Date: Tue, 25 Jun 2024 13:24:41 +1200
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
Subject: Re: [PATCH 18/23] dt-bindings: allwinner: add H616 DE33 bus,
 clock and display bindings
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

Hi,

On Tue, 25 Jun 2024, at 12:37 PM, Andre Przywara wrote:

> That doesn't look right, that would allow:
> - h6-de
> - h616-de33
> - a64-de2
>
> which is not what we want, right? It's more:
> - h6-de, a64-de2
> - h616-de, a64-de2
> - a64-de2

Ah right, have got my head round how the fallback works now, thanks!

Ryan
