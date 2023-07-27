Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E1A7652A7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 13:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66F7E10E352;
	Thu, 27 Jul 2023 11:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CD610E352
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 11:40:26 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fe15bfb1adso1445699e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690458025; x=1691062825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CQNTkXPnx3vtxi9gXhe6F8GyptxWIzVy/cR8pZ3VmZI=;
 b=n+dzJVefXszARcjuYn0EuJDKH4yuffGCemwWfVAWg7ZPElofPkCeKOzMNgjDwlIOqj
 XZckvkessVyXYodF1UvhuOECm/TijRGu/fgNH4Ajq4t7HfAFkKQ9KevjJeKXapg8QxHW
 qhH+rrwJheMYUHlt0jYw1zJhoIECYux/vEpfDLj8PIJMtKfbikVMi9jzG2e7RS3fGSfj
 nx40Uk+jo0o91/rxBbIWje2meP7+ZE+Vkr1xHuA8yPoHsa62S9jTQ4//uTfmol4HQqoB
 jvmvyCPRWlpvpuev5zQFMwZfKpPKVlBpIGkDEsMENkPrnv16yVDmHtUOv/17KdjaDH2T
 FFMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690458025; x=1691062825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CQNTkXPnx3vtxi9gXhe6F8GyptxWIzVy/cR8pZ3VmZI=;
 b=lG8/qzr09zYtXrENMzt9RH1m5r3Wp29z/ZkL/3AF/izxR/7TyQ2mbE+NXYlzUcH96l
 P25E3HS0IjnOND/l9d8ZFGIH/27ASdyzQ4a/ar9rPkx0QcWlM7sJ6A7yZrb3gg0ZIOnB
 GOqUVbuvc7W4qEHvVmw5ttg8eCvpmO6kDKMtoztenYFjACsAnVDYNMYExNVn2WKyzk/3
 mwqxsXkpIoUsBzyTHGgOFEX8p2UVzL/c+SGotGpjQPyrk1lGru/wsuq83dB61fHRo4IF
 6pf2+hi9s7hoR+af5fQTgEJZ01/P3F6VG91eOLbg5f7rSfkGwytGXAROo1H93u3ycgbV
 Zqww==
X-Gm-Message-State: ABy/qLZpcxEEsWH4/4GTJeGhzTx4QKIg7QgEyxByfoqYMCNHB3/qcdYZ
 Q4PjWjPljQQ+IOPNI1Xskn0wgQPC3tA=
X-Google-Smtp-Source: APBJJlFZcJdV/2tsOuTHdZeivtkzWTWVOio476KT8N8lXbV+wlSd2bdlofgtNZw6MIh0NjgWFabYQA==
X-Received: by 2002:a19:5f1c:0:b0:4fd:fc3d:cce7 with SMTP id
 t28-20020a195f1c000000b004fdfc3dcce7mr1288696lfb.44.1690458024822; 
 Thu, 27 Jul 2023 04:40:24 -0700 (PDT)
Received: from ?IPV6:2a00:e180:1511:5300:e4c6:3a45:7174:efa8?
 ([2a00:e180:1511:5300:e4c6:3a45:7174:efa8])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a1cf710000000b003fc080acf68sm4459448wmh.34.2023.07.27.04.40.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 04:40:23 -0700 (PDT)
Message-ID: <dfe4bae7-13a0-3c5d-d671-f61b375cb0b4@gmail.com>
Date: Thu, 27 Jul 2023 13:40:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [Linaro-mm-sig] Re: [RFC PATCH 00/10] Device Memory TCP
Content-Language: en-US
To: Jason Gunthorpe <jgg@ziepe.ca>,
 Stephen Hemminger <stephen@networkplumber.org>
References: <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
 <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
 <ZLbUpdNYvyvkD27P@ziepe.ca> <20230718111508.6f0b9a83@kernel.org>
 <35f3ec37-11fe-19c8-9d6f-ae5a789843cb@kernel.org>
 <20230718112940.2c126677@kernel.org>
 <eb34f812-a866-a1a3-9f9b-7d5054d17609@kernel.org>
 <20230718154503.0421b4cd@kernel.org>
 <CAHS8izPORN=r2-hzYSgN4s_Aoo2dnwoJXrU5Hu=43sb8zsWyhQ@mail.gmail.com>
 <20230719105711.448f8cad@hermes.local> <ZLhww+P+7zhTTUk7@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <ZLhww+P+7zhTTUk7@ziepe.ca>
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
Cc: Mina Almasry <almasrymina@google.com>, linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 linux-kselftest@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Eric Dumazet <edumazet@google.com>,
 Andy Lutomirski <luto@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jesper Dangaard Brouer <hawk@kernel.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 20.07.23 um 01:24 schrieb Jason Gunthorpe:
> On Wed, Jul 19, 2023 at 10:57:11AM -0700, Stephen Hemminger wrote:
>
>> Naive idea.
>> Would it be possible for process to use mmap() on the GPU memory and then
>> do zero copy TCP receive some how? Or is this what is being proposed.
> It could be possible, but currently there is no API to recover the
> underlying dmabuf from the VMA backing the mmap.

Sorry for being a bit late, have been on vacation.

Well actually this was discussed before to work around problems with 
Windows applications through wine/proton.

Not 100% sure what the outcome of that was, but if I'm not completely 
mistaken getting the fd behind a VMA should be possible.

It might just not be the DMA-buf fd, because we use mmap() re-routing to 
be able to work around problems with the reverse tracking of mappings.

Christian.

>
> Also you can't just take arbitary struct pages from any old VMA and
> make them "netmem"
>
> Jason
> _______________________________________________
> Linaro-mm-sig mailing list -- linaro-mm-sig@lists.linaro.org
> To unsubscribe send an email to linaro-mm-sig-leave@lists.linaro.org

