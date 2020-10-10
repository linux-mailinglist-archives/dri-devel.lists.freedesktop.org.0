Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1975289FCE
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 12:03:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2326EEA5;
	Sat, 10 Oct 2020 10:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA9786E12A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 09:08:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C7fJ21hkXz1rrKZ;
 Sat, 10 Oct 2020 11:08:50 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C7fJ20R3bz1qvgd;
 Sat, 10 Oct 2020 11:08:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3d4ypTh_aFbm; Sat, 10 Oct 2020 11:08:48 +0200 (CEST)
X-Auth-Info: VSShtmZctzVahsNuDR5I32dJjEw6fWhdYFF6IzeUW/o=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Sat, 10 Oct 2020 11:08:48 +0200 (CEST)
Subject: Re: [PATCH v2 3/7] dt-bindings: display: mxsfb: Add a bus-width
 endpoint property
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
 <20201007012438.27970-4-laurent.pinchart@ideasonboard.com>
 <7b8df7af-5ca8-708b-4975-2fdf4280116f@denx.de>
 <20201009235843.GR25040@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <9c7615d6-0f69-5f67-0795-b86ecea2eea8@denx.de>
Date: Sat, 10 Oct 2020 10:47:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201009235843.GR25040@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 10 Oct 2020 10:02:57 +0000
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
Cc: devicetree@vger.kernel.org,
 =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/10/20 1:58 AM, Laurent Pinchart wrote:
> Hi Marek,

Hi,

> On Wed, Oct 07, 2020 at 10:40:26AM +0200, Marek Vasut wrote:
>> On 10/7/20 3:24 AM, Laurent Pinchart wrote:
>>
>> [...]
>>
>>> +          bus-width:
>>> +            enum: [16, 18, 24]
>>> +            description: |
>>> +              The output bus width. This value overrides the configuration
>>> +              derived from the connected device (encoder or panel). It should
>>> +              only be specified when PCB routing of the data signals require a
>>> +              different bus width on the LCDIF and the connected device. For
>>> +              instance, when a 18-bit RGB panel has its R[5:0], G[5:0] and
>>> +              B[5:0] signals connected to LCD_DATA[7:2], LCD_DATA[15:10] and
>>> +              LCD_DATA[23:18] instead of LCD_DATA[5:0], LCD_DATA[11:6] and
>>> +              LCD_DATA[17:12], bus-width should be set to 24.
>>
>> The iMX6 IPUv3 uses interface-pix-fmt which is a bit more flexible, but
>> I'm not sure whether it's the right way to go about this, see:
>> Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> 
> I think specifying the bus with is better. It's a standard property, but
> more than that, a given bus width can carry different formats. For
> instance, a 24-bus could carry RGB666 data (with dithering for the
> LSBs).

I think that's exactly what the interface-pix-fmt was trying to solve
for the IPUv3, there you could have e.g. both RGB666 and LVDS666 , which
were different.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
