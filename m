Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113D1AD32CC
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04AC10E104;
	Tue, 10 Jun 2025 09:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="IUldsBmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E9B10E292
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 09:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KurdznyGmdBaXGxy5k6+GHKIMOxog06BdRN2PVDz908=; b=IUldsBmVmrfNnn14VfmuIq0X5q
 yX+6JPYiM8PCpsjC8I9Yhpohy2h6fxGZOyPyaBnNvTW7UQ/sbez/dxsXEcHnza9CcSiTUejGiVT9P
 9nsECCK9YYeZNU8TCBG1cb0EWI623bxRNQrkLZUG90XaV+o9ZqpBJjTLuZ2Cp4arUXP27byu+/KxM
 PPScdYwO9Mrw21v7T/uabcBbahFE3wIbaSBG7+3oXJVXrXlNT32D2b+AYo5CIGUv7Gq4kIVVMdtz9
 xJl3X/nbh2+a/5Q9r8NAxxqUDFC/AKYkdExOGtlCsvW+fzGGPKSPmoIu9a0JabAqEnotV9hxPQYWw
 eaY1vH9Q==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uOvfo-008jtg-1l;
 Tue, 10 Jun 2025 12:53:40 +0300
Message-ID: <621a9459-f2dd-4b19-a083-0e62f1a42f50@kapsi.fi>
Date: Tue, 10 Jun 2025 18:52:22 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
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
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
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

On 6/10/25 6:05 PM, Thierry Reding wrote:
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

FWIW, the impression I have is that NVJPG is basically unchanged all the 
way to Tegra234. So if we add stream ID support and the firmwares, it'll 
probably just work. Tegra234 has the quirk that it has two instances of 
NVJPG -- these have to be distinguished by their different class IDs. 
But we should go ahead with the T210 support first.

> 
>> Due to the way the Gallium implementation works for Tegra
>> the GPU also needs to be enabled.
> 
> I wonder if maybe we can get rid of this requirement. While it's
> certainly nice to have the GPU enabled, there may be cases where using
> only the other engines may be advantageous. Originally when I had worked
> on VIC, I was looking at how it could be used for compositing without
> getting the GPU involved. That's something that Android devices tend(ed)
> to do because of the power savings that come with it.
> 
> Anyway, not a big deal, depending on the GPU for now is fine.
> 
> Thierry

