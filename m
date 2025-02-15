Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C9A36ACF
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 02:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 780AA10E0DA;
	Sat, 15 Feb 2025 01:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="Hxhx1nky";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ON1iSdRX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 312 seconds by postgrey-1.36 at gabe;
 Sat, 15 Feb 2025 01:22:54 UTC
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CF2110E0DA
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 01:22:54 +0000 (UTC)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal
 [10.202.2.53])
 by mailfout.phl.internal (Postfix) with ESMTP id DB3D21380105;
 Fri, 14 Feb 2025 20:17:41 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
 by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 20:17:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:content-type
 :date:date:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:subject:subject:to:to; s=fm3;
 t=1739582261; x=1739668661; bh=hPBYFiAweKzLygU/co8iY53bvVtiA5up
 X/HaNd3eSYM=; b=Hxhx1nkyQ5uF4Ow8rzokIProVSGAzqzyB2NygjkCRpoCVBhZ
 1zVzXpaNJf7Y8ZTxXigS6XFKUUzjC3GfH3xek/2PfeWnL7TDRV5Q6ayGkMs9gtA9
 wVINimPihowRNxpNm8jRSxPDMpmC430ynzD72FUnIY79Ojtea7oev5d9Qf62cgR9
 hW/VOW+R+aRnw3xYNx2NM62SpU337D2BHyIoLkiUAVYSWRvH4hqoTOIaaqdHj1Ts
 k7WPX6ee6sYAaSzCnwMMupQjtuiioY6gSKrQssEdbjNafCz0qf1Tr/pXJsvUEpfX
 9LMabGfXlLZbZ3lRgpPFaDX8TBa+mex1AyaBjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739582261; x=
 1739668661; bh=hPBYFiAweKzLygU/co8iY53bvVtiA5upX/HaNd3eSYM=; b=O
 N1iSdRXvdS33leQGOQaUeO0XVj2m2kBDw5uabBTwFOk0CBX3nzgnDiOWswKEkRXY
 GBzkrLObdjw2LipUuAlOMn92f8sUGL2acPODzuIpboZCtKVfLDXkokgDB/LAoRn2
 GMXDiUaWdrPlPBWKBvrQA46CFdNxW+AeeawKUNQ94H/GzfQVyG7cSDn8ns9TwQW+
 l7QfysoX1fBvNeQ0qUlBNJ0OpeYDuJ0iNf59xzfvbn9z2Kv42cxhxpighdw4/tJl
 EIwqeTjqN7KSqFqr/ACxJySbDIazfilzTREqQtWHELED7ksCcLPbWMCTI+1xQmkW
 bnkIlJeD8L+95EXKXr9QQ==
X-ME-Sender: <xms:NOuvZ2m1JWa_dM05Egspp3NUZb-EucncXLW-5xIUpVeFRacklHev6g>
 <xme:NOuvZ92vzPEfdL9w4jp4iBIbxu7O0f72N6FJjzUF2BlFR0M9laStv5yD7TDPn5TH4
 EAXfmXZX6RV4VheuA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehuddulecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
 tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
 grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
 tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
 pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
 gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
 vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
 dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
 ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
 esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
 lhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
 hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NOuvZ0rHQ5e6sbUBcy5t76b_C0Oh9jpZPxrjuqVep3FaomZk9Sf25Q>
 <xmx:NOuvZ6nCA3aM90ZVzT1kDiyuXOAwB2Dh-IrQIUGwUepb2rLDvgY9QA>
 <xmx:NOuvZ018jd52c-TNbNxRaEwu8LWYEJM2NyqATFz_jKlk4Co6Yg7wOQ>
 <xmx:NOuvZxu3zb1RggKnd4ZY63bH8xdgKWrhQb0bBhkE0prbt8LYZOnO0w>
 <xmx:NeuvZ-XZ820qASIJ3wVhpgyixDut7xHJznx1iHQ5tg7f7AoKOECLuVEd>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
 id BF98FBA006F; Fri, 14 Feb 2025 20:17:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 14:17:19 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
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
 "Chris Morgan" <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <40fdbece-009e-4c7d-85e9-2d2488dfd91e@app.fastmail.com>
In-Reply-To: <635hn2vkmoyna7fxzgrzp7q3tlk76aoggssjbt2mpkhpvvo4fx@2pmvvxgvmfpq>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-2-ryan@testtoast.com>
 <635hn2vkmoyna7fxzgrzp7q3tlk76aoggssjbt2mpkhpvvo4fx@2pmvvxgvmfpq>
Subject: Re: [PATCH v5 01/26] drm: sun4i: de2/de3: Change CSC argument
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

On Sun, 20 Oct 2024, at 3:11 AM, Dmitry Baryshkov wrote:
> On Sun, Sep 29, 2024 at 10:04:33PM +1300, Ryan Walklin wrote:

Hi Dmitry, thanks for reviewing, and apologies for the delay in replying.

>> -enum sun8i_csc_mode {
>> -	SUN8I_CSC_MODE_OFF,
>> -	SUN8I_CSC_MODE_YUV2RGB,
>> -	SUN8I_CSC_MODE_YVU2RGB,
>> +enum format_type {
>
> enum sun8i_format_type, unless there is a strong reason to name it
> otherwise.

No problem, will make that change.

Regards,

Ryan
