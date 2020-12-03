Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF82CE9F0
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 09:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E7A6EC84;
	Fri,  4 Dec 2020 08:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA456EB83
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 18:09:07 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4Cn3kT3fBKz1qtQY;
 Thu,  3 Dec 2020 19:09:05 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4Cn3kT34R6z1qsp3;
 Thu,  3 Dec 2020 19:09:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id MTFhkoOU3ZT8; Thu,  3 Dec 2020 19:09:04 +0100 (CET)
X-Auth-Info: LZKIA5ycnstMqGSyOlI9+wkxZPM4GGfdZeixVKaWks8=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  3 Dec 2020 19:09:04 +0100 (CET)
Subject: Re: [PATCH V3 1/2] dt-bindings: Add DT bindings for Toshiba TC358762
 DSI-to-DPI bridge
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20200809105705.6334-1-marex@denx.de>
 <20200812200738.GA651402@ravnborg.org>
 <CAPY8ntBCsDF+D8EiSrDJ8vn_S6-OGr6p4SMd7_9MHvoFj=f+Fw@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <95f00eda-a0b7-0637-d6cc-2bbea0429b6a@denx.de>
Date: Thu, 3 Dec 2020 19:09:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAPY8ntBCsDF+D8EiSrDJ8vn_S6-OGr6p4SMd7_9MHvoFj=f+Fw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 04 Dec 2020 08:33:34 +0000
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/3/20 7:01 PM, Dave Stevenson wrote:
> Hi Marek

Hi,

[...]

>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c1 {
> 
> Minor point.
> I've just come to use this and noticed that this example puts the
> device under i2c1. Seeing as it's a DSI driver with no I2C
> interaction, shouldn't it be under a dsi node?

Good catch, it should, please send a patch to correct this error, thanks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
