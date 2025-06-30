Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E06AED7D9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 10:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A1B10E3C9;
	Mon, 30 Jun 2025 08:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="K9OIzhqe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19AB10E3C9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 08:52:11 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9382260022E5;
 Mon, 30 Jun 2025 09:52:10 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id dLtn5WJTzlZG; Mon, 30 Jun 2025 09:52:08 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 65B5B60022FD;
 Mon, 30 Jun 2025 09:52:08 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1751273528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iYrszlhKrE+3rdPzD0KHo3Mkh5qRDqFv6VEwxfGiZyg=;
 b=K9OIzhqeOT11oxMfGwHcvaqPsRscpGBxUmH5NTsbSN32JHsByyOEQffHecgeDvDEXRZNtG
 rnIKZkbRc69JeEFBgTRX8876WVJFH7XwogYOP2eUEU8nXEnELU+djUYVPyDA87+Ajz1xDE
 2W5JGY+dUitw26iPErv+Hgz+SMthuk8=
Received: from [192.168.1.69] (unknown [92.56.11.86])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id BB96B360083;
 Mon, 30 Jun 2025 09:52:06 +0100 (WEST)
Message-ID: <b4f97871-bf42-45f8-b4c5-65fef7e583e3@tecnico.ulisboa.pt>
Date: Mon, 30 Jun 2025 09:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
 <621a9459-f2dd-4b19-a083-0e62f1a42f50@kapsi.fi>
 <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>
 <4cibh66elviiatataa45lsfcyeovkqyxe4fjvfh7uqddhsbe6z@svt2dgeafrdh>
 <78cc8814-c89f-4a5f-9a70-08ed69580c3f@tecnico.ulisboa.pt>
 <36898d74-d9f7-4c5a-b6f2-d9652c674b84@kapsi.fi>
 <82bfabf0-8c55-4bbd-8c81-44dc86209b15@tecnico.ulisboa.pt>
 <338ae324-1f1a-429f-9ea2-ecab56331895@kapsi.fi>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <338ae324-1f1a-429f-9ea2-ecab56331895@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Mikko,

On 6/30/25 7:14 AM, Mikko Perttunen wrote:
> On 6/17/25 6:26 PM, Diogo Ivo wrote:
>>
>>
>> On 6/17/25 5:40 AM, Mikko Perttunen wrote:
>>>
>>>
>>> On 6/16/25 7:21 PM, Diogo Ivo wrote:
>>>>
>>>>
>>>> On 6/11/25 4:06 PM, Thierry Reding wrote:
>>>>> On Wed, Jun 11, 2025 at 01:05:40PM +0100, Diogo Ivo wrote:
>>>>>>
>>>>>>
>>>>>> On 6/10/25 10:52 AM, Mikko Perttunen wrote:
>>>>>>> On 6/10/25 6:05 PM, Thierry Reding wrote:
>>>>>>>> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>>>>>>>>> Hello,
>>>>>>>>>
>>>>>>>>> This series adds support for the NVJPG hardware accelerator 
>>>>>>>>> found in the
>>>>>>>>> Tegra210 SoC.
>>>>>>>>>
>>>>>>>>> The kernel driver is essentially a copy of the NVDEC driver as 
>>>>>>>>> both
>>>>>>>>> engines are Falcon-based.
>>>>>>>>>
>>>>>>>>> For the userspace part I have written a Mesa Gallium backend 
>>>>>>>>> [1] that,
>>>>>>>>> while still very much experimental, works in decoding images
>>>>>>>>> with VA- API.
>>>>>>>>>
>>>>>>>>> I have been using ffmpeg to call VA-API with the following 
>>>>>>>>> command:
>>>>>>>>>
>>>>>>>>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device
>>>>>>>>> /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev
>>>>>>>>> /dev/fb0
>>>>>>>>>
>>>>>>>>> which decodes <input.jpg> and shows the result in the framebuffer.
>>>>>>>>>
>>>>>>>>> The firmware for the engine can be obtained from a Linux for Tegra
>>>>>>>>> distribution.
>>>>>>>>
>>>>>>>> By the way, have you tried running this on anything newer than 
>>>>>>>> Tegra210?
>>>>>>>> Given your progress on this, we can probably start thinking about
>>>>>>>> submitting the binaries to linux-firmware.
>>>>>>>
>>>>>>> FWIW, the impression I have is that NVJPG is basically unchanged 
>>>>>>> all the
>>>>>>> way to Tegra234. So if we add stream ID support and the 
>>>>>>> firmwares, it'll
>>>>>>> probably just work. Tegra234 has the quirk that it has two 
>>>>>>> instances of
>>>>>>> NVJPG -- these have to be distinguished by their different class 
>>>>>>> IDs.
>>>>>>> But we should go ahead with the T210 support first.
>>>>>>
>>>>>> I have a question here, what exactly are the stream IDs? While 
>>>>>> working
>>>>>> on the driver this came up and I didn't manage to figure it out.
>>>>>
>>>>> Stream IDs are a way to identify memory transactions as belonging to a
>>>>> certain device. This comes into play when working with the IOMMU 
>>>>> (which
>>>>> is a Tegra SMMU on Tegra210 and earlier, and an ARM SMMU on Tegra) and
>>>>> is used to isolate DMA capable devices. Basically for every stream ID
>>>>> you get a separate I/O address space. NVJPG will have its own address
>>>>> space, and so will VIC. Each device can only access whatever has been
>>>>> mapped to it's I/O address space. That means NVJPG can't interfere 
>>>>> with
>>>>> VIC and vice-versa. And neither can any of these engines read from or
>>>>> write to random system memory if badly programmed.
>>>>
>>>> So if I understand this correctly a Stream ID corresponds to an IOMMU
>>>> domain right?
>>>
>>> Technically not necessarily, but in practice that's the case, as the 
>>> IOMMU driver creates IOMMU domains for each stream ID in the device 
>>> tree. They are similar to the SWGROUPs on Tegra210.
>>
>> Ok that makes sense, thank you for the clarification :)
>>
>>>> Ok, then in that case I'll keep the driver in its current state without
>>>> these implementations if that's ok. Connected with this I wanted to 
>>>> know
>>>> your thoughts on the best way to upstream this, is it better to wait 
>>>> for
>>>> testing on different platforms first and then if things work merge a
>>>> driver that works for all of them or go with Tegra210 first and then 
>>>> add
>>>> more platforms later on?
>>>
>>> Personally, I'd say to go for Tegra210 first.
>>
>> In that case I believe that in the v2 I sent out of the driver I 
>> addressed
>> both yours and Thierry's reviews and the driver should be in good 
>> condition
>> for Tegra210. What are the next steps in order to merge it?
> 
> I left one more comment on the v2 patch. With that fixed, if Thierry has 
> no further objections, hopefully he can merge.

I sent out v3 addressing this comment and picked up your Acked-by.

Thanks for the review!
Diogo

> Cheers,
> Mikko
> 
>>
>> Thanks,
>> Diogo
>>
>>> Cheers
>>> Mikko
>>
> 
