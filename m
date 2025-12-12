Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C168CB7830
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 02:08:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151F010E312;
	Fri, 12 Dec 2025 01:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PPMtGW6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 364C110E312
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 01:08:35 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-34ab8e0df53so391906a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765501715; x=1766106515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pBdi/oDzvSWIXA9titZw8xt1yZ2pS2N9m++Fybej/Mo=;
 b=PPMtGW6pCSw0S2/X95R9V+5aUaS2Yw1CdbAVsEeLkBGZjq9Gt/e6xNUklN1nf0PjZ2
 5dUykIXtF0EHmvpnfG0SOILU7tikL2Kc1iWnWXValgW/o1tkdDFTYyQFAcFEXAZ6Iw2S
 B/XQbIxHdQZbzp5gFQlpKlSsCaVjgX+gE53kcAN8ILT9d6NQc5Pzm7GiouYC+K8rRMYR
 kNTL3pikWNyZX42aqKNWnQBGDyGU4XcQZsrymuCdcD5LNpB7Imz5tC3IcGMnHLesBjgD
 rHvcIpH9zumyM+MerZGItZdOwPkMAvfBn1mfJ07Ugv2Ti9unbqIj0RUtRzhz9cAjdFP5
 B3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765501715; x=1766106515;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pBdi/oDzvSWIXA9titZw8xt1yZ2pS2N9m++Fybej/Mo=;
 b=RnRcVVpnQnB41gg7HB3AINVYx7rfQqO3XBrQ+zBvXJtBF2/ZEdCJN3auO79cvqTguL
 PZViuMxNzzyqHvCkQVMRmVNrWRzPMdcjHIjWuit0u7xSt9hbpcovoZIcRJF/NfBRMqpG
 CdS1FthSDh1zo/UfgzdNeZDUIs4jnWRHFDdGtgaSvtPi7Bdc1mVYRvZqK3yQm0mdLBii
 8MkNx2LOsGE7EN3YssKItEbV7PBDboqmNr9C4SldFdGa9eP0zrmdp8Y833+BODcp5jyB
 Uqc24LMLZTdZ4Nil14jGzsqevSJnOaF+qdymEUW1RwcipzkQSPCrSXcRoRglGdQ+Gkfq
 u0gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoTBpxjLhAZX3viicwKbhIe9xpqgZOsNF9r3h60fy5TaEG3i7Lj2/3lIjbpxCV4WxQwzXqxquB68M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4vhkIXJTR2tAZqQPiPWRq8vWTv5dfYOEy7eAzJop6PN6aum/I
 3UR1RVkG52xUOSnC9Jy8WEKRKyLSkKUyjwBwbBmuBTbRCWPlprcAQScLde5Cc3aY
X-Gm-Gg: AY/fxX7lXOIUsbVI51ev90qlAqEKYnI3oY5ut3RAufem80PFD1nuAePV072r81D+Bvs
 9gP0VdqoxViCoa6qTEX8e6U7h5YB0ItX+H5aiJtuXptXLWer+EH6UqEzCkh2tRijsgAS44EhYnc
 QzDcvNaWGpXgoReksHskS4gKfYSvGuRSrvWyMOVuH8nv015AgWAhT/0AkA8gAluIUBRdJ/akLiz
 31XxL0shq4SnjmhkrijiWN+xbVggNXk8OVoWr92f+sDjZ90MGBzuk0sgG/t/HIoqI4s34pPaR26
 xm/Fk1w9rKaTgDW702agyXSxLAXGUyQu60kCJUzMIf0S64kD0Vq/zhmHCkH0czHQ57pVgsjWsSU
 SjQRi/zjsCQVoCBw1y9wEnRdJEpEDl2a+pYH7h4yO9NG7RBGr+YGdlv+E4MZNALpYY1DDoLx3yR
 qcTp46ZtnwtHAxVoMHqZzCTtbgOY4gVTkDbjh+XaINH5nsh3UVKFnPAjHKvSrTgd0LsSTE/mPhH
 w5sVRYZrYqQWIZmLMvg5Rm+boRFFtR5PqhiTc5ASgMsx9S1kJQ=
X-Google-Smtp-Source: AGHT+IGFHKJf8QGiqR5uvpYaapCUZkmkibIutIZLTj7GFDM1IGCQKgJEzHKd26M9n65r0qbsOVsfhw==
X-Received: by 2002:a17:90b:4c:b0:340:c64d:38d3 with SMTP id
 98e67ed59e1d1-34abd6e0220mr546380a91.12.1765501714653; 
 Thu, 11 Dec 2025 17:08:34 -0800 (PST)
Received: from [10.200.8.97] (fs98a57d9c.tkyc007.ap.nuro.jp. [152.165.125.156])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34abe3ba59bsm167302a91.7.2025.12.11.17.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 17:08:29 -0800 (PST)
Message-ID: <4ed581b6-af0f-49e6-8782-63f85e02503c@gmail.com>
Date: Fri, 12 Dec 2025 01:08:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 03/11] block: move around bio flagging helpers
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
 <6cb3193d3249ab5ca54e8aecbfc24086db09b753.1763725387.git.asml.silence@gmail.com>
 <aTFl290ou0_RIT6-@infradead.org>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <aTFl290ou0_RIT6-@infradead.org>
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
> On Sun, Nov 23, 2025 at 10:51:23PM +0000, Pavel Begunkov wrote:
>> We'll need bio_flagged() earlier in bio.h in the next patch, move it
>> together with all related helpers, and mark the bio_flagged()'s bio
>> argument as const.
>>
>> Signed-off-by: Pavel Begunkov <asml.silence@gmail.com>
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Maybe ask Jens to queue it up ASAP to get it out of the way?

I was away, so a bit late for that. I definitely wouldn't
mind if Jens pulls it in, but for a separate patch I'd need
to justify it, and I don't think it brings anything
meaningful in itself.

-- 
Pavel Begunkov

