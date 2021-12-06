Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C3846A09C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 17:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F301A6F902;
	Mon,  6 Dec 2021 16:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC47C6E49F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Dec 2021 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2epoAf2lUXqG0LoZXcquZka33t9goGRmiuRxD8PmsgE=; b=GolYI1fHrt4U+XsASD+aZcpHDm
 aEzYCiTSmm1v+3u0CgSAfs9RDQgzk84O45eckS5eHs1tWYy3JzJfKF/ZXqBd/aPoptDTgyVx9U2LJ
 XiesCkh9jtstIJCydKpn3frLNFRKKX5vmpRurOwbW+jgE6JB7jKhvKx+K6QwUGQbXYlHDdk4zKkEV
 gxX7QfmEe7wZ4RC0fZbpfgPXibgwVP4zQhCHwEg0AsynsUd12iNvQamrt9mv06OpQGO2QtD5a5A2Y
 OSl2lycDr0ZLEEgaIgr3bJLGpHXLNpWdp7xZCYnNBExf4qS1W3Z6vn3Q3oMOSst0vjYj52y88DOxy
 56WKZ0ig==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:58493
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1muGTj-0001B0-Nj; Mon, 06 Dec 2021 17:04:35 +0100
Message-ID: <998fa525-d4f1-b0a7-d233-e6d1ebc506bc@tronnes.org>
Date: Mon, 6 Dec 2021 17:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
To: David Lechner <david@lechnology.com>, Maxime Ripard <maxime@cerno.tech>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
 <20211129093946.xhp22mvdut3m67sc@houat>
 <ca9e432a-6b04-9935-2469-135a9b47514e@tronnes.org>
 <20211201145237.6ezs4pwkmku3pesv@houat>
 <1fec2480-195a-b1ec-a58e-caedf7798019@lechnology.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <1fec2480-195a-b1ec-a58e-caedf7798019@lechnology.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 06.12.2021 16.26, skrev David Lechner:
> On 12/1/21 8:52 AM, Maxime Ripard wrote:
>> Hi Noralf,
>>
>> On Tue, Nov 30, 2021 at 03:30:11PM +0100, Noralf Trønnes wrote:
>>> Den 29.11.2021 10.39, skrev Maxime Ripard:
>>>> On Wed, Nov 24, 2021 at 04:03:07PM -0600, David Lechner wrote:
>>>>> On 11/24/21 9:07 AM, Noralf Trønnes wrote:
>>>> I agree that it doesn't really fit in the DT either though. Noralf,
>>>> what
>>>> kind of data do we need to setup a display in fbtft? The init sequence,
>>>> and maybe some enable/reset GPIO, plus some timing duration maybe?
>>>>
>>>> There's one similar situation I can think of: wifi chips. Those also
>>>> need a few infos from the DT (like what bus it's connected to, enable
>>>> GPIO, etc) and a different sequence (firmware), sometimes different
>>>> from
>>>> one board to the other.
>>>>
>>>> Could we have a binding that would be something like:
>>>>
>>>> panel@42 {
>>>>      compatible = "panel-spi";
>>>>      model = "panel-from-random-place-42";
>>>>      enable-gpios = <&...>;
>>>> }
>>>>
>>>> And then, the driver would request the init sequence through the
>>>> firmware mechanism using a name generated from the model property.
>>>>
>>>> It allows to support multiple devices in a given system, since the
>>>> firmware name wouldn't conflict, it makes a decent binding, and users
>>>> can adjust the init sequence easily (maybe with a bit of tooling)
>>>>
>>>> Would that work?
>>>
>>> I really like this idea. An added benefit is that one driver can handle
>>> all MIPI DBI compatible controllers avoiding the need to do a patchset
>>> like this for all the various MIPI DBI controllers. The firmware will
>>> just contain numeric commands with parameters, so no need for different
>>> controller drivers to handle the controller specific command names.
>>>
>>> The following is a list of the MIPI DBI compatible controllers currently
>>> in staging/fbtft: ili9341, hx8357d, st7735r, ili9163, ili9163, ili9163,
>>> ili9163, ili9486, ili9481, tinylcd, s6d02a1, s6d02a1, hx8340bn, ili9340.
>>>
>>> The compatible needs to be a bit more specific though since there are 2
>>> major SPI protocols for these display: MIPI DBI and the one used by
>>> ILI9325 and others.
>>>
>>> The full binding would be something like this:
>>>
>>> panel@42 {
>>>     compatible = "panel-mipi-dbi-spi";
>>>     model = "panel-from-random-place-42";
>>>
>>>     /* The MIPI DBI spec lists these powers supply pins */
>>>     vdd-supply = <&...>;
>>>     vddi-supply = <&...>;
>>>
>>>     /* Optional gpio to drive the RESX line */
>>>     reset-gpios = <&...>;
>>>
>>>     /*
>>>      * D/CX: Data/Command, Command is active low
>>>      * Abcense: Interface option 1 (D/C embedded in 9-bit word)
>>>      * Precense: Interface option 3
>>>      */
>>>     dc-gpios = <&...>;
>>>
>>>     /*
>>>      * If set the driver won't try to read from the controller to see
>>>      * if it's already configured by the bootloader or previously by
>>>      * the driver. A readable controller avoids flicker and/or delay
>>>      * enabling the pipeline.
>>>      *
>>>      * This property might not be necessary if we are guaranteed to
>>>      * always read back all 1's or 0's when MISO is not connected.
>>>      * I don't know if all setups can guarantee that.
>>>      */
>>>     write-only;
>>>
>>>     /* Optional ref to backlight node */
>>>     backlight = <&...>;
>>> }
>>
>> It looks decent to me. We'll want Rob to give his opinion though, but it
>> looks in a much better shape compared to what we usually have :)
>>
>>> Many of these controllers also have a RGB interface option for the
>>> pixels and only do configuration over SPI.
>>> Maybe the compatible should reflect these 2 options somehow?
>>
>> I think we'll want a "real" panel for RGB, with its own compatible
>> though. We have a few of these drivers in tree already, so it's better
>> to remain consistent.
>>
>> Maxime
>>
> 
> I'm on board with the idea of the init sequence as firmware as well.
> 
> It looks like Rob might have missed this thread, so maybe just apply
> the acked patches and submit a v2 with the firmware implementation?
> 

Yes, that's my plan.

Noralf.
