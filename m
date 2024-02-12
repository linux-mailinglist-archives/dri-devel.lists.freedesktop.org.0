Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD330851DD6
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 20:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8532910E0C5;
	Mon, 12 Feb 2024 19:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="nW+VyRJJ";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="yZVCs8cW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 378 seconds by postgrey-1.36 at gabe;
 Mon, 12 Feb 2024 19:21:02 UTC
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA1A10E796
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 19:21:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 2452513800A5;
 Mon, 12 Feb 2024 14:14:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 12 Feb 2024 14:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1707765281;
 x=1707851681; bh=owswN7XU/Fn0mSvnFsqZqiicnFod/NS5cnjRqcaw1U8=; b=
 nW+VyRJJFFU1Zxtj1eZWKi+KMs2BVX3Z8BA+KwbAyA812Sh6+PcWLAItYIb98btw
 NY8oHmLn/UzMfA/xzunxmaq8Huh7a230fwMqh+x6rJAmkYm8QrtrrtLK87GirL8u
 xVArA6xM1ORyPi/gjCkwOsaN214DgGWT1cfJ5Xu7lGEQbz+0FmYEEkpQFjdJ2w7A
 6EqXM0zJZwz8xQWyLu9GH3/zMvCdx8W5Ggdvw73T06RtPCpomopN8a0qp91yRFCN
 dOKfwHOAlkMAa6rzIdnLYueGHL0i8Y8wZZc186AkZ6NrXaDOy2KIiIqj6xq8pGld
 mehi1NWe3zCevzCya2whlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1707765281; x=
 1707851681; bh=owswN7XU/Fn0mSvnFsqZqiicnFod/NS5cnjRqcaw1U8=; b=y
 ZVCs8cWJMmS/foQOdJrpUc7TbWBIaLeICwQTavWekPIalfjX48b8dBEW539Mc93C
 VS8xq+ReDnciLn6eXns6WzMZtZIFeLpjLuYU5/dJLvxccnFTU6a71zYheZTiWbiB
 xsA6Umg20/zfbV2ejxiHbJivyLYFyVTOlA7q8cE1d2Q+eZU9gqI4IjcUWmivaj6g
 9p5Xw5BgnDcMDX1dukXtNVKYvrdK+lBxbpF/pM5Iw41vU2J6u0gDL7xMsIyk8Wf1
 is0fBYmKuGG/QDCdjz9g/mbFci94I3vnNHMG0610usIiQ6XsVg3CFGawxTDjNKcd
 Dp7ixXkFLDA2rSqCpMKEA==
X-ME-Sender: <xms:IG7KZfoXX4N5T5lq4ALykSgSgZ7zogu0GQDjjd59DWI6wh06-fWNBQ>
 <xme:IG7KZZrtdY2nZl5IlC3uAvPSyF4VvBFTUgrB-VfJnIgEXYVORQw2aoqDzs1CubqgC
 glS665VZTkx-KeCRRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudefgdduvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:IG7KZcPeBrzOTwwpsnH8vneIDZt98fD1SAopAyqNNiwHr1m6B9wBVg>
 <xmx:IG7KZS53t_XSYXsI5-aZ0ahMbIrePfPA6EP3NOgW6xhsxbjorB7xMw>
 <xmx:IG7KZe7W3HIdZ1bFhA2U7kxhuAWhL119lTskO0dw9lHFEndu5sGtfA>
 <xmx:IW7KZRJbyVsb_ls52tp7cqiPAckIN9K9IlBBLfSt8wvAtm5CaBQ9AA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5A778B6008D; Mon, 12 Feb 2024 14:14:40 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <2cacd8dc-6150-4aa2-af9e-830a202fb0a8@app.fastmail.com>
In-Reply-To: <4869921.GXAFRqVoOG@radijator>
References: <20240212111819.936815-1-arnd@kernel.org>
 <20240212124428.GB4593@aspen.lan> <4869921.GXAFRqVoOG@radijator>
Date: Mon, 12 Feb 2024 20:14:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Daniel Thompson" <daniel.thompson@linaro.org>
Cc: "Lee Jones" <lee@kernel.org>, "Jingoo Han" <jingoohan1@gmail.com>,
 "Helge Deller" <deller@gmx.de>, "Linus Walleij" <linus.walleij@linaro.org>,
 "Flavio Suligoi" <f.suligoi@asem.it>, "Hans de Goede" <hdegoede@redhat.com>,
 "Jianhua Lu" <lujianhua000@gmail.com>,
 "Matthew Wilcox" <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: ktd2801: fix LED dependency
Content-Type: text/plain;charset=utf-8
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

On Mon, Feb 12, 2024, at 15:31, Duje Mihanovi=C4=87 wrote:
> On Monday, February 12, 2024 1:44:28 PM CET Daniel Thompson wrote:
>> On Mon, Feb 12, 2024 at 12:18:12PM +0100, Arnd Bergmann wrote:
> I believe this would be the best thing to do here. Making LEDS_EXPRESS=
WIRE=20
> user selectable doesn't make much sense to me as the library is rather=
 low-
> level (a quick grep turns up BTREE as an example of something similar)=
 and IMO=20
> the GPIOLIB dependency should be handled by LEDS_EXPRESSWIRE as it's t=
he one=20
> actually using the GPIO interface (except maybe for KTD2692 as it has =
some=20
> extra GPIOs not present in the other one and thus handles them itself).

Agree, let's do it this way. Maybe the leds-expresswire.c file should
not be in drivers/leds either, but it's already there and I can't think
of a better place for it.so just adapting Kconfig should be enough.

Please add the corresponding Makefile change as well though:

--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -135,7 +135,7 @@ obj-$(CONFIG_CPU_IDLE)              +=3D cpuidle/
 obj-y                          +=3D mmc/
 obj-y                          +=3D ufs/
 obj-$(CONFIG_MEMSTICK)         +=3D memstick/
-obj-$(CONFIG_NEW_LEDS)         +=3D leds/
+obj-y                          +=3D leds/
 obj-$(CONFIG_INFINIBAND)       +=3D infiniband/
 obj-y                          +=3D firmware/
 obj-$(CONFIG_CRYPTO)           +=3D crypto/

Without this, the expresswire library module won't
get built unless NEW_LEDS is enabled.

     Arnd
