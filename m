Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E98310088
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 00:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818BE6EEA6;
	Thu,  4 Feb 2021 23:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682D26EEA6
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 23:20:40 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4DWvft2rt4z1qsjt;
 Fri,  5 Feb 2021 00:20:38 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4DWvft1JMtz1t6q3;
 Fri,  5 Feb 2021 00:20:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id zHp_fqeBdiam; Fri,  5 Feb 2021 00:20:36 +0100 (CET)
X-Auth-Info: /EEokMMTLiaG7ulH+Hks+51zGFPhXIDs4hynjRrPDLk=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  5 Feb 2021 00:20:36 +0100 (CET)
Subject: Re: [PATCH v2 2/2] drm: bridge: Add SN65DSI84 DSI to LVDS bridge
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20210203071256.42050-1-jagan@amarulasolutions.com>
 <20210203071256.42050-2-jagan@amarulasolutions.com>
 <YBx1T3U1pNaLfJLQ@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <ae346027-a58e-e773-60ce-92a79f0d99d6@denx.de>
Date: Fri, 5 Feb 2021 00:20:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBx1T3U1pNaLfJLQ@pendragon.ideasonboard.com>
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-amarula@amarulasolutions.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/4/21 11:29 PM, Laurent Pinchart wrote:
> Hi Jagan,
> 
> Thank you for the patch.
> 
> On Wed, Feb 03, 2021 at 12:42:56PM +0530, Jagan Teki wrote:
>> SN65DSI84 is a Single Channel DSI to Dual-link LVDS bridge from
>> Texas Instruments.
>>
>> SN65DSI83, SN65DSI85 are variants of the same family of bridge
>> controllers.
>>
>> Right now the bridge driver is supporting a single link, dual-link
>> support requires to initiate I2C Channel B registers.
> 
> MArek Vasut (on CC) has very recently posted a driver for the SN65DSI86.
> Should the two drivers be merged together ?

Since Jagan's V1 was out first, I will let Jagan pick whatever might be 
useful from the driver I posted, probably the O(1) clock rate 
calculation and some of the regmap stuff, and once there is some merged 
result, I am happy to test it on my hardware. The DSI83 is I think the 
same as DSI84, except with half of the channels.

[...]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
