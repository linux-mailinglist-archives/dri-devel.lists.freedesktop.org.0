Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB79743AF6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 13:38:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47A10E453;
	Fri, 30 Jun 2023 11:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C78DE10E454
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 11:38:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8373F5C0927;
 Fri, 30 Jun 2023 07:34:44 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 30 Jun 2023 07:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1688124884; x=1688211284; bh=nc
 6UvgQb+g5X+pDtgRsF2kSeZKlYtDiySSTwTr4xAGw=; b=wMIZG81Y7VjD2pJxlr
 +o0pPZ6+2Bi7Gl1jYbpv5qs6xBnLIknF8VqJSkKuGRdIAHelbkP6VYAEjqsPfPhd
 4j3+ghiS9SPyTSF1LlmGZiBFk4vcJNFpO5wOWeIAcDIwiQJuqiv4TLXXL+1UxNlq
 k/k73r135NF4wDpr0+KhbPu1FDaMKLec2iv1VsvyguAW2k6W2vryV32OfSIgF37U
 gKYBXYs43HZ1nqMdzDoXqXLFBsJaoX9sEWV6bdi0uj07Gl966/UXPObDLlKdryP1
 Kz/kLUVWrtDqfog98mtyqsA3I8BOg/8T/1POMxr2RNKZ4feDYi4bdW24sDEaMoGX
 i5PQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688124884; x=1688211284; bh=nc6UvgQb+g5X+
 pDtgRsF2kSeZKlYtDiySSTwTr4xAGw=; b=LmfXaLj7L7ZXBfMoLblls9Xk62/jZ
 yV8BJTcwOQco6G7ELGObG+Qyn9rm1CtnNX+hXehTogXSExEJePgnwmk7KOLt9W39
 X1/ZXaift3sPkEJK8moAq/NZu0CtEaXRVQK5x/FpvUfWween3z3Na9uzy8swyCPQ
 GQXoNLtdaAL62T8z/jt3YpEZYnRiG2a//3/RZFzrBRXLfIZxyEfHx17g+HD0d708
 X6I077cvuJO2YQLlIm6zre2+xB5kGJIvbfe6yDkRoXkYsUbkfI814NOKY5ZwQoWj
 PJ3ISwPzxRC13AuW4nEp4+bHT3WQK+45unOjUoodcA9pqUAKcK6ysgNIQ==
X-ME-Sender: <xms:0r2eZF2bNQqG9q-xA0JWeQ1t0_sK2QJoQOJ6Imd7ncWsbM7HDfNvhw>
 <xme:0r2eZMHQGqpme9d3XyfgXOwp7OjZksHNUfucjcx3dhOtpURuTN2v_OQXaPim6o2hR
 AZniXdKUWOtV6S7OIg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeigdegtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeekudfggedvgfegffeffedvffelgfeludfhueefjeeiveektdevfeehjeffkeeh
 veenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:0r2eZF6gREwkk2oy-bQNkm_Xt3bKHwZIEhiWTdscx9w_t3e2m3tAvQ>
 <xmx:0r2eZC0o2MBD2bFzyAa39z1vYtqS9xY8DRMoc_QcEzdNZ1eAev6sdA>
 <xmx:0r2eZIFN4ZuQGLbWjMY6nT_5et0DgmueZ-DSiMpj9EeJ7Kiuz4iVrQ>
 <xmx:1L2eZOGj96hAkBrUSwVDCS11mlAFkB4f-BBj49ERkZ7P9u8ybvsMsg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 1EC18B60092; Fri, 30 Jun 2023 07:34:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <ea049651-32c5-42d7-96a0-fc236680a714@app.fastmail.com>
In-Reply-To: <87h6qpdy04.fsf@minerva.mail-host-address-is-not-set>
References: <20230629225113.297512-1-javierm@redhat.com>
 <20230629225113.297512-2-javierm@redhat.com>
 <723a3c51-7997-46d0-9262-68f33384a9e7@app.fastmail.com>
 <87h6qpdy04.fsf@minerva.mail-host-address-is-not-set>
Date: Fri, 30 Jun 2023 13:34:21 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] fbdev: Split frame buffer support in FB and FB_CORE
 symbols
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 30, 2023, at 12:51, Javier Martinez Canillas wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>
>>> @@ -59,7 +71,7 @@ config FIRMWARE_EDID
>>> 
>>>  config FB_DEVICE
>>>  	bool "Provide legacy /dev/fb* device"
>>> -	depends on FB
>>> +	depends on FB_CORE
>>>  	default y
>>>  	help
>>>  	  Say Y here if you want the legacy /dev/fb* device file and
>>
>> I don't see this symbol in linux-next yet, what tree are you using
>> as a base?
>>
>
> It's now in the drm-misc/drm-misc-next branch [1]. It's not in -next yet
> because it just landed a few days ago [2].
>
> [1]: https://cgit.freedesktop.org/drm/drm-misc/log/?h=drm-misc-next
> [2]: https://cgit.freedesktop.org/drm/drm-misc/commit/?id=701d2054fa3
>
> In fact, that's the reason why I rebased my previous attempt [0].

Ok.

I wonder if it would make sense to also make FB_DEVICE depend on FB
instead of FB_CORE then. I don't think there is any actual dependency
between the two, but as I understand we want modern distros to use
neither FB nor FB_DEVICE, so tying them together with a dependency
may be desirable anyway.


>>>  config FB_BACKLIGHT
>>>  	tristate
>>> -	depends on FB
>>> +	depends on FB_CORE
>>>  	select BACKLIGHT_CLASS_DEVICE
>>
>> Separating this one from FB_CORE would help avoid circular dependencies,
>> this one keeps causing issues.
>>
>
> You mean separating from FB or should I keep the existing depends on FB?
>
> It seems this is only used by fbdev drivers so probably the latter?

Right, I meant keeping the dependency on FB. Ideally we'd
turn this all into a set of 'depends on' instead of 'select',
but that is a completely separate topic.

    Arnd
