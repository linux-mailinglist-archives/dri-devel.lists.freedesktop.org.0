Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF6A5B0258
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 13:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA1410E56B;
	Wed,  7 Sep 2022 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53FE110E56B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 11:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IHtQBirzXwtf4dk/q6xxCro2O8jKQgCndRBuJfwM/g4=; b=ctEgD08LMNNW/SIaq3haLz/Cb/
 we01NEUmX7hYITgBJcfVsRPOE9tn1o+DDXcYOMkZnSgrcVfoo0w+dFdRLaXIhZHcSdtSW1I0tlpw6
 RLj2UJtqtI7tR9XbBB0eu6xcp+AUzQkPvYg7Ryg5Wu66VBcH9w+eO6KBSPUR+5g2ISw/DqmSND47m
 Z3QQUis68MB3dFLzYh3qy4xZoVU+zsru4KDj4iqlxb0ODTjfqFR6a+F4pemZTLwWSSOmc3WBQQokH
 FWxQYu80m3qDdQFfkDeRgDnpGJyucJAt++4FQhNQTXOJ5JnNN0P7rhoTKpT6+FpMuVwO6RSib0y4N
 bt1zOKOQ==;
Received: from [193.209.96.43] (helo=[10.21.26.179])
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVssR-00EMPf-H8; Wed, 07 Sep 2022 14:05:51 +0300
Message-ID: <bc9499fe-b48c-4fce-24aa-f2de7d8be3fa@kapsi.fi>
Date: Wed, 7 Sep 2022 14:05:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
 <68ff1b7e-51e1-f1e5-dac7-5419472e396a@linaro.org>
 <1dabfcbe-7729-1a96-816c-68ae524ed4aa@kapsi.fi>
 <e1145bd8-e477-9a20-00cc-3d5f5e4f7977@linaro.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <e1145bd8-e477-9a20-00cc-3d5f5e4f7977@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 193.209.96.43
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
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>, linux-tegra@vger.kernel.org,
 Ashish Mhetre <amhetre@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7.9.2022 13.58, Krzysztof Kozlowski wrote:
> On 07/09/2022 07:27, Mikko Perttunen wrote:
>> On 9/6/22 20:50, Krzysztof Kozlowski wrote:
>>> On 06/09/2022 15:28, Mikko Perttunen wrote:
>>>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>>>
>>>> Hi all,
>>>>
>>>> this series adds support for the HW video decoder, NVDEC,
>>>> on Tegra234 (Orin). The main change is a switch from Falcon
>>>> to RISC-V for the internal microcontroller, which brings along
>>>> a change in how the engine is booted. Otherwise it is backwards
>>>> compatible with earlier versions.
>>>
>>> You need to describe the dependencies, otherwise I would be free to go
>>> with applying memory controllers part.
>>
>> Hi Krzysztof,
>>
>> the memory controller patch can be applied independently.
> 
> OK then... but looking at the code it does not seem to. Anyway kbuild
> robot complained so I expect v2.

Ah, indeed, though patch 1 can be applied on top of current trees, patch 
8 does require patch 1 to be there first. Which is, thinking about it 
now, necessary information as well..

Thanks for the reviews.

Mikko

> 
> Best regards,
> Krzysztof
