Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC2F3BE7B5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 14:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8096E125;
	Wed,  7 Jul 2021 12:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFBC6E10C;
 Wed,  7 Jul 2021 12:17:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id i94so2821733wri.4;
 Wed, 07 Jul 2021 05:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=gFcpO09X9eqmjEev1StyvxVCY7X0AALnaeQkmkAwWuA=;
 b=ZjJsQUBAGSRzwkesl+g70QlwkbvYhuHJtn9TzO41zn/XqXK0HsPfSJXxQ1uubM80r2
 QYeHYcYzl3pdaIKusWL8Cd7Wu51RMb/uf3qRgfVEUeKySy/8psgPpeGYTaM+zPTnUhPF
 9xKe5V78YV9n8JpqoYRiJqSsCkiLrBbIA9ZtSqYpocicMRidvhtcTJamlaqtccNRyFEN
 02DbkAeA4CUIOThsqvoQeKbSJh5ta3Oe42xfSOVaXDxn0ln/B0etndt5ICGG0ZrG3npQ
 LpRDrwUb4cIJSkCzDubfh19bl4gMUkqIeaYnL4XjUhz4gGqkC155BwFDxgWq0MBa3QsZ
 xebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=gFcpO09X9eqmjEev1StyvxVCY7X0AALnaeQkmkAwWuA=;
 b=q/aj8SpX7UZU0ny42h1yLC6XfOmzr5fRVZaZxrjZyS3OfaUC+mxngZzARPzygBrE40
 qKU0RgQPlt+POWVSaX9Sx7I1CDOwFalw6E6pmNwRgSDqhNQ2eSmK+5YYD+Qo1Z3qjfwD
 jnQcLeqtmMBUjFxn169JrO1+YfWKAsdZnbHd451x3nCkRM3B1fo4InlMI+aN1tgFMwYc
 QELAnpFqQOOjmIKanA2jc7ygC06Rr79ljrUcQtFCJTaHbzlXXlw0A2qWuoxfc4QM9GF8
 BiAxfv/9MQSWee31kR/kYX2YKh6OitSm7+3l896WzWk9fnKaq6EnjnVZwcvsPzOjGaX9
 wkjQ==
X-Gm-Message-State: AOAM531Q2RfHEIb1/qIbWZATsPcKuFyaCbcIREB0kXSShSKYtbaJDx5u
 auODCg2c2kBuSvN0HiVB2Ag=
X-Google-Smtp-Source: ABdhPJw+KpKKmv799GNloUfwlu8fKZlyMeia+T+6lyR5kx2E0g6ByA5UB8esUFEyQkPer8zSwXyRww==
X-Received: by 2002:a5d:680b:: with SMTP id w11mr15450397wru.426.1625660233375; 
 Wed, 07 Jul 2021 05:17:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7671:3328:2129:96b5?
 ([2a02:908:1252:fb60:7671:3328:2129:96b5])
 by smtp.gmail.com with ESMTPSA id u2sm13550473wmc.42.2021.07.07.05.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 05:17:12 -0700 (PDT)
Subject: Re: [Linaro-mm-sig] [PATCH v4 0/2] Add p2p via dmabuf to habanalabs
To: Christoph Hellwig <hch@lst.de>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, galpress@amazon.com,
 sleybo@amazon.com, dri-devel@lists.freedesktop.org, jgg@ziepe.ca,
 linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
 dledford@redhat.com, airlied@gmail.com, alexander.deucher@amd.com,
 leonro@nvidia.com, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20210705130314.11519-1-ogabbay@kernel.org>
 <YOQXBWpo3whVjOyh@phenom.ffwll.local> <20210706122110.GA18273@lst.de>
 <YORLTmyoXDtoM9Ta@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9af554b1-e4d8-4dd4-5a6a-830f3112941d@gmail.com>
Date: Wed, 7 Jul 2021 14:17:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YORLTmyoXDtoM9Ta@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 06.07.21 um 14:23 schrieb Daniel Vetter:
> On Tue, Jul 06, 2021 at 02:21:10PM +0200, Christoph Hellwig wrote:
>> On Tue, Jul 06, 2021 at 10:40:37AM +0200, Daniel Vetter wrote:
>>>> Greg, I hope this will be good enough for you to merge this code.
>>> So we're officially going to use dri-devel for technical details review
>>> and then Greg for merging so we don't have to deal with other merge
>>> criteria dri-devel folks have?
>>>
>>> I don't expect anything less by now, but it does make the original claim
>>> that drivers/misc will not step all over accelerators folks a complete
>>> farce under the totally-not-a-gpu banner.
>>>
>>> This essentially means that for any other accelerator stack that doesn't
>>> fit the dri-devel merge criteria, even if it's acting like a gpu and uses
>>> other gpu driver stuff, you can just send it to Greg and it's good to go.
>>>
>>> There's quite a lot of these floating around actually (and many do have
>>> semi-open runtimes, like habanalabs have now too, just not open enough to
>>> be actually useful). It's going to be absolutely lovely having to explain
>>> to these companies in background chats why habanalabs gets away with their
>>> stack and they don't.
>> FYI, I fully agree with Daniel here.  Habanlabs needs to open up their
>> runtime if they want to push any additional feature in the kernel.
>> The current situation is not sustainable.
> Before anyone replies: The runtime is open, the compiler is still closed.
> This has become the new default for accel driver submissions, I think
> mostly because all the interesting bits for non-3d accelerators are in the
> accel ISA, and no longer in the runtime. So vendors are fairly happy to
> throw in the runtime as a freebie.

Well a compiler and runtime makes things easier, but the real question 
is if they are really required for upstreaming a kernel driver?

I mean what we need is to be able to exercise the functionality. So 
wouldn't (for example) an assembler be sufficient?

> It's still incomplete, and it's still useless if you want to actually hack
> on the driver stack.

Yeah, when you want to hack on it in the sense of extending it then this 
requirement is certainly true.

But as far as I can see userspace don't need to be extendable to justify 
a kernel driver. It just needs to have enough glue to thoughtfully 
exercise the relevant kernel interfaces.

Applying that to GPUs I think what you need to be able to is to write 
shaders, but that doesn't need to be in a higher language requiring a 
compiler and runtime. Released opcodes and a low level assembler should 
be sufficient.

Regards,
Christian.

> -Daniel

