Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB546058A5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 09:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB38210E49F;
	Thu, 20 Oct 2022 07:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99DB10E3D6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 07:32:33 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 0537D5808D2;
 Thu, 20 Oct 2022 03:32:33 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Thu, 20 Oct 2022 03:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1666251153; x=1666258353; bh=AV6tDFUKMO
 pEg3MRX4qWR5oX2aLW/thhAYpb2YqHogo=; b=LwBqYSaIPzEagD5t3VSAH3u8bC
 GOMlXQATN5NPYHGJFRyMCdNJ3bJrRoKDlIzXqSLAARVo0XAiVZTrHleEnER1/EDH
 OInqpIPnbivBMmUN75vwdEn9cJboi5Z1O0GhbXJY/ZQ/AgfgtfeH98a9YCaXXDYz
 k0SlfSZwM7sIY1aSnSr9dZPZh2dyWqatx9j5fwh45959VUD1CCocyiAi5SXGLGn6
 QBmIQDxJx+1LTanOxN+487ZkZiX0gzMPK41B611svX/zdsgtyx8zryp+roi8z+Y6
 kAQoRkW+9j6/JT1CxWRbc0eHDwYnWe6Fa3huhOGTL3J91VnneBSZorDOHVfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666251153; x=1666258353; bh=AV6tDFUKMOpEg3MRX4qWR5oX2aLW
 /thhAYpb2YqHogo=; b=VL3hwyWdbYa9ajHTB8LAad0OFgZoCydHOUKD/q/nRXJM
 La7526Kuk9mhD81n+xvH2WUzAZfB2SNlsZKeLEPdLFJs3TLYaqAMOT1uKOoVfH8K
 L/HAgMaXz62AxNzj/wJ1JD4ITtXCJqDUEoYhL3kqSK1x4fNPxL47VxhKZdBO1nbz
 t4qEhqH/42Yltf+1hlvgrpsM1De+bD6uXlxU+we4F2UAjUqesFo+HZEM9ATayU/a
 TJc30PBOmgy5fwrN/CIwfsx6z6tOnT57f6IEqy+m4Bc5fq6OEnpF4RLUw1Q84JKd
 1C1+a4x0f0dPk+sQn6oRcfGiFlKGMYMpk9Zn2xW02Q==
X-ME-Sender: <xms:kPlQY0COucP_JBuc3VO6ui00Aeod_vY6KX2eD5gQI9Yr1DkWG3a5mA>
 <xme:kPlQY2gtxfaxEF8E0nupOggf72VxqawQyxSR0L9pyZ_JV7qHtQn9M6vY36KXi61ZM
 KbMyjKA1pB-2a_oUQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelhedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
 keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:kPlQY3kdADxAHh0mg9ZEyeDNoL9T7Br6cBC9Vw3B4UkHhpWz-Qje1w>
 <xmx:kPlQY6yu9gT9-n3kSmZ9BE9kk2TNEm3ealNf0llEEScW5_OS2XXJJg>
 <xmx:kPlQY5SryijVrEYyekFDxeVLDfbY5orH6ssBHORZUU5jX_BrZwLJSg>
 <xmx:kflQY6413sE1AInazuTgiKzob_WzdVkTnkNVvnojS32tD5OKxwgvSQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6001BB60086; Thu, 20 Oct 2022 03:32:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <c7366f60-aef0-463f-9bba-f14680d820ac@app.fastmail.com>
In-Reply-To: <Y1D08tpbdE52x7hN@google.com>
References: <20221019161831.3864786-1-arnd@kernel.org>
 <Y1D08tpbdE52x7hN@google.com>
Date: Thu, 20 Oct 2022 09:32:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lee Jones" <lee@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 00/30] ARM: pxa: remove all unused boards&drivers
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-usb@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, patches@opensource.cirrus.com,
 linux-mtd@lists.infradead.org, philipp.zabel@gmail.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, kernel@wantstofly.org,
 linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, tiwai@suse.com,
 Russell King <linux@armlinux.org.uk>, marek.vasut@gmail.com,
 Alan Stern <stern@rowland.harvard.edu>, lost.distance@yahoo.com,
 slapin@ossfans.org, alsa-devel@alsa-project.org, linux-pm@vger.kernel.org,
 linux-input@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, sre@kernel.org, linux-fbdev@vger.kernel.org,
 perex@perex.cz, linux-arm-kernel@lists.infradead.org,
 Felipe Balbi <balbi@kernel.org>, mkpetch@internode.on.net,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 jingoohan1@gmail.com, dri-devel@lists.freedesktop.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 lgirdwood@gmail.com, Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022, at 09:12, Lee Jones wrote:
> On Wed, 19 Oct 2022, Arnd Bergmann wrote:
>
> Are you sure these went out?
>
> They do not appear to be in my inbox, nor lore.

You are right, I was interrupted after sending out the
cover letter and didn't manage to finish sending the rest.

Since Robert Jarzmik already found a problem with the
series overall, I'll continue sending the other (mmp, sa1100,
s3c, omap2) patch sets for now and get back to PXA after
we've worked out the issue with the ac97 infrastructure.

    Arnd
