Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C587A37696
	for <lists+dri-devel@lfdr.de>; Sun, 16 Feb 2025 19:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46DE10E113;
	Sun, 16 Feb 2025 18:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="N96rZAMe";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="MsEAHXpU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB98710E16C
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2025 18:30:06 +0000 (UTC)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 8626925400FA;
 Sun, 16 Feb 2025 13:30:05 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-13.internal (MEProxy); Sun, 16 Feb 2025 13:30:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1739730605; x=1739817005; bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJ
 iw3aqC4IqVc=; b=N96rZAMeR/tUe1AL5usu2jp9nGe3Hyfkkmq2eCGoZ+QLg6+h
 UzflLhFdaWXIo9en9Uh6fJCfEQSFkZrBwjJDCV74sP88H3HDnAK8+JR+WhysOkSx
 2sOET0FDZBJYqGyrH64XOlYiZVgCiitOeXnyJU0qZ1p758FRu6BiZ158Ss370JWh
 mKszyRDylBeSVqEt/+QpxNUw9TtC0tDIdU1rLKSd6Ln7qKjalkJY0ImXyPeI2rQ1
 PXxfWVANvrPl/JEtLYRKHXwFq0/mvxyJTIMDUj07gczRW6E1UJpjLid+XkC2j4Ue
 qPQyqOt83d9/j44XgfZmEgFCxrfwi4n0lXnaDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739730605; x=
 1739817005; bh=8Qu0rvygyD7TSAHMaq+SdbD+dcR7mrAJiw3aqC4IqVc=; b=M
 sEAHXpUU72PiET0Jr777/O6d8vZatx5/QLX5qDqIHuCwYZGGrRVA04SK3Si1ZlP5
 Exb2EdCQSZHP7yi1M54C54w5a3+W7qi7YZ6QnbnamcfgydNnn4oAeUrjYW+RSz1Y
 WIZ1KmzDVBURD8zGzSNwHbPTsABCO01J2lLsDGn/ThskhUbRVsC4a6XezRqtLfkW
 ewdbsff8/74+92c3K7LHZkeYrGlTlqdk65xE+tQGBjJSp/czF8gVxQRn3yLNFH9d
 opTIhG9Xy00/ixR22sQ403ct8v70+YupNzFznNhB9UdjTrRL02oiSwBX9fPKvWds
 WCSdut4RaBpLj/uRJWNvA==
X-ME-Sender: <xms:qy6yZ7GnieHTpuii2ZvseofaO8cOaXH9sCXG_09uEr1uTbOQ9r7jXg>
 <xme:qy6yZ4WIZxFsjqipW8-m7u1kSE_9HtFMSEgYk1NuAIQw08YKd6zX8dkbB1JLAw8o6
 -aEMAC4pFdHrRDfHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehiedukecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
 grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
 tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
 pghrtghpthhtohepvdefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
 gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
 vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
 dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
 ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
 esghhmrghilhdrtghomhdprhgtphhtthhopehkihhkuhgthhgrnhelkeesghhmrghilhdr
 tghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghilhdrtghomhdprh
 gtphhtthhopehsihhmohhnshdrphhhihhlihhpphgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:qy6yZ9L2uJVrlNNxyA26MmkE_CckIKK8KW3gsJR_gOurr6rPJd5p-w>
 <xmx:qy6yZ5Ev_dfVnN6se7DIqZk41wHkglkiTy19z1m1REKfSwHfZcqMQA>
 <xmx:qy6yZxVLeUOyv3pb7foJV63NVFMaZ0JT_sG9JhmSKr80BOdk5gnh9A>
 <xmx:qy6yZ0NyXKLBPTt7UscFwnUZUUQHACsICPODfhUJnJ38QpFEKtolcA>
 <xmx:rS6yZ3FuSdzvqzLJIcLw1zYQqYjGvmzBbnuYocMCl2AiaCigntDLEMGo>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id 7CE4DBA006F; Sun, 16 Feb 2025 13:30:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 17 Feb 2025 07:29:42 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
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
Message-Id: <7897968c-da47-4dd0-8a79-cb8b2c3325e1@app.fastmail.com>
In-Reply-To: <20250216085432.6373-13-ryan@testtoast.com>
References: <20250216085432.6373-2-ryan@testtoast.com>
 <20250216085432.6373-13-ryan@testtoast.com>
Subject: Re: [PATCH v6 11/27] drm: sun4i: de3: add YUV support to the color
 space correction module
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

On Sun, 16 Feb 2025, at 9:50 PM, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Add coefficients and support for YUV formats to the display engine
> colorspace and dynamic range correction submodule.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---

Apologies this patch inadvertently omits a helper function (sun8i_csc_get_de3_yuv_table). Please disregard and I will send a v7 shortly. Thanks Philippe for reviewing and letting me know.

Regards,

Ryan
