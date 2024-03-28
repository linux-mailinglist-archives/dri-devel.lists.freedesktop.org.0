Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E098A88FEE3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF061123EC;
	Thu, 28 Mar 2024 12:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SarVm9ox";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCBA10EB98
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:25:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41490d05bafso8876065e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 05:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711628707; x=1712233507;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IewWu8lmxt6/0HVEI36CNBq5rN/g2F+PxaVTBG2h/iU=;
 b=SarVm9oxX/3//MVqjan5sjsaCjAb0eeXnF6xYkkpjC4/tJnFicXoJHKjX8AewmWVSZ
 ytkFpkpmZiWvCzg3bZP5rzxPobOhbLuVl02Cw/i9sP+UAhzNWF1RM1XpDADdPbU5MaZp
 xnNkBiEICcv7rlsYk7wyT2B2XH59rsq/t5Z1VuDD4OPEn+4Uku6zkkkfjkIsDYGYVIHD
 ke7gLtE+UWB8dZjvLYF2XrHQlKITTSpfhJgXgcumw1TdHI3qh0uM/Bi+tCIDevanFOXv
 G5cwp3JowUDb1GNI3n46wNuam8K/QWOrBk8RiBQtTopooLij4J2ADEA/VUeD8rCgkoxY
 KRaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711628707; x=1712233507;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IewWu8lmxt6/0HVEI36CNBq5rN/g2F+PxaVTBG2h/iU=;
 b=vQw3aUGGuB5NGLIs4d3PDpHeqvtZBaWayzbq6vw0ooKDoiH4Sfrnbj6pDYSTo0NayE
 cLHIaRV5S5rJWCSSaSxkeRV+0EpgDhUjKs7Zmy4su7OGJSSjebt5n/2jnIkSj78bM6rz
 K0KIlsKtLPX9C8R3oUqcaeBqmDy8oKTl86QlYyDQAry+fq9JOTNlsc4PZ89eMFGK4imm
 1lv6u7Mu5NL/qnlCPL8k29GFi3qAm0cfZDfTjniHCrtJJ6JVLwN4Auihp66Ssz77Be/u
 W43+yvtEqENLMO8LtJYrPMqcd70q0TBg8w/nff9IMTWtThYDpYpVGggBnxq4tfWeocch
 oBTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfeefFRGu12tYlcU/DrQ8KWpp2yoTD8Ym9kH2cE6lSMtC1u5K6NMtjiVIM1cGS1jnihtmClALHz1TBegRWka+WdTkvX24R23oVhcnWUOKZ
X-Gm-Message-State: AOJu0YxYJt2uzJ37yKg67699rNWszpATxWVj8Il2SoG18G9rI2wIfZOc
 jIXFT4Zmtuel6ibD2iCx+mzE+CqNF8tH7XB+R6+0AJ/vZXkax9/fE53n2/cGvRI=
X-Google-Smtp-Source: AGHT+IH0y2fo2UTEGk+nQ03ttrhLqd3C0Z1OT03HbenKppy5AOYESKIChnTRGuAmLfyXp7UsaXIgVA==
X-Received: by 2002:a05:600c:1c8d:b0:413:feed:b309 with SMTP id
 k13-20020a05600c1c8d00b00413feedb309mr2723847wms.6.1711628706870; 
 Thu, 28 Mar 2024 05:25:06 -0700 (PDT)
Received: from [10.1.5.112]
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 fb7-20020a05600c520700b00414969894a1sm4030818wmb.13.2024.03.28.05.25.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Mar 2024 05:25:06 -0700 (PDT)
Message-ID: <342cdc02-22e7-4caf-b00e-b46cbcdf36fa@baylibre.com>
Date: Thu, 28 Mar 2024 13:25:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors for
 struct k3_cppi_desc_pool members
To: Naveen Mamindlapalli <naveenm@marvell.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ratheesh Kannoth <rkannoth@marvell.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20240223-am65-cpsw-xdp-basic-v5-0-bc1739170bc6@baylibre.com>
 <20240223-am65-cpsw-xdp-basic-v5-1-bc1739170bc6@baylibre.com>
 <SJ2PR18MB5635B9F20BB6CE1CC945F3B2A23B2@SJ2PR18MB5635.namprd18.prod.outlook.com>
Content-Language: en-US
From: Julien Panis <jpanis@baylibre.com>
In-Reply-To: <SJ2PR18MB5635B9F20BB6CE1CC945F3B2A23B2@SJ2PR18MB5635.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 3/28/24 13:06, Naveen Mamindlapalli wrote:
>> -----Original Message-----
>> From: Julien Panis <jpanis@baylibre.com>
>> Sent: Thursday, March 28, 2024 2:57 PM
>> To: David S. Miller <davem@davemloft.net>; Eric Dumazet
>> <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
>> <pabeni@redhat.com>; Russell King <linux@armlinux.org.uk>; Alexei Starovoitov
>> <ast@kernel.org>; Daniel Borkmann <daniel@iogearbox.net>; Jesper Dangaard
>> Brouer <hawk@kernel.org>; John Fastabend <john.fastabend@gmail.com>;
>> Sumit Semwal <sumit.semwal@linaro.org>; Christian König
>> <christian.koenig@amd.com>; Simon Horman <horms@kernel.org>; Andrew
>> Lunn <andrew@lunn.ch>; Ratheesh Kannoth <rkannoth@marvell.com>
>> Cc: netdev@vger.kernel.org; linux-kernel@vger.kernel.org; bpf@vger.kernel.org;
>> linux-media@vger.kernel.org; dri-devel@lists.freedesktop.org; linaro-mm-
>> sig@lists.linaro.org; Julien Panis <jpanis@baylibre.com>
>> Subject: [PATCH net-next v5 1/3] net: ethernet: ti: Add accessors
>> for struct k3_cppi_desc_pool members
>>
>> This patch adds accessors for desc_size and cpumem members. They may be
>> used, for instance, to compute a descriptor index.
>>
>> Signed-off-by: Julien Panis <jpanis@baylibre.com>
>> ---
>>   drivers/net/ethernet/ti/k3-cppi-desc-pool.c | 12 ++++++++++++
>> drivers/net/ethernet/ti/k3-cppi-desc-pool.h |  2 ++
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c b/drivers/net/ethernet/ti/k3-
>> cppi-desc-pool.c
>> index 05cc7aab1ec8..fe8203c05731 100644
>> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
>> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.c
>> @@ -132,5 +132,17 @@ size_t k3_cppi_desc_pool_avail(struct
>> k3_cppi_desc_pool *pool)  }  EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_avail);
>>
>> +size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool) {
>> +	return pool->desc_size;
> Don't you need to add NULL check on pool ptr since this function is exported?

Thanks for the review.
Absolutely, you're right.

>
>> +}
>> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_desc_size);
>> +
>> +void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool) {
>> +	return pool->cpumem;
> Same here.
>
>> +}
>> +EXPORT_SYMBOL_GPL(k3_cppi_desc_pool_cpuaddr);
>> +
>>   MODULE_LICENSE("GPL");
>>   MODULE_DESCRIPTION("TI K3 CPPI5 descriptors pool API"); diff --git
>> a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h b/drivers/net/ethernet/ti/k3-cppi-desc-
>> pool.h
>> index a7e3fa5e7b62..149d5579a5e2 100644
>> --- a/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
>> +++ b/drivers/net/ethernet/ti/k3-cppi-desc-pool.h
>> @@ -26,5 +26,7 @@ k3_cppi_desc_pool_dma2virt(struct k3_cppi_desc_pool
>> *pool, dma_addr_t dma);  void *k3_cppi_desc_pool_alloc(struct
>> k3_cppi_desc_pool *pool);  void k3_cppi_desc_pool_free(struct
>> k3_cppi_desc_pool *pool, void *addr);  size_t k3_cppi_desc_pool_avail(struct
>> k3_cppi_desc_pool *pool);
>> +size_t k3_cppi_desc_pool_desc_size(struct k3_cppi_desc_pool *pool);
>> +void *k3_cppi_desc_pool_cpuaddr(struct k3_cppi_desc_pool *pool);
>>
>>   #endif /* K3_CPPI_DESC_POOL_H_ */
>>
>> --
>> 2.37.3
>>

