Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE5338BE9
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 12:53:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490C46F5D8;
	Fri, 12 Mar 2021 11:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BA16F5D8
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 11:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TcGONRPmElVmn+nKEitd4aH/duF2ZwstRExKwPJUL2o=; b=ETbv1QJmTN9B/8/lH7duYCbHMV
 tulmk31VTbT3r/69cmXC4GsWB0ySDUF6RYtH2lUOWazE8qFWnZfW3zOqoVyQQoUfqZuZXhsXCMkiG
 sdNr1PT+1LgAbUepTN/uKU6+vXiqO1FWe+rwAf63/UWLgymshN16aczw3HMAIG1IZgPGDACQ+55Zk
 VsLyoUZCt49JB2VLJlRnBMx44WddY85kz9V/KPaRxmZj+2l20QlsnaWa6B5+O7jXu6VH4KBvfv49Q
 u5cnm1ssLrWx0r4qGWqdxvpcH2PXXuCRbPtjxphxDZoKvd1WL/pNPh4NR84AkOiOITGQQO3hJQ4Hw
 44o6dIUQ==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=63321)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lKgMJ-0004yU-Jf; Fri, 12 Mar 2021 12:53:35 +0100
Subject: Re: [PATCH v7 3/3] drm: Add GUD USB Display driver
To: Peter Stuge <peter@stuge.se>, Ilia Mirkin <imirkin@alum.mit.edu>
References: <20210310045544.28961.qmail@stuge.se>
 <1894f3f7-bd1d-493e-8d7f-8c10917da51b@tronnes.org>
 <20210311144839.29454.qmail@stuge.se>
 <04a86207-325c-8170-6692-a87ec3b0fe4c@tronnes.org>
 <20210311200226.1166.qmail@stuge.se>
 <CAKb7UvihLX0hgBOP3VBG7O+atwZcUVCPVuBdfmDMpg0NjXe-cQ@mail.gmail.com>
 <20210311225751.2721.qmail@stuge.se>
 <CAKb7UvgRLa=_4vzeFS-ws6T28S_j8yz8Jq_ONowPcBKaBHwYkw@mail.gmail.com>
 <20210312043236.5102.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <b8a135eb-a6a9-b66a-012b-6ba833dfb074@tronnes.org>
Date: Fri, 12 Mar 2021 12:53:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312043236.5102.qmail@stuge.se>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, th020394@gmail.com,
 lkundrak@v3.sk, pontus.fuchs@gmail.com, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 12.03.2021 05.32, skrev Peter Stuge:
> Ilia Mirkin wrote:
>> XRGB8888 means that the memory layout should match a 32-bit integer,
>> stored as LE, with the low bits being B, next bits being G, etc. This
>> translates to byte 0 = B, byte 1 = G, etc. If you're on a BE system,
>> and you're handed a XRGB8888 buffer, it still expects that byte 0 = B,
>> etc (except as I outlined, some drivers which are from before these
>> formats were a thing, sort of do their own thing). Thankfully this is
>> equivalent to BGRX8888 (big-endian packing), so you can just munge the
>> format.
> 
> I understand! Thanks a lot for clarifying.
> 
> It makes much more sense to me that the format indeed describes
> what is in memory rather than how pixels look to software.
> 
> 
>>>> I'm not sure why you guys were talking about BE in the first place,
>>>
>>> I was worried that the translation didn't consider endianess.
>>
>> The translation in gud_xrgb8888_to_color definitely seems suspect.
> 
> So to me this means that the gud_pipe translations from XRGB8888 to the
> 1-bit formats *do* have to adjust for the reversed order on BE.
> 
> 
>> There's also a gud_is_big_endian, but I'm guessing this applies to the
>> downstream device rather than the host system.
> 
> gud_is_big_endian() is a static bool wrapper around defined(__BIG_ENDIAN)
> so yes, it applies to the host.
> 
> With memory layout being constant I again think gud_xrgb8888_to_color()
> needs to take further steps to work correctly also on BE hosts. (Maybe
> that's le32_to_cpu(*pix32), maybe drm_fb_swab(), maybe something else?)
> 
> 
>> I didn't check if dev->mode_config.quirk_addfb_prefer_host_byte_order
>> is set
> 
> I can't tell if that's helpful, probably Noralf can.
> 

I skimmed a discussion a while back around BE and all it's problems
through the whole graphics stack and my take away was that I needed a BE
machine so I could test the whole stack to make sure it works.
Judging from what Ilia says I've been wrong in my assumptions so the
driver is probably broken on BE (along with my SPI display drivers).
I'm not going to try and fix this now, I need someone with a BE machine
that can test the whole stack and make sure it actually works. Me doing
more guesswork is not going to work out well I think :)

I'll add a FIXME in gud_pipe.c that BE is probably broken and link to
this discussion.

It seems Gerd did some work to fix BE in the kernel:
drm: byteorder fixes
https://patchwork.freedesktop.org/series/49073/

But that seems to deal with the format value itself and not the buffer
contents.

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
