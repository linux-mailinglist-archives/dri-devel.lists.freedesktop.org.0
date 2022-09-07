Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B525AFBBA
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 07:28:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BB010E27B;
	Wed,  7 Sep 2022 05:28:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC5910E27B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 05:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ag5A/RmCropcVrgEGeSl2EI9o9geRtdOi57vqqT+CvE=; b=kQ2pBUusDPefhBlg4MGjWwa8ty
 +/GdLiFN+gF8drvcCy7WMoe4LgkhG8JbtbwxG79U6GI3M9xRam/Y7NOjUzSv5dFoNWnjwAYzAjy4p
 HVUbxizz4LyAksmsZCBTh4b/sjr9dbvOhdLXGYPzOmjaM1LfEVY1l0HyQCouemgcXGSWFaiGrx9TO
 MO3tkQhmX3tebsgXDWXjVOWEe6WYMUUV4jOWswYcYMVbxUt9GkhzSuF0JLalzUVsr2uc1/T02Vtyu
 QGrANyvBhdh991kfEx3d1v7swBspa7ftTgtWbEpoRk98smXz+uyR0OHH5aYnwFEkhTUSzOkLFpO3A
 pKKoHL3A==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVnbR-00Chdy-OB; Wed, 07 Sep 2022 08:27:57 +0300
Message-ID: <1dabfcbe-7729-1a96-816c-68ae524ed4aa@kapsi.fi>
Date: Wed, 7 Sep 2022 08:27:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH 0/8] Support for NVDEC on Tegra234
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
References: <20220906132823.2390953-1-cyndis@kapsi.fi>
 <68ff1b7e-51e1-f1e5-dac7-5419472e396a@linaro.org>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <68ff1b7e-51e1-f1e5-dac7-5419472e396a@linaro.org>
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

On 9/6/22 20:50, Krzysztof Kozlowski wrote:
> On 06/09/2022 15:28, Mikko Perttunen wrote:
>> From: Mikko Perttunen <mperttunen@nvidia.com>
>>
>> Hi all,
>>
>> this series adds support for the HW video decoder, NVDEC,
>> on Tegra234 (Orin). The main change is a switch from Falcon
>> to RISC-V for the internal microcontroller, which brings along
>> a change in how the engine is booted. Otherwise it is backwards
>> compatible with earlier versions.
> 
> You need to describe the dependencies, otherwise I would be free to go
> with applying memory controllers part.

Hi Krzysztof,

the memory controller patch can be applied independently.

Thanks,
Mikko

> 
> Best regards,
> Krzysztof

