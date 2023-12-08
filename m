Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150080ADAD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2057D10EB12;
	Fri,  8 Dec 2023 20:20:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C04410EB12
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 20:20:08 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40c2308faedso25840075e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 12:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702066806; x=1702671606; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uOW35AO1MljF8VXrGiU+7YQ0Sxg9Sin/49gICtGehP4=;
 b=lpdxsFwK8mvMremEOo5AWxsIpA1TEzpbD3S+cp4IUgZRqucDq15bcfuRk0GslJCRpr
 Lhjkz5dc0ZVAEZ3FlNRL30G43IPkV+d7ZZwgt+81NkYLMHNXNJqAwFodMcHQ80kYNRd2
 i6cskcSuBVYDX+RPAR5GzXW5rVIVpY+KVglPnbQRyuK9sMiadJYDQ65RLJFpAqiuAusF
 xEHmQ35uMh9dClNLOz5chBHoQc0caPi53mz8HUHQ0Jea7wPN6OToY4qBLpzqFBCd18n5
 r5NrAkExP6bnSfTIIvSAsFq0Tj/XkcRLE3vfUoLRgT4Zr8pHFEdOiraGs+p5vxWWmYSY
 g4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702066806; x=1702671606;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uOW35AO1MljF8VXrGiU+7YQ0Sxg9Sin/49gICtGehP4=;
 b=sh4outxh53X8M6RUqPFwGVHiPoy6PQi1pYTDLCmekKip7vgVRtNwqujrJM7Y+EysTN
 8MGr45dQY39NoIlt9oiBJkrjFze6s5aQup9nUmXoCEEFTt8xSmb6tLOl9Scl2RzTsn1/
 MovoI4PvY0UmetvXiB2gXcszhOCHGXgmDy0QJskfDeUCvLpwt4oVMkt82yCB6RmxUBqR
 uxzaLPAdNn3S86M5Wk9gtKbalrsYLFGxHNqhsyjxK2imGSAHPNhRxQyrg5nG70NfZhSA
 5KAnaLymQ89Qit9ry2CHs3/QyK5JxXwmTZPq9fZWPcPNcfYtEe73pTQom4KvG05fJSk+
 zX8w==
X-Gm-Message-State: AOJu0Yw0TB5MVACIjTWmhfO6cE/Mi4zlO410F0OL+0WHuqUGJBhfGg/+
 PCRDWUb1FdqG0zEaSgt6vo4=
X-Google-Smtp-Source: AGHT+IHPBOEeXi/rqbz7qszufoY2A9OT7UPzmbehyZD259vtVrFzNVCxBNaFELhPk/sbfSi3pdVMng==
X-Received: by 2002:a05:600c:3411:b0:40b:37ec:41b3 with SMTP id
 y17-20020a05600c341100b0040b37ec41b3mr298018wmp.31.1702066806283; 
 Fri, 08 Dec 2023 12:20:06 -0800 (PST)
Received: from [192.168.8.100] ([85.255.232.89])
 by smtp.gmail.com with ESMTPSA id
 bh15-20020a05600c3d0f00b0040b4ccdcffbsm3947710wmb.2.2023.12.08.12.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 12:20:06 -0800 (PST)
Message-ID: <fbdba904-e24c-43e8-9278-cde7fbe74053@gmail.com>
Date: Fri, 8 Dec 2023 20:12:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 10/12] tcp: RX path for devmem TCP
Content-Language: en-US
To: Edward Cree <ecree.xilinx@gmail.com>,
 Mina Almasry <almasrymina@google.com>, David Ahern <dsahern@kernel.org>
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-11-almasrymina@google.com>
 <ZUk0FGuJ28s1d9OX@google.com>
 <CAHS8izNFv7r6vqYR_TYqcCuDO61F+nnNMhsSu=DrYWSr3sVgrA@mail.gmail.com>
 <CAF=yD-+MFpO5Hdqn+Q9X54SBpgcBeJvKTRD53X2oM4s8uVqnAQ@mail.gmail.com>
 <ZUlp8XutSAScKs_0@google.com>
 <CAF=yD-JZ88j+44MYgX-=oYJngz4Z0zw6Y0V3nHXisZJtNu7q6A@mail.gmail.com>
 <CAKH8qBueYgpxQTvTwngOs6RNjy9yvLF92s1p5nFrobw_UprNMQ@mail.gmail.com>
 <93eb6a2b-a991-40ca-8f26-f520c986729a@kernel.org>
 <CAF=yD-Ln4v8orUne8E7D2_eHu39PWPCrMR3Qtuh312pCu=erng@mail.gmail.com>
 <CAHS8izOU06ceKyc5oVZhdCKJqmeRdcRyJBFpjGe=u2yh=V52dQ@mail.gmail.com>
 <7ce2d027-1e02-4a63-afb7-7304fbfbdf90@kernel.org>
 <CAHS8izM_qrEs37F=kPzT_kmqCBV_wSiTf72PtHfJYxks9R9--Q@mail.gmail.com>
 <6f853286-e463-b684-cc1e-405119528697@gmail.com>
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <6f853286-e463-b684-cc1e-405119528697@gmail.com>
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
Cc: Kaiyuan Zhang <kaiyuanz@google.com>, dri-devel@lists.freedesktop.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jeroen de Borst <jeroendb@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-media@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/9/23 16:07, Edward Cree wrote:
> On 09/11/2023 02:39, Mina Almasry wrote:
>> On Wed, Nov 8, 2023 at 7:36 AM Edward Cree <ecree.xilinx@gmail.com> wrote:
>>>   If not then surely the way to return a memory area
>>>   in an io_uring idiom is just to post a new read sqe ('RX descriptor')
>>>   pointing into it, rather than explicitly returning it with setsockopt.
>>
>> We're interested in using this with regular TCP sockets, not
>> necessarily io_uring.
> Fair.  I just wanted to push against the suggestion upthread that "oh,
>   since io_uring supports setsockopt() we can just ignore it and it'll
>   all magically work later" (paraphrased).

IMHO, that'd be horrible, but that why there are io_uring zc rx
patches, and we'll be sending an update soon

https://lore.kernel.org/all/20231107214045.2172393-1-dw@davidwei.uk/


> If you can keep the "allocate buffers out of a devmem region" and "post
>   RX descriptors built on those buffers" APIs separate (inside the
>   kernel; obviously both triggered by a single call to the setsockopt()
>   uAPI) that'll likely make things simpler for the io_uring interface I
>   describe, which will only want the latter.
> PS: Here's a crazy idea that I haven't thought through at all: what if
>   you allow device memory to be mmap()ed into process address space
>   (obviously with none of r/w/x because it's unreachable), so that your
>   various uAPIs can just operate on pointers (e.g. the setsockopt
>   becomes the madvise it's named after; recvmsg just uses or populates
>   the iovec rather than needing a cmsg).  Then if future devices have
>   their memory CXL accessible that can potentially be enabled with no
>   change to the uAPI (userland just starts being able to access the
>   region without faulting).
> And you can maybe add a semantic flag to recvmsg saying "if you don't
>   use all the buffers in my iovec, keep hold of the rest of them for
>   future incoming traffic, and if I post new buffers with my next
>   recvmsg, add those to the tail of the RXQ rather than replacing the
>   ones you've got".  That way you can still have the "userland
>   directly fills the RX ring" behaviour even with TCP sockets.
> 

-- 
Pavel Begunkov
