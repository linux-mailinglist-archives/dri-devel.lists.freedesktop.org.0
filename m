Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B397E31FF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 01:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D935510E479;
	Tue,  7 Nov 2023 00:08:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9C410E479
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 00:08:01 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id
 71dfb90a1353d-49e15724283so1962182e0c.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Nov 2023 16:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699315681; x=1699920481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dMgLiPx32/MTfxuwbgzERtFe/YaKVNm8c3X3ms3/1PE=;
 b=XExKupR8w2me07s497R+whj8R+jwwc0ukq8kygVB9Zp7pIs1Krto+CtqBFi23W7QXC
 g5I1XG5gilomqMbMkXXFG+DSfcfgJOfEs5YzEG971qRCadD60PiMbnvZx5A5KWlx5b33
 RvM5aQg8ArW/8k69l99IMpxw9qaaurfbtDFWB0WY5s1YiPUy9QyRZOcSdxbZrAWvlM2V
 vYsQitTfAY+/+MYthXRdt4faeC0zAQ92jJilcTyJPN4c7VFX9vZlrgBVcymTD73gL7Pt
 ntwCuI/LaJo4OUKyratvDS2NMen3UUNf0TAewTyhe34MKkVgnCTFWwXngAfRNymeFoh7
 gvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699315681; x=1699920481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dMgLiPx32/MTfxuwbgzERtFe/YaKVNm8c3X3ms3/1PE=;
 b=vrBJuB6rYW3ei6uydiimJ8a3MINF93mfBka7MHQ+4Rugb2AkVBXe0R4uyL1ilLUMsf
 stzL4xxV10tG7vaZuK5eLvNbnsKhR5Fo51ocIZc++/zZqKOKlWmV1/FE9icy/C7VgDr0
 1H5hJFQrP1q11EQNCV/DkOhq8VS4maIlP5Dg7rUZf1MoPR74yyqhCoMuK3HKJpZFhna/
 aWRIJAET5h+7cfH1+NUqjVv9ELNPFhs1WZm3AVXitTkUtvmaTzee4W9zAxFNejp1djHc
 EMNWP+vXuRnlLEihP5t7IZT3EIwMcCtg7Zs5E9pS60JxT6NffsWv46pha65enZffVKmn
 CBqg==
X-Gm-Message-State: AOJu0YymF9RR83UZaDysv8f38Gb05XV1b0xP1MX9b8nz71h/cHTnIqSr
 dH/OcDYEaerX6sLSVZ5mu7zjaTudE0BfDcpZTnw=
X-Google-Smtp-Source: AGHT+IHH0naUlMlkHryf8Cm/tc+cRL6aLUmgXGaNQ1gzh/QqvXA/kqhc+AXrzuHp3abzthzJsDu7FFam4MhVmahCUz0=
X-Received: by 2002:a67:e1d0:0:b0:45d:974a:7f4f with SMTP id
 p16-20020a67e1d0000000b0045d974a7f4fmr8293787vsl.2.1699315680898; Mon, 06 Nov
 2023 16:08:00 -0800 (PST)
MIME-Version: 1.0
References: <20231106024413.2801438-1-almasrymina@google.com>
 <20231106024413.2801438-10-almasrymina@google.com>
 <ZUk03DhWxV-bOFJL@google.com>
 <19129763-6f74-4b04-8a5f-441255b76d34@kernel.org>
 <CAHS8izMrnVUfbbS=OcJ6JT9SZRRfZ2MC7UnggthpZT=zf2BGLA@mail.gmail.com>
 <ZUlhu4hlTaqR3CTh@google.com>
 <CAHS8izMaAhoae5ChnzO4gny1cYYnqV1cB8MC2cAF3eoyt+Sf4A@mail.gmail.com>
 <ZUlvzm24SA3YjirV@google.com>
 <CAHS8izMQ5Um_ScY0VgAjaEaT-hRh4tFoTgc6Xr9Tj5rEj0fijA@mail.gmail.com>
 <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
In-Reply-To: <CAKH8qBsbh8qYxNHZ6111RQFFpNWbWZtg0LDXkn15xcsbAq4R6w@mail.gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Mon, 6 Nov 2023 16:07:23 -0800
Message-ID: <CAF=yD-+BuKXoVL8UF+No1s0TsHSzBTz7UrB1Djt_BrM74uLLcg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 09/12] net: add support for skbs with unreadable
 frags
To: Stanislav Fomichev <sdf@google.com>
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

On Mon, Nov 6, 2023 at 3:55=E2=80=AFPM Stanislav Fomichev <sdf@google.com> =
wrote:
>
> On Mon, Nov 6, 2023 at 3:27=E2=80=AFPM Mina Almasry <almasrymina@google.c=
om> wrote:
> >
> > On Mon, Nov 6, 2023 at 2:59=E2=80=AFPM Stanislav Fomichev <sdf@google.c=
om> wrote:
> > >
> > > On 11/06, Mina Almasry wrote:
> > > > On Mon, Nov 6, 2023 at 1:59=E2=80=AFPM Stanislav Fomichev <sdf@goog=
le.com> wrote:
> > > > >
> > > > > On 11/06, Mina Almasry wrote:
> > > > > > On Mon, Nov 6, 2023 at 11:34=E2=80=AFAM David Ahern <dsahern@ke=
rnel.org> wrote:
> > > > > > >
> > > > > > > On 11/6/23 11:47 AM, Stanislav Fomichev wrote:
> > > > > > > > On 11/05, Mina Almasry wrote:
> > > > > > > >> For device memory TCP, we expect the skb headers to be ava=
ilable in host
> > > > > > > >> memory for access, and we expect the skb frags to be in de=
vice memory
> > > > > > > >> and unaccessible to the host. We expect there to be no mix=
ing and
> > > > > > > >> matching of device memory frags (unaccessible) with host m=
emory frags
> > > > > > > >> (accessible) in the same skb.
> > > > > > > >>
> > > > > > > >> Add a skb->devmem flag which indicates whether the frags i=
n this skb
> > > > > > > >> are device memory frags or not.
> > > > > > > >>
> > > > > > > >> __skb_fill_page_desc() now checks frags added to skbs for =
page_pool_iovs,
> > > > > > > >> and marks the skb as skb->devmem accordingly.
> > > > > > > >>
> > > > > > > >> Add checks through the network stack to avoid accessing th=
e frags of
> > > > > > > >> devmem skbs and avoid coalescing devmem skbs with non devm=
em skbs.
> > > > > > > >>
> > > > > > > >> Signed-off-by: Willem de Bruijn <willemb@google.com>
> > > > > > > >> Signed-off-by: Kaiyuan Zhang <kaiyuanz@google.com>
> > > > > > > >> Signed-off-by: Mina Almasry <almasrymina@google.com>
> > > > > > > >>
> > > > > > > >> ---
> > > > > > > >>  include/linux/skbuff.h | 14 +++++++-
> > > > > > > >>  include/net/tcp.h      |  5 +--
> > > > > > > >>  net/core/datagram.c    |  6 ++++
> > > > > > > >>  net/core/gro.c         |  5 ++-
> > > > > > > >>  net/core/skbuff.c      | 77 +++++++++++++++++++++++++++++=
+++++++------
> > > > > > > >>  net/ipv4/tcp.c         |  6 ++++
> > > > > > > >>  net/ipv4/tcp_input.c   | 13 +++++--
> > > > > > > >>  net/ipv4/tcp_output.c  |  5 ++-
> > > > > > > >>  net/packet/af_packet.c |  4 +--
> > > > > > > >>  9 files changed, 115 insertions(+), 20 deletions(-)
> > > > > > > >>
> > > > > > > >> diff --git a/include/linux/skbuff.h b/include/linux/skbuff=
.h
> > > > > > > >> index 1fae276c1353..8fb468ff8115 100644
> > > > > > > >> --- a/include/linux/skbuff.h
> > > > > > > >> +++ b/include/linux/skbuff.h
> > > > > > > >> @@ -805,6 +805,8 @@ typedef unsigned char *sk_buff_data_t;
> > > > > > > >>   *  @csum_level: indicates the number of consecutive chec=
ksums found in
> > > > > > > >>   *          the packet minus one that have been verified =
as
> > > > > > > >>   *          CHECKSUM_UNNECESSARY (max 3)
> > > > > > > >> + *  @devmem: indicates that all the fragments in this skb=
 are backed by
> > > > > > > >> + *          device memory.
> > > > > > > >>   *  @dst_pending_confirm: need to confirm neighbour
> > > > > > > >>   *  @decrypted: Decrypted SKB
> > > > > > > >>   *  @slow_gro: state present at GRO time, slower prepare =
step required
> > > > > > > >> @@ -991,7 +993,7 @@ struct sk_buff {
> > > > > > > >>  #if IS_ENABLED(CONFIG_IP_SCTP)
> > > > > > > >>      __u8                    csum_not_inet:1;
> > > > > > > >>  #endif
> > > > > > > >> -
> > > > > > > >> +    __u8                    devmem:1;
> > > > > > > >>  #if defined(CONFIG_NET_SCHED) || defined(CONFIG_NET_XGRES=
S)
> > > > > > > >>      __u16                   tc_index;       /* traffic co=
ntrol index */
> > > > > > > >>  #endif
> > > > > > > >> @@ -1766,6 +1768,12 @@ static inline void skb_zcopy_downgr=
ade_managed(struct sk_buff *skb)
> > > > > > > >>              __skb_zcopy_downgrade_managed(skb);
> > > > > > > >>  }
> > > > > > > >>
> > > > > > > >> +/* Return true if frags in this skb are not readable by t=
he host. */
> > > > > > > >> +static inline bool skb_frags_not_readable(const struct sk=
_buff *skb)
> > > > > > > >> +{
> > > > > > > >> +    return skb->devmem;
> > > > > > > >
> > > > > > > > bikeshedding: should we also rename 'devmem' sk_buff flag t=
o 'not_readable'?
> > > > > > > > It better communicates the fact that the stack shouldn't de=
reference the
> > > > > > > > frags (because it has 'devmem' fragments or for some other =
potential
> > > > > > > > future reason).
> > > > > > >
> > > > > > > +1.
> > > > > > >
> > > > > > > Also, the flag on the skb is an optimization - a high level s=
ignal that
> > > > > > > one or more frags is in unreadable memory. There is no requir=
ement that
> > > > > > > all of the frags are in the same memory type.
> > > > >
> > > > > David: maybe there should be such a requirement (that they all ar=
e
> > > > > unreadable)? Might be easier to support initially; we can relax l=
ater
> > > > > on.
> > > > >
> > > >
> > > > Currently devmem =3D=3D not_readable, and the restriction is that a=
ll the
> > > > frags in the same skb must be either all readable or all unreadable
> > > > (all devmem or all non-devmem).
> > > >
> > > > > > The flag indicates that the skb contains all devmem dma-buf mem=
ory
> > > > > > specifically, not generic 'not_readable' frags as the comment s=
ays:
> > > > > >
> > > > > > + *     @devmem: indicates that all the fragments in this skb a=
re backed by
> > > > > > + *             device memory.
> > > > > >
> > > > > > The reason it's not a generic 'not_readable' flag is because ha=
nding
> > > > > > off a generic not_readable skb to the userspace is semantically=
 not
> > > > > > what we're doing. recvmsg() is augmented in this patch series t=
o
> > > > > > return a devmem skb to the user via a cmsg_devmem struct which =
refers
> > > > > > specifically to the memory in the dma-buf. recvmsg() in this pa=
tch
> > > > > > series is not augmented to give any 'not_readable' skb to the
> > > > > > userspace.
> > > > > >
> > > > > > IMHO skb->devmem + an skb_frags_not_readable() as implemented i=
s
> > > > > > correct. If a new type of unreadable skbs are introduced to the=
 stack,
> > > > > > I imagine the stack would implement:
> > > > > >
> > > > > > 1. new header flag: skb->newmem
> > > > > > 2.
> > > > > >
> > > > > > static inline bool skb_frags_not_readable(const struct skb_buff=
 *skb)
> > > > > > {
> > > > > >     return skb->devmem || skb->newmem;
> > > > > > }
> > > > > >
> > > > > > 3. tcp_recvmsg_devmem() would handle skb->devmem skbs is in thi=
s patch
> > > > > > series, but tcp_recvmsg_newmem() would handle skb->newmem skbs.
> > > > >
> > > > > You copy it to the userspace in a special way because your frags
> > > > > are page_is_page_pool_iov(). I agree with David, the skb bit is
> > > > > just and optimization.
> > > > >
> > > > > For most of the core stack, it doesn't matter why your skb is not
> > > > > readable. For a few places where it matters (recvmsg?), you can
> > > > > double-check your frags (all or some) with page_is_page_pool_iov.
> > > > >
> > > >
> > > > I see, we can do that then. I.e. make the header flag 'not_readable=
'
> > > > and check the frags to decide to delegate to tcp_recvmsg_devmem() o=
r
> > > > something else. We can even assume not_readable =3D=3D devmem becau=
se
> > > > currently devmem is the only type of unreadable frag currently.
> > > >
> > > > > Unrelated: we probably need socket to dmabuf association as well =
(via
> > > > > netlink or something).
> > > >
> > > > Not sure this is possible. The dma-buf is bound to the rx-queue, an=
d
> > > > any packets that land on that rx-queue are bound to that dma-buf,
> > > > regardless of which socket that packet belongs to. So the associati=
on
> > > > IMO must be rx-queue to dma-buf, not socket to dma-buf.
> > >
> > > But there is still always 1 dmabuf to 1 socket association (on rx), r=
ight?
> > > Because otherwise, there is no way currently to tell, at recvmsg, whi=
ch
> > > dmabuf the received token belongs to.
> > >
> >
> > Yes, but this 1 dma-buf to 1 socket association happens because the
> > user binds the dma-buf to an rx-queue and configures flow steering of
> > the socket to that rx-queue.
>
> It's still fixed and won't change during the socket lifetime, right?
> And the socket has to know this association; otherwise those tokens
> are useless since they don't carry anything to identify the dmabuf.
>
> I think my other issue with MSG_SOCK_DEVMEM being on recvmsg is that
> it somehow implies that I have an option of passing or not passing it
> for an individual system call.
> If we know that we're going to use dmabuf with the socket, maybe we
> should move this flag to the socket() syscall?
>
> fd =3D socket(AF_INET6, SOCK_STREAM, SOCK_DEVMEM);
>
> ?

I think it should then be a setsockopt called before any data is
exchanged, with no change of modifying mode later. We generally use
setsockopts for the mode of a socket. This use of the protocol field
in socket() for setting a mode would be novel. Also, it might miss
passively opened connections, or be overly restrictive: one approach
for all accepted child sockets.
