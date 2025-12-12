Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B4CCB780C
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 02:06:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA52410E299;
	Fri, 12 Dec 2025 01:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lHJjx5Wy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A6110E299
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 01:06:05 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-7f651586be1so90307b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765501565; x=1766106365; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IIn/LcD13PrglPwKrjbzANKOSQPEYp8vSoODGBl4RDw=;
 b=lHJjx5WyeSPMwVX+umTr/F7cbvsc/hovavQsfgp3NlA4jtaAI2A4U366V2xj1IaNkO
 aEKwfA0+FAH11UVjAfAFhRnUYNxsoBxjvIcDVPURN8r25rv+JBKLtg5m0zxHasGBo0hF
 iUq3wZgNu6AlnvRdCxXAAJ2In4d3VE6EyuUoYU0JwIzY5mXQ7TSqYftZjbfeavYFRaWJ
 4OxOrtO+b7QovEgotZHQoQnrTGbqz8j+zUrJDJgmFUrbjPYphr7DjAm56KhGWOUoFS94
 bzrH4NYf5emtpprIsaK1Jsaw/sEqvoVflwcEtfWbFCRZbkRxQ6p+6zEUF9l558H/63cW
 wO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765501565; x=1766106365;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIn/LcD13PrglPwKrjbzANKOSQPEYp8vSoODGBl4RDw=;
 b=ULOMuafQBau6yKAUR8s9XjghoRGNUXRmVLxiA2Ym+HXh82oWDJxTNAqV+wp7n2eS0j
 JAALSLbcVwwfFrS8ODezfiX3rJZ/XOp9d6COm3RWcIVpq5psv8NZ/XpvxUaiuEaScakc
 yv2xN+YydBDDHCn5yqS9okO9Pk9JVCDzed3QtnpYLCg7kZqLBx5k1RO0Ap7VY1YAS5xj
 SVevEBCSCIjipti9v5mJal/9RspknXKohatyPASJNapLEhTNZgqcLjUD3iF1SvZbg8yQ
 gYH1cORWHse2vKjAcLc2Sx0cQWATzYgHw8ereJujlEnrOliI+L4lCi/viN41TWro2q1o
 p+eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7CJ0xqUgeo8B6Yl6YrOTdHfbF9Ak2nQkenHjKxlAqnNqwYIGs/KXh1tacs1ZR67btDgE97TmfbiM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypQbfkSyfxa9vbPbPaY3cnn2G6vNY756LS4Ck8mkF5h9DIPmEX
 mc1nVfDPewGaoMdft9J9Xwejd8iTAoNEdASuGbiCSpHHQUBX8FS/1m59
X-Gm-Gg: AY/fxX61kesZVVTfF+cmXieVdcB3XaOKs5HL68JqlRkEhdA7a+KMz5gMFOKQXtAuNtP
 pQwHzBE5UdfSqTJopFj1HgjWiP+xxz+hWtrs6TwEJvK/sRORlGyaVKUI0ZVS5vw/pWSeRkPf7V0
 GOcGI/lu0UaREq9DAd7qncVdPIpTjxU0adCd8/k890VZtnaGIOzNYp2YcVO30GzdebKCBDoU/zT
 dhXGOzB4VUZ4aSe3tGY/UW5xUJfkQq7JNiH0PuOw3noM7i8h7tPuP9wCCBrJ+T+VuZfcFdjXpHa
 /fNgapzytzSNPnJppJjEBYrXTpXT2nA2sxI42n74pBKGVbTGV1WF4xBwRXnvhQEgTVyOWEiyN/e
 l/tj5zNPNkuOhuFPXrp++c9bwUFvvpwQKYpxdpnmzmS6rVfWWVmNgUYjaAYb75271SMYAbyOjlE
 YQmMA23eMf1iyDfCkw+zWD1ixe7QsNnnVOOzKmAo+GrR+pm9urXfYbvcZBXBeKZ9WDkObeAPD8r
 CpTcaRTbvBKPZl3Q1XAZoz4mkaCZ01vbKaTavr2Zw8DUwYlJbz+Km8otj7m4w==
X-Google-Smtp-Source: AGHT+IEhxHfa3EvqLnd161U/iUsmuB/KO5aMfBcewaILSnv9w+0OotqTV/mO8Q9y2e3SELVXDNPiCw==
X-Received: by 2002:a05:6a00:8c12:b0:7e8:3fcb:bc4a with SMTP id
 d2e1a72fcca58-7f669c8a4efmr414424b3a.31.1765501565293; 
 Thu, 11 Dec 2025 17:06:05 -0800 (PST)
Received: from [10.200.8.97] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7f4c5093a56sm3565645b3a.47.2025.12.11.17.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 17:06:04 -0800 (PST)
Message-ID: <6edcb112-dabc-41ff-8e47-8b331de12f5c@gmail.com>
Date: Fri, 12 Dec 2025 01:06:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 02/11] iov_iter: introduce iter type for pre-registered
 dma
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-block@vger.kernel.org, io-uring@vger.kernel.org,
 Vishal Verma <vishal1.verma@intel.com>, tushar.gohad@intel.com,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <cover.1763725387.git.asml.silence@gmail.com>
 <f57269489c4d6f670ab1f9de4d0764030d8d080c.1763725387.git.asml.silence@gmail.com>
 <aTFlx1Rb-zS5vxlq@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aTFlx1Rb-zS5vxlq@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/4/25 10:43, Christoph Hellwig wrote:
> On Sun, Nov 23, 2025 at 10:51:22PM +0000, Pavel Begunkov wrote:
>> diff --git a/include/linux/uio.h b/include/linux/uio.h
>> index 5b127043a151..1b22594ca35b 100644
>> --- a/include/linux/uio.h
>> +++ b/include/linux/uio.h
>> @@ -29,6 +29,7 @@ enum iter_type {
>>   	ITER_FOLIOQ,
>>   	ITER_XARRAY,
>>   	ITER_DISCARD,
>> +	ITER_DMA_TOKEN,
> 
> Please use DMABUF/dmabuf naming everywhere, this is about dmabufs and
> not dma in general.

I guess I can do that (in all places) since it got that much fat
around dmabuf, but for me it was always about passing dma
addresses. Dmabuf was a way to pass buffers, even though
mandatory for uapi.

-- 
Pavel Begunkov

