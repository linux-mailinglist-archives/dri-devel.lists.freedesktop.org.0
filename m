Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761F7AD54EB
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:05:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD55D10E324;
	Wed, 11 Jun 2025 12:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="BPFWdb+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89BD10E324
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:05:46 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 97E146003C11;
 Wed, 11 Jun 2025 13:05:45 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 9o3E2IBRN4VS; Wed, 11 Jun 2025 13:05:43 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 013FD6000870;
 Wed, 11 Jun 2025 13:05:43 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749643543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EszJrXpVlktwqI9OICr8GM+DRV+5b4sbE2x+AglRscU=;
 b=BPFWdb+aCnHuRF/GC3OJ2b3BiHphnIUEgV8KPJ/adUx4ak/jVjA3CmWz1trzsGp+x2uIrt
 tT+kB5b1jmrV22N8tp48OK9Sp3zrxg4fcWQoPkUpzE5+L7PvLRMXt+CMfAIxSx+v7+I3Cu
 xs0vpmyLy4oIcnK8cDPm2NSs8B++lNA=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CD012360084;
 Wed, 11 Jun 2025 13:05:42 +0100 (WEST)
Message-ID: <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 13:05:40 +0100
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
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <621a9459-f2dd-4b19-a083-0e62f1a42f50@kapsi.fi>
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



On 6/10/25 10:52 AM, Mikko Perttunen wrote:
> On 6/10/25 6:05 PM, Thierry Reding wrote:
>> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>>> Hello,
>>>
>>> This series adds support for the NVJPG hardware accelerator found in the
>>> Tegra210 SoC.
>>>
>>> The kernel driver is essentially a copy of the NVDEC driver as both
>>> engines are Falcon-based.
>>>
>>> For the userspace part I have written a Mesa Gallium backend [1] that,
>>> while still very much experimental, works in decoding images with VA- 
>>> API.
>>>
>>> I have been using ffmpeg to call VA-API with the following command:
>>>
>>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 
>>> -i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>>>
>>> which decodes <input.jpg> and shows the result in the framebuffer.
>>>
>>> The firmware for the engine can be obtained from a Linux for Tegra
>>> distribution.
>>
>> By the way, have you tried running this on anything newer than Tegra210?
>> Given your progress on this, we can probably start thinking about
>> submitting the binaries to linux-firmware.
> 
> FWIW, the impression I have is that NVJPG is basically unchanged all the 
> way to Tegra234. So if we add stream ID support and the firmwares, it'll 
> probably just work. Tegra234 has the quirk that it has two instances of 
> NVJPG -- these have to be distinguished by their different class IDs. 
> But we should go ahead with the T210 support first.

I have a question here, what exactly are the stream IDs? While working
on the driver this came up and I didn't manage to figure it out.

Diogo
