Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7994C450436
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 13:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488E66E9BA;
	Mon, 15 Nov 2021 12:13:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www381.your-server.de (www381.your-server.de [78.46.137.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A4226E9BA
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 12:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=metafoo.de; 
 s=default2002;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=toF67llO+BAwsdq0Ra1tOzp5njbcpYDZtx+Ajrw2D5M=; b=Fdhydmz9sHTMX39b4OR+PnWK29
 ollzQvnmIQR6UYtKJJv+pdNenKDhmJoe1m+AZz1r/UzmBuh/s/zyEVT/qUSOAY+AepfailB3KakGl
 nzMJPMS8YSL/mnxq67rqUJ7DGip2AxA33Vlw4H7McDxqIsQkCuDgzYTS3PpC3S4JeCR7BBcBbUbNI
 zMk0Qwr7AHYBGE7YmvvEhxReJcSjOojKOUKKRtntZ7OnV/zed4/BbkqMvJs3SZ7PDbAEwJGvaYuyr
 n93yvvpN0QrMdCXLyiVSv13S7LoWnUnb5JznQFPOzPr8bw/l91uSL6xCRsqIjm0Tb3QDvxbpszYjo
 WFHKC7mA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www381.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <lars@metafoo.de>)
 id 1mmaYO-000B0u-Vm; Mon, 15 Nov 2021 12:53:41 +0100
Received: from [82.135.83.112] (helo=[192.168.178.20])
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <lars@metafoo.de>)
 id 1mmaYO-000AKe-8G; Mon, 15 Nov 2021 12:53:40 +0100
Subject: Re: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
To: Arnd Bergmann <arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
 <20211115085403.360194-2-arnd@kernel.org>
 <647b842d-76a1-7a96-3ea7-8a37b62bc18e@metafoo.de>
 <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
From: Lars-Peter Clausen <lars@metafoo.de>
Message-ID: <d2dd42fc-e58a-0c06-7f7e-a6a2161c368d@metafoo.de>
Date: Mon, 15 Nov 2021 12:53:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a2EVseM4t=e982fFhzBGSZxZ2_V-FHwr-fQPd-bkAKaJg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Authenticated-Sender: lars@metafoo.de
X-Virus-Scanned: Clear (ClamAV 0.103.3/26354/Mon Nov 15 10:21:07 2021)
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi <linux-spi@vger.kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-staging@lists.linux.dev,
 Michal Simek <michal.simek@xilinx.com>, Jon Hunter <jonathanh@nvidia.com>,
 Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>, Jaroslav Kysela <perex@perex.cz>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-mmc <linux-mmc@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Laxman Dewangan <ldewangan@nvidia.com>,
 Baolin Wang <baolin.wang7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/21 11:42 AM, Arnd Bergmann wrote:
> On Mon, Nov 15, 2021 at 11:14 AM Lars-Peter Clausen <lars@metafoo.de> wrote:
>> On 11/15/21 9:53 AM, Arnd Bergmann wrote:
>>> From: Arnd Bergmann <arnd@arndb.de>
>>>
>>> This field is never set, and serves no purpose, so remove it.
>> I agree that we should remove it. Its been legacy support code for a
>> while, but the description that there is no user is not right.
>>
>> The tegra20_spdif driver obviously uses it and that user is removed in
>> this patch. I think it makes sense to split that out into a separate
>> patch with a description why the driver will still work even with
>> slave_id removed. Maybe the best is to remove the whole tegra20_spdif
>> driver.
> Ok, I'll split out the tegra patch and try to come up with a better
> description for it. What I saw in that driver is it just passes down the
> slave_id number from a 'struct resource', but there is nothing in
> the kernel that sets up this resource.
>
> Do you or someone else have more information on the state of this
> driver? I can see that it does not contain any of_device_id based
> probing, so it seems that this is either dead code, the platform_device
> gets created by some other code that is no longer compatible with
> this driver.

I've looked into this a while back, when I tried to remove slave_id. And 
as far as I can tell there were never any in-tree users of this driver, 
even back when we used platform board files. Maybe somebody from Nvidia 
knows if there are out-of-tree users.

- Lars

