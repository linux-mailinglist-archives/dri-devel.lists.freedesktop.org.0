Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F571ADAD3D
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 12:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71C9010E320;
	Mon, 16 Jun 2025 10:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="T/+qxgVa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B8E10E320
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 10:23:42 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7E1416000872;
 Mon, 16 Jun 2025 11:23:40 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id L9bELFm_BR3k; Mon, 16 Jun 2025 11:23:38 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt
 [IPv6:2001:690:2100:1::b3dd:b9ac])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 3BBF26000840;
 Mon, 16 Jun 2025 11:23:38 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1750069418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a5FEJ53jx6GAvPakT/TDuoSkCUkkHtIFeh8HSktAvb8=;
 b=T/+qxgVaciRTgz3aRFCVmufxs6tJvPAEtDig2UMTAHzxEiU/8xOepx9gpMcRzkpdVzVgbd
 DbIo78A4XPfWpeJBzr8sPN1gxXamUL9SiXNUkZnwukwuEGM09ttXUTxpxTFkawE1D8w296
 LZJlVtdTLOCLa7KcynTJ2foLubenQxs=
Received: from [10.158.133.22] (dial-b1-161-46.telepac.pt [194.65.161.46])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0204636006F;
 Mon, 16 Jun 2025 11:23:37 +0100 (WEST)
Message-ID: <9018994f-de55-41b3-ae45-59cccaaf8603@tecnico.ulisboa.pt>
Date: Mon, 16 Jun 2025 11:23:37 +0100
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
 <3293ae49-90c6-454c-b2f4-98ea84302c11@kapsi.fi>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <3293ae49-90c6-454c-b2f4-98ea84302c11@kapsi.fi>
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



On 6/12/25 2:55 AM, Mikko Perttunen wrote:
> On 6/12/25 12:06 AM, Thierry Reding wrote:
>> On Wed, Jun 11, 2025 at 01:05:40PM +0100, Diogo Ivo wrote:
>>> I have a question here, what exactly are the stream IDs? While working
>>> on the driver this came up and I didn't manage to figure it out.
>>
>> Stream IDs are a way to identify memory transactions as belonging to a
>> certain device. This comes into play when working with the IOMMU (which
>> is a Tegra SMMU on Tegra210 and earlier, and an ARM SMMU on Tegra) and
>> is used to isolate DMA capable devices. Basically for every stream ID
>> you get a separate I/O address space. NVJPG will have its own address
>> space, and so will VIC. Each device can only access whatever has been
>> mapped to it's I/O address space. That means NVJPG can't interfere with
>> VIC and vice-versa. And neither can any of these engines read from or
>> write to random system memory if badly programmed.
>>
>> For Tegra SMMU there's no such thing as programmable stream IDs, so the
>> stream ID is fixed for the given device.
>>
>> On newer chips (Tegra186 and later, or maybe it wasn't until Tegra194),
> 
> Tegra186 and newer -- all chips with the ARM SMMU. To add a little bit, 
> each engine can address two stream IDs, one for firmware and one for 
> data. All user specified buffers are mapped into the data IOMMU domain, 
> and these are switched between jobs / applications.
> 
> As an aside, currently each engine has its own firmware stream ID, but 
> that's a bit wasteful, since the kernel allocates a separate IOMMU 
> domain for each. The firmwares are all read-only so they could be in a 
> shared one. We've had to consolidate these on some platforms that ran 
> out of IOMMU domains otherwise. Not really a concern with upstream 
> platforms, though.

Does this dual Stream ID also apply to Tegra210?

> Also need to program the THI_STREAMID / TRANSCFG registers during boot.

Thanks,
Diogo
