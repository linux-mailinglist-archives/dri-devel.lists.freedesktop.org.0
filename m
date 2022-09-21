Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACE5BF836
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 09:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B5D10E8BD;
	Wed, 21 Sep 2022 07:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C440E10E8BD
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Sep 2022 07:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yDU7cULxVdpJ/UBJp8aYy02w14Tx6aVcHKBJ/fAjBHk=; b=1j1J0Nfa6b+RwDngJH/QJ9P1Dd
 8rUbvZzpqajDqRXZXukqpeO3bisSbhdTUWh3RndHaZGCB0jYWafxCOKyZkixUKMruSNt2o8iRv32U
 +KXZ/B1mA7tgg8E9w/zA50K8p4do+dvOl4HAZ+0vi8Y5RUBBQGlWsWtnWVPiPCVoNgjniAa5C3YM2
 y8KpvDE3p0637ZNGddh8z/vT1pfe46cpDil5aEIlr1XTJQXgkc7usijYJqTuxCvZze7vc5ezUMq7u
 qxpxpUKYMGXNN3ZYUendoIxt1ZePaSzQeOKCYn+KldbLH2qmpL+Sp+a80eRyefnZ4memqD7LOrwbE
 UgTlClQQ==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oauUq-0076Jh-I3; Wed, 21 Sep 2022 10:50:16 +0300
Message-ID: <de7f5e65-c939-558a-277d-01320f93eedc@kapsi.fi>
Date: Wed, 21 Sep 2022 10:50:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v3 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220920081203.3237744-1-cyndis@kapsi.fi>
 <89d925ea-f550-6903-1c24-b320ae5a82c0@linaro.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <89d925ea-f550-6903-1c24-b320ae5a82c0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 91.158.25.70
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

On 9/21/22 10:26, Krzysztof Kozlowski wrote:
> On 20/09/2022 10:11, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> v3:
>> * Updated patch 3 based on comments
>>
>> v2:
>> * Updated patches 1,3 based on comments
>> * Added Acked-by to patch 2
>>
>> Original message:
>>
>> Hi all,
>>
>> this series adds support for the HW video decoder, NVDEC,
>> on Tegra234 (Orin). The main change is a switch from Falcon
>> to RISC-V for the internal microcontroller, which brings along
>> a change in how the engine is booted. Otherwise it is backwards
>> compatible with earlier versions.
> 
> I asked you to describe the dependencies and patch merging strategy.
> It's still not here, so I assume there are no and I am taking patches
> relevant to me.
> 
> Best regards,
> Krzysztof

Sorry, I described it in the earlier email and forgot to add it to the 
cover letter..

Patch 8 does depend on patch 1 so it would be better to take the memory 
patch with it, or however works best from maintainership point of view 
(not my expertise).

thanks,
Mikko
