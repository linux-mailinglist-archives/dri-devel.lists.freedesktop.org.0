Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C72D652C8FD
	for <lists+dri-devel@lfdr.de>; Thu, 19 May 2022 02:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6387F10E309;
	Thu, 19 May 2022 00:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D77D10E309
 for <dri-devel@lists.freedesktop.org>; Thu, 19 May 2022 00:55:07 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id F0DC882132;
 Thu, 19 May 2022 02:55:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1652921706;
 bh=/QZjgRKxfyjaHmadvRByCwL27zyfogbuKhHybXiWOOA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WuHPOka1PDSvt6XeelfLS1m0zrj6w++0c8MyqPifzyjaf2thS3TA+xynFYyo/SHNb
 YuN6+B03S6aJ/m63qdjrgCKKKWWlltepQFVensdP1hugCeqOlFsV6xvCA2Y1vZx5an
 YFQdGKth76YFMVSvPRrJ6mpmc6Ir+cfkLvgNJqoZYph1oRQqndk6Iicx5bJRXLbZoz
 MtLdBEvamYrs36hYdeKj3V1fh8Ns9AW/LCUgiOgKlD6h/o4qRT16FzJhpzUUc/4NuW
 Q8XbzogPcO9UaW5CjJQUyQf5nyRwBz8PhVmw9Sm46YnsX6PNelcrqWXZDLDCdozpa5
 sNDF4zXwBYUcg==
Message-ID: <85b6a706-79ab-2e50-2549-ce2d70ff8eb2@denx.de>
Date: Thu, 19 May 2022 02:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: (EXT) [PATCH v0.5 0/9] i.MX8MP HDMI support
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Lucas Stach <l.stach@pengutronix.de>
References: <20220506181034.2001548-1-l.stach@pengutronix.de>
 <2112379.Mh6RI2rZIc@steina-w>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <2112379.Mh6RI2rZIc@steina-w>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandor Yu <Sandor.yu@nxp.com>, Robert Foss <robert.foss@linaro.org>,
 patchwork-lst@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/9/22 11:44, Alexander Stein wrote:
> Hi Lucas,
> 
> Am Freitag, 6. Mai 2022, 20:10:25 CEST schrieb Lucas Stach:
>> second round of the i.MX8MP HDMI work. Still not split up into proper
>> parts for merging through the various trees this needs to go into, but
>> should make it easy for people to test.
>>
>> I've worked in the feedback I got from the last round, including fixing
>> the system hang that could happen when the drivers were built as modules.
>>
>> Series is based on linux-next/master, as there are some prerequisite
>> patches in both the drm and imx tree already. The last patch from [1]
>> and the patches from [2] need to be applied. Please note that this series
>> expects the sync polarity from the LCDIF to be set according to the
>> comments I made in [2]. Please test and provide feedback.
> 
> Thanks for the 2nd round of HDMI support patches. Sorry I wasn't able to reply
> to your questions, but the PLL locking seems to be gone on my system.
> 
> I still get the error
>> imx-lcdif 32fc6000.display-controller: Unknown media bus format 0x200f
> 
> To answer the other question on the last patchset
>> Do have a 4k HDMI display connected that wants to do YUV input? That's
>> something I have to admit I didn't test yet and would be likely to
>> cause this bus format selection.
> 
> This is a FullHD HDMI monitor, ASUS PB238Q. Apparently the color format is
> YCBCR422. From what I can see is that
> dw_hdmi_bridge_atomic_get_output_bus_fmts() adds MEDIA_BUS_FMT_UYVY8_1X16
> (0x200f) to the output formats. This is then passed to

Try LCDIFv3 v3 patchset I just posted, that should work then.
