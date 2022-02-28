Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 728AF4C6367
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 07:57:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE57810E271;
	Mon, 28 Feb 2022 06:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEC410E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 06:57:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2565283BCC;
 Mon, 28 Feb 2022 07:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1646031425;
 bh=ueHy08uBf8B3Cafh+p6eow3aQ/02PK8YIUKF5lp4WTI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=y7R+IzHfStB1VPvW6SZRAQOrKJvU4qmdh26k40uw3lqps01x1V3BWHc1PT1bio7iq
 jQ/Tt77MkW1PMbLM/JzPj8XExikKmTzJuHUGBmW6/Wk64EChDAyh25VXaCqjQZUmAo
 BPl+63lzGE5qxA8dSmnyvk3wti9fFzj0pGJWWoekiIkLDf7PrbX0qZrYAFvZ9pdii+
 ihd8q4RYJ3rAAdkd015BVpS6ZEESoZA1Kc860YETPsWb17YV+yze3lmlfwzx3Gglm7
 Po5m3tUKolUM6WyrOIBh07Gnl4GObvLreG6pdodWDxl2VCh6EiBHsc/dmhpUDoOTt8
 WjCJYzz+ZH/Bw==
Message-ID: <8eac8a2c-bc6d-0c79-c727-bdaa2cd9abee@denx.de>
Date: Mon, 28 Feb 2022 07:57:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/9] dt-bindings: mxsfb: Add compatible for i.MX8MP
Content-Language: en-US
To: Liu Ying <victor.liu@oss.nxp.com>, dri-devel@lists.freedesktop.org
References: <20220228004605.367040-1-marex@denx.de>
 <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <35b981d0d9d763525c427491ca0e25b6e4c03d0f.camel@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/28/22 07:37, Liu Ying wrote:
> Hi Marek,

Hi,

> On Mon, 2022-02-28 at 01:45 +0100, Marek Vasut wrote:
>> Add compatible string for i.MX8MP LCDIF variant. This is called LCDIFv3
>> and is completely different from the LCDIFv3 found in i.MX23 in that it
> 
> In i.MX23 reference manual, there is no LCDIFv3 found, but only LCDIF.

See i.MX23 HW_LCDIF_VERSION MAJOR=0x3 , that's LCDIF V3 . MX28 has LCDIF 
V4 .

>> has a completely scrambled register layout compared to all previous LCDIF
> 
> It looks like no single register of i.MX8MP LCDIFv3 overlaps with
> registers in other i.MX2x/6x/7x/8x LCDIFs. The LCDIFv3 block diagram is
> totally different from the LCDIF block diagram, according to the SoC
> reference manuals. LCDIFv3 supports SHADOW_EN bit to update horizontal
> and vertical size of graphic, position of graphic on the panel, address
> of graphic in memory and color formats or color palettes, which is not
> supported by LCDIF and impacts display driver control mechanism
> considerably. LCDIF supports DOTCLK interface, MPU interface and VSYNC
> interface, while LCDIFv3 only supports parallel output as a counterpart
> of the DOTCLK interface.
> 
> Generally speaking, LCDIFv3 is just a new display IP which happens to
> have the word 'LCDIF' in its name.  Although both of LCDIFv3 and LCDIF
> are display controllers for scanning out frames onto display devices, I
> don't think they are in one family.
> 
> So, LCDIFv3 deserves a new separate dt-binding, IMO.

It seems to me a lot of those bits just map to their previous 
equivalents in older LCDIF, others were dropped, so this is some sort of 
new LCDIF mutation, is it not ?

I am aware NXP has a separate driver in its downstream, but I'm not 
convinced the duplication of boilerplate code by introducing a separate 
driver for what looks like another LCDIF variant is the right approach.

>> variants. The new LCDIFv3 also supports 36bit address space. However,
>> except for the complete bit reshuffling, this is still LCDIF and it still
>> works like one.

[...]
