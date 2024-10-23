Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB19ACC91
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 16:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328A810E7F6;
	Wed, 23 Oct 2024 14:34:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ql7wNzuc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D88110E7F6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 14:34:19 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a9a156513a1so937954166b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729694058; x=1730298858; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Q4kJampXEx3nv7rxbRRPQLyxusFtEFCb6+hV0uyGoRA=;
 b=Ql7wNzucxIhcKuCpPaA2/KZ1C32fvKECDl/H66jtHn7x0l/0VS9C7sG1xKBm+o96zI
 6toCmUH76rNfzpRPhUTP5HIHVfmO2SCuL+W4zO2SqaF/1aQwhevFNN49M6O6E8hylONe
 /Imcae5ISSNDeXuQ/q7e9dCGhu17K9TiF2F8MmvrpYHWSAPZOeKu8oK0gOjG6L3heFpP
 L6RySKm+jps0O3C+AUWoGM37+LhqYIElF/h2OtzFhpblnzFT2mTApEJaRpS2zak6TaSm
 Y4iX+pIxzt+K9tV6bXtUASIYzgUuVnonfKecnHYX8nQ1/ar2aMvFUNisKyveJ3DFkRIm
 Gy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729694058; x=1730298858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q4kJampXEx3nv7rxbRRPQLyxusFtEFCb6+hV0uyGoRA=;
 b=gU4doYmWgH8KW9M3hoqj5pvQJI5XI2zIp6klV4FL+sIZgBMkmvzGDDjXIArdshnDEM
 E9qERCuFM/n2rX5sCPBJZ9T2YGP4KyUpgUTCA2f3VqvVySJGJyOlGBaDtv2/lb5VJHJJ
 K9Jwj9Cw8FqiUvREIWh/os0NAGgXvjXX7htXEa6NDHUTto+tC4i3wah1Pu8w8f63fLct
 uZ9Pr2EGobsdGVSHixWZyJCx1QE/Vkl03hLZIbmkVJepVT1PEaLR15TGT9DUfFxuLjWJ
 OvuFg3X9pPuwZkTgOwx3JIvDRYZsgDSXgdjT3AVkzeMkaHgy43Ji5M++2eJq8vVf2KCn
 PKSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+8huy/HzeoctoZEWIv2dKisb5Uuph0ovZ1lyQ5MlCuojmmD0OkGzDmdFwsb7kEVENR/mpoJgX3VY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4yH+5B5OVMlXivZXh5ctn+PSpGj445pWn60LDCrPxQ3e4vplA
 CUW843uiurJ9kbjP7QrhyYje4vyANiLUuQD1n3dOcLe7NYp4IFSU
X-Google-Smtp-Source: AGHT+IHpnzei1u28XJ/Cb4x4LM2CIq79av1YBmoRQwGIYPDEwnobftY+MUQkzpScEWtj5S2LMvBtDQ==
X-Received: by 2002:a17:907:960b:b0:a9a:e2b:1711 with SMTP id
 a640c23a62f3a-a9abf5288bdmr329808366b.0.1729694057334; 
 Wed, 23 Oct 2024 07:34:17 -0700 (PDT)
Received: from [192.168.8.113] ([148.252.141.112])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91573645sm479309066b.182.2024.10.23.07.34.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 07:34:17 -0700 (PDT)
Message-ID: <264c8f95-2a69-4d49-8af6-d035fa890ef1@gmail.com>
Date: Wed, 23 Oct 2024 15:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/15] net: generalise net_iov chunk owners
To: Christoph Hellwig <hch@infradead.org>, David Wei <dw@davidwei.uk>
Cc: io-uring@vger.kernel.org, netdev@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, David Ahern <dsahern@kernel.org>,
 Mina Almasry <almasrymina@google.com>,
 Stanislav Fomichev <stfomichev@gmail.com>, Joe Damato <jdamato@fastly.com>,
 Pedro Tammela <pctammela@mojatatu.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20241016185252.3746190-1-dw@davidwei.uk>
 <20241016185252.3746190-3-dw@davidwei.uk> <ZxijxiqNGONin3IY@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <ZxijxiqNGONin3IY@infradead.org>
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

On 10/23/24 08:20, Christoph Hellwig wrote:
> On Wed, Oct 16, 2024 at 11:52:39AM -0700, David Wei wrote:
>> From: Pavel Begunkov <asml.silence@gmail.com>
>>
>> Currently net_iov stores a pointer to struct dmabuf_genpool_chunk_owner,
>> which serves as a useful abstraction to share data and provide a
>> context. However, it's too devmem specific, and we want to reuse it for
>> other memory providers, and for that we need to decouple net_iov from
>> devmem. Make net_iov to point to a new base structure called
>> net_iov_area, which dmabuf_genpool_chunk_owner extends.
> 
> We've been there before.  Instead of reinventing your own memory
> provider please enhance dmabufs for your use case.  We don't really
> need to build memory buffer abstraction over memory buffer abstraction.

It doesn't care much what kind of memory it is, nor it's important
for internals how it's imported, it's user addresses -> pages for
user convenience sake. All the net_iov setup code is in the page pool
core code. What it does, however, is implementing the user API, so
There is no relevance with dmabufs.

-- 
Pavel Begunkov
