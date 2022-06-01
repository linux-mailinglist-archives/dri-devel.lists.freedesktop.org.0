Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7053A55E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 14:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE8710E770;
	Wed,  1 Jun 2022 12:45:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D118810E72A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 12:45:48 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id q21so3555162ejm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 05:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=3gXXAFCIgEtF+YzTyCewnTjN33A3GV3iuvrjUd27wQQ=;
 b=gta6eDw43Uu7sglXZL/Vx2eKNZv/oPKGubWeykfGXP6+d5MRPMny64oKmMnBVj1ov2
 WBL+iirMwlra8edJZnYxIOoIQ+8fT9uqyc0vdTXiddtI5+dqrGKxPTEgZzRaq7luDAgW
 Xbes5Fr0LjMEQOnXST9oMj7xnFY4gwNGyBwYzLwh3XRe3rysTNoaTaIJkSEtAtcG52IY
 j7zMyk3iHiwwhxX7XXJeotHqR/xNBwJwhjlLqqwdHbJMW0Q6Ah3hCeYIQXfzX5inb5tu
 NWNJLs72EwPyi5ZAzHA+k5531RYCDHMCs7XtmvxEfrpgZgFOXJFeJv1Uj0wa5qdZEjAh
 wRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3gXXAFCIgEtF+YzTyCewnTjN33A3GV3iuvrjUd27wQQ=;
 b=KCwaSPtybVWdTFYWeAkMG0JVaXcGmdSORby4zfv4sVGfj6bOP7zMzocu0RX/m2Y/Po
 /n8TizayRO8NlCy4JzkTNWhY+cbNcEyHo6wUFENI2C/38/8DlGIwh9NbuUNtoTngqw4Y
 XwgyvUDbFCSzg1PdA2dsyhUm2zb1uCSZ8RdQ7dfWgSscJB8SenFc+kW2K9rDKZrV0Nwy
 FJVNbLi/o7dxyJtu9itYNFsF6wFynVUka6MEaPNcIl6FBF2J4PDubbs9uog3p8KX8kAQ
 b8+ANBDwoB59ReLcvqZCeQxR5Tmv/INQYhrMGVyHRV525S9XgptdLsDn1WEKTpkj7NtE
 NXMQ==
X-Gm-Message-State: AOAM5327H8NB8y+DB/P6gGVSb6srkfS6+NAplZoe6pgvhV8FWEmFsIUg
 XBxJcp9VLA3ccmDu0CTRyoY=
X-Google-Smtp-Source: ABdhPJw2hNXssU1Die826uY3QfwCGMNWy9eIR9jcXgxN1q7weKBiW4r00uIvzYLOojrC71wHndfrzQ==
X-Received: by 2002:a17:906:2416:b0:6fe:a0be:91d5 with SMTP id
 z22-20020a170906241600b006fea0be91d5mr54759460eja.132.1654087544558; 
 Wed, 01 Jun 2022 05:45:44 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea02f.dip0.t-ipconnect.de. [91.14.160.47])
 by smtp.gmail.com with ESMTPSA id
 gk2-20020a17090790c200b006febce7081esm677798ejb.177.2022.06.01.05.45.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jun 2022 05:45:43 -0700 (PDT)
Message-ID: <33aba213-b6ad-4a15-9272-c62f5dfb1fb7@gmail.com>
Date: Wed, 1 Jun 2022 14:45:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-fence: allow dma fence to have
 their own lock
Content-Language: en-US
To: Sergey Senozhatsky <senozhatsky@chromium.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20220530142232.2871634-1-senozhatsky@chromium.org>
 <7eee4274-bd69-df8d-9067-771366217804@amd.com> <YpWCvniLzJfcp684@google.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YpWCvniLzJfcp684@google.com>
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

Am 31.05.22 um 04:51 schrieb Sergey Senozhatsky:
> On (22/05/30 16:55), Christian König wrote:
>> Am 30.05.22 um 16:22 schrieb Sergey Senozhatsky:
>>> [SNIP]
>>> So the `lock` should have at least same lifespan as the DMA fence
>>> that borrows it, which is impossible to guarantee in our case.
>> Nope, that's not correct. The lock should have at least same lifespan as the
>> context of the DMA fence.
> How does one know when it's safe to release the context? DMA fence
> objects are still transparently refcount-ed and "live their own lives",
> how does one synchronize lifespans?

Well, you don't.

If you have a dynamic context structure you need to reference count that 
as well. In other words every time you create a fence in your context 
you need to increment the reference count and every time a fence is 
release you decrement it.

If you have a static context structure like most drivers have then you 
must make sure that all fences at least signal before you unload your 
driver. We still somewhat have a race when you try to unload a driver 
and the fence_ops structure suddenly disappear, but we currently live 
with that.

Apart from that you are right, fences can live forever and we need to 
deal with that.

Regards,
Christian.

> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

