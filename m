Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5C222DFD9
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E96189F33;
	Sun, 26 Jul 2020 15:02:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2A189359
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 10:13:16 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4BDzKQ29Q0z1qrfD;
 Sun, 26 Jul 2020 12:13:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4BDzKQ0nmvz1qw6h;
 Sun, 26 Jul 2020 12:13:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id I3uHk3kyKvZs; Sun, 26 Jul 2020 12:13:13 +0200 (CEST)
X-Auth-Info: +UxxsQTk0lTXcwxY3B7PbpBPvZXT0hDIdYuGW0bu7v4=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sun, 26 Jul 2020 12:13:12 +0200 (CEST)
Subject: Re: [PATCH 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200725211457.5772-1-marex@denx.de>
 <20200726070627.GC1691925@ravnborg.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <a3eb3adc-ebfc-50bb-4da9-032a5c7279fe@denx.de>
Date: Sun, 26 Jul 2020 12:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200726070627.GC1691925@ravnborg.org>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:44 +0000
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
Cc: Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/26/20 9:06 AM, Sam Ravnborg wrote:
> Hi Marek.

Hi,

> On Sat, Jul 25, 2020 at 11:14:56PM +0200, Marek Vasut wrote:
>> Add DT bindings for Toshiba TC358762 DSI-to-DPI bridge, this
>> one is used in the Raspberry Pi 7" touchscreen display unit.
[...]
> This looks like a candidate for the simple-bridge-yaml binding.
> Did you check if this is sufficient or we really need a new binding?

The binding says "Transparent non-programmable DRM bridges", but this
TC358762 one is programmable, so I would expect a separate binding file
is better in case the driver evolves and needs more DT properties.

> If we need a new binding then they to take a look at how simple-bridge
> define the ports. You can do this in a simple way than what is used
> here.
> It looks like this was copied from toshiba,tc358768.yaml, but there are
> better examples to follow.

I took a subset of the file.

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
