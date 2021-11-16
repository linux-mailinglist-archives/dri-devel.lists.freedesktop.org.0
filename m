Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C3945279C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 03:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DFB6E174;
	Tue, 16 Nov 2021 02:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5476E174
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 02:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=wMEYwRnfQ2uN4NJH/LcIFcvyTglWJNpL//1mKWSrSgU=; b=RhqpbimsYD1BWAnU3z1ctqHHKC
 TuPNkjJmJaOoArc+a98Y8HBDZK13pLds2cBvSnGuuWzoYNu6OZRbLbu8npdYNvp7dDpVeQAtvl+y5
 nVc567zTVAD5z9pMQz3hZT8uHmtzweseckZsDPqOKCh24jGTJd2GRwapDqKPkYUBjkN+3aaaFuxYk
 l54fTdgEQuhnrQGPIACYm0vTX8KEu7oEEB2jRwJYh/qKQoN1Ieel2lY5K/FFAhdyDhlUAzUioh+Ii
 8079FpsoOfO76pDBAC/qSovlWqOvQW0VUJg39lj2DGARc0IS6i0D898aa64Kcr5/N3IVp+bLHbzfJ
 63p/9i9Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmo9k-000400-QM; Tue, 16 Nov 2021 02:25:08 +0000
Subject: Re: [PATCH] backlight: ili922x: fix kernel-doc warnings & notation
To: Daniel Thompson <daniel.thompson@linaro.org>
References: <20211115033925.22024-1-rdunlap@infradead.org>
 <20211115113832.rsdx3ziuujrobwxx@maple.lan>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9671cd29-aa9c-c93b-4bcd-43d4300a2e7c@infradead.org>
Date: Mon, 15 Nov 2021 18:25:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211115113832.rsdx3ziuujrobwxx@maple.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: kernel test robot <lkp@intel.com>, Jingoo Han <jingoohan1@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Anatolij Gustschin <agust@denx.de>, Lee Jones <lee.jones@linaro.org>,
 Stefano Babic <sbabic@denx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/15/21 3:38 AM, Daniel Thompson wrote:

> 
> Thanks for the fixes. Just a could of quibbles about full
> stops/periods.
> 
> 
>> ---
>>   drivers/video/backlight/ili922x.c |   29 ++++++++++++++++++----------
>>   1 file changed, 19 insertions(+), 10 deletions(-)
>>
>> --- linux-next-20211102.orig/drivers/video/backlight/ili922x.c
>> +++ linux-next-20211102/drivers/video/backlight/ili922x.c

>>   /**
>> - * CHECK_FREQ_REG(spi_device s, spi_transfer x) - Check the frequency
>> - *	for the SPI transfer. According to the datasheet, the controller
>> - *	accept higher frequency for the GRAM transfer, but it requires
>> + * CHECK_FREQ_REG() - Check the frequency for the SPI transfer
>> + *	According to the datasheet, the controller
>> + *	accepts higher frequency for the GRAM transfer, but it requires
> 
> Also missing the full stop/period in the first sentence of the summary.
> 
> Note that here the missing full stop does not benefit from a new line to
> conceal it and we will generate bad text as a result.
> 
>    Check the frequency for the SPI transfer According to the data
>    sheet, the controller accepts...

Got it. I'll send a v2.

Thanks.
-- 
~Randy
