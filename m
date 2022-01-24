Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0DE4985AE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 18:04:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1836189801;
	Mon, 24 Jan 2022 17:04:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E28B10E36D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 17:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6s1GdgDiN9WlfGFDxvzemW3LaqsHCD+moYByHcHllcs=; b=JmeSW7r2seFeejLWt5uqXR4cgF
 48CquFcOgd/Rx86kX2ONpPwGx7trwUi+UxZcZjz8RaYr9MbSZhZzrxGmGy7EyLCjuKEKCcUqpILtj
 r9oXf+Dh/SvsY3bzPkHlXs5DWeP+VYKzBvZJYPF3IyHqngoZTsu7gw9MmB48HgONQe7blyUXJVzKF
 27qmbCMLXjqZMaNgF31c3SsJ21cO6IsXneF/nxnNEE6uPkOShizYb7MEnrx2mXmzzc8Y6sOawhzM9
 YTxx2uRdOg5PSNCD+UYAq8XGHJv6hoapoZztll8bShdaHqvq0CtbrZ7u6rfNyoK0nL9uSEGPTActP
 oYY/GuVg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50953
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1nC2lg-0003rw-Mj; Mon, 24 Jan 2022 18:04:36 +0100
Message-ID: <73d6d94b-bde1-4d8e-ed36-eeb2ad2534d4@tronnes.org>
Date: Mon, 24 Jan 2022 18:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] dt-bindings: display: add bindings for MIPI DBI
 compatible SPI panels
To: Rob Herring <robh+dt@kernel.org>
References: <20220123172520.48741-1-noralf@tronnes.org>
 <20220123172520.48741-2-noralf@tronnes.org>
 <CAL_JsqJU_WFeJDt5jqLN9BQN2j_TCf3+0hKvbNSYwmg-2DSF=Q@mail.gmail.com>
 <931fab73-3a91-fda0-4af3-b48a1ad3c742@tronnes.org>
 <CAL_JsqLiw42zfaRPmszs2bmGbAcL5STSTVUtP0PyWnm=CaG8ug@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <CAL_JsqLiw42zfaRPmszs2bmGbAcL5STSTVUtP0PyWnm=CaG8ug@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, david@lechnology.com,
 dave.stevenson@raspberrypi.com, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, maxime@cerno.tech, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 24.01.2022 17.42, skrev Rob Herring:
> On Mon, Jan 24, 2022 at 10:28 AM Noralf Trønnes <noralf@tronnes.org> wrote:
>>
>>
>>
>> Den 24.01.2022 17.08, skrev Rob Herring:
>>> On Sun, Jan 23, 2022 at 11:25 AM Noralf Trønnes <noralf@tronnes.org> wrote:
>>>>
>>>> Add binding for MIPI DBI compatible SPI panels.
>>>
>>> I'm sure we already have MIPI DBI panels. What's this for?
>>>
>>
>> It aims to use one driver to cover all MIPI DBI panels where the
>> controller setup is loaded from userspace in a firmware file.
> 
> What's the solution when the user wants a splash screen in the
> bootloader and also wants multiple panels supported?
> 

In that case the bootloader needs builtin support for the screen. The OS
driver can then detect that the controller is configured and just skip
the configure stage. I have yet to see someone implement suppport for
such a SPI panel in a bootloader though.

> Also, 1 driver doesn't dictate 1 compatible. A one to many
> relationship is fine and makes the decision entirely the OS's.
> 
>> The cover
>> letter points to the discussion where Maxime proposed this:
>>
>> https://lore.kernel.org/dri-devel/20211129093946.xhp22mvdut3m67sc@houat/
> 
> The proposal there is:
> 
>> compatible = "panel-spi";
>> model = "panel-from-random-place-42";
> 
> The same thing can be accomplished with this:
> 
> compatible = "panel-from-random-place-42", "panel-spi";
> 
> What's the advantage of hijacking 'model'?
> 

That's what Maxime proposed, but having it in the compatible like this
is even better. I suppose it's ok for the driver to use the compatible
to load the firmware file?

Noralf.
