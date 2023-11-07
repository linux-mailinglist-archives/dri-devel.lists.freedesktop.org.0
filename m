Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F2D7E4757
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 18:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E7D110E634;
	Tue,  7 Nov 2023 17:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com
 [IPv6:2607:f8b0:4864:20::114a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB44B10E634
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 17:44:50 +0000 (UTC)
Received: by mail-yw1-x114a.google.com with SMTP id
 00721157ae682-5a7cf717bacso81257747b3.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 09:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699379090; x=1699983890;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UdTuJbMPNA9mg1FxCGi+kg3boA7o2BN4MhcyDntGV5Q=;
 b=cawiEUwPEAqbL8tIVKlWL1RXEMDd8/DLDTzVCf5VfRCFhhn+JO8vCKrdVvb35n/rdz
 lVfP8h/i+29IHYX4rrtdHBEyMaOELju6G2cAIn1fPNSCBGyDJkLfO36leDoZq5tUs1if
 ty6wOMrGj76YKJkwOMXi8pYQCmqsVW0w9IUajAVGY37E0qRy9570+Zc2Rn9LUP0hGrYW
 t3D22GEdkiBeLELlE4rz+2p+Iz092PY/z6DOIY25jmrMkLJ0+H/KezrSCQZKyi4tjvOo
 V3smmCdqwn0nC0qu8MhEtbCmloTz3rqewvVHH0L7yZkbEab5fNOs1CsL4cqZ0Fd/w+LU
 nBcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699379090; x=1699983890;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UdTuJbMPNA9mg1FxCGi+kg3boA7o2BN4MhcyDntGV5Q=;
 b=RqcCK5sKBZ4EtAGW0966A7g5fpbkIwEBjqr+kAMX46K6iqtmodnwzPwc6d65QXw0MG
 pRaxJyFy6WWm7Mf/ybhtEGku2xxytOR+g7ZDWJ/IjRAHI5UTkGtyfJNnG2zEjSM8lf2s
 neUpRBt65pnPSUeHJ5g77ykaz4VFTc2y4nC/3mZGpwR5SWQCohK2evUXM8hqzvUgZNZr
 dCFV3mt54eg2hCzY3LTx7cdSxDxczFRmMFKxDo25eEmLo1BKVARPC7fBn0f/LXvt20jO
 ER8jmq0fRCOWbr7JLW/ZKx6ny3yPyVsbOyaz1IAuPLuGhkC4qLi+ms+O4w4jacL4msUt
 7+Lw==
X-Gm-Message-State: AOJu0YxMl24lPQRk2Ne0oMTsPx1NQjCNgBBSbH1bUJqFeNp13++HaK1A
 4VMVogVEVUclU71cFaVnXQv4kjk=
X-Google-Smtp-Source: AGHT+IEdiK1WEoh2+6U+bQH9Li0JSDfO/xDBtSZs6coo4v7ue+AtpEROBdggpJnmwjryu7dXhenhMCA=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a25:8689:0:b0:d9a:3bee:255c with SMTP id
 z9-20020a258689000000b00d9a3bee255cmr578349ybk.7.1699379089844; Tue, 07 Nov
 2023 09:44:49 -0800 (PST)
Date: Tue, 7 Nov 2023 09:44:47 -0800
In-Reply-To: <CAF=yD-+tZ7xaU0rKWBuVbfdVWptj88Z=Xf4Mqx+zaC-gZ1U1mw@mail.gmail.com>
Mime-Version: 1.0
References: <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
 <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
 <ZUmBf7E8ZoTQwThL@google.com> <ZUmMBZpLPQkRS9bg@google.com>
 <CAF=yD-+tZ7xaU0rKWBuVbfdVWptj88Z=Xf4Mqx+zaC-gZ1U1mw@mail.gmail.com>
Message-ID: <ZUp3j2TLNKhPYwch@google.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
From: Stanislav Fomichev <sdf@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="utf-8"
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
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/06, Willem de Bruijn wrote:
> > > > > I think my other issue with MSG_SOCK_DEVMEM being on recvmsg is that
> > > > > it somehow implies that I have an option of passing or not passing it
> > > > > for an individual system call.
> > > > > If we know that we're going to use dmabuf with the socket, maybe we
> > > > > should move this flag to the socket() syscall?
> > > > >
> > > > > fd = socket(AF_INET6, SOCK_STREAM, SOCK_DEVMEM);
> > > > >
> > > > > ?
> > > >
> > > > I think it should then be a setsockopt called before any data is
> > > > exchanged, with no change of modifying mode later. We generally use
> > > > setsockopts for the mode of a socket. This use of the protocol field
> > > > in socket() for setting a mode would be novel. Also, it might miss
> > > > passively opened connections, or be overly restrictive: one approach
> > > > for all accepted child sockets.
> > >
> > > I was thinking this is similar to SOCK_CLOEXEC or SOCK_NONBLOCK? There
> > > are plenty of bits we can grab. But setsockopt works as well!
> >
> > To follow up: if we have this flag on a socket, not on a per-message
> > basis, can we also use recvmsg for the recycling part maybe?
> >
> > while (true) {
> >         memset(msg, 0, ...);
> >
> >         /* receive the tokens */
> >         ret = recvmsg(fd, &msg, 0);
> >
> >         /* recycle the tokens from the above recvmsg() */
> >         ret = recvmsg(fd, &msg, MSG_RECYCLE);
> > }
> >
> > recvmsg + MSG_RECYCLE can parse the same format that regular recvmsg
> > exports (SO_DEVMEM_OFFSET) and we can also add extra cmsg option
> > to recycle a range.
> >
> > Will this be more straightforward than a setsockopt(SO_DEVMEM_DONTNEED)?
> > Or is it more confusing?
> 
> It would have to be sendmsg, as recvmsg is a copy_to_user operation.
>
>
> I am not aware of any precedent in multiplexing the data stream and a
> control operation stream in this manner. It would also require adding
> a branch in the sendmsg hot path.

Is it too much plumbing to copy_from_user msg_control deep in recvmsg
stack where we need it? Mixing in sendmsg is indeed ugly :-(

Regarding hot patch: aren't we already doing copy_to_user for the tokens in
this hot path, so having one extra condition shouldn't hurt too much?

> The memory is associated with the socket, freed when the socket is
> closed as well as on SO_DEVMEM_DONTNEED. Fundamentally it is a socket
> state operation, for which setsockopt is the socket interface.
> 
> Is your request purely a dislike, or is there some technical concern
> with BPF and setsockopt?

It's mostly because I've been bitten too much by custom socket options that
are not really on/off/update-value operations:

29ebbba7d461 - bpf: Don't EFAULT for {g,s}setsockopt with wrong optlen
00e74ae08638 - bpf: Don't EFAULT for getsockopt with optval=NULL
9cacf81f8161 - bpf: Remove extra lock_sock for TCP_ZEROCOPY_RECEIVE
d8fe449a9c51 - bpf: Don't return EINVAL from {get,set}sockopt when optlen > PAGE_SIZE

I do agree that this particular case of SO_DEVMEM_DONTNEED seems ok, but
things tend to evolve and change.
