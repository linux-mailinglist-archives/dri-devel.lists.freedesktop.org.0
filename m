Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BEAD54A2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:52:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A92910E641;
	Wed, 11 Jun 2025 11:52:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="Zt7n7Z4/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135D410E641
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:52:05 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id D6AFF6003006;
 Wed, 11 Jun 2025 12:52:03 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id pgY0qHFItH3e; Wed, 11 Jun 2025 12:52:01 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 013966000870;
 Wed, 11 Jun 2025 12:52:01 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1749642721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Rri53Eo7/3l8mt9JrOH+jnscGitH/3oc84vLlM63uI=;
 b=Zt7n7Z4/VXQFijEFZo7YyBFOih02agzetxv7J7KE51BT6jbMYwsa6ROoHwhCW3RfK6ntPT
 zqebZgCccTbrC+vmcnDwfL1YiadoD3w9G8lWGcQoUZIkOhK9sHeEds0e7shyKopTx7Z1Q2
 PL8AKvmdnCrSAMV+uWnVA4CZttIHowQ=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CC98B360061;
 Wed, 11 Jun 2025 12:52:00 +0100 (WEST)
Message-ID: <4ac9f433-f1d3-407b-8fd6-3cc44c141748@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 12:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: tegra: Add NVJPG node
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-3-5f2c36feeb39@tecnico.ulisboa.pt>
 <4a02f671-2be0-45c9-b471-071596b22338@kapsi.fi>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <4a02f671-2be0-45c9-b471-071596b22338@kapsi.fi>
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



On 6/10/25 6:01 AM, Mikko Perttunen wrote:
> On 6/6/25 7:45 PM, Diogo Ivo wrote:
>> The Tegra X1 chip contains a NVJPG accelerator capable of
>> encoding/decoding JPEG files in hardware, so add its DT node.
>>
>> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/ 
>> boot/dts/nvidia/tegra210.dtsi
>> index 
>> 6f8cdf012f0f12a16716e9d479c46b330bbb7dda..087f38256fd40f57c4685e907f9682eb49ee31db 100644
>> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
>> @@ -253,7 +253,13 @@ vic@54340000 {
>>           nvjpg@54380000 {
>>               compatible = "nvidia,tegra210-nvjpg";
>>               reg = <0x0 0x54380000 0x0 0x00040000>;
>> -            status = "disabled";
>> +            clocks = <&tegra_car TEGRA210_CLK_NVJPG>;
>> +            clock-names = "nvjpg";
>> +            resets = <&tegra_car 195>;
>> +            reset-names = "nvjpg";
>> +
>> +            iommus = <&mc TEGRA_SWGROUP_NVJPG>;
>> +            power-domains = <&pd_nvjpg>;
>>           };
>>           dsib: dsi@54400000 {
>>
> 
> Please mention Tegra210 in the commit subject, and perhaps adjust the 
> commit message to say that you're updating and enabling the device tree 
> node (rather than adding, since it's already there).

Will do, for v2 I'll collect the tag, mention Tegra210 and change the
commit message.

> With that,
> 
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
