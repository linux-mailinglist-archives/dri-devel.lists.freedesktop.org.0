Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A712F870065
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:27:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8710311201D;
	Mon,  4 Mar 2024 11:27:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="eRq7C42j";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ro/Zm46E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh6-smtp.messagingengine.com
 (fhigh6-smtp.messagingengine.com [103.168.172.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBCB0112019
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:27:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 9137C11400AA;
 Mon,  4 Mar 2024 06:27:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 04 Mar 2024 06:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1709551630; x=1709638030; bh=WCLCx6ZXib
 mkTszLQSSQ7hZc4cbzBKS93Xk+HpWXKXg=; b=eRq7C42jv0AVG+FYFsv3Xw43fr
 rV6E/nvYM21RbXjn3fXQBH8l2aFkmDTpyjwXVGR2ldOeN33m8y2reY8mm1+asd89
 XeLVDyzt5YFPIOFjDcyd7Q26dwvTRcA768lp9lDsIEJCr2KVTYYvhrmX8TafAqtA
 3694/F49vq711//XazCx4o/eFmoauA5E0r1o9aOtxZF+1mKDwbIZfA8ZT5MefHwd
 +RLVgmOi0uajoei5Mej9rjhM3ujtmmiiiVdtmgiUBqfjYhDUNICI12n5S2Mo7ELu
 7boySfVmDoipTB4Wp1va34ylhlEvGXudJXqUVd+OuJOqiQ8zAi6bt+n0d1tQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709551630; x=1709638030; bh=WCLCx6ZXibmkTszLQSSQ7hZc4cbz
 BKS93Xk+HpWXKXg=; b=Ro/Zm46EuO3nd92ZCxytDuo9hBCXLF/cZmtg1ONfP5cr
 t4xjhm7yOoMxI9q6gOnsvFAofIL/tXOiqSBHAeZi5E5AWiRNaA3jp2jt103MrRks
 8/2rTP82txkOYf+QfR4vl6w12h1Q+ZznZp2+dHgJApFn0OoP6YvmogL4yPbnlXNc
 pnlNbPpwEb0Wb7s5kg1/Pq4Qe5Zb8SfWslhDk29TKlZOq/wKw0BwpsbZwCKt4ypF
 rw0+hvsNEd99IHK907WWne8rF3k59uDovu9RB6GPHApTc8e+VnwbY664UJHiCRvs
 Tlm72+mjdZ8cYwYBakOM3qXC6b5NyeLwMNi+uOFc8w==
X-ME-Sender: <xms:DrDlZXntkvws9IQn3ORO4enwQBHkCLTp3pwe7sgcWrHt8y-DpeFqJg>
 <xme:DrDlZa3ua634C7USDJNZ4uDU0a2UaWOyRn1tRNqytbaRjC3KKL5O6y6Yntkju0cj6
 Ca0Fh8hZ-j7agBfI1c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheejgddvjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:DrDlZdplQNTvcUoTNsECURnF4Qi8faEISXUABHp2IUIKdwdp2VnKKQ>
 <xmx:DrDlZfmlyHD6-nfbYFrL9r9pTKiz47WmMBQ-n-vXG3SrrviTV01q-w>
 <xmx:DrDlZV0lXHYkWXttK2dbV5v9zVXe79f74wqrPazIWUd0O-H7lfiinQ>
 <xmx:DrDlZevIOiRT-axKExEQu8-6neS-9FmHi2dnVdzCIa2tUktonrEUIw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 46BEEB6008D; Mon,  4 Mar 2024 06:27:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-205-g4dbcac4545-fm-20240301.001-g4dbcac45
MIME-Version: 1.0
Message-Id: <1baf9a7f-b0e4-45d8-ac57-0727a213d82d@app.fastmail.com>
In-Reply-To: <20240304112441.707ded23@donnerap.manchester.arm.com>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304112441.707ded23@donnerap.manchester.arm.com>
Date: Mon, 04 Mar 2024 12:26:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andre Przywara" <andre.przywara@arm.com>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 lkft-triage@lists.linaro.org, "Maxime Ripard" <mripard@kernel.org>,
 "Dave Airlie" <airlied@redhat.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Ard Biesheuvel" <ardb@kernel.org>
Subject: Re: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
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

On Mon, Mar 4, 2024, at 12:24, Andre Przywara wrote:
> On Mon, 04 Mar 2024 12:11:36 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:
>>
>> This used to be a 32-bit division. If the rate is never more than
>> 4.2GHz, clock could be turned back into 'unsigned long' to avoid
>> the expensive div_u64().
>
> Wouldn't "div_u64(clock, 200)" solve this problem?

Yes, that's why I mentioned it as the worse of the two obvious
solutions. ;-)

     Arnd
