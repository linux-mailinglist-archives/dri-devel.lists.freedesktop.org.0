Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516147E32E1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 03:24:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D713F10E4A1;
	Tue,  7 Nov 2023 02:24:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com
 [IPv6:2607:f8b0:4864:20::932])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4011B10E4A1
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 02:24:06 +0000 (UTC)
Received: by mail-ua1-x932.google.com with SMTP id
 a1e0cc1a2514c-7b625ed7208so1738392241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 18:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699323845; x=1699928645; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q8/hIJ+hXi3TTC8/M5hN/3Tp+g8W2vvsh36FqMl8LBI=;
 b=S0mPNmZ6dt2EhWEScKbYDTlxcuUzvbfBW5xinyYkwIqcBRlSsHNJROV7P4sqI7Pwe6
 aUPWTDDbhBAkUARprW8vNPpPcdyQ0gvtjYlUw+J24Zv6IZ/E0TM/w+qODF70dJ6N7GWX
 AKvENDW+W5sEKLZ1PmaZEJAs4PD4MDKIIJzkFtgGY/dydL0ownajIyHnTNKnS3CS3mI/
 GjNaAfWHkqhmkf/3FuqNNQia7Bmh0fONqxGQ+SdiKL/MjF1h9QpjxzKOqTo7HGfv3Ehr
 PiCW5UrQfB71YCmDVYT9YRHfR8ni5rDKyRwBUFlaLayprBdZu06NMP0fckg24xD/NX4/
 4SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699323845; x=1699928645;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q8/hIJ+hXi3TTC8/M5hN/3Tp+g8W2vvsh36FqMl8LBI=;
 b=PnPiwIV+/TExI5cbpsiBK+OTpeSXx94pPdQu4cBpnf2o31joTWL0ea9xu8IS9ARfEl
 1u+B9F6es4Z5giO2KLN6S/q5ak5tDn4B7Y7diVxWyqsozxuoYi3o+TPUKI3x8FpqeqnY
 xfbPYpGifCm29YeYmTCW7v8WBiQ/YZHiaBKmd3OoHkVCdc1mRx01ZAlvpoSZ3/mEX44l
 u1caI7CijqQZPGfRyPfMYbaiRKlYv8o+VTeqgY5pgcmg8frUBBhcF/bRKzEtNcFDQ6Uk
 fi9C8IWNhRhZsdDvHm4P/cx51/XnBFdgRH7SD2jFqefuO4V3760cic5vQQvPlKkMivwt
 5kIg==
X-Gm-Message-State: AOJu0YxhtL72Aa4nmG9H57iQIxyiojD75nOn8PSfQFbjhmsQvy9D/8nc
 yfR4FdvAkgzcR15FXHSRzOTylhKT+bbN2i64McM=
X-Google-Smtp-Source: AGHT+IFMLt/VUG6TU/4hOSl6RqKh7SB0dwBaFHv9+9I37C28wvAczM3wwtVldLZdBo8d+kzaH5f944U0PquGa1Yz4yU=
X-Received: by 2002:a67:e10a:0:b0:45e:9611:7b71 with SMTP id
 d10-20020a67e10a000000b0045e96117b71mr6126361vsl.27.1699323845025; Mon, 06
 Nov 2023 18:24:05 -0800 (PST)
MIME-Version: 1.0
References: <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
 <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
 <ZUmBf7E8ZoTQwThL@google.com> <ZUmMBZpLPQkRS9bg@google.com>
In-Reply-To: <ZUmMBZpLPQkRS9bg@google.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 6 Nov 2023 20:23:28 -0600
Message-ID: <CAF=yD-+tZ7xaU0rKWBuVbfdVWptj88Z=Xf4Mqx+zaC-gZ1U1mw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
To: Stanislav Fomichev <sdf@google.com>
Content-Type: text/plain; charset="UTF-8"
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
 Eric Dumazet <edumazet@google.com>, linux-kselftest@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mina Almasry <almasrymina@google.com>, Jeroen de Borst <jeroendb@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-media@vger.kernel.org, linux-arch@vger.kernel.org,
 Jesper Dangaard Brouer <hawk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linaro-mm-sig@lists.linaro.org, Shakeel Butt <shakeelb@google.com>,
 Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org,
 David Ahern <dsahern@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Praveen Kaligineedi <pkaligineedi@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> > > > I think my other issue with MSG_SOCK_DEVMEM being on recvmsg is that
> > > > it somehow implies that I have an option of passing or not passing it
> > > > for an individual system call.
> > > > If we know that we're going to use dmabuf with the socket, maybe we
> > > > should move this flag to the socket() syscall?
> > > >
> > > > fd = socket(AF_INET6, SOCK_STREAM, SOCK_DEVMEM);
> > > >
> > > > ?
> > >
> > > I think it should then be a setsockopt called before any data is
> > > exchanged, with no change of modifying mode later. We generally use
> > > setsockopts for the mode of a socket. This use of the protocol field
> > > in socket() for setting a mode would be novel. Also, it might miss
> > > passively opened connections, or be overly restrictive: one approach
> > > for all accepted child sockets.
> >
> > I was thinking this is similar to SOCK_CLOEXEC or SOCK_NONBLOCK? There
> > are plenty of bits we can grab. But setsockopt works as well!
>
> To follow up: if we have this flag on a socket, not on a per-message
> basis, can we also use recvmsg for the recycling part maybe?
>
> while (true) {
>         memset(msg, 0, ...);
>
>         /* receive the tokens */
>         ret = recvmsg(fd, &msg, 0);
>
>         /* recycle the tokens from the above recvmsg() */
>         ret = recvmsg(fd, &msg, MSG_RECYCLE);
> }
>
> recvmsg + MSG_RECYCLE can parse the same format that regular recvmsg
> exports (SO_DEVMEM_OFFSET) and we can also add extra cmsg option
> to recycle a range.
>
> Will this be more straightforward than a setsockopt(SO_DEVMEM_DONTNEED)?
> Or is it more confusing?

It would have to be sendmsg, as recvmsg is a copy_to_user operation.

I am not aware of any precedent in multiplexing the data stream and a
control operation stream in this manner. It would also require adding
a branch in the sendmsg hot path.

The memory is associated with the socket, freed when the socket is
closed as well as on SO_DEVMEM_DONTNEED. Fundamentally it is a socket
state operation, for which setsockopt is the socket interface.

Is your request purely a dislike, or is there some technical concern
with BPF and setsockopt?
