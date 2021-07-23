Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492BC3D3794
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jul 2021 11:18:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC956EA23;
	Fri, 23 Jul 2021 09:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BF86F894
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jul 2021 09:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=crMwevUrUiGlxEnhBFj4y4HAHydElCl65A6jne0BeK8=; b=U7FWPEyckNRDPg3f4Yzl94zzgL
 EcQ+M4oNPMzexdurBMNkRjFHQQd7+Z2QCtjbgemp4hJHU4aMbPEa0VnBnIJ8RyoA5AkFZ0c3oxiwQ
 HWaAwXR/qhw9sKuhz3tHk4hY6aR6djs6YvbuAFy/Fe+8sY+zK34ddwWkxMx8fv1+lEOmbyPqBkf9Z
 7aR2+KWyZTrV4h9oietZAqFCzhk8EBFQ+WePaVeoBrYeN0QTu9jcPBvaY0AkcIQ1iNXx5TfYbi78u
 iK6UHAdGQ1CWidot3uAPahogxofT9VeM54zIMBMBfJoE4M+R/+5yLPFgfsm8qa1HoH//tcqby8//J
 Dzu/vDlA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1m6rKY-0006sm-7H; Fri, 23 Jul 2021 12:18:54 +0300
Subject: Re: [PATCH] gpu: host1x: select CONFIG_SYNC_FILE
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Arnd Bergmann <arnd@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
References: <20210723091424.1682193-1-arnd@kernel.org>
 <0f4d1f0a-c313-a60e-6a72-fd4b0c757bc3@kapsi.fi>
Message-ID: <b7432d28-1082-1500-b4bd-fa566c63d264@kapsi.fi>
Date: Fri, 23 Jul 2021 12:18:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <0f4d1f0a-c313-a60e-6a72-fd4b0c757bc3@kapsi.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/23/21 12:17 PM, Mikko Perttunen wrote:
> Hi Arnd,
> 
> I think the best fix for this is to just remove that function -- it is 
> currently not used anywhere. I posted a patch to do that, but Thierry is 
> currently on vacation so it hasn't been picked up yet.

.. and sorry for the top post ..

Mikko

> 
> thanks,
> Mikko
> 
> On 7/23/21 12:14 PM, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> With the addition of the DMA fence, the host1x driver now fails to
>> build without the sync_file helper:
>>
>> arm-linux-gnueabi-ld: drivers/gpu/host1x/fence.o: in function 
>> `host1x_fence_create_fd':
>> fence.c:(.text+0x624): undefined reference to `sync_file_create'
>>
>> Fixes: ad0529424def ("gpu: host1x: Add DMA fence implementation")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/gpu/host1x/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/host1x/Kconfig b/drivers/gpu/host1x/Kconfig
>> index 6dab94adf25e..6f7ea1720a39 100644
>> --- a/drivers/gpu/host1x/Kconfig
>> +++ b/drivers/gpu/host1x/Kconfig
>> @@ -3,6 +3,7 @@ config TEGRA_HOST1X
>>       tristate "NVIDIA Tegra host1x driver"
>>       depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
>>       select IOMMU_IOVA
>> +    select SYNC_FILE
>>       help
>>         Driver for the NVIDIA Tegra host1x hardware.
>>
