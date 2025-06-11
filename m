Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E232AD549B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:51:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9283E10E63C;
	Wed, 11 Jun 2025 11:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="YIAGWcoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C21D10E63E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:51:29 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 22D04600301C;
 Wed, 11 Jun 2025 12:51:28 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with UTF8LMTP id buvm1NxkIZMr; Wed, 11 Jun 2025 12:51:25 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8702F600301B;
 Wed, 11 Jun 2025 12:51:25 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749642685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1ULVQlz+6/dwkS/QYWUaI4mp2Hm4pXF3Hld/TP4IWWY=;
 b=YIAGWcoBAwX96S7/sHg0Fesy8LYQqz7yNh3dJVAUP/0S0bEOrjuW30Kf7b8dQmUjzuFhqN
 Z2qzltiIy9tP0gaRMJZHMxP0FvtPzgMTLdDh0pi3xEgPaBB9Lr+WfOe9TYnXhahyOtN5nt
 AW4CWrf3CuS+0ZChuYbfalgv4RDs+zc=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 4D399360061;
 Wed, 11 Jun 2025 12:51:25 +0100 (WEST)
Message-ID: <7d5c5a51-29d5-4373-b93d-e758f45e77e9@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 12:51:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: tegra: Add NVJPG power-domain node
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-2-5f2c36feeb39@tecnico.ulisboa.pt>
 <140a1f16-3baa-46a1-9cb3-a02381cbb3e4@kapsi.fi>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <140a1f16-3baa-46a1-9cb3-a02381cbb3e4@kapsi.fi>
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



On 6/10/25 5:57 AM, Mikko Perttunen wrote:
> On 6/6/25 7:45 PM, Diogo Ivo wrote:
>> Add the NVJPG power-domain node in order to support the NVJPG
>> accelerator.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/ 
>> boot/dts/nvidia/tegra210.dtsi
>> index 
>> 402b0ede1472af625d9d9e811f5af306d436cc98..6f8cdf012f0f12a16716e9d479c46b330bbb7dda 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -947,6 +947,12 @@ pd_xusbhost: xusbc {
>>                   resets = <&tegra_car TEGRA210_CLK_XUSB_HOST>;
>>                   #power-domain-cells = <0>;
>>               };
>> +
>> +            pd_nvjpg: nvjpg {
>> +                clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
>> +                resets = <&tegra_car 195>;
>> +                #power-domain-cells = <0>;
>> +            };
>>           };
>>       };
>>
> 
> Please mention Tegra210 in the commit subject. Otherwise,

Will do, for v2 I'll collect the tag and mention Tegra210.

> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
