Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1044E87033A
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 14:49:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A411A112192;
	Mon,  4 Mar 2024 13:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="AmWRSk25";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="VAgEIm/0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 048E6112194
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 13:49:18 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id D5B5C138010B;
 Mon,  4 Mar 2024 08:49:17 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Mon, 04 Mar 2024 08:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm3; t=1709560157; x=1709646557; bh=BRaQGMUhZF
 +5gvPmzCZj10RTFRpRoCHi8lIQAFa6I38=; b=AmWRSk25knneYEOIKlZQ9P4pod
 w7Zzklals0aZcGl24S0l5doNkX4rUc+l/jiTAnJ/Xu98d07n5cwfJjFcHjGU+0H3
 4KWQcEyS9eesEKaQ4qvMetqJC3l60ZMQ0EMx6kHOWPNU3eIBPrmgNXq+JdokN/fC
 mDnl/nlvqVNSaJUKopHul8y4fnIdnUNdtIVOjHwiBPrDzTXUR/xsEr08hOeDcXN6
 aPhMTbEyA0gc74n/Jy4DyzcQ94hW7d8+IHuQS8lBDd6t3WEcdQomwnKRTl9tKEhD
 U17Es/Ue/hGgfpc2nD/JwwsM6gQ4gKnzoslNEeHTYlyvG1PwnnjLHSpyZeBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1709560157; x=1709646557; bh=BRaQGMUhZF+5gvPmzCZj10RTFRpR
 oCHi8lIQAFa6I38=; b=VAgEIm/0E/dM3PQQEGcKjdRAkjB52xCRMiOmUHipXPF6
 EOjCeHBFpV2jWZSMmSh9YRunduraSrgp0nFYo7MpzsPyFvOv5bMeDohJYa8chrBw
 CcgjFk2vHzMCs8pm0IaZ8u+DFTY4AFd+zF55rtpDE89bTaa0jmAXsgw0CGc2+RpH
 bxPz5scghGuO8wLvtNzkqnkPXutoJKXAX06OJDOWRXQmYzeBc2C3H4NIqdQq1WOj
 ttakdq2RKGiz9c/5s1H28skDrExUU3kkMJV5lSNjk+R/DeLc8DKa7Q+mV03XTScq
 wxfcNb0bwfb3Nn3OhkV3ePgtB0ZssPOsut5T/rttIA==
X-ME-Sender: <xms:XdHlZU-1-ZnHZ7iRn66pd8kJL3f2lnnJWpNMBzUqo5GHakhBFgHbYw>
 <xme:XdHlZctIAdfdnTPOkErAzD6tcHkhx_Z30FC_85rVP_kiM5ThI13N8fA2b2S-NClci
 5thPFQGkSkZHns9Ll8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrheejgdehhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:XdHlZaC4ds8JJ8D4G2yGujtYaloJSPg26lo6xIJ_jov-4U4WSHDohQ>
 <xmx:XdHlZUfIzzdXKnPhrkgE0KFCUmhxtJ8W6_GU06pcmZJZe_y4AkrVJg>
 <xmx:XdHlZZPUH-EFk838YNgLGI2KF_v3cViyIWYiVkHMVXwJy-C-RoxrsQ>
 <xmx:XdHlZaGxwGtBp2WAhh3bmnvTtWPbZsOBY3rNBmxnlwo8_uz5Tg9wcA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 9AD75B6008D; Mon,  4 Mar 2024 08:49:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-205-g4dbcac4545-fm-20240301.001-g4dbcac45
MIME-Version: 1.0
Message-Id: <61aa333f-aa13-4068-b73f-eeae615f4640@app.fastmail.com>
In-Reply-To: <CAMj1kXENYqUx=esK9b_pGd4wpwE43fNaGRCUhJLK_4MQzrAQeg@mail.gmail.com>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
 <20240304112441.707ded23@donnerap.manchester.arm.com>
 <1baf9a7f-b0e4-45d8-ac57-0727a213d82d@app.fastmail.com>
 <20240304114546.4e8e1e32@donnerap.manchester.arm.com>
 <badf279a-f1fa-4938-a5d2-492b89d7c27c@app.fastmail.com>
 <CAMj1kXENYqUx=esK9b_pGd4wpwE43fNaGRCUhJLK_4MQzrAQeg@mail.gmail.com>
Date: Mon, 04 Mar 2024 14:48:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ard Biesheuvel" <ardb@kernel.org>
Cc: "Andre Przywara" <andre.przywara@arm.com>,
 "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "Linux ARM" <linux-arm-kernel@lists.infradead.org>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 lkft-triage@lists.linaro.org, "Maxime Ripard" <mripard@kernel.org>,
 "Dave Airlie" <airlied@redhat.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>
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

On Mon, Mar 4, 2024, at 14:01, Ard Biesheuvel wrote:
> On Mon, 4 Mar 2024 at 13:35, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Mon, Mar 4, 2024, at 12:45, Andre Przywara wrote:
>> It's not critical if this is called infrequently, and as Maxime
>> just replied, the 64-bit division is in fact required here.
>> Since we are dividing by a constant value (200), there is a good
>> chance that this will be get turned into fairly efficient
>> multiply/shift code.
>>
>
> Clang does not implement that optimization for 64-bit division. That
> is how we ended up with this error in the first place.

I meant it will use the optimization after the patch to convert
the plain '/' to div_u64().

> Perhaps it is worthwhile to make div_u64() check its divisor, e.g.,
>
> --- a/include/linux/math64.h
> +++ b/include/linux/math64.h
> @@ -127,6 +127,9 @@
>  static inline u64 div_u64(u64 dividend, u32 divisor)
>  {
>         u32 remainder;
> +
> +       if (IS_ENABLED(CONFIG_CC_IS_GCC) && __builtin_constant_p(divisor))
> +               return dividend / divisor;
>         return div_u64_rem(dividend, divisor, &remainder);
>  }

I think the div_u64()->do_div()->__div64_const32()->__arch_xprod_64()
optimization in asm-generic/div64.h already produces what we want
on both compilers. Is there something missing there?

     Arnd
