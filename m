Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9F7260BAD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Sep 2020 09:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D883F6E4A7;
	Tue,  8 Sep 2020 07:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8396E527
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 18:29:10 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 7so8350500pgm.11
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 11:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bmURCbMiaqKzzelpk/S2JynuuyDAIuukHKp0frES45k=;
 b=pGJxdnPlnnjuVnEQiNNF8NPZ9N8cHRKSXuzhjcwyPpc1EErwzM0CyOU4oIwN4LS9Mw
 1wC7EvuKj0Ax1z41J2Q3+FCDPwoQdUe7gPwjEhSmttF1uE8TKkr0ZeZZaCOYAlsTrSqs
 1hDtsmCA12I0M7LfTaBMaahkp6lybABgSUqZ0T/SfYV2TIViz4H4Kf4gHzZu64C2mrWY
 hdu86ghnR/J8FGXfGJpJFZ+boynxUUhjN2XGe9NwROXh85rZPnj3p6DBsKU/2NHGtf8x
 ChhltHIi6E47BdFQF4Mbz+1aEHdsFzD7p965i8s22ViF4mXU7St3Cx+aCA3tXWJyqQQm
 g1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bmURCbMiaqKzzelpk/S2JynuuyDAIuukHKp0frES45k=;
 b=nRzb1Pq/Yjv5Yx4B+fCVlaEtP0Yn9wyJO1zTI6tvlVmgK+enK5UNVhs6wxG9lNJ3GJ
 1g8/azxsmqjfrwKU10RGaEI8hoXvHL/T9Nw9yFDc7GQ/O6jP+O/FSeTEyBMK8/BZZ8VO
 K/s0zSXZmt7KkC7P/cLNIW6LUvCfPGSGmmsUW8+WtPW1nO7C0UXg7Mh476HNIFjRcKM3
 GvFUE2rWVqzf2cJE1rXYGmhbtlSeu2/0PhE8pzVPNfUlZYyAU+AiS3SWjvYzYIZmkyw9
 pyV6j+tL44anyHFKdZnTVZMBLT3G2Ie1Tk2BW499+aPIogQS55KrhLEN+FnJtoIQm5iQ
 q2rQ==
X-Gm-Message-State: AOAM5317AEb+rvZd3gomJHB2USDiD0fyL83YaK9EwjKjBAaCNoc7bJQ9
 jG21Nqmxkvxe7qYXZSjqnDE=
X-Google-Smtp-Source: ABdhPJyh6g2rRcD6ogNPy2tapg1StlUEf/BdvWQy8jzaR475oJoKQT/NWFiUoNd1k6PiwSYe5VKk+A==
X-Received: by 2002:a62:fb05:: with SMTP id x5mr21991954pfm.121.1599503349977; 
 Mon, 07 Sep 2020 11:29:09 -0700 (PDT)
Received: from [192.168.1.3] (ip68-111-84-250.oc.oc.cox.net. [68.111.84.250])
 by smtp.gmail.com with ESMTPSA id
 13sm15823860pfp.3.2020.09.07.11.29.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 11:29:09 -0700 (PDT)
Subject: Re: [PATCH v11 00/11] PCI: brcmstb: enable PCIe for STB chips
To: Jim Quinlan <james.quinlan@broadcom.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
 <b19bc982-a0c4-c6ff-d8f5-650f2b3a83c8@gmail.com>
 <20200827063517.GA4637@lst.de>
 <CA+-6iNy3U9pO0Bykzgvb9n9fcsBi6FiatLdpA1s0HgQNWZ49mg@mail.gmail.com>
 <20200907091649.GA6428@e121166-lin.cambridge.arm.com>
 <CA+-6iNzoz3pM2pJksXogeuou6wB9W-59rN-amCLERFLuY5zLMg@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <00e49acb-c659-de10-3e87-76bfd82e4a76@gmail.com>
Date: Mon, 7 Sep 2020 11:29:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <CA+-6iNzoz3pM2pJksXogeuou6wB9W-59rN-amCLERFLuY5zLMg@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 08 Sep 2020 07:17:17 +0000
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
Cc: "open list:SUPERH" <linux-sh@vger.kernel.org>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Christoph Hellwig <hch@lst.de>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Saravana Kannan <saravanak@google.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/7/2020 10:43 AM, Jim Quinlan wrote:
> On Mon, Sep 7, 2020 at 5:16 AM Lorenzo Pieralisi
> <lorenzo.pieralisi@arm.com> wrote:
>>
>> On Thu, Aug 27, 2020 at 09:29:59AM -0400, Jim Quinlan wrote:
>>> On Thu, Aug 27, 2020 at 2:35 AM Christoph Hellwig <hch@lst.de> wrote:
>>>>
>>>> On Tue, Aug 25, 2020 at 10:40:27AM -0700, Florian Fainelli wrote:
>>>>> Hi,
>>>>>
>>>>> On 8/24/2020 12:30 PM, Jim Quinlan wrote:
>>>>>>
>>>>>> Patchset Summary:
>>>>>>     Enhance a PCIe host controller driver.  Because of its unusual design
>>>>>>     we are foced to change dev->dma_pfn_offset into a more general role
>>>>>>     allowing multiple offsets.  See the 'v1' notes below for more info.
>>>>>
>>>>> We are version 11 and counting, and it is not clear to me whether there is
>>>>> any chance of getting these patches reviewed and hopefully merged for the
>>>>> 5.10 merge window.
>>>>>
>>>>> There are a lot of different files being touched, so what would be the
>>>>> ideal way of routing those changes towards inclusion?
>>>>
>>>> FYI, I offered to take the dma-mapping bits through the dma-mapping tree.
>>>> I have a bit of a backlog, but plan to review and if Jim is ok with that
>>>> apply the current version.
>>> Sounds good to me.
>>
>> Hi Jim,
>>
>> is the dependency now solved ? Should we review/take this series as
>> is for v5.10 through the PCI tree ?
> Hello Lorenzo,
> 
> We are still working out a regression with the DMA offset commit on
> the RaspberryPi.  Nicolas has found the root cause and we are now
> devising a solution.

Maybe we can parallelize the PCIe driver review while the DMA changes 
are being worked on in Christoph's branch. Lorenzo, are you fine with 
the PCIe changes proper?
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
