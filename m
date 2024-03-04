Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 695B0870198
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 13:35:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A1710E5BB;
	Mon,  4 Mar 2024 12:35:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="T9/BQtSi";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="E6PLUkad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com
 [103.168.172.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDE110E5BB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 12:35:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 08E0713800B1;
 Mon,  4 Mar 2024 07:35:10 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 04 Mar 2024 07:35:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1709555710; x=1709642110; bh=+TroZF8jeB
 zIowpYrGF9jrP9uh+0X1BM1HbguhEHK/Y=; b=T9/BQtSiILQpMCnqJv+UGt4nim
 DKXKwfSy6GCSmU9MI/Pjsfj44Z3Wenf6/LEy+I4ZoIzLMkMgMHF+PhBwQrEQSd4R
 3rZ34vnDWPzOLcBAQ62+F62GS/PCSwLGOjzWb+4HYu61h70JZQCIMRnQeh4xv94L
 RqYEnHdxXR+DuyS6xSsASBQtPM6SWEa9H5ufn4ujyn/GfVm6eqdJVo0J2tl1Q9JN
 osTb1ZoBQT/GDSHLKe+qDqnCkft9Ctrbkk5rdzz0PysbgoloPjWfVGYPC/WFEi3S
 fwraymKJf8Oz5X0l6etK+pq0APaTc34fcxeJ/yGvKIwwpEcW1Cueh3TlRW2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709555710; x=1709642110; bh=+TroZF8jeBzIowpYrGF9jrP9uh+0
 X1BM1HbguhEHK/Y=; b=E6PLUkad/4kqaHFHfUpwwh4uJpCKtRVopl24PVUHG9Mw
 LECgX5ZE9tMDn2FoHcmaohB658HUZmtIEw/WZy3lnp1a/CWLhvo2ivZz6E7VADD0
 62B/D08u2/oLOME9TQj8WnUl4qtdfDQvJoaRgVNeIrOzjw+tSSGK8jYnQdxMteWO
 B68q0Iind1V77AMyiOD0AvrLeopaQo55R7a69/krkZWyZVLFhaPCYOUN6nDofW94
 sxV5UjKcnlMguzeNrZFy9PHtSJbq8oMRGtSY1qWVoWlxqqrTvJjKoCzJMaxjcR0z
 PA3GyhuUq7W/yzGqROK+aw8iiAxFUrplNkVwb/B/ew==
X-ME-Sender: <xms:_b_lZejkpGfPnkZ6rWHmnlF83ytm5tLUqBDv525-BSP26reAj07lWw>
 <xme:_b_lZfACtMQggRtzKMcil5im_zd8ZbalEEKkC-rfuv8tx8uUhDTIOuJUqTPf6H8zF
 i4LkP3AMKbjW3Re-Kk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheejgdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:_b_lZWE46UepRGStc-ln7gow_V2jQP-_Q_XxHslclj-_ee0Oz5Yl-w>
 <xmx:_b_lZXSTQ4OTlJjnlshezWanXyeIh7YpBpBVHTBFpEUGfZJ7tncL1A>
 <xmx:_b_lZbzEc11JtuWNBa_9xbo1ZfetGIJ_nairqqjxFQaF5dkINnhbxw>
 <xmx:_r_lZQr-hNcmlRBZu5F-5E4vJ6n1LfLuyiyftEFvlDNfCRd2z4rDrg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id AA096B6008F; Mon,  4 Mar 2024 07:35:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-205-g4dbcac4545-fm-20240301.001-g4dbcac45
MIME-Version: 1.0
Message-Id: <badf279a-f1fa-4938-a5d2-492b89d7c27c@app.fastmail.com>
In-Reply-To: <20240304114546.4e8e1e32@donnerap.manchester.arm.com>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304112441.707ded23@donnerap.manchester.arm.com>
 <1baf9a7f-b0e4-45d8-ac57-0727a213d82d@app.fastmail.com>
 <20240304114546.4e8e1e32@donnerap.manchester.arm.com>
Date: Mon, 04 Mar 2024 13:34:49 +0100
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

On Mon, Mar 4, 2024, at 12:45, Andre Przywara wrote:
> On Mon, 04 Mar 2024 12:26:46 +0100
> "Arnd Bergmann" <arnd@arndb.de> wrote:
>
>> On Mon, Mar 4, 2024, at 12:24, Andre Przywara wrote:
>> > On Mon, 04 Mar 2024 12:11:36 +0100 "Arnd Bergmann" <arnd@arndb.de> wrote:  
>> >>
>> >> This used to be a 32-bit division. If the rate is never more than
>> >> 4.2GHz, clock could be turned back into 'unsigned long' to avoid
>> >> the expensive div_u64().  
>> >
>> > Wouldn't "div_u64(clock, 200)" solve this problem?  
>> 
>> Yes, that's why I mentioned it as the worse of the two obvious
>> solutions. ;-)
>
> Argh, should have cleaned my glasses first ;-)
>
> I guess I was put somehow put off by the word "expensive". While it's
> admittedly not trivial, I wonder if we care about the (hidden) complexity
> of that function? I mean it's neither core code nor something called
> frequently?

It's not critical if this is called infrequently, and as Maxime
just replied, the 64-bit division is in fact required here.
Since we are dividing by a constant value (200), there is a good
chance that this will be get turned into fairly efficient
multiply/shift code.

> I don't think we have any clock exceeding 3GHz at the moment, but it
> sounds fishy to rely on that.

Right, it's just important to look at each case individually.
The cost of 64-bit division is crazy if it gets called repeatedly,
which is of course the entire reason we don't provide a
__aeabi_uldivmod() function and require developers to think
before adding div_u64().

     Arnd
