Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7AF4CCCAC
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 05:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CFDD10E44A;
	Fri,  4 Mar 2022 04:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947C910E44A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 04:50:41 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8B89B836AC;
 Fri,  4 Mar 2022 05:50:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646369439;
 bh=ehGcgupovN2TvtXK/E5/wv/gjtRK8E2WWVb5WaBWVwc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Oc2d2mgxNmNW4W9VrI3fSiIrfr7iyYQaMQ/OpvIcsrHKIekoE1sSJxiRQG91uViKy
 UoMR0tk+UvB64yCxC6WqLpYAvzgq9JZUeCaIu3IZomCBh3q5gtXf5Azx2XtmqjrIak
 UgLPebc8kIKII/RtnmYqQI3czrvZdikgczVvE0COFPgKtsSLQxlLyErD7kG0vvLEiG
 7dCJznas5eCHnXLnFwGKMEaq7yCgWkGLwJktnxOHfnIx3iXwG3AvUpS2TGdhFUBIrN
 BBAfzO06uzOB5YJCLZa7x8BkBS24+TyxAcfBcUCh9loC87TJDS+Rx3pfY8BivaVpvI
 u8sRJ9mduF7tg==
Message-ID: <c86900c7-fda5-c02e-d248-c225b24c7aa6@denx.de>
Date: Fri, 4 Mar 2022 05:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
 <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
 <a3ab4ec2dd0c7b87698bc7902509a4de6950dd25.camel@oss.nxp.com>
 <33207e88-da9b-96d7-0fef-461cb4496c88@denx.de>
 <284d65f53dffb6085bde6ef6ecd398f10d4c6c80.camel@oss.nxp.com>
 <8950434843ff7bbd1a527b0c799d9a74a75ee36d.camel@pengutronix.de>
 <7aeed693-dfb7-950f-fdf0-3c90de285392@denx.de>
 <8bf0b5a1c9ab9faee28077436cdfd49c0cd08792.camel@pengutronix.de>
 <CAHCN7xJ6ypDxZouZV1b1F1EgQFwdTvmY6EEekj+_z-UWbQMD5Q@mail.gmail.com>
 <4253aa4b5dc4a3568e45755678849961468bfd38.camel@pengutronix.de>
 <b655f565-43b2-4e42-953e-d6efa02f0219@denx.de>
 <85af7c5dfa120903a22e5e704e3bddd87830033c.camel@pengutronix.de>
 <430de480-5a7a-6ed0-eecd-4105f5940aba@denx.de>
 <a1240c0263be8372ccad42552db635a384deee4d.camel@pengutronix.de>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <a1240c0263be8372ccad42552db635a384deee4d.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree <devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Liu Ying <victor.liu@oss.nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/3/22 09:21, Lucas Stach wrote:
> Am Donnerstag, dem 03.03.2022 um 04:14 +0100 schrieb Marek Vasut:
>> On 3/2/22 10:23, Lucas Stach wrote:
>>
>> [...]
>>
>>>>>> I tend to agree with Marek on this one.  We have an instance where the
>>>>>> blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
>>>>>> but different enough where each SoC has it's own set of tables and
>>>>>> some checks.   Lucas created the framework, and others adapted it for
>>>>>> various SoC's.  If there really is nearly 50% common code for the
>>>>>> LCDIF, why not either leave the driver as one or split the common code
>>>>>> into its own driver like lcdif-common and then have smaller drivers
>>>>>> that handle their specific variations.
>>>>>
>>>>> I don't know exactly how the standalone driver looks like, but I guess
>>>>> the overlap is not really in any real HW specific parts, but the common
>>>>> DRM boilerplate, so there isn't much point in creating a common lcdif
>>>>> driver.
>>>>
>>>> The mxsfb currently has 1280 LoC as of patch 8/9 of this series. Of
>>>> that, there is some 400 LoC which are specific to old LCDIF and this
>>>> patch adds 380 LoC for the new LCDIF. So that's 800 LoC or ~60% of
>>>> shared boilerplate that would be duplicated .
>>>
>>> That is probably ignoring the fact that the 8MP LCDIF does not support
>>> any overlays, so it could use the drm_simple_display_pipe
>>> infrastructure to reduce the needed boilerplate.
>>
>> It seems the IMXRT1070 LCDIF v2 (heh ...) does support overlays, so no,
>> the mxsfb and hypothetical lcdif drivers would look really very similar.
>>
>>>>> As you brought up the blk-ctrl as an example: I'm all for supporting
>>>>> slightly different hardware in the same driver, as long as the HW
>>>>> interface is close enough. But then I also opted for a separate 8MP
>>>>> blk-ctrl driver for those blk-ctrls that differ significantly from the
>>>>> others, as I think it would make the common driver unmaintainable
>>>>> trying to support all the different variants in one driver.
>>>>
>>>> But then you also need to maintain two sets of boilerplate, they
>>>> diverge, and that is not good.
>>>
>>> I don't think that there is much chance for bugs going unfixed due to
>>> divergence in the boilerplate, especially if you use the simple pipe
>>> framework to handle most of that stuff for you, which gives you a lot
>>> of code sharing with other simple DRM drivers.
>>
>> But I can not use the simple pipe because overlays, see imxrt1070 .
>>
>> [...]
>>
>> We can always split the drivers later if this becomes unmaintainable
>> too, no ?
> 
> Not if you want to keep the same userspace running. As userspace has
> some ties to the DRM driver name, e.g. for finding the right GBM
> implementation, splitting the driver later on would be a UABI break.

Hum, so what other options do we have left ? Duplicate 60% of the driver 
right away ?
