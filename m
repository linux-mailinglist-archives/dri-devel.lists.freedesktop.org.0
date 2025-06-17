Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8DBADC0CA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jun 2025 06:36:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8127510E523;
	Tue, 17 Jun 2025 04:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="XLwjOtPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA32E10E523
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jun 2025 04:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7eqDqm+SaUKSGhEadOgv0OlnZVZmYzaFnYFVSlppPDg=; b=XLwjOtPG1gBb5tLTo61BN85sct
 79POY9WU0lTBj3TJedskAhHRPx9Waeb/lSBYb+sliP+1f1TF75PpAp9hVRTEm1SXD3zqLGFXJo8oa
 gJzJW04ASJLwK9S2FIPzW/Ju+kw6WQh+6xswzFngVrEJZ5LVKUpmepxWZSnuEM/CFCTdVKL/uABsB
 dv3CvlKPiuidW98G1VE4nwAubdfT77HjFlRPUSfkKCQi8et0KLqFo5sF2KK5KfhfQSPL18ZvIutQR
 BFalSjN1LrNlgmpI72/5br7MXSd6NTnWRXANevr09ISFN7LRBDD8eyEKQqqBF8N6GmXjDjSNfdcd8
 psrDU0mQ==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uRO2s-00ARqc-2m;
 Tue, 17 Jun 2025 07:35:39 +0300
Message-ID: <ccf6ab71-bdf2-4e3d-a8e5-228c24bcf3bb@kapsi.fi>
Date: Tue, 17 Jun 2025 13:34:18 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
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
 <9018994f-de55-41b3-ae45-59cccaaf8603@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <9018994f-de55-41b3-ae45-59cccaaf8603@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 6/16/25 7:23 PM, Diogo Ivo wrote:
> 
> 
> On 6/12/25 2:55 AM, Mikko Perttunen wrote:
>> On 6/12/25 12:06 AM, Thierry Reding wrote:
>>> On Wed, Jun 11, 2025 at 01:05:40PM +0100, Diogo Ivo wrote:
>>>> I have a question here, what exactly are the stream IDs? While working
>>>> on the driver this came up and I didn't manage to figure it out.
>>>
>>> Stream IDs are a way to identify memory transactions as belonging to a
>>> certain device. This comes into play when working with the IOMMU (which
>>> is a Tegra SMMU on Tegra210 and earlier, and an ARM SMMU on Tegra) and
>>> is used to isolate DMA capable devices. Basically for every stream ID
>>> you get a separate I/O address space. NVJPG will have its own address
>>> space, and so will VIC. Each device can only access whatever has been
>>> mapped to it's I/O address space. That means NVJPG can't interfere with
>>> VIC and vice-versa. And neither can any of these engines read from or
>>> write to random system memory if badly programmed.
>>>
>>> For Tegra SMMU there's no such thing as programmable stream IDs, so the
>>> stream ID is fixed for the given device.
>>>
>>> On newer chips (Tegra186 and later, or maybe it wasn't until Tegra194),
>>
>> Tegra186 and newer -- all chips with the ARM SMMU. To add a little 
>> bit, each engine can address two stream IDs, one for firmware and one 
>> for data. All user specified buffers are mapped into the data IOMMU 
>> domain, and these are switched between jobs / applications.
>>
>> As an aside, currently each engine has its own firmware stream ID, but 
>> that's a bit wasteful, since the kernel allocates a separate IOMMU 
>> domain for each. The firmwares are all read-only so they could be in a 
>> shared one. We've had to consolidate these on some platforms that ran 
>> out of IOMMU domains otherwise. Not really a concern with upstream 
>> platforms, though.
> 
> Does this dual Stream ID also apply to Tegra210?

No, only Tegra186 and later (chips with ARM SMMU).

> 
>> Also need to program the THI_STREAMID / TRANSCFG registers during boot.
> 
> Thanks,
> Diogo
> 

