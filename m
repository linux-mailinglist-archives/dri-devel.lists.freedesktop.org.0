Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4249E36B9D1
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 21:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6900D89148;
	Mon, 26 Apr 2021 19:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521ED6E86D;
 Mon, 26 Apr 2021 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=pnKzdbOPzZSQYjwLj7WyZcZU9565NzRjpCFzu8GyTfw=; b=efMIkUs4aQeMT6UgS/WiHk1rrm
 +Qum2LujncESNM6fWI0GSAjQEp5UKm6AeQvgUDWTQfUboADhwgeGDfWYXU+ed0VFA0uPPg3mpLBkM
 N+BaPeGVyYvQ96rsY4wsvvR31Fxp+/UxI7HcQAyjODSidR25QGGSBCsTDm5dmge+2kMjeulUAiybm
 aWmi3sTfFHXxXJjwJ103LyXflCYgNZh8aAxmBkKnLFugg+JHQePuprcFp2Dwonv52GhzpdZPbBxRF
 RjOkgC3/5v368BDxCR1UBmkitmRsP3pAjxxLNdWZAppE14a9APyYQz6J7oKc9voE2hBqnJJZ87pkS
 KgX/kwnA==;
Received: from [2601:1c0:6280:3f0::df68]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lb6e7-005zpv-1Y; Mon, 26 Apr 2021 19:11:55 +0000
Subject: Re: [PATCH 01/12] vfio/mdev: Remove CONFIG_VFIO_MDEV_DEVICE
To: Jason Gunthorpe <jgg@nvidia.com>
References: <1-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
 <d058f9ad-7ce1-c1b3-19cd-5f625ef4c670@infradead.org>
 <20210426182625.GY1370958@nvidia.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <79ee612e-4830-2d04-c7eb-e2a51dd7e8e7@infradead.org>
Date: Mon, 26 Apr 2021 12:11:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210426182625.GY1370958@nvidia.com>
Content-Language: en-US
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Kirti Wankhede <kwankhede@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>, linux-s390@vger.kernel.org, "Raj,
 Ashok" <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Tarun Gupta <targupta@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Max Gurtovoy <mgurtovoy@nvidia.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/26/21 11:26 AM, Jason Gunthorpe wrote:
> On Fri, Apr 23, 2021 at 05:08:10PM -0700, Randy Dunlap wrote:
>> On 4/23/21 4:02 PM, Jason Gunthorpe wrote:
>>> @@ -171,7 +171,7 @@ config SAMPLE_VFIO_MDEV_MDPY_FB
>>>  
>>>  config SAMPLE_VFIO_MDEV_MBOCHS
>>>  	tristate "Build VFIO mdpy example mediated device sample code -- loadable modules only"
>>
>> You can drop the ending of the prompt string.
> 
> Hum, I see this whole sample kconfig file is filled with this '&& m'
> pattern, I wonder if there is a reason?
> 
> I think I will put the '&& m' back, I thought it was some kconfig
> misunderstanding as it is very strange to see a naked '&& M'.

It just limits those kconfig items to being =m or not set,
i.e., even though they are tristate, setting to =y is not
allowed.  I guess the thinking is that samples don't need to
reside in system memory for very long. However, if you want
this one to be capable of =y, like your patch, you can still
remove the end of the prompt string.

-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
