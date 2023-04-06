Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786D6D9A90
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 16:38:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75B710EC0A;
	Thu,  6 Apr 2023 14:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DDF10EC0A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 14:38:01 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id D62C5320085B;
 Thu,  6 Apr 2023 10:37:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 06 Apr 2023 10:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1680791878; x=1680878278; bh=ox
 2ZTXVsnbCyF5ePDD8wIyzUaomnw6wvo09Yg9xH4yE=; b=Xl+ravcsiPsKVk2KkL
 I2jaNWP6SsVzgj0l2AAUmdwcsWH8WBvAQaHcPNWK+oWtxSG5v8oft3mEiGrfSX+O
 oOOyht5MAlRfGzJVVW/iK2pv4kUDma72keV05qqQR8UC9Pc42i0O9T9EHpbWfV2q
 dhneyZXVZjxAxknA+NZ3ltAeelllUc2qY1dUTPlVHUWQKRYu1HGioEopE0mqBp1x
 yAl5Qo49dkA9pIDgeovoR8Wtmb0YUeabZaE1fHuoRFtZXdWYnqKR3cGRvxX3PLsI
 WCdrwJwIgl81qkWG+GkEin7JO5Vdh2sfir2w6BIffO16YKeBp9i2LWc6dH7NCOlY
 2Feg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680791878; x=1680878278; bh=ox2ZTXVsnbCyF
 5ePDD8wIyzUaomnw6wvo09Yg9xH4yE=; b=GJfsiXySiyLf/aSKQME9Omi9YYhQr
 CBUMzH5Uu43SH4QKDtYKPdBAJfuqP0NYP8lJWaRmtwPVtNV7viKv4fLZGelyBqMK
 J5Qna0pHObrbrHvqZPnhXi74n8rFpFnA2IhtqhvDkY3Z4V+VtO1Mf625SU81oW1O
 fZ7gI045b0yaHjkgJUFjqkjCPcT9n75w4QICk0wh0D0JSwWkLoz/7o543vEbuZi5
 3gbR+G+lSU0RNbFT5kHLJQRV5kzSUkuNvJ66O5Oi0u+VQ5cdF+pUKK8toGyIkV/Q
 rkuRD9xppnn4JB0zMQ6IdR/RkvatfyUfnN/l9S6EkQxCzLpAoyGjeVpog==
X-ME-Sender: <xms:RtkuZCqf42ix84osUCEK9qBmJpUY0MWD5aN0kUufTQmfAJCPAI9ePQ>
 <xme:RtkuZAqdmJirzfxks01q6UkJQGYetIRs4WOepWBxGJcXFoPE90E4G-icR0GYMnVOt
 VJ4Ttz8oAhfswFsqN0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgjeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:RtkuZHMxqn64kqiLOVgPSyYvg7svJqv-ByDyemeaeZD3anI6mqKv_Q>
 <xmx:RtkuZB7My2vHt6AwrHQt_rAYHS5WUC7Rj_Thxx6629TSM03aenFM8g>
 <xmx:RtkuZB6hFGsGfZM8nFH_fIefgRcisw4z8faenvM5ePqi-0oFIPgF4Q>
 <xmx:RtkuZCPXreSStp1HAL25jNK0qQrYTDcw3TjgITOQ56G92NdX7CTSpQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 216BEB60093; Thu,  6 Apr 2023 10:37:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <3ff4e8c4-9c4d-4694-bc34-d7778958770e@app.fastmail.com>
In-Reply-To: <20230406143019.6709-2-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-2-tzimmermann@suse.de>
Date: Thu, 06 Apr 2023 16:37:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 6, 2023, at 16:30, Thomas Zimmermann wrote:
> Generic implementations of fb_pgprotect() and fb_is_primary_device()
> have been in the source code for a long time. Prepare the header file
> to make use of them.
>
> Improve the code by using an inline function for fb_pgprotect()
> and by removing include statements. The default mode set by
> fb_pgprotect() is now writecombine, which is what most platforms
> want.
>
> Symbols are protected by preprocessor guards. Architectures that
> provide a symbol need to define a preprocessor token of the same
> name and value. Otherwise the header file will provide a generic
> implementation. This pattern has been taken from <asm/io.h>.
>
> v2:
> 	*  use writecombine mappings by default (Arnd)
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Arnd Bergmann <arnd@arndb.de>
