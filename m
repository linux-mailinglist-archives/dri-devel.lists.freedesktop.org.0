Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D71E78B139D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 21:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A755C10F7EB;
	Wed, 24 Apr 2024 19:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="FXB+EDJM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FA910F7EB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 19:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1713987285; x=1714592085; i=deller@gmx.de;
 bh=CIUnUYKAT2q07NOCTFGXVBu6qvyL07NRUyXAhaxL3cM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FXB+EDJMWfKXzdrIt6zy0zKbO40VD/SnYPX6KuOs+l5z0brCLDkVwO2MVOrAMxNl
 h8XLnAmB6zRSKq4yaqeyN9PC6L2YWI1pr4ujy5gX7LQl0shdkW7VCyMj7/PKln5MO
 w8Oq4l76XUOot1r8DZx4YgiL3NGm2ALx6Na1fTBuZDsDqqOeqvtw0P87w9k3T7Wpj
 P8xTAKko5OPAa1ncw4xUTF9ehOQHNZ8mBHlxVc4Xp3YpPBbwmsk/eXmtlTkxdPR+f
 SUKeLeXoMAVfaIfLc/5k3pi1px34iGydZwkTZ2tnwG/j5gcoHIg5N6BtJulTqwPUS
 y4Ub1W6KbIWGVYK8VA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([89.244.184.72]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNh7-1scatS0Bh9-00ftoC; Wed, 24
 Apr 2024 21:29:21 +0200
Message-ID: <3eb5b0b4-f025-4396-9d52-05c59d6b904b@gmx.de>
Date: Wed, 24 Apr 2024 21:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] video: Handle HAS_IOPORT dependencies
To: Arnd Bergmann <arnd@kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>, Helge Deller <deller@kernel.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20240410142329.3567824-1-schnelle@linux.ibm.com>
 <20240410142329.3567824-2-schnelle@linux.ibm.com> <Zhfs8CN5XdgldKUn@carbonx1>
 <26c23fb8557d806c12a246caa575e4f4fc4ea27a.camel@linux.ibm.com>
 <a666e39d-a894-4e27-aac4-65d11a18358a@app.fastmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <a666e39d-a894-4e27-aac4-65d11a18358a@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nbBacxTuYFEkXeSr+U9wiH2g2D4A2ChvfA22yvIGH3MEZB6EsWn
 ke9Aglxusz1k1PcF82I8QDm+KD6tC72+PSLVKlBe0zwzdT+URLDjZAQlCb9ppt97A8ye77y
 9j7A3vzw75Jtf6fT+6dhUEUkHO100SWK+bQPnlsIwL6qHvEXFEMo5rC0NJoiJbosDx73FEz
 YeKzN2t21i1HhkjXDJiRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:5nu8BzNhuYk=;2m8vMOU9KvRxm7So486PYW3J9d5
 Lu/xbL+1jQ3PTybXxshBXPA5FzFF6oDhtx3N/qTRN+32gCq90hEkuHVZBTLnerW3rnCa0Z46i
 J6rIRVFP9S9FtY3i91y1tGzL1cozKhzEAOYLvdJ0EevEwWitP4rAQ306FADAFe/BaaXfiAqln
 lq3/Pxkm7eXDd1khCuAZz422Z3XNcRPPeUJPe11Cfe7bI2IZCEiYm+UYkf8RS98s0SBagOlwS
 xtKvVISc6fYW/A+qt/2qINShENP7FZATLWRa6WE4G7ApdI81i9JYLXtB/AzyPVjQ/0D5MqapZ
 gpg6vOvb44EV4/9xsmXfbs5K1gGE+LBTnjv8DHVp4HFZSpDmdONPUaOlTtypowb7lhDx84HB3
 pYsDwoq1q/5n9d3M8HEtWUf1sT2Tg/QRyD4yv8zQh5qviv4rCHjke4ZjjKgv9U/P/QBhrV4Vd
 DDHNfl6HM2xKY0tc39oH3zjOlD7SKr8/W5SEHgnWgCsbyvo2LghIj+HnjK63dD4VaImJLyMcm
 FQSzl2CJaeoaLYoLKHWqHIsSbaRy7K4dqTzJ/AjllUOFXiywMv065E9N39G77BoGzqxAX7mOF
 yD72uWu/Yab4mCFR6ZtQx7LHVxKzaa6GDZeCZK8uMo6eef31Rb9gazrYT8MvNRhM19TltDQKZ
 AOjUy/z8Z41MTvCiBjqRD3IXTTa/paPuw2P8jyOeXyqxzcaTBzfoD3uJ+sCAxp55O7Anajf0c
 EsJbI3/vuUhMayzh7LFvYvyoiBO3hx8Adn6COL5u/SsuEco5oCb+wgngPS7mxYo+V1A4fqLOu
 WjrmK89iCBJvYfwbzcFB3JlDSXOuwF3U8KAox2vjMpQ1Y=
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

On 4/22/24 21:28, Arnd Bergmann wrote:
> On Mon, Apr 22, 2024, at 10:34, Niklas Schnelle wrote:
>> On Thu, 2024-04-11 at 16:00 +0200, Helge Deller wrote:
>>> * Niklas Schnelle <schnelle@linux.ibm.com>:
>>>> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friend=
s at
>>>> compile time. We thus need to #ifdef functions and their callsites wh=
ich
>>>> unconditionally use these I/O accessors. In the include/video/vga.h
>>>> these are conveniently all those functions with the vga_io_* prefix.
>>>
>>> Why don't you code it like in the patch below?
>>> inb_p(), outb_p() and outw() would then need to be defined externally
>>> without an implementation so that they would generate link time errors
>>> (instead of compile time errors).
>>
>> This may be personal preference but I feel like link time errors would
>> be very late to catch a configuration that can't work. Also this would
>> bypass the __compiletime_error("inb()) requires CONFIG_HAS_IOPORT");
>> added instead of the in*()/out*() helpers to make it easy to spot the
>> problem.
>>
>> I'm not a fan of #ifdeffery either but I think in this case it is
>> simple, well enough contained and overall there aren't that many spots
>> where we need to exclude just some sections of code vs entire drivers
>> with vga.h probably being the worst of them all.
>
> Agreed. I also tried to see if we can move stuff out of vga.h
> to have it included in fewer places, as almost everything that
> uses this header already has a HAS_IOPORT dependency, but that
> would be a lot more work.
>
> The other one that gains a few ugly #ifdefs is the 8250 driver,
> everything else is already merged in linux-next or needs a simple
> Kconfig dependency.
>
> I think we can make the vga.h file a little more readable
> by duplicating the functions and still keep the __compiletime_error()
> version in asm/io.h, see below.

Ok.
I assume you or Niklas will then send an updated patch?

Helge


> diff --git a/include/video/vga.h b/include/video/vga.h
> index 947c0abd04ef..7e1d8252b732 100644
> --- a/include/video/vga.h
> +++ b/include/video/vga.h
> @@ -197,6 +197,23 @@ struct vgastate {
>   extern int save_vga(struct vgastate *state);
>   extern int restore_vga(struct vgastate *state);
>
> +static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned s=
hort port)
> +{
> +	return readb (regbase + port);
> +}
> +
> +static inline void vga_mm_w (void __iomem *regbase, unsigned short port=
, unsigned char val)
> +{
> +	writeb (val, regbase + port);
> +}
> +
> +static inline void vga_mm_w_fast (void __iomem *regbase, unsigned short=
 port,
> +				  unsigned char reg, unsigned char val)
> +{
> +	writew (VGA_OUT16VAL (val, reg), regbase + port);
> +}
> +
> +#ifdef CONFIG_HAS_IOPORT
>   /*
>    * generic VGA port read/write
>    */
> @@ -217,22 +234,6 @@ static inline void vga_io_w_fast (unsigned short po=
rt, unsigned char reg,
>   	outw(VGA_OUT16VAL (val, reg), port);
>   }
>
> -static inline unsigned char vga_mm_r (void __iomem *regbase, unsigned s=
hort port)
> -{
> -	return readb (regbase + port);
> -}
> -
> -static inline void vga_mm_w (void __iomem *regbase, unsigned short port=
, unsigned char val)
> -{
> -	writeb (val, regbase + port);
> -}
> -
> -static inline void vga_mm_w_fast (void __iomem *regbase, unsigned short=
 port,
> -				  unsigned char reg, unsigned char val)
> -{
> -	writew (VGA_OUT16VAL (val, reg), regbase + port);
> -}
> -
>   static inline unsigned char vga_r (void __iomem *regbase, unsigned sho=
rt port)
>   {
>   	if (regbase)
> @@ -258,7 +259,25 @@ static inline void vga_w_fast (void __iomem *regbas=
e, unsigned short port,
>   	else
>   		vga_io_w_fast (port, reg, val);
>   }
> +#else
>
> +static inline unsigned char vga_r (void __iomem *regbase, unsigned shor=
t port)
> +{
> +	return vga_mm_r(regbase, port);
> +}
> +
> +static inline void vga_w(void __iomem *regbase, unsigned short port, un=
signed char val)
> +{
> +	vga_mm_w (regbase, port, val);
> +}
> +
> +static inline void vga_w_fast (void __iomem *regbase, unsigned short po=
rt,
> +			       unsigned char reg, unsigned char val)
> +{
> +	vga_mm_w_fast(regbase, port, reg, val);
> +}
> +
> +#endif
>
>   /*
>    * VGA CRTC register read/write

