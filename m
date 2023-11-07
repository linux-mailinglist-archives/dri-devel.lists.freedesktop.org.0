Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD557E47FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 19:14:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512A810E643;
	Tue,  7 Nov 2023 18:14:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E74D10E643
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 18:14:28 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 3f1490d57ef6-da0631f977bso7161266276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 10:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1699380867; x=1699985667;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
 :reply-to; bh=8HeHeN/xiCMz8DEWBM6X0ByYPySZA5Zqi9Xr6EDBkSs=;
 b=ao9QRxjrCpYLCKUIDQaOWMvkUpIAW4SC2dLs75qFGAm4TpKr9bGSLPY7fOt7xgchC3
 wHM8t602x9+uho/o+csbGnUErmza/TWoI0RhblhnLd6nVUkM+xHpkQEw99U3lexInCEm
 cLrWv/K97/oKYaR11cx0mfYsU9EUzJ4Fie7ebEiZ+N+btqMdj+Va/ze322itfqJ9qsZ5
 HXvVvalxVxKlHJL2QUHKe1nhApz/sE1TXe702NTuJM/l3QxckOGU7ZqewFcCRRvemNrs
 oJ16QhTCqFVvO2migajLcG1fOClB9VoFQPkaer6iheAwn0ndkVCbvfeqFOgNXiFchCVa
 WksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699380867; x=1699985667;
 h=content-transfer-encoding:cc:to:from:subject:message-id:references
 :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=8HeHeN/xiCMz8DEWBM6X0ByYPySZA5Zqi9Xr6EDBkSs=;
 b=Yfy1yV69kM4eOIB9uP8nDhabPxq+t7nY2Nlk7C2gWcSY1b/HIkzBy2yqc3kOCbqyo5
 Cb58O/AMUgQyK/MKZwzWl+snaSc6EMLBuocaWn9ZCw8hrAe1rRLUwf3ZmYZW2MG+YUTb
 giE+AgtgcRJL8whdwUrq4XwpTldV8j4id+utq6jq4m0KWNaGLpZh31n6P5rt5SK6fNW+
 ZM/rAaRosDcA139ok626ifesLNKqNyd8oFvWncOJUdT6/cgBrsqKS6LynrYMuFQjw/5D
 J0INOxtyI5i2VlB45A5fOUU0x/8lv2n91zex+W6nHxgMUpaCRDzkhi339aLdp2NW7FNn
 85DQ==
X-Gm-Message-State: AOJu0YyiOw3dAN+feKzrqedwst4+WNbQTYZwxlqGJ6p35AzIaSWCDA12
 g0wSmjJK6h+wmjnGVvU/05yAPzQ=
X-Google-Smtp-Source: AGHT+IEFH3S1Xddt5/l1kHplzp6Kf3Zu4Jc1nx0T2cx1iq2FT0uS/xoaqN5IyidpJIJBKzD/qi9XQZ0=
X-Received: from sdf.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5935])
 (user=sdf job=sendgmr) by 2002:a25:494:0:b0:d13:856b:c10a with SMTP id
 142-20020a250494000000b00d13856bc10amr597853ybe.3.1699380867206; Tue, 07 Nov
 2023 10:14:27 -0800 (PST)
Date: Tue, 7 Nov 2023 10:14:25 -0800
In-Reply-To: <CAF=yD-Ltd0REhOS78q_t8bSEpefQsZuJV_Aq7zxXmFDh+BmJhg@mail.gmail.com>
Mime-Version: 1.0
References: <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
 <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
 <ZUmBf7E8ZoTQwThL@google.com> <ZUmMBZpLPQkRS9bg@google.com>
 <CAF=yD-+tZ7xaU0rKWBuVbfdVWptj88Z=Xf4Mqx+zaC-gZ1U1mw@mail.gmail.com>
 <ZUp3j2TLNKhPYwch@google.com>
 <CAF=yD-Ltd0REhOS78q_t8bSEpefQsZuJV_Aq7zxXmFDh+BmJhg@mail.gmail.com>
Message-ID: <ZUp-gYT7OMb9wun3@google.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
From: Stanislav Fomichev <sdf@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

On 11/07, Willem de Bruijn wrote:
> On Tue, Nov 7, 2023 at 12:44=E2=80=AFPM Stanislav Fomichev <sdf@google.co=
m> wrote:
> >
> > On 11/06, Willem de Bruijn wrote:
> > > > > > > I think my other issue with MSG_SOCK_DEVMEM being on recvmsg =
is that
> > > > > > > it somehow implies that I have an option of passing or not pa=
ssing it
> > > > > > > for an individual system call.
> > > > > > > If we know that we're going to use dmabuf with the socket, ma=
ybe we
> > > > > > > should move this flag to the socket() syscall?
> > > > > > >
> > > > > > > fd =3D socket(AF_INET6, SOCK_STREAM, SOCK_DEVMEM);
> > > > > > >
> > > > > > > ?
> > > > > >
> > > > > > I think it should then be a setsockopt called before any data i=
s
> > > > > > exchanged, with no change of modifying mode later. We generally=
 use
> > > > > > setsockopts for the mode of a socket. This use of the protocol =
field
> > > > > > in socket() for setting a mode would be novel. Also, it might m=
iss
> > > > > > passively opened connections, or be overly restrictive: one app=
roach
> > > > > > for all accepted child sockets.
> > > > >
> > > > > I was thinking this is similar to SOCK_CLOEXEC or SOCK_NONBLOCK? =
There
> > > > > are plenty of bits we can grab. But setsockopt works as well!
> > > >
> > > > To follow up: if we have this flag on a socket, not on a per-messag=
e
> > > > basis, can we also use recvmsg for the recycling part maybe?
> > > >
> > > > while (true) {
> > > >         memset(msg, 0, ...);
> > > >
> > > >         /* receive the tokens */
> > > >         ret =3D recvmsg(fd, &msg, 0);
> > > >
> > > >         /* recycle the tokens from the above recvmsg() */
> > > >         ret =3D recvmsg(fd, &msg, MSG_RECYCLE);
> > > > }
> > > >
> > > > recvmsg + MSG_RECYCLE can parse the same format that regular recvms=
g
> > > > exports (SO_DEVMEM_OFFSET) and we can also add extra cmsg option
> > > > to recycle a range.
> > > >
> > > > Will this be more straightforward than a setsockopt(SO_DEVMEM_DONTN=
EED)?
> > > > Or is it more confusing?
> > >
> > > It would have to be sendmsg, as recvmsg is a copy_to_user operation.
> > >
> > >
> > > I am not aware of any precedent in multiplexing the data stream and a
> > > control operation stream in this manner. It would also require adding
> > > a branch in the sendmsg hot path.
> >
> > Is it too much plumbing to copy_from_user msg_control deep in recvmsg
> > stack where we need it? Mixing in sendmsg is indeed ugly :-(
>=20
> I tried exactly the inverse of that when originally adding
> MSG_ZEROCOPY: to allow piggy-backing zerocopy completion notifications
> on sendmsg calls by writing to sendmsg msg_control on return to user.
> It required significant code churn, which the performance gains did
> not warrant. Doing so also breaks the simple rule that recv is for
> reading and send is for writing.

We're breaking so many rules here, so not sure we should be super
constrained :-D

> > Regarding hot patch: aren't we already doing copy_to_user for the token=
s in
> > this hot path, so having one extra condition shouldn't hurt too much?
>=20
> We're doing that in the optional cmsg handling of recvmsg, which is
> already a slow path (compared to the data read() itself).
>=20
> > > The memory is associated with the socket, freed when the socket is
> > > closed as well as on SO_DEVMEM_DONTNEED. Fundamentally it is a socket
> > > state operation, for which setsockopt is the socket interface.
> > >
> > > Is your request purely a dislike, or is there some technical concern
> > > with BPF and setsockopt?
> >
> > It's mostly because I've been bitten too much by custom socket options =
that
> > are not really on/off/update-value operations:
> >
> > 29ebbba7d461 - bpf: Don't EFAULT for {g,s}setsockopt with wrong optlen
> > 00e74ae08638 - bpf: Don't EFAULT for getsockopt with optval=3DNULL
> > 9cacf81f8161 - bpf: Remove extra lock_sock for TCP_ZEROCOPY_RECEIVE
> > d8fe449a9c51 - bpf: Don't return EINVAL from {get,set}sockopt when optl=
en > PAGE_SIZE
> >
> > I do agree that this particular case of SO_DEVMEM_DONTNEED seems ok, bu=
t
> > things tend to evolve and change.
>=20
> I see. I'm a bit concerned if we start limiting what we can do in
> sockets because of dependencies that BPF processing places on them.
> The use case for BPF [gs]etsockopt is limited to specific control mode
> calls. Would it make sense to just exclude calls like
> SO_DEVMEM_DONTNEED from this interpositioning?

Yup, that's why I'm asking. We already have ->bpf_bypass_getsockopt()
to special-case tcp zerocopy. We might add another bpf_bypass_setsockopt
to special case SO_DEVMEM_DONTNEED. That's why I'm trying to see if
there is a better alternative.

> At a high level what we really want is a high rate metadata path from
> user to kernel. And there are no perfect solutions. From kernel to
> user we use the socket error queue for this. That was never intended
> for high event rate itself, dealing with ICMP errors and the like
> before timestamps and zerocopy notifications were added.
>
> If I squint hard enough I can see some prior art in mixing data and
> high rate state changes within the same channel in NIC descriptor
> queues, where some devices do this, e.g.,  { "insert encryption key",
> "send packet" }. But fundamentally I think we should keep the socket
> queues for data only.

+1, we keep taking an easy route with using sockopt for this :-(

Anyway, let's see if any better suggestions pop up. Worst case - we stick
with a socket option and will add a bypass on the bpf side.
