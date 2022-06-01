Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9098253A628
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 15:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D047410EB98;
	Wed,  1 Jun 2022 13:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A29E10EB98
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 13:50:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 h62-20020a1c2141000000b0039aa4d054e2so3086908wmh.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 06:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8js3BmhqDmlsACbALLq5e90PLEF4lborosfHSvoWOKM=;
 b=YTm8+7dPHONlBsZR4SMEitCaBrfkbRXNUYC3ZuJKHQrTTGF4FMpWDkHvPvAUKxe/7W
 vdWoMgFNonHPdtNFLs8dJ0eKIrl3TVQfXZJ1W0tL8u1KraHZ3D4SYSONkggVAD+CYTXc
 vmgHav8NPKJ04dRy1E1KYZ6JMM3uN6Mbr1xauaHZ7Yu5PzCs6IOS9W3k8KXkoAtGZ+Kj
 3WTmHnwAlXIAlgL8PwWAtd6lN4A7aT+ryvS5oVzEY7RSSG+IjEpqmsMSZk4Zg8mHPLnn
 iayVlAoBzt92WTZsmg6sguCvUgZ2C7pPg2hJF3Jn/ExC9EtV0aaEwYCXejT3Wp+8zJqK
 u0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8js3BmhqDmlsACbALLq5e90PLEF4lborosfHSvoWOKM=;
 b=aXDKsNJJYpsQLMwkCSe1MCsCpVjY1nqw2glNmrdzO4rL3iQDa6xSqLU1g1zqyx9Zhj
 oqOB0geXvGAa+AXPIRfegtJdr9imcLZ1pF+nfAtWYgKgFvFDU0a5dDWEoV2HuSjFMB1m
 QMZoB/GZ82zY1EpSRx0MOyZYmqpzNLHHfmNA8lghbWmJCY2HqLHHQ/6r40obwY5k3E/U
 b7ZwCe0V4lK2KAH3m+FL1zDbjLaxPRDm3BLt4PG3CRlyWyLWZDCbpP+InYmyzj1VAPDo
 sLqhSB9vZgnAn5MBzRD64Hk09iaR7hD4iKi8cX0ZKhLhI4mcEthcgEJMK/a0Uik/cbkK
 3IcA==
X-Gm-Message-State: AOAM533B6y1+7KogBGpL+Fxfd8sBjLIKVYupQOtfiwzogK8csSHtdNzq
 plnqtodI9cYxqxEzY1u+xak=
X-Google-Smtp-Source: ABdhPJwrKHJfq73KfKlhy8VE3p9Xdk0H07fsnJbZrGsy5keEhwCnMaJoppLUFggoAw0VxEGq5FlEhQ==
X-Received: by 2002:a7b:c1d9:0:b0:397:335d:4d9f with SMTP id
 a25-20020a7bc1d9000000b00397335d4d9fmr29006967wmj.55.1654091425051; 
 Wed, 01 Jun 2022 06:50:25 -0700 (PDT)
Received: from ?IPV6:2a02:908:1256:79a0:d1fb:e1e4:e193:e55f?
 ([2a02:908:1256:79a0:d1fb:e1e4:e193:e55f])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a5d400d000000b0020ff7246934sm1664650wrp.95.2022.06.01.06.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 06:50:24 -0700 (PDT)
Message-ID: <87724f19-7976-3a2c-96bc-8652a1cec9e8@gmail.com>
Date: Wed, 1 Jun 2022 15:50:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-fence: allow dma fence to have
 their own lock
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com> <YpTmhixkV7+yh6wo@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YpTmhixkV7+yh6wo@google.com>
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
Cc: linaro-mm-sig@lists.linaro.org, Gustavo Padovan <gustavo@padovan.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tomasz Figa <tfiga@chromium.org>, Christoph Hellwig <hch@infradead.org>,
 Ricardo Ribalda <ribalda@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 30.05.22 um 17:45 schrieb Sergey Senozhatsky:
> On (22/05/30 16:55), Christian König wrote:
>> If you just want to create a single dma_fence which is also only bound to a
>> single context you can embed the lock into the fence without much problem.
>>
>> See how the dma_fence_array does that for example: https://elixir.bootlin.com/linux/latest/source/include/linux/dma-fence-array.h#L37
> Christian, I'm not sure I'm following you on the "embed the lock into the
> fence without much problem" part. If I understand it correctly this should
> be something like:
>
> 	fences = kmalloc_array(1, sizeof(*fences), GFP_KERNEL);
> 	for_each_fence(...) {
>
> 		// what spinlock should I use here?
>
> 		dma_fence_init(&fences[i], .. &lock ..);
> 		dma_fence_get(&fences[i]);
> 	}
> 	fence_array = dma_fence_array_create(1, fences, ....);
> 	sync_file_create(&fence_array->base);

Well no, that's the high level usage of the dma_fence_array.

What I meant was this here:

struct dma_fence_array {
     struct dma_fence base;

     spinlock_t lock;
...
};

Regards,
Christian.

> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

