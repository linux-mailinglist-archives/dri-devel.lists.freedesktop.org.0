Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B8E2528D7
	for <lists+dri-devel@lfdr.de>; Wed, 26 Aug 2020 10:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB9F6EA3E;
	Wed, 26 Aug 2020 08:04:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C546E956
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 17:40:31 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id mw10so1599751pjb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 10:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2CIAlEB0sn0czmBCstmmbk0rRRc0a7Q7Eg5uRFK+DTM=;
 b=OWtTyCh4mBkSanD+KT2LmsSmys9GdgNPDuMOUrEMBvirSVEpgWaccxzuVDCSUPzr+g
 UL3d/b/WhkUnWbhm0C+dKAbICczXHeEay6JEghnYPq1AWGXV0OqUHZVzSR0vH40qB4T7
 CvKheJOKe1bLwlHMjKz6V1TnFYQX/QwQ3zFo3OtKNBualjgvS3McIxk5bZckCXdHUxPn
 y5cllopsvswApow32o5Hqk8i69l4DMq5zNUIBV31X/TRx3SDq4RkHJpDQFbpdjwtNLEK
 YafzqTXU3/pyTiKmRDgRCRX9RrujtgeJf8Hbr9VBxTZRL/Jzkqt3LfmQHxV5h/PRKVwB
 vyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2CIAlEB0sn0czmBCstmmbk0rRRc0a7Q7Eg5uRFK+DTM=;
 b=qBQnH4OrTy1ZVItB2TW1ksqmPEKMJVshXx7WQHARA/FRqDcGG8J8zmBW7C0E9WmqXl
 MZTNq7Y8x2N+nXwlJrOtfeF1P+Z0t7SAbpmxx+uR5RKYtuJ5faZ5EXQpuFTgRgDAg0dT
 eg9SgK9i8hAgfPCFJ61vpKIVBDLhOT5fk7QNx+yYDK/HJeqpgqwAS6EIZQihuymIk/FG
 mIuaQ74mpiCKriuRa6Pi/cF4C3h5MU883Dt6tgNDJ2/QxQtHfkSZpcREphzf364OJzqd
 iahBBfXsfSTTHYxLokuxqhluS90PC+8Ec1+9pnj3Hx6hckW8Ha4gg5oHags9gNqXZT6E
 rjdQ==
X-Gm-Message-State: AOAM533FzHXnqlAH3MCWnQn5oIxp2AcPmz/jNeFq08a5tz75isRXoDAT
 ItB6DZJqO9acF/7fDgsMD44=
X-Google-Smtp-Source: ABdhPJygG/iRoMRtYkc62+6+vovnxiIUBYXGvz6sXIt/PP/MjnVCr6wdHgCpE82t+Egu2LRmdgvskQ==
X-Received: by 2002:a17:90a:eb17:: with SMTP id
 j23mr2403499pjz.151.1598377230639; 
 Tue, 25 Aug 2020 10:40:30 -0700 (PDT)
Received: from [10.69.79.32] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b6sm3378574pjz.33.2020.08.25.10.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Aug 2020 10:40:29 -0700 (PDT)
Subject: Re: [PATCH v11 00/11] PCI: brcmstb: enable PCIe for STB chips
To: Jim Quinlan <james.quinlan@broadcom.com>, linux-pci@vger.kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
 bcm-kernel-feedback-list@broadcom.com
References: <20200824193036.6033-1-james.quinlan@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <b19bc982-a0c4-c6ff-d8f5-650f2b3a83c8@gmail.com>
Date: Tue, 25 Aug 2020 10:40:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200824193036.6033-1-james.quinlan@broadcom.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Aug 2020 08:04:49 +0000
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
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Julien Grall <julien.grall@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "open list:ACPI FOR ARM64 \(ACPI/arm64\)" <linux-acpi@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 "open list:ALLWINNER A10 CSI DRIVER" <linux-media@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Joerg Roedel <jroedel@suse.de>,
 "moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 8/24/2020 12:30 PM, Jim Quinlan wrote:
> 
> Patchset Summary:
>    Enhance a PCIe host controller driver.  Because of its unusual design
>    we are foced to change dev->dma_pfn_offset into a more general role
>    allowing multiple offsets.  See the 'v1' notes below for more info.

We are version 11 and counting, and it is not clear to me whether there 
is any chance of getting these patches reviewed and hopefully merged for 
the 5.10 merge window.

There are a lot of different files being touched, so what would be the 
ideal way of routing those changes towards inclusion?

Thanks!
-- 
Florian
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
