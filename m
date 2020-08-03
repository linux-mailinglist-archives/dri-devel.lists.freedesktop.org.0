Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8219023B5B2
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 09:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775AE6E447;
	Tue,  4 Aug 2020 07:27:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9DA76E162
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Aug 2020 22:29:54 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BLCHg2wKCz1rt4X;
 Tue,  4 Aug 2020 00:29:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BLCHg1VBcz1qql0;
 Tue,  4 Aug 2020 00:29:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id uTl9Mx1IYAvV; Tue,  4 Aug 2020 00:29:50 +0200 (CEST)
X-Auth-Info: wpsgAEGoEh2o5gk1ooVL8xJ6UNHvBNUjSL6JH4mrbhI=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Tue,  4 Aug 2020 00:29:50 +0200 (CEST)
Subject: Re: [RFC][PATCH] regulator: rpi-panel: Add regulator/backlight driver
 for RPi panel
To: Mark Brown <broonie@kernel.org>
References: <20200729214645.247185-1-marex@denx.de>
 <20200730155944.GA1477410@ravnborg.org>
 <87447ebd-2838-c6bb-1dd4-28104f09dbb9@denx.de>
 <20200730191300.GJ5055@sirena.org.uk>
 <5cfc1d07-c8ce-47d7-8763-1efa0316d05a@denx.de>
 <20200801011653.GD4510@sirena.org.uk>
 <20116f3c-64d7-0f52-b38a-56c62398a5e9@denx.de>
 <20200803194831.GF4502@sirena.org.uk>
From: Marek Vasut <marex@denx.de>
Message-ID: <9512f1f4-d3a0-8306-4765-1efde5259ba9@denx.de>
Date: Tue, 4 Aug 2020 00:29:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200803194831.GF4502@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 04 Aug 2020 07:27:04 +0000
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
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/3/20 9:48 PM, Mark Brown wrote:
> On Mon, Aug 03, 2020 at 09:21:25AM +0200, Marek Vasut wrote:
>> On 8/1/20 3:16 AM, Mark Brown wrote:
> 
>>> I see, so this is the remaining bits.  Perhaps the binding might help me
>>> see how things fit together - I don't know anything about the system
>>> really.  It's not doing anything that looks like it should cause the
>>> framework too many problems so I'm not overly worried from that point of
>>> view but equally well it's obviously not ideal.
> 
>> See below:
> 
> OK, basically I've got no real objection from a regulator point of view
> - it's not ideal but not the end of the world.

Then, how shall we proceed ?
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
