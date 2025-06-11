Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECAAAD54E6
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 14:04:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 775F110E63E;
	Wed, 11 Jun 2025 12:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="pea6Ccjr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C5310E640
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 12:04:20 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0DC616003014;
 Wed, 11 Jun 2025 13:04:19 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 9hPjO_f-eCHZ; Wed, 11 Jun 2025 13:04:16 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 9E4C7600301B;
 Wed, 11 Jun 2025 13:04:16 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749643456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H3JQgS3p43p5THNQw0KB6nL6/rdKYdxEDetoSqTjwzo=;
 b=pea6Ccjr2yJlbBuKzdmYxoS9nbR9av6NMj2oOIxhgJlvvljUstw3g6j6sjQ2q5iiwf1ycS
 fhEkGEvVtyRk6qZSBEvrKie42yw1F4/YJ5y/UEWPR4Z9b14PTHmxWnTJZg9Up/+jzsg3yH
 XptrtAyHblh3mUflMr/V0ZiIB+3JBiQ=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6179C360084;
 Wed, 11 Jun 2025 13:04:16 +0100 (WEST)
Message-ID: <00f678ae-0b66-403c-bd53-6090e5920b1a@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 13:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Thierry Reding <thierry.reding@gmail.com>
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
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
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



On 6/10/25 10:05 AM, Thierry Reding wrote:
> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>> Hello,
>>
>> This series adds support for the NVJPG hardware accelerator found in the
>> Tegra210 SoC.
>>
>> The kernel driver is essentially a copy of the NVDEC driver as both
>> engines are Falcon-based.
>>
>> For the userspace part I have written a Mesa Gallium backend [1] that,
>> while still very much experimental, works in decoding images with VA-API.
>>
>> I have been using ffmpeg to call VA-API with the following command:
>>
>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>>
>> which decodes <input.jpg> and shows the result in the framebuffer.
>>
>> The firmware for the engine can be obtained from a Linux for Tegra
>> distribution.
> 
> By the way, have you tried running this on anything newer than Tegra210?
> Given your progress on this, we can probably start thinking about
> submitting the binaries to linux-firmware.

Since I don't have access to other Tegra platforms I haven't been able
to test this driver there. For this I need help from someone with access
to more hardware, I can send a version that just adds the extra compatibles
and we could see if it works.

As for the firmwares that would be great!

>> Due to the way the Gallium implementation works for Tegra
>> the GPU also needs to be enabled.
> 
> I wonder if maybe we can get rid of this requirement. While it's
> certainly nice to have the GPU enabled, there may be cases where using
> only the other engines may be advantageous. Originally when I had worked
> on VIC, I was looking at how it could be used for compositing without
> getting the GPU involved. That's something that Android devices tend(ed)
> to do because of the power savings that come with it.

Yes I think this is possible to do, it mainly has involves properly
handling the Gallium driver initialization. I'll take a look at it
before submitting the MR for the Gallium driver.

Diogo

> Anyway, not a big deal, depending on the GPU for now is fine.
