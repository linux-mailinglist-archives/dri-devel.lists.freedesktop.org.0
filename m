Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F404C9B68
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 03:49:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0A210E691;
	Wed,  2 Mar 2022 02:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9987210E691
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 02:49:44 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C7BFA83BEE;
 Wed,  2 Mar 2022 03:49:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646189382;
 bh=RnLQ1kSTn68gdlTwMtECShUd7f5MtMzMhxUhBCdUMjc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fz1lwIokv3awZa4+fkO7y6CaxGTVUjYs/sYmGldgwyOAZ6fV6cbs3rJDKRWC5ymU+
 mFDGGkV9tya9+1IWgui53d4184sj3QbUPEWjndjQwkhC9LYYxyvSdmLHKicd+CVbwt
 RZI7dvvYlPDzQmdrN7GK+S6luHFY3Y+Te6+ET8KrDWiysF3hHuDyvt+cEVOQ9xhd2o
 ErFHmVIdKuy6QUeAP+DwnR5a/ZWnLaigK6Nr7MCAwcEQQXbSAyNLnOPINy7r8KZdpx
 LU4jmjsb3VfMH4ruyuBD2YbhG4EL78luvyTHDfboElVIcnc8veaUICtmfWxCgNpQw0
 bJg+SBDYJT95w==
Message-ID: <3485f77c-667c-05fa-ff96-93e732247b49@denx.de>
Date: Wed, 2 Mar 2022 03:49:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [EXT] Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for
 i.MX8MP
Content-Language: en-US
To: Robby Cai <robby.cai@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Adam Ford <aford173@gmail.com>
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
 <VI1PR04MB699190CC6CB1D5C37C4BB64CF2029@VI1PR04MB6991.eurprd04.prod.outlook.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <VI1PR04MB699190CC6CB1D5C37C4BB64CF2029@VI1PR04MB6991.eurprd04.prod.outlook.com>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Ying Liu \(OSS\)" <victor.liu@oss.nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/1/22 14:37, Robby Cai wrote:

Hi,

[...]

>>> I tend to agree with Marek on this one.  We have an instance where the
>>> blk-ctrl and the GPC driver between 8m, mini, nano, plus are close,
>>> but different enough where each SoC has it's own set of tables and
>>> some checks.   Lucas created the framework, and others adapted it for
>>> various SoC's.  If there really is nearly 50% common code for the
>>> LCDIF, why not either leave the driver as one or split the common code
>>> into its own driver like lcdif-common and then have smaller drivers
>>> that handle their specific variations.
>>
>> I don't know exactly how the standalone driver looks like, but I guess the
>> overlap is not really in any real HW specific parts, but the common DRM
>> boilerplate, so there isn't much point in creating a common lcdif driver.
>>
>> As you brought up the blk-ctrl as an example: I'm all for supporting slightly
>> different hardware in the same driver, as long as the HW interface is close
>> enough. But then I also opted for a separate 8MP blk-ctrl driver for those
>> blk-ctrls that differ significantly from the others, as I think it would make the
>> common driver unmaintainable trying to support all the different variants in
>> one driver.
>>
>> Regards,
>> Lucas
> 
> LCDIF on i.MX8MP is a different IP which is borrowed from non-iMX series, although it's also called 'LCDIF'.
> We prefer not mix these two series of IPs in one driver for ease of maintenance and extension.

Where does the MX8MP LCDIF come from then, SGTL maybe ?
