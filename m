Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7A428624C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 17:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E586E922;
	Wed,  7 Oct 2020 15:39:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5936E0AF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 14:20:25 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4C5xLv1ZmYz1sQrf;
 Wed,  7 Oct 2020 16:20:23 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4C5xLt6ygdz1qqkM;
 Wed,  7 Oct 2020 16:20:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id pziLOkGfj2Kn; Wed,  7 Oct 2020 16:20:21 +0200 (CEST)
X-Auth-Info: FajRkvEwn7zFglMjFpW/8QrpOMHWznfBIrlMfoJH3uk=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed,  7 Oct 2020 16:20:21 +0200 (CEST)
Subject: Re: [PATCH v2 1/7] dt-bindings: display: mxsfb: Convert binding to
 YAML
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201007012438.27970-1-laurent.pinchart@ideasonboard.com>
 <20201007012438.27970-2-laurent.pinchart@ideasonboard.com>
 <daabffc8-24e9-4963-58a9-6c62724e7a11@denx.de>
 <bef04042ebd7dc1c744b51ab2b1c614a2f04084f.camel@pengutronix.de>
 <a8db345a-24b3-db8c-8dce-f97e021a1bf1@denx.de>
 <20201007133357.GJ3937@pendragon.ideasonboard.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <7fc84f7c-0660-efb6-6baf-4e2b9df6b48a@denx.de>
Date: Wed, 7 Oct 2020 16:20:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007133357.GJ3937@pendragon.ideasonboard.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Oct 2020 15:39:39 +0000
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

On 10/7/20 3:33 PM, Laurent Pinchart wrote:
> Hi Marek,
> 
> On Wed, Oct 07, 2020 at 10:55:24AM +0200, Marek Vasut wrote:
>> On 10/7/20 10:43 AM, Lucas Stach wrote:
>>> On Mi, 2020-10-07 at 10:32 +0200, Marek Vasut wrote:
>>>> On 10/7/20 3:24 AM, Laurent Pinchart wrote:
>>>> [...]
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - fsl,imx23-lcdif
>>>>> +      - fsl,imx28-lcdif
>>>>> +      - fsl,imx6sx-lcdif
>>>>> +      - fsl,imx8mq-lcdif
>>>>
>>>> There is no fsl,imx8mq-lcdif in drivers/gpu/drm/mxsfb/mxsfb_drv.c,
>>>> so the DT must specify compatible = "fsl,imx8mq-lcdif",
>>>> "fsl,imx28-lcdif" (since imx28 is the oldest SoC with LCDIF V4).
>>>>
>>>> Should the compatible be added to drivers/gpu/drm/mxsfb/mxsfb_drv.c or
>>>> dropped from the YAML file or neither ?
>>>
>>> Neither. As far as we know the block is compatible, so the DT should
>>> claim that it's compatible to "fsl,imx28-lcdif". However we don't know
>>> if there are any surprises, so we add the SoC specific compatible to be
>>> able to change the driver matching later without changing the DT if the
>>> need arises. For the DT validation to pass the SoC specific compatible 
>>> needs to be documented, even if it currently unused by the driver.
>>
>> What in that binding says you should specify compatible =
>> "fsl,imx8mq-lcdif", "fsl,imx28-lcdif"; and not e.g. "fsl,imx8mq-lcdif",
>> "fsl,imx23-lcdif" or simply "fsl,imx8mq-lcdif" ?
> 
> Nothing, until the next patch :-) This patch only handles the YAML
> conversion but doesn't fix issues.

Good, thanks !
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
