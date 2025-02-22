Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B02FA40C26
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 00:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE67F10E0E4;
	Sat, 22 Feb 2025 23:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="G81bPmtJ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="GEQO0T1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E2B10E0CB
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 23:37:15 +0000 (UTC)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5956211400E3;
 Sat, 22 Feb 2025 18:37:14 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-13.internal (MEProxy); Sat, 22 Feb 2025 18:37:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm1;
 t=1740267434; x=1740353834; bh=h7jj2OIYXJKTacAxvFh74vzRvVu7yE3V
 9RKcJiHkDeE=; b=G81bPmtJ1VvPdaPATZTVE6kT9vNOYg6pD4/eIkxu36ArMnZJ
 hyI4Kq1JZfLudZLIyGVHD7383Jo8NrBUSTMrKMrAKtn8sPH84/DecS7v9xz5h95b
 dJzol18B2NEmzIEe0sn4wi/HDDJIeegxvpUO7DRT3+kwexjxRWb1gDtFbukng3FE
 +6vc6FckdfMZAmLPqyKjI2u+/nKhiHHk5LYfyb5A/Xo7EJn90jjtYkWjSBs5ViKG
 J//JgTACKJxRLwFmguS8gDD/dfJS4kp64G5nafEA2QKHmHlE0X/sQESccS8N8UQD
 1H9V0Kcy9EwX/p/tTNjDUKN8+iyTNItGMMQfaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740267434; x=
 1740353834; bh=h7jj2OIYXJKTacAxvFh74vzRvVu7yE3V9RKcJiHkDeE=; b=G
 EQO0T1tv9kK9FGFevO50hgX3lLItvbgUnXTrdvrpsNHklwzJWUz0pFDOOu0YmZUg
 QWhDcYwBLk5XWQGDRW4kub59Efw7+XmH3LVaXpvYdTjUPpkwPWgEF8K36ajEBJLH
 tV76mM1QTm7G30yr7n6X8m5mQD5Nq54n+Ptr1sdytHeR3/osy0HYFuaNMkEK1EFj
 wwrITAaR5CLQtCGtmG25g2V5TSIUnf6Fh48wzeKUZYy2QM5MJ/YN3/AQecY30b/x
 2FogmvzRVVZVlPcHRIQhdaBzFUllWaxG99No2V/bdbOPxLtI8jnGWjW9Kdm8MB74
 hZ3ipaoQGoYZY7FjuwaOQ==
X-ME-Sender: <xms:qV-6Z1H6yX-5U5ODT2Q0NksEWRL5e3azNe20KVofC9zRXsheW964Cg>
 <xme:qV-6Z6V2hijT5_TEwOtSXOtxJkW9SBLeRrsg43zVcdDQmibmTO9778uuDGJube9C_
 PDXVDDCvb_d53PjVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejgedvjecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
 jeenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
 grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeeghffgkedtueeiudeukedvveevhfdu
 uefhhedviefgffduheeuieeihefhfefgveenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
 pghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
 gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
 vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
 dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
 ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
 esghhmrghilhdrtghomhdprhgtphhtthhopehkihhkuhgthhgrnhelkeesghhmrghilhdr
 tghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprh
 gtphhtthhopehsihhmohhnshdrphhhihhlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:qV-6Z3IaVX26xeOkrfTi3HIrfb1IOy1-RrRn_XnSKvWPi-MxZMOmMQ>
 <xmx:qV-6Z7Ea-lTZEYIo9K528Ob4kXpU4lMSD2GXAJKV42mAtt9auHFX0g>
 <xmx:qV-6Z7Un6DejbJ8tDJJZ2KGgYgtDIZcwN7yhUF-EikEr1I2k7carJg>
 <xmx:qV-6Z2MiSHOzsnr_6jrOtsGAldZJc3qg62_8dVypSxeWYsWFqxUm0w>
 <xmx:ql-6ZxGRR19w_JzQ7-5bmxxOxZC2WimK1eSZxjiHVpeuBw-HW4leABaF>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id EB7D8BA006F; Sat, 22 Feb 2025 18:37:12 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sun, 23 Feb 2025 12:36:51 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>
Cc: "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Message-Id: <5c5dfb41-1697-44e8-b082-fa88b524cd10@app.fastmail.com>
In-Reply-To: <3860147.kQq0lBPeGt@jernej-laptop>
References: <20250216183710.8443-3-ryan@testtoast.com>
 <20250216183710.8443-9-ryan@testtoast.com> <3860147.kQq0lBPeGt@jernej-laptop>
Subject: Re: [PATCH v7 08/27] drm: sun4i: de3: add YUV support to the DE3 mixer
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sat, 22 Feb 2025, at 10:30 PM, Jernej =C5=A0krabec wrote:
> Dne nedelja, 16. februar 2025 ob 19:36:08 Srednjeevropski standardni=20
> =C4=8Das je Ryan Walklin napisal(a):
>> +	struct regmap			*top_regs;
>> +	struct regmap			*disp_regs;
>
> This chunk is DE33 specific and should go in patch 24.

Thanks, will fix.

Regards,

Ryan
