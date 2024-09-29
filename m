Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1808B9893E2
	for <lists+dri-devel@lfdr.de>; Sun, 29 Sep 2024 10:53:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BA110E25E;
	Sun, 29 Sep 2024 08:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="5NmgZ0Fw";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="EK0RqoEs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F056410E25E
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Sep 2024 08:53:04 +0000 (UTC)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 3BAA2138039C;
 Sun, 29 Sep 2024 04:53:04 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-04.internal (MEProxy); Sun, 29 Sep 2024 04:53:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm2;
 t=1727599984; x=1727686384; bh=T9BxQePmRdxHseNE/o37i5dBpNMdSdlc
 UT0o+FQkSSM=; b=5NmgZ0Fwe/2D0fLrp+ZDnXqSCpxO3GTeMtgO3vyltBG5fp9t
 li4MDj2bKH5KotZPJalgcvRDCuc8kiCMdN/Apz/8PRKVf+Xd1LkcFLQdwM8Vj0lB
 fY/3EiAQHWx32466qAYXhAvfhO7EfHnpd3KZd7UsbjFXUbOc2/NIpmN0HHxaMd/K
 F/DUGXSPxPJllS/axJecXxeSLxb0lks3akAQqfiQ9PxqaM2+dlkGTJ9H7vfKC/tF
 ooylDyaR1ZGtQkCCy16G/sbxm6tUHH9pxeNyJqNqxhjHVYvqHnn/gRFMDa9kaijs
 yKp/LsEFNUBu82TUfnK+r4xfr2jMM8SAY8iUXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1727599984; x=
 1727686384; bh=T9BxQePmRdxHseNE/o37i5dBpNMdSdlcUT0o+FQkSSM=; b=E
 K0RqoEs825ywx7OQoWGXKtnPjTViCiPPUEiTKAYoV+nqWf+vK/DQVmR54PYIPGgN
 L/f7VONJWDeDkwljnjqBcN8h4tYrMNAWieqSfH40CaGT0cznG3rmFnDC4ukuRBiv
 CO+T90bClNywG07qSI4wslql6fseVcA3YzhVwrAenu6iOMXm38dGfyrHYlV6T9NH
 7SOslbNPZTzmwxwvsIytUSOuU9CVavEBj3s3IRaVnoaYEDs0Jj5qxIwdDWRiO8wl
 AWziSwJQED9cUPbwnjtt6uuSCteZFs5r/Yg5h3PFI9kSsRBBelNwdA70mcoUIaAh
 jYpJSL28nXDtx8/EgdI1A==
X-ME-Sender: <xms:bhX5Zo1fSJo930oekBINbZYPTPhH50-G9qG718n5q8l_O3vJzB55oQ>
 <xme:bhX5ZjF5m1qz7fehUqGebzukhvGazaWqzVpU1UCcN9S76al3Whh1RrkLSYdV5q4I-
 CO05eRh_gxYDBauGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddufedguddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
 necuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtthhorg
 hsthdrtghomheqnecuggftrfgrthhtvghrnhepjefhueekjeejgfduvdffheevveejhfdt
 uddthfduuddvveefjeffgfdvleefuefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggp
 rhgtphhtthhopedvfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughrvg
 drphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvghtthgv
 segsrgihlhhisghrvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorhhgpd
 hrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopegrihhrlhhi
 vggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtse
 hgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhl
 rdgtohhmpdhrtghpthhtoheptghonhhtrggtthesjhhoohhkihgrrdhorhhgpdhrtghpth
 htoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:bhX5Zg74oHGh8ke1_LfKqmQS9XBdBYO2tbJ2sLr-e233TamBeVRvSg>
 <xmx:bhX5Zh2eMRaNI3Od9S8dVkFKCZ_9BZmJrbu5TbDt_0gHMai76_Tv5w>
 <xmx:bhX5ZrEkLiz-_kjy3kGwjPqTT_zUPeAQywZdiob6HdXiS1xEgjv0iA>
 <xmx:bhX5Zq9BrxaSSfWWjoSzdAsyG-WifU8CTmP3bjCtpE1gK5r0uU1EWw>
 <xmx:cBX5Zk1Ebam-cqKHpAufa2lsI7HhQd4eMFLh0vAfjJQTO0iKHSMyueq5>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 96816BA006E; Sun, 29 Sep 2024 04:53:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 29 Sep 2024 21:52:41 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>, 
 "Chris Morgan" <macroalpha82@gmail.com>, "John Watts" <contact@jookia.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, "Conor Dooley" <conor.dooley@microchip.com>
Message-Id: <4a8c7dcd-d5be-41c4-9735-bf6810a076e9@app.fastmail.com>
In-Reply-To: <wma4hpidn353lsika3a5t7qf3ochmtbowhp4g4vuqrvgzthltc@yfwp5qastn7f>
References: <20240921095153.213568-1-ryan@testtoast.com>
 <20240921095153.213568-22-ryan@testtoast.com>
 <wma4hpidn353lsika3a5t7qf3ochmtbowhp4g4vuqrvgzthltc@yfwp5qastn7f>
Subject: Re: [PATCH v4 21/26] dt-bindings: allwinner: add H616 DE33 mixer
 binding
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


On Mon, 23 Sep 2024, at 8:52 AM, Krzysztof Kozlowski wrote:
> On Sat, Sep 21, 2024 at 09:46:10PM +1200, Ryan Walklin wrote:
>> --
>
> That's not a delimiter and you would see checkpatch warning (because it
> is quite confused).
>
Thanks, will correct these for v5.

> Please run scripts/checkpatch.pl and fix reported warnings. Then please
> run  and (probably) fix more warnings.
> Some warnings can be ignored, especially from --strict run, but the code
> here looks like it needs a fix. Feel free to get in touch if the warning
> is not clear.
>
> Best regards,
> Krzysztof

Regards,

Ryan
