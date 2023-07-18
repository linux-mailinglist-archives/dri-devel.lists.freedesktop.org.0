Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD86758397
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 19:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFA5610E3A0;
	Tue, 18 Jul 2023 17:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3A10E3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 17:37:05 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id
 ada2fe7eead31-446e8355203so255938137.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 10:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1689701824; x=1692293824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OF7u0tkhZuJp+iYGmAnUNlyXY8n4e2wtaxsLwo/TJ0U=;
 b=GvhF9so1mjJXiE/TvurKZcRANx4xoduJ12AI7tyQuLMZKhF+GAimJJ6+jOxa5DbOxx
 ZkKgtoehuKyPuCc90EiNAJ7pAoNst0vuc7x1Og0cjyuGCU9w9PV4qgvI/S0aUPiFGuJN
 mD9GvO3+AxzbtHsvl3FCd6C1r9kxBvaANizWpS6BgtwFPbXsGnY4AxbcWpXVCkfMIi+y
 vk6k/qLV/s43NfR1l7h6bopJ1DTN9YfxIMYUn8Q74BKBmDVKGcFTYtfFK1Mp2c3EpZK/
 sQWDMvHJls5znmpTUiPK/gD2WQSSwyZ2dzp5+poQJH75Bvsz9D3Yg4w7yp8IzQL6IPsD
 j/2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689701824; x=1692293824;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OF7u0tkhZuJp+iYGmAnUNlyXY8n4e2wtaxsLwo/TJ0U=;
 b=lijnP4sstCTZpc+Y2zsW9uQzrRU0lWeUD3GKubyc84dwwHNV3BcWr00iasK+3weB/1
 +pujgObu8ZLePhrYXJswYQED/WrwNXq/BS/SecMCdUYdYAuB0fERLlBuv0Xc0t/0MmmU
 i5lLNTx1p9ZZCnuyuBLb535IRct4vz+MoWe7AALuy1V6Q3IPJmnFQo9kwuG1jAg3ntY9
 gt0ZWRLoHQKcfkB0S6Fo/b+zUqWgMp29VLbMsNDybPhi4SPbLcMBFHILubhSTiJEyxn5
 n95Z9ZWVBgvpFBEyYXktajtOO4CCKRNim30zQ7fZRgir+53IjD4Wqf3VzL0TgGbNJYUy
 Y63Q==
X-Gm-Message-State: ABy/qLZllcmMQigdYAe0+OVGplerTJTIBnb070jUswKq0BcjDTAdjJ2k
 uhlZhG3BkKT/mtwWMEZ95wfFIfunm0s9jvr8Qrzu0g==
X-Google-Smtp-Source: APBJJlGybULcU+7z4JGO9VYtEkqhuSOGFBtDCY9RmNEp4loR/4Bx729tLJCCF1e3TIymnhgxCELYGS33nBdmUH493Xw=
X-Received: by 2002:a05:6102:391:b0:443:6052:43ae with SMTP id
 m17-20020a056102039100b00443605243aemr9163796vsq.24.1689701823762; Tue, 18
 Jul 2023 10:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230710223304.1174642-1-almasrymina@google.com>
 <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
In-Reply-To: <12393cd2-4b09-4956-fff0-93ef3929ee37@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Tue, 18 Jul 2023 10:36:52 -0700
Message-ID: <CAHS8izNPTwtk+zN7XYt-+ycpT+47LMcRrYXYh=suTXCZQ6-rVQ@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Device Memory TCP
To: Andy Lutomirski <luto@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-arch@vger.kernel.org,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, jgg@ziepe.ca,
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 16, 2023 at 7:41=E2=80=AFPM Andy Lutomirski <luto@kernel.org> w=
rote:
>
> On 7/10/23 15:32, Mina Almasry wrote:
> > * TL;DR:
> >
> > Device memory TCP (devmem TCP) is a proposal for transferring data to a=
nd/or
> > from device memory efficiently, without bouncing the data to a host mem=
ory
> > buffer.
>
> (I'm writing this as someone who might plausibly use this mechanism, but
> I don't think I'm very likely to end up working on the kernel side,
> unless I somehow feel extremely inspired to implement it for i40e.)
>
> I looked at these patches and the GVE tree, and I'm trying to wrap my
> head around the data path.  As I understand it, for RX:
>
> 1. The GVE driver notices that the queue is programmed to use devmem,
> and it programs the NIC to copy packet payloads to the devmem that has
> been programmed.
> 2. The NIC receives the packet and copies the header to kernel memory
> and the payload to dma-buf memory.
> 3. The kernel tells userspace where in the dma-buf the data is.
> 4. Userspace does something with the data.
> 5. Userspace does DONTNEED to recycle the memory and make it available
> for new received packets.
>
> Did I get this right?
>

Sorry for the late reply. I'm a bit buried working on the follow up to
this proposal: exploring using dma-bufs without pages.

Yes, this is completely correct.

> This seems a bit awkward if there's any chance that packets not intended
> for the target device end up in the rxq.
>

It does a bit. What happens in practice is that we use RSS to steer
general traffic away from the devmem queues, and we use flow steering
to steer specific flows to devem queues.

In the case where the RSS/flow steering configuration is done
incorrectly, the user would call recvmsg() on a devmem skb and if they
haven't specified the MSG_SOCK_DEVMEM flag they'd get an error.

> I'm wondering if a more capable if somewhat higher latency model could
> work where the NIC stores received packets in its own device memory.
> Then userspace (or the kernel or a driver or whatever) could initiate a
> separate DMA from the NIC to the final target *after* reading the
> headers.  Can the hardware support this?
>

Not that I know of. I guess Jakub also responded with the same.

> Another way of putting this is: steering received data to a specific
> device based on the *receive queue* forces the logic selecting a
> destination device to be the same as the logic selecting the queue.  RX
> steering logic is pretty limited on most hardware (as far as I know --
> certainly I've never had much luck doing anything especially intelligent
> with RX flow steering, and I've tried on a couple of different brands of
> supposedly fancy NICs).  But Linux has very nice capabilities to direct
> packets, in software, to where they are supposed to go, and it would be
> nice if all that logic could just work, scalably, with device memory.
> If Linux could examine headers *before* the payload gets DMAed to
> wherever it goes, I think this could plausibly work quite nicely.  One
> could even have an easy-to-use interface in which one directs a *socket*
> to a PCIe device.  I expect, although I've never looked at the
> datasheets, that the kernel could even efficiently make rx decisions
> based on data in device memory on upcoming CXL NICs where device memory
> could participate in the host cache hierarchy.
>
> My real ulterior motive is that I think it would be great to use an
> ability like this for DPDK-like uses.  Wouldn't it be nifty if I could
> open a normal TCP socket, then, after it's open, ask the kernel to
> kindly DMA the results directly to my application memory (via udmabuf,
> perhaps)?  Or have a whole VLAN or macvlan get directed to a userspace
> queue, etc?
>
>
> It also seems a bit odd to me that the binding from rxq to dma-buf is
> established by programming the dma-buf.

That is specific to this proposal, and will likely be very different
in future ones. I thought the dma-buf pages approach was extensible
and the uapi belonged somewhere in dma-buf. Clearly not. The next
proposal, I think, will program the rxq via some net uapi and will
take the dma-buf as input. Probably some netlink api (not sure if
ethtool family or otherwise). I'm working out details of this
non-paged networking first.

> This makes the security model
> (and the mental model) awkward -- this binding is a setting on the
> *queue*, not the dma-buf, and in a containerized or privilege-separated
> system, a process could have enough privilege to make a dma-buf
> somewhere but not have any privileges on the NIC.  (And may not even
> have the NIC present in its network namespace!)
>
> --Andy



--
Thanks,
Mina
