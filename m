Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8E2544D1E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 15:08:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94B6D112E8C;
	Thu,  9 Jun 2022 13:08:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mr3.vodafonemail.de (mr3.vodafonemail.de [145.253.228.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7678A112E8C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 13:08:33 +0000 (UTC)
Received: from smtp.vodafone.de (unknown [10.0.0.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mr3.vodafonemail.de (Postfix) with ESMTPS id 4LJktR4S7fz20Rf
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arcor.de;
 s=vfde-mb-mr2-21dec; t=1654780111;
 bh=KhvKfjg3BUt5QsQHpd1oxS5sJu7LWs+iRxpZlu41zns=;
 h=Message-ID:Date:User-Agent:Subject:Content-Language:To:References:
 From:In-Reply-To:Content-Type:From;
 b=fEq7ZJdrd3EnHzaK8tHYT6vvNrtNldlW3/b0ejBPrcjFPQpNwY3g/I/4qg6IIvXjZ
 hpqAlxu01PBHdjbXg9ZkejtFL0J5sV34ujKU3Tg+vauvJRlMyFo/OE6cYIgwf4fQhp
 vylJslkH9PZr8u1WcdXj0BduJoeVFqe7n0UReNg0=
Received: from schreibtisch (p2e579e8f.dip0.t-ipconnect.de [46.87.158.143])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.vodafone.de (Postfix) with ESMTPSA id 4LJktQ5K7Yz9wMx
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 13:08:27 +0000 (UTC)
Message-ID: <d4d19e5d-360e-f62f-ea8d-229a85803bc1@arcor.de>
Date: Thu, 9 Jun 2022 15:08:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Language: en-US
To: dri-devel@lists.freedesktop.org
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
From: Peter Mattern <pmattern@arcor.de>
In-Reply-To: <20220608143605.x4arwudst3nqeg7b@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-type: clean
X-purgate: clean
X-purgate-size: 1596
X-purgate-ID: 155817::1654780110-0000049E-51E070F7/0/0
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

 > If I understand you properly, it results in a blank screen if the
 > monitor is connected, but the system is still responsive?
Yes. Similar to (the other) Peter's findings, the system is fully 
responsive, it's just that the monitor is displaying a black screen.
Meanwhile I stumbled upon another detail: when the problem is manifest, 
the monitor's LED displaying whether a signal is available keeps shining 
permanently. I does not start flashing as it does when an attached 
computer is switched off.

 > If so, it's a very different problem than the link you provided, since
 > it was occurring when no monitor was connected and resulted in a total
 > system hang.
I didn't follow up things too closely. But I remember very well that I 
stumbled upon that thread "Linux 5.16.3 breaks headless Raspberry Pi 3 
boot, again" while I was facing the exact same problem we're discussing 
right now. Also, some findings in the Arch Linux ARM forums were similar 
then [1].
The problem did disappear in 5.16.7 when some offending commit was reverted.

 > I tested on 5.18 on my 3B and it works well. Could you paste your kernel
 > configuration and config.txt somewhere?
Just done in a Mail which was supposed to respond to Stefan's first one, 
which went wrong. (As Stefan isn't subscribed his mail was lacking the 
usual headers like "In-Reply-to". So I started editing by hitting the 
link on top of [2]. But this didn't work.)

[1] https://archlinuxarm.org/forum/viewtopic.php?f=57&t=15842
[2] https://lists.freedesktop.org/archives/dri-devel/2022-June/357819.html
