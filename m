Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8542684A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 12:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C1D6F464;
	Fri,  8 Oct 2021 10:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00BC56F464
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 10:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dMUi9fUk9Sl1RKpo0LrAUB/zQghMevCatyl2BQsJhqI=; b=DPyq9tYdKHX5MIMlxg5ptXmbvs
 IsxJ8MQGTTQLcO9qpDk5Sv/gRhGgkLc1PL4gsQvwPCaZdOoUGRZJRSKMqia98Trd5GmFteaUAl5Rz
 65YmtlkgM2Cp033duDQjLBO3s6rGONvDBesae+043lom0pzbma+QjV4PzhJJAqvcYZsKsL+sng0dF
 5sJGDW7RBDe+jLwWtjBQ5U9t/ZvHdFM9cS+aWDaLp0NYNhdMLyakFYsN9fHqFBZKxoqVTStnOqNme
 HXUCpTL1bn8Us/27enQMT+if6J/QpY078SGOQ+zL82yCk2jiWc6g0z2lWj+KBtL4HSNA/AaKHGa/2
 9IbmEMLA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1mYnTR-0001QZ-Td; Fri, 08 Oct 2021 13:51:33 +0300
Subject: Re: [PATCH v6 2/3] arm64: tegra: Add NVDEC to Tegra186/194 device
 trees
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20210916145517.2047351-1-mperttunen@nvidia.com>
 <20210916145517.2047351-3-mperttunen@nvidia.com>
 <YV3ojTpZuH9HU5DU@orome.fritz.box>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <bd6b2743-65d1-7af5-41f5-ecfa5981f30c@kapsi.fi>
Date: Fri, 8 Oct 2021 13:51:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YV3ojTpZuH9HU5DU@orome.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 84.249.134.236
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

On 10/6/21 9:18 PM, Thierry Reding wrote:
> On Thu, Sep 16, 2021 at 05:55:16PM +0300, Mikko Perttunen wrote:
>> Add a device tree node for NVDEC on Tegra186, and
>> device tree nodes for NVDEC and NVDEC1 on Tegra194.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v5:
>> * Change from nvidia,instance to nvidia,host1x-class
>> v4:
>> * Add dma-coherent markers
>> v3:
>> * Change read2 to read-1
>> v2:
>> * Add NVDECSRD1 memory client
>> * Add also to T194 (both NVDEC0/1)
>> ---
>>   arch/arm64/boot/dts/nvidia/tegra186.dtsi | 16 ++++++++++
>>   arch/arm64/boot/dts/nvidia/tegra194.dtsi | 38 ++++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
> 
> The driver patch adds support for Tegra210, so could we also add NVDEC
> entries for that?
> 
> Thierry
> 

Yes. I don't have my T210 system set up right now to verify, though, and 
I don't have time to look at this in the next few weeks.

Mikko
