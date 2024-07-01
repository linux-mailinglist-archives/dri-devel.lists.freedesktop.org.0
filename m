Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B155091DA2A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 10:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C63210E355;
	Mon,  1 Jul 2024 08:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UzcLBXSM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038A410E355
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 08:41:10 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-424a3ccd0c0so20086105e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jul 2024 01:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719823268; x=1720428068; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AMt7mTb63MOoRef5KMAR+OLG9LjGQCs3Iv9eQzbOgVY=;
 b=UzcLBXSMlZM9v61P/oC9tZy3QLoUnYzeVGqsh14DeymUavPNoR9rEWFZqBRXkSknEp
 oxI6rO5oUj3iVkudwS2/DCVzOhmfMRMfXPJ9sjRq8w8bU0ezR+0R9Y+Rsqsq68QVL8Oy
 5KKWE6fpPn5RBDi2MuW1fwVqZWnQhaYQQXkuU9iqTQu47yI9WBuapp4TZ7bWFPi5OQMU
 DWQHtrzaeAOiDh2rUQBihmWT0SxeEgfwHUqaOwoqZ+rBKfFG0/Dgg6ziwCEic0dUT3es
 pFdMsgDKoq6wQfZF54bRYvVe6Usd8HxY0EdHOGifj1+bbEa3bOzfPjgVNSgB9dVABLQK
 X0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719823268; x=1720428068;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AMt7mTb63MOoRef5KMAR+OLG9LjGQCs3Iv9eQzbOgVY=;
 b=QYIkPPWcI16+skGPgEX9+OMIChE6K8Fwavh1TbeBQl0qw5WDHnkJD3UqFYiaHSmcnM
 AkZtaacani512XFldiABwQWYbX86pOwSAJsKie9gFwQCLM6nZs76lEkHc8jhVVaXtXHQ
 zsco44+1kUhRaJbWDTB29KrUwz8PHrHcf7rFLmN6s3E1vswPZ8L7xYUKcwuji7kbV8Un
 FaPz5HKhnmoCrmMxEXNwwQkiPM0yS2dAUwfGeVMVMj7g9syAAObFjSSTNVeun5W00kRv
 CqKtxz2jtd99a4xjBS54Qe2q7nmV/MQbgbTqMMkWQvmS8gZFra7VH9Q7gDvv/SyUBo4U
 Q6KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCrcm06gKtVTmzmbIFY3KtVC30RyUPjVhNlk/L4/FdUYgKMB4pudADQQxRTiS4mBwCrbRpVt+/vM/myJd8KMOUEqVRrK5TGXDDMkYqDjLg
X-Gm-Message-State: AOJu0YzVW9F0p1hjFkDP+IeFUDCRj3CxTa7obqQOiTX4xrHIDXX6oiry
 TtTa8KLxpkgjLt7uL8qzf74ypvlHD+HWTIfhUrEMHpkaXxR/4M5S
X-Google-Smtp-Source: AGHT+IFVkP4vxt28218+k2V48TYQocy8Fz5i69HcPxCmln5LU4tWH1iaovbS/2p5BgnSrenoOSY/NQ==
X-Received: by 2002:a05:600c:6a8d:b0:425:77b4:366d with SMTP id
 5b1f17b1804b1-4257a02f3f6mr32722375e9.11.1719823267873; 
 Mon, 01 Jul 2024 01:41:07 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a94csm141988335e9.33.2024.07.01.01.41.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 01:41:07 -0700 (PDT)
Message-ID: <dbcd9a16-4e4b-42c8-ba7f-d6c1dfd9dccb@gmail.com>
Date: Mon, 1 Jul 2024 10:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 2/9] scatterlist: Add a flag for
 the restricted memory
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
Cc: "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "willy@infradead.org" <willy@infradead.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "jstultz@google.com" <jstultz@google.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
 <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
 <1050c44512374031d1349b5dced228d0efc3fbde.camel@mediatek.com>
 <3104b765-5666-44e4-8788-f1b1b296fe17@amd.com>
 <98c11bad7f40bcc79ed7a2039ddb3a46f99908f5.camel@mediatek.com>
 <75dc1136-7751-4772-9fa7-dd9124684cd2@amd.com>
 <ZnxWWtdShekGSUif@phenom.ffwll.local>
 <ae73a0203d6acf2878c9e3ae2d7554816b9c66ad.camel@mediatek.com>
 <5739abdb-0234-412a-9f25-49219411bbc6@amd.com>
 <183f2ae09c2dbcf687e69cd13a9d258fd24fd80c.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <183f2ae09c2dbcf687e69cd13a9d258fd24fd80c.camel@ndufresne.ca>
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

Am 28.06.24 um 22:16 schrieb Nicolas Dufresne:
> [SNIP]
>>>>> Why can't you get this information from userspace?
>>>> Same reason amd and i915/xe also pass this around internally in the
>>>> kernel, it's just that for those gpus the render and kms node are the
>>>> same
>>>> driver so this is easy.
>>>>
>> The reason I ask is that encryption here looks just like another
>> parameter for the buffer, e.g. like format, stride, tilling etc..
> I'm mostly a reader of the thread here, but I'd like to avoid basic mistakes.
> The buffer in question are "protected", meaning that the CPU HW does not have
> access to the underlying pages (or zone in the case of Meditatek).
>
> This is different from encrypted buffers, which don't need this level of
> protection, as without the security key to decrypt them, their content is close
> to random data.

Thanks for that clarification, this difference was absolutely not obvious.

In that case having a separate heap for this memory is indeed the 
easiest approach.

My question is still what would happen if the CPU tries to access this 
protected buffer? Or does the CPU not even have an address to do that?

Just out of curiosity, I mean the exporting heap should then somehow 
reject any attempt to mmap() or vmap() the buffer content.

Thanks,
Christian.
