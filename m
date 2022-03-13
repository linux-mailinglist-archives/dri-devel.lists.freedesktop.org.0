Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F37D44D769F
	for <lists+dri-devel@lfdr.de>; Sun, 13 Mar 2022 17:07:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4C9A10E6D5;
	Sun, 13 Mar 2022 16:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAA9E10E6C1
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647187642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nY2cZCuy6qYWtFA5cdqxCaGAcEbZP4lwmilsEEN2CdQ=;
 b=VHBNvrJVr2KvCSvgqp/VsslJDBWEqHv/H0jn2R/XPiHJ91iIOLcgbEsYCLFY2TCaLzlzWe
 wZT8pmQP9Dh4teG432Artd3QUBnBXUkO/+HIOB6bmVpdK1DONt1Jtt/nfp1+whGR+bEeV9
 a9C2LTG2MzaaPCds1ZiU2kYqMTjRSrY=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-272-aliKNcV3NmaPzaVZlKfTYw-1; Sun, 13 Mar 2022 12:07:21 -0400
X-MC-Unique: aliKNcV3NmaPzaVZlKfTYw-1
Received: by mail-oi1-f197.google.com with SMTP id
 13-20020aca210d000000b002da5b484056so7419719oiz.8
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Mar 2022 09:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=nY2cZCuy6qYWtFA5cdqxCaGAcEbZP4lwmilsEEN2CdQ=;
 b=HGaL3B4wRwVR9eBgXtgbvL8YRYmOzPF36ePqCNetv0abFE19L0Sa3b8Lu/e1CCOo57
 tFSRXh8AelYs+R60Q4q6SvvvkwTTtziTEGBKwsUeWii/srS873SQRQED5FZNdQxJjoHU
 mrz/9th6vyz4utVhNiTW0EjvZCio0AGivr/ieQPm1AccKR3x7VWYiMDpWlPWv4J62Bzk
 aZguVJWETfkItSfUI+KmsFMt94zc0MWYnrcQ2+Y7Iaur0GM3RDsG1Gy8857y9I759pFg
 e/tHRlJJ2zmcP2OZHbCXsPKPiHEKWx7HHdsDpMgtj3FdSe/0ttmxOfHgLG2fhjHDqIlU
 5x+Q==
X-Gm-Message-State: AOAM5305T9s1G07FIqO/bJOCvQ5sbHR8snxE8zQCTMCAaqNN9j8Uqnks
 4f1hWVT77WgvS6pSIz1kraPIbJHWEa1XwDH/nyR6zAzy2wWSbA9CultwEpouClWqoNbbjSlv/33
 lFlCgtA/i9FYQC0ezzmjmp7TTOL0o
X-Received: by 2002:a05:6870:390a:b0:da:5a7d:6db7 with SMTP id
 b10-20020a056870390a00b000da5a7d6db7mr9521356oap.89.1647187640352; 
 Sun, 13 Mar 2022 09:07:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDdtgAQe/DZ7B56iQBj44EMV7xiW+P7wdn9p7djGiqekto8fq1VMJd/Hzy1GzC0jqq0RgYLg==
X-Received: by 2002:a05:6870:390a:b0:da:5a7d:6db7 with SMTP id
 b10-20020a056870390a00b000da5a7d6db7mr9521349oap.89.1647187640176; 
 Sun, 13 Mar 2022 09:07:20 -0700 (PDT)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113]) by smtp.gmail.com with ESMTPSA id
 bb39-20020a05680816a700b002d9a8eb89fasm6472639oib.46.2022.03.13.09.07.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 09:07:19 -0700 (PDT)
Subject: Re: [PATCH] drm/repaper: combine allocs in repaper_spi_transfer()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220313141008.1503638-1-trix@redhat.com>
 <569b42fb-5d85-645a-2947-77216c44696a@tronnes.org>
From: Tom Rix <trix@redhat.com>
Message-ID: <52a1c253-0206-182e-5e41-03f94e7e7275@redhat.com>
Date: Sun, 13 Mar 2022 09:07:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <569b42fb-5d85-645a-2947-77216c44696a@tronnes.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/13/22 8:41 AM, Noralf Trønnes wrote:
>
> Den 13.03.2022 15.10, skrev trix@redhat.com:
>> From: Tom Rix <trix@redhat.com>
>>
>> repaper_spi_transfer() allocates a single byte
>> for the spi header and then another buffer for
>> the payload.  Combine the allocs into a single
>> buffer with offsets.  To simplify the offsets
>> put the header after the payload.
>>
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/gpu/drm/tiny/repaper.c | 40 ++++++++++------------------------
>>   1 file changed, 12 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
>> index 37b6bb90e46e1..22a6732f35a01 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>> @@ -100,50 +100,34 @@ static inline struct repaper_epd *drm_to_epd(struct drm_device *drm)
>>   static int repaper_spi_transfer(struct spi_device *spi, u8 header,
>>   				const void *tx, void *rx, size_t len)
>>   {
>> -	void *txbuf = NULL, *rxbuf = NULL;
>>   	struct spi_transfer tr[2] = {};
>> -	u8 *headerbuf;
>> +	u8 *buf;
>>   	int ret;
>>   
>> -	headerbuf = kmalloc(1, GFP_KERNEL);
>> -	if (!headerbuf)
>> +	buf = kmalloc(1 + len, GFP_KERNEL);
>> +	if (!buf)
>>   		return -ENOMEM;
>>   
>> -	headerbuf[0] = header;
>> -	tr[0].tx_buf = headerbuf;
>> +	buf[len] = header;
>> +	tr[0].tx_buf = &buf[len];
> I don't think this will work since the buffer is used directly for DMA
> on some platforms[1] so the buffers need to be at the correct alignment
> for that to work. For this reason I think it's better to leave this
> as-is since we know the kmalloc buffers will always be useable for DMA
> and the code is also easy to read and understand instead of calculating
> offsets.
>
> [1] tinydrm/mipi-dbi: Use dma-safe buffers for all SPI transfers
> (a89bfc5d9a07)
>
> Noralf.
>
>>   	tr[0].len = 1;
>>   
>> -	/* Stack allocated tx? */
>> -	if (tx && len <= 32) {

How about a change to remove this ?

It seems like you are getting lucky.

reduce the to single txrx_buf

Tom

>> -		txbuf = kmemdup(tx, len, GFP_KERNEL);
>> -		if (!txbuf) {
>> -			ret = -ENOMEM;
>> -			goto out_free;
>> -		}
>> +	if (tx) {
>> +		memcpy(buf, tx, len);
>> +		tr[1].tx_buf = buf;
>>   	}
>>   
>> -	if (rx) {
>> -		rxbuf = kmalloc(len, GFP_KERNEL);
>> -		if (!rxbuf) {
>> -			ret = -ENOMEM;
>> -			goto out_free;
>> -		}
>> -	}
>> +	if (rx)
>> +		tr[1].rx_buf = buf;
>>   
>> -	tr[1].tx_buf = txbuf ? txbuf : tx;
>> -	tr[1].rx_buf = rxbuf;
>>   	tr[1].len = len;
>>   
>>   	ndelay(80);
>>   	ret = spi_sync_transfer(spi, tr, 2);
>>   	if (rx && !ret)
>> -		memcpy(rx, rxbuf, len);
>> -
>> -out_free:
>> -	kfree(headerbuf);
>> -	kfree(txbuf);
>> -	kfree(rxbuf);
>> +		memcpy(rx, buf, len);
>>   
>> +	kfree(buf);
>>   	return ret;
>>   }
>>   

